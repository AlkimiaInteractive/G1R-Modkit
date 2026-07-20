class UCircleSummonSpawnPlaceHelper : USummonSpawnPlaceHelper
{
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinSummonDistance;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxSummonDistance;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_AngleInterval;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_DistanceInterval;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_CurrentDistance;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_CurrentAngle;
    
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_SpawnAttemptRadius;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_CreatureSpawnAttempts;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	bool m_Odd = false;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;


    bool TryToGetValidSpawnPlace(AActor TargetActor, FVector& DesiredPos, AActor DefaultCharacter) override
    {
        const FVector character_pos = TargetActor.GetActorLocation();

        while (m_CurrentDistance < m_MaxSummonDistance)
        {
            DesiredPos = ComputeNextLocation(character_pos, m_CurrentDistance, m_CurrentAngle, TargetActor.GetActorForwardVector());
            //System::DrawDebugPoint(DesiredPos, 5.f, FLinearColor::Red, 15.f);
            //Print(FString::ApplyFormat(DesiredPos, FString()), 5.f, FLinearColor::Black);
            ModifySearchParams();


            //System::DrawDebugPoint(floorLocation, 5.f, FLinearColor::Green, 15.f);
            //Print(FString::ApplyFormat(floorLocation, FString()));

            if(CheckLocation(TargetActor.GetActorLocation(), DesiredPos, DefaultCharacter, GetActorsToIgnore()))
            {
                
                //System::DrawDebugPoint(DesiredPos, 5.f, FLinearColor::Green, 15.f);
                return true;
            }
            else
            {
                if(FindArroundComputedPosition(TargetActor, DesiredPos, DefaultCharacter))
                {
                    //MagicScript::FindFloorAtLocation(floorLocation, DesiredPos, normal, nullptr, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
                    //System::DrawDebugPoint(DesiredPos, 5.f, FLinearColor::Blue, 15.f);
                    return true;
                }
            }
            
            
            
        }
        DesiredPos = FVector::ZeroVector;
        return false;
    }


    bool TryToGetValidRandomInCircleSpawnPlace(AActor TargetActor, FVector& DesiredPos, ACharacter DefaultCharacter)
    {
        const FVector character_pos = TargetActor.GetActorLocation();

        AGothicCharacter DefaultGothicCharacter = Cast<AGothicCharacter>(DefaultCharacter);
        if (DefaultGothicCharacter == nullptr)
            return false;

        if (!UNavigationSystemV1::TryGetRandomNavigablePointInRadius(DefaultGothicCharacter.CharacterState, character_pos, 1000.f, DesiredPos))
            return false;

        ModifySearchParams();


        if(CheckLocation(TargetActor.GetActorLocation(), DesiredPos, DefaultCharacter, GetActorsToIgnore()))
        {
            //System::DrawDebugPoint(DesiredPos, 5.f, FLinearColor::Green, 15.f);
            return true;
        }
        else
        {
            if(FindArroundComputedPosition(TargetActor, DesiredPos, DefaultCharacter))
            {
                //MagicScript::FindFloorAtLocation(floorLocation, DesiredPos, normal, nullptr, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
                //System::DrawDebugPoint(DesiredPos, 5.f, FLinearColor::Blue, 15.f);
                return true;
            }
        }      
        
        
        DesiredPos = FVector::ZeroVector;
        return false;
    }

    bool FindArroundComputedPosition(AActor TargetActor, FVector& DesiredPos,
                                     AActor DefaultCharacter) override
    {
        if(m_CreatureSpawnAttempts <= 0.f)
            return false;

        float angleInterval = 360.f / m_CreatureSpawnAttempts;
        float currentAngle = 0;
        bool odd = false;

        FVector center = DesiredPos;

        for(int j = 0; j < m_CreatureSpawnAttempts; j++)
        {
            center = ComputeNextLocation(DesiredPos, m_SpawnAttemptRadius, currentAngle, TargetActor.GetActorForwardVector());
            //System::DrawDebugSphere(center, 5.f, 12.f, FLinearColor::Purple, 5.f, 5.f);
            //System::DrawDebugPoint(center, 5.f, FLinearColor::Red, 5.f);
            if(CheckLocation(TargetActor.GetActorLocation(), center, DefaultCharacter, GetActorsToIgnore()))
            {
                DesiredPos = center;
                return true;
            }

            if(odd)
            {
                currentAngle *= -1;
                odd = false;
            }
            else
            {
                odd = true;
                currentAngle = Math::Abs(currentAngle) + angleInterval;
            }
        }

        return false;
	}

    bool CheckLocation(const FVector StartPosition, const FVector DesiredPosition,
                       AActor ActorToCheck, TArray<AActor> ActorsToIgnore) override
    {    
                
        FHitResult out_hit;

        bool hits = false;
        hits = DoShapeTrace(ActorToCheck, DesiredPosition, ActorsToIgnore, out_hit);

        if(hits)
        {
            //Print("System::CapsuleTraceSingle( hits", 5.f, FLinearColor::Purple);
            //System::DrawDebugSphere(out_hit.ImpactPoint, 20.f, 12.f, FLinearColor::Red, 5.f, 5.f);
            return false;
        }
        
        //ETraceTypeQuery::TraceTypeQuery1 Is ECC_Visiblility
        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);
        hits = System::LineTraceSingle(
            StartPosition,
            DesiredPosition,
            trace_type,
            true,
            ActorsToIgnore,
            EDrawDebugTrace::None,
            out_hit,
            true,
            FLinearColor::Green,
            FLinearColor::Red,
            5.5f
        );
             //System::DrawDebugSphere(DesiredPosition, 3.f, 12.f, FLinearColor::Gray, 5.f, 15.f);    
        if(hits)
        {
            //System::DrawDebugSphere(out_hit.ImpactPoint, 10.f, 12.f, FLinearColor::Yellow, 5.f, 15.f);
            //Print(FString(out_hit.Actor.GetName()), 25.f, FLinearColor::Blue);
            //We ignore the characters              
            if(!IsAnIgnoringActor(out_hit.Actor))
                return false;
        }

        return Super::CheckLocation(StartPosition, DesiredPosition, ActorToCheck, ActorsToIgnore);
    }
   

	bool IsAnIgnoringActor(AActor Actor) const
	{
        if(IsACharacter(Actor))
            return true;

        return false;
	}

	bool IsACharacter(AActor Actor) const
	{
        auto character = Cast<AGothicCharacter>(Actor);
        return character != nullptr;
	}

    void ModifySearchParams() override
    {
        if(m_Odd)
        {
            m_CurrentAngle *= -1;
            m_Odd = false;
        }
        else
        {
            m_Odd = true;
            m_CurrentAngle = Math::Abs(m_CurrentAngle) + m_AngleInterval;
        }
            
        if(Math::Abs(m_CurrentAngle) > 180.f || m_CurrentAngle == -180)
        {
            m_Odd = false;
            m_CurrentAngle = 0;
            m_CurrentDistance += m_DistanceInterval;
        }
    }   
}
