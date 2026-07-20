
UCLASS()
class ATriggerSphereSpawner : ATriggerSphere
{
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSubclassOf<USpawnAIAgentDefinition> m_SpawnAIAgentDefinition;

    default CollisionComponent.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
	USphereComponent comp = Cast<USphereComponent>(CollisionComponent);
	default comp.SphereRadius = 150;
	//default m_DebugColor = FColor::Green;

	UPROPERTY(DefaultComponent)
	UTextRenderComponent m_TextComp;
	default m_TextComp.SetWorldRotation(FRotator(90, 0, 0));
	default m_TextComp.SetRelativeLocation(FVector(0, 0, 4));
	default m_TextComp.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
	default m_TextComp.SetTextRenderColor(FColor::Black);

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	ATriggerBox m_SpawnZone;

	default bHidden = false;

	UFUNCTION(BlueprintOverride)
	void ConstructionScript()
	{
		FText text = FText::FromString("Select creature");
		if(m_SpawnAIAgentDefinition.IsValid())
		{
			text = FText::FromString(m_SpawnAIAgentDefinition.Get().GetName().ToString());
		}
		
		m_TextComp.SetText(text);
	}

	UFUNCTION()
	FVector GetSpawnPosition() const
	{
		const FVector BoxExtent = m_SpawnZone.CollisionComponent.BoundsExtent;
		const FVector BoxMin = m_SpawnZone.GetActorLocation() - BoxExtent;
		const FVector BoxMax = m_SpawnZone.GetActorLocation() + BoxExtent;
		FBox Box = FBox(BoxMin, BoxMax);
		FVector pos = FVector( Math::RandRange(Box.Min.X, Box.Max.X), Math::RandRange(Box.Min.Y, Box.Max.Y), Math::RandRange(Box.Min.Z, Box.Max.Z) );

		TArray<AActor> actors_ignore;
		FHitResult hit_result;
		System::LineTraceSingle(
			pos,
			pos - FVector::UpVector * 1000,
			UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility),
			false,
			actors_ignore,
			EDrawDebugTrace::None,
			hit_result,
			true);

        pos.Z = hit_result.ImpactPoint.Z;

		return pos;
	}

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        Log("ATriggerSphereSpawner::OnBeginOverlap " + OtherActor.Name + " " + OtherComp.Name);

		if(!m_SpawnAIAgentDefinition.IsValid() || m_SpawnZone == nullptr)
		{
			return;
		}

		FVector pos = GetSpawnPosition();
		AIScript::SpawnAIAgent(m_SpawnAIAgentDefinition, pos);
    }
};
