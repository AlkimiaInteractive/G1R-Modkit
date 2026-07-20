UCLASS()
class UAIState_Combat_Sleeper_Xardas : UAIState_Combat_G1R
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_SleeperTest_Xardas::StaticClass());

    void DefaultConfigValues() override
    {
        EnemyCombatDistance = 10000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }

    bool CanTarget() override
    {
        if (!Super::CanTarget())
            return false;

        if (CharacterState.HasGameplayTag(GameplayTag::State_XardasSleeper_CantDoTarget)) 
            return false;

        return true;
    }
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "SleeperTest_Xardas - Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Xardas_Grounded : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default bBlockBehaviorSwitchWhenAttackSelected = false;

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Combat.CharacterState.HasGameplayTag(GameplayTag::State_XardasSleeper_OnCentralSpot) && !Combat.CharacterState.HasGameplayTag(GameplayTag::State_XardasSleeper_InitialTeleport))
        {
            Reason = "Not on central spot";
            return false;
        }

        if (Combat.CharacterState.HasGameplayTag(GameplayTag::State_XardasSleeper_OnMinionSpot))
        {
            Reason = "On Minion spot";
            return false;
        }

        return true;
    }

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .DoNode(UCBT_Behavior_CombatMove(UCM_Spell_Xardas_Teleport_ToMinionSpot_Initial()), 0.0f)
                .AddRequirement(UCS_SelfHasTag(GameplayTag::State_XardasSleeper_CanTeleportTo_MinionSpot));
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Xardas_Flying : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default bBlockBehaviorSwitchWhenAttackSelected = false;

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Combat.CharacterState.HasGameplayTag(GameplayTag::State_XardasSleeper_OnMinionSpot))
        {
            Reason = "Not on Minion spot";
            return false;
        }

        return true;
    }
   
    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1000000000.0f;

    // ATTACKS /////////
    FAttackInfo Firebolt = FAttackInfo(
        UCM_Spell_Xardas_FireBolt(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        10000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(Firebolt);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .DoNode(UCBT_Behavior_CombatMove(UCM_Spell_Xardas_TeleportStunned()), 0.01f)
                .AddRequirement(UCS_SelfHasTag(GameplayTag::State_XardasSleeper_CanTeleportTo_CentralSpot))
                .AddTreeCooldown("Teleport_Stunned", 2.0f);

    default Behavior_MediumPriority()
                .DoNode(UCBT_Behavior_CombatMove(UCM_Spell_Xardas_Teleport_ToMinionSpot_Visibility()), 1.0f)
                .AddRequirement(UCS_SelectedAttackWouldHitCollision())
                .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_XardasSleeper_CanTeleportTo_CentralSpot)))
                .AddTreeCooldown("Teleport_Visibility", 2.0f);

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Firebolt")
                    .AddAttack(Firebolt)
                    .AddTreeCooldown("Firebolt", 4.0f)
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_XardasSleeper_CanTeleportTo_CentralSpot)))
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_XardasSleeper_DoingTeleportTo)))
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::State_Stunned)))
                    .AddRequirement(UCS_SelfHasTag(GameplayTag::State_XardasSleeper_OnMinionSpot));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_SleeperTest_Xardas : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Xardas_Grounded::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Xardas_Flying::StaticClass());
}