
class UGA_Spell_Firewall_Orc : UGameplayAbilitySpellBasic
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Orc/Hashor/Firewall/BP_Hashor_Firewall.BP_Hashor_Firewall_C'";

    
    UPROPERTY()
    AGothicCharacter m_Target;
    UPROPERTY()
    AAIAgentCharacter m_Instigator;
   
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        m_Instigator = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        m_Target = Cast<AGothicCharacter>(m_Instigator.GetTargetedActor());
        if(m_Target == nullptr)
            EndAbility();
    }

    // UFUNCTION(BlueprintOverride)
    // void OnEndAbility(bool bWasCancelled)
    // {
    //     ReleaseTarget();
    // }
      
    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        return FRotator::ZeroRotator;
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        TArray<AActor> outActors;
        GetAllActorsOfClass(AHashorFirewallSpawner::StaticClass(), outActors);
        if(outActors.IsEmpty())
            return GetAvatarActorFromActorInfo().GetActorLocation();
        return outActors[0].GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        auto firewallArea = Cast<ADemonAreaFirewallVisual>(ActorSpawned);
        firewallArea.m_OwnerAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        firewallArea.InitializeArea(m_Target); 
    }

}

UCLASS()
class AHashorFirewallSpawner : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetRelativeLocation(FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Green);
            m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
            m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
            m_TextRender.SetHiddenInGame(true);
        }
        if(m_ArrowComponent != nullptr)
        {
            m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
            m_ArrowComponent.SetHiddenInGame(true);
        }      
    }
}
