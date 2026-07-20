class UGA_CastSpell_Teleport_Creature : UGA_CastSpell_Default
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    //default m_SpellConfigurationContainerClass = USpellConfigurationContainer_SkeletonMageWeapon_Teleport::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        UClass teleportSpotFilterClass = GetTeleportSpotFilterClass();
        if(teleportSpotFilterClass == nullptr)
        {
            return;
        }
        UCreatureTeleportComponent teleportComponent = GetTeleportComponent();
        if(teleportComponent == nullptr)
        {
            return;
        }

        if(HasAuthority())
        {
            //@DE - Deactivate tick optimizer for teleport.
            UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(GetAvatarActorFromActorInfo(), false);
        }

        ATeleportSpotVisual TeleportSpot = GetTeleportSpot(teleportComponent, teleportSpotFilterClass);
        //@DE - We updated the position even if it is null.
        teleportComponent.SetTargetTeleportSpot(TeleportSpot);
        teleportComponent.ActivateDirectionVisuals();
    }

    ATeleportSpotVisual GetTeleportSpot(UCreatureTeleportComponent TeleportComponent, UClass TeleportSpotFilterClass)
    {
        if(TeleportSpotFilterClass == nullptr)
        {
            return nullptr;
        }

        if(TeleportComponent == nullptr)
        {
            return nullptr;
        }

        return TeleportComponent.FindFurthestTeleportSpot(TeleportSpotFilterClass);
    }
    
    UCreatureTeleportComponent GetTeleportComponent()
    {
        return Cast<UCreatureTeleportComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(UCreatureTeleportComponent::StaticClass()));
    }

    UClass GetTeleportSpotFilterClass()
    {
        return nullptr;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldForceIgnoreInput_Scriptable()
    {
        return true;
    }
}