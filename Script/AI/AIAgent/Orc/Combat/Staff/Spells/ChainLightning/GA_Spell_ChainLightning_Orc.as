class UGA_Spell_ChainLightning_Orc : UGA_Spell_ChainLightning
{
    //default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_Pyrokinesis;
    
    default m_WeaponDataForTargets = ULightningRayDefinition_WithParalysis_Orc::StaticClass();
    default m_WeaponDataForOwner = ULightningRayDefinition_WithoutParalysis_Orc::StaticClass();

    UPROPERTY()
    AItemVisual m_ItemInHand;

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        Super::OnActivateSpellServer_Scriptable();
        m_ItemInHand = GetItemInHand();
    }

    void SpawnSourceToTargetVisuals(AActor NewTarget, AActor SourceActor) override
    {
        if(m_ItemInHand == nullptr)
        {
            Super::SpawnSourceToTargetVisuals(NewTarget, SourceActor);
            return;
        }

        auto meshComp = Cast<UStaticMeshComponent>(m_ItemInHand.GetComponentByClass(UStaticMeshComponent::StaticClass()));
        m_Rays.Add(SpawnRay(NewTarget, SourceActor, meshComp, n"Bottom"));
            
    }

    AItemVisual GetItemInHand()
    {
        auto carryComp = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCarryComponent();
        if(carryComp == nullptr)
            return nullptr;

        return carryComp.GetItemVisual(); 
    }

}