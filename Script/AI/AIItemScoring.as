mixin void CalculateScoreOfItemAction(const UGameplayAbility_CharacterAI_Gothic AI, FScoredItemAction& ScoredItemAction, FGameplayTagContainer RequiredTags = FGameplayTagContainer())
{
    AI.ItemActionScoringEntryManager.CalculateScoreOfItemAction(ScoredItemAction, RequiredTags);
}

UCLASS()
class UGothicAIItemActionScoringEntry : UAIItemActionScoringEntry
{
    UGameplayAbility_CharacterAI_Gothic AI = GetTypedOuter(UGameplayAbility_CharacterAI_Gothic);
}

UCLASS()
class UGothicAIItemActionScoringEntryManager : UAIItemActionScoringEntryManager
{
}

//////////////////////////////////////////////////////////////////////////////
// Weapon Score Modifiers
//////////////////////////////////////////////////////////////////////////////

UCLASS()
class UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill : UGothicAIItemActionScoringEntry
{
    default Description = "Melee weapon skill";
    default GroupTag = GameplayTag::Ability_Combat_Attack;

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_MeleeWeapon_BasePriorityBySkill::VetoActionUsage"));

        return false;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_MeleeWeapon_BasePriorityBySkill::CalculateScore"));

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Grip_OneHand) && AI.Character.IsMeleeOneHandedTrained())
            return 0.66f;

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Grip_OneHand) && AI.Character.IsMeleeOneHandedMaster())
            return 1.0f;

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Grip_TwoHand) && AI.Character.IsMeleeTwoHandedTrained())
            return 0.66f;

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Grip_TwoHand) && AI.Character.IsMeleeTwoHandedMaster())
            return 1.0f;

        return 0.33f;
    }
}

UCLASS()
class UAIItemScoringEntry_UseFists : UGothicAIItemActionScoringEntry
{
    default Description = "Should use fists";
    default GroupTag = GameplayTag::Item_Weapon;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_UseFists::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterState.HasGameplayTag(GameplayTag::State_FightWithFists))
            return true;        

        return false;
    }
    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_UseFists::VetoActionUsage"));

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Fist))
            return false;

        return true;
    }
}

// UCLASS()
class UAIItemScoringEntry_UseWatchFightWeapon : UGothicAIItemActionScoringEntry
{
    default Description = "Watch fight weapon";
    default GroupTag = GameplayTag::Item_Weapon_Fist;
    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_UseFists::VetoActionUsage"));

        bool bIsInWatchFight = AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_WatchFight);

        if (ItemActionHandler.ItemDefinition.IsA(UWatchFightWeapon))
        {
            // Veto weapon if not in watchfight
            return !bIsInWatchFight;
        }

        if (bIsInWatchFight)
            return true;

        return false;
    }
}

UCLASS()
class UAIItemScoringEntry_UseSwimmingWeapon : UGothicAIItemActionScoringEntry
{
    default Description = "Swimming weapon";
    default GroupTag = GameplayTag::Item;

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_UseFists::VetoActionUsage"));

        bool bIsSwimming = AI.Self.IsSwimming();
        bool bIsDiving = AI.Self.IsDiving();
        bool bIsInShallowWater = AI.Self.IsInShallowWater();

        if (ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Underwater))
        {
            // Veto weapon if not diving?
            return !bIsDiving;
        }

        if (ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Surface))
        {
            // Veto weapon if not swimming on the surface?
            return !bIsSwimming;
        }

        if (ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Environment_Water_Walking))
        {
            // Veto weapon if not swimming on the surface?
            return !bIsInShallowWater;
        }

        // Veto any other weapon if swimming or diving
        return bIsSwimming || bIsDiving || bIsInShallowWater;
    }
}

UCLASS()
class UAIItemScoringEntry_UseClimbingWeapon : UGothicAIItemActionScoringEntry
{
    default Description = "Climbing weapon";
    default GroupTag = GameplayTag::Item;

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_UseFists::VetoActionUsage"));

        bool bIsClimbingWall = AI.Self.IsClimbingWall();
        bool bIsClimbingLadder = AI.Self.IsClimbingLadder();

        if (ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Environment_Climbing))
        {
            // Veto weapon if not climbing?
            return !bIsClimbingWall;
        }

        if (ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Environment_Climbing_Ladder))
        {
            // Veto weapon if not climbing?
            return !bIsClimbingLadder;
        }

        // Veto any other weapon if climbing
        return bIsClimbingWall || bIsClimbingLadder;
    }
}

UCLASS()
class UAIItemScoringEntry_UseFlyingWeapon : UGothicAIItemActionScoringEntry
{
    default Description = "Flying weapon";
    default GroupTag = GameplayTag::Item;

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        bool bIsFlying = AI.Self.IsFlying();

        if (ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Environment_Air_Flying))
        {
            // Veto weapon if not flying
            return !bIsFlying;
        }

        // Veto any other weapon if flying
        return bIsFlying;
    }
}

UCLASS()
class UAIItemScoringEntry_Mlt_Weapon_CloseToTarget : UGothicAIItemActionScoringEntry
{
    default Description = "Target Close";
    default bIsMultiplier = true;
    default GroupTag = GameplayTag::Item_Range;
    float Distance = 400.0f;

    float MeleeMinScoreMultiplier = 1.7f;
    float MeleeMaxScoreMultiplier = 2.0f;

    float RangedMinScoreMultiplier = 0.0f;
    float RangedMaxScoreMultiplier = 0.5f;

    float MagicMinScoreMultiplier = 0.5f;
    float MagicMaxScoreMultiplier = 1.0f;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Weapon_CloseToTarget::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        // if (!AI.CharacterOfInterest.IsOnTheGround())
        //     return false;
               
        float VerticalReach = AI.Character.SimpleCollisionHalfHeight * 2 + AI.CharacterOfInterest.SimpleCollisionHalfHeight;

        if (AI.CharacterOfInterest.GetDistanceTo(AI.Character) >= Distance)
            return false;
        
        FVector Location;
        if (!AI.Character.Perception.CanGroundedTargetBePotentiallyReached(
                AI.CharacterOfInterest, 
                100.0f, 
                VerticalReach))
        {
            return false;
        }


        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Weapon_CloseToTarget::CalculateScore"));
        float CurrentDistance = AI.CharacterOfInterest.GetDistanceTo(AI.Character);
        float Ratio = CurrentDistance / Distance; // 0 to 1
            // 0 when CurrentDistance == 0
            // 1 when CurrentDistance == Distance

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Range_Melee))
            return MeleeMinScoreMultiplier + (MeleeMaxScoreMultiplier - MeleeMinScoreMultiplier) * (1.0f - Ratio);

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords))
            return MagicMinScoreMultiplier + (MagicMaxScoreMultiplier - MagicMinScoreMultiplier) * Ratio;

        return RangedMinScoreMultiplier + (RangedMaxScoreMultiplier - RangedMinScoreMultiplier) * Ratio;
    }
}

UCLASS()
class UAIItemScoringEntry_Weapon_TargetGroundedButUnreachable : UGothicAIItemActionScoringEntry
{
    default Description = "Target grounded but unreachable";
    default GroupTag = GameplayTag::Item_Range_Melee;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Weapon_TargetGroundedButUnreachable::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (!AI.CharacterOfInterest.IsOnTheGround())
            return false;
               
        float VerticalReach = AI.Character.SimpleCollisionHalfHeight * 2 + AI.CharacterOfInterest.SimpleCollisionHalfHeight;

        FVector Location;
        if (AI.Character.Perception.CanGroundedTargetBePotentiallyReached(
                AI.CharacterOfInterest, 
                150.0f, 
                VerticalReach))
        {
            return false;
        }

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Weapon_TargetGroundedButUnreachable::CalculateScore"));

        float VerticalReach = AI.Character.SimpleCollisionHalfHeight * 2 + AI.CharacterOfInterest.SimpleCollisionHalfHeight;
        
        FVector Location;
        if (AI.Character.Perception.CanGroundedTargetBePotentiallyReached(
                AI.CharacterOfInterest, 
                300.0f, 
                VerticalReach))
        {
            return 0;
        }
        return -1.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Weapon_TargetFlying : UGothicAIItemActionScoringEntry
{
    default Description = "Target flying";
    default GroupTag = GameplayTag::Item_Range_Melee;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Weapon_TargetFlying::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (!AI.CharacterOfInterest.IsFlying())
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Weapon_TargetFlying::CalculateScore"));

        float VerticalReach = AI.Character.SimpleCollisionHalfHeight * 2 + AI.CharacterOfInterest.SimpleCollisionHalfHeight;
         FVector Location;
        if (AI.Character.Perception.CanGroundedTargetBePotentiallyReached(
                AI.CharacterOfInterest, 
                75.0f, 
                VerticalReach))
        {
            return 0;
        }
        return -1.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Weapon_TargetInWater : UGothicAIItemActionScoringEntry
{
    default Description = "Target in water";
    default GroupTag = GameplayTag::Item_Range_Melee;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(FItemActionHandler ItemActionHandler) const
    {
        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Swimming))
            return false;

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_WaterWalking))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (!AI.CharacterOfInterest.IsSwimming() && !AI.CharacterOfInterest.IsDiving())
            return false;

        if (!AI.bRangedAttackRequiresRangedWeapon)  
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        return -1.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_MeleeWeapon_PrioritizeIfBluntAndTargetFrozen : UGothicAIItemActionScoringEntry
{
    default Description = "Blunt melee weapon and target frozen";
    default GroupTag = GameplayTag::Ability_Combat_Attack;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_MeleeWeapon_BluntAndTargetFrozen::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (!AI.CharacterOfInterest.IsFrozen())
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_MeleeWeapon_BluntAndTargetFrozen::CalculateScore"));

        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Damage_Physical_Blunt))
            return 0.0f;

        return 0.3f;
    }
}

UCLASS()
class UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill : UGothicAIItemActionScoringEntry
{
    default Description = "Ranged weapon skill";
    default GroupTag = GameplayTag::Ability_Combat_Archery;

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_BasePriorityBySkill::VetoActionUsage"));

        return false;
    }
    
    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_BasePriorityBySkill::CalculateScore"));

        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Range_Long))
            return 0.0f;

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Bow) && AI.Character.IsBowTrained())
            return 0.66f;

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Bow) && AI.Character.IsBowMaster())
            return 1.0f;

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Crossbow) && AI.Character.IsCrossbowTrained())
            return 0.66f;

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Crossbow) && AI.Character.IsCrossbowMaster())
            return 1.0f;

        return 0.33f;
    }
}

UCLASS()
class UAIItemScoringEntry_RangedWeapon_DisableIfNoAmmunitionInInventory : UGothicAIItemActionScoringEntry
{
    default Description = "No ammunition";
    default GroupTag = GameplayTag::Ability_Combat_Archery;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_NoAmmunition::IsEntryRelevantToItemAction"));

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Bow) && !AI.Character.Inventory.HasItemOfClass(UItAm_Arrow))
            return true;

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Crossbow) && !AI.Character.Inventory.HasItemOfClass(UItAm_Bolt))
            return true;

        return false;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_NoAmmunition::VetoActionUsage"));

        return true;
    }
    
    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_NoAmmunition::CalculateScore"));

        return 0.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_RangedWeapon_DisableIfInCombatEndActionsState : UGothicAIItemActionScoringEntry
{
    default Description = "in CombatEndActions state";
    default GroupTag = GameplayTag::Ability_Combat_Archery;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_CombatEndActionsState::IsEntryRelevantToItemAction"));

        if (!AI.Self.HasGameplayTag(GameplayTag::AIState_Conflict_CombatEndActions))
            return false;

        return true;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_CombatEndActionsState::VetoActionUsage"));

        return true;
    }
    
    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_CombatEndActionsState::CalculateScore"));

        return 0.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Mlt_RangedWeapon_PrioritizeIfTargetFarAway : UGothicAIItemActionScoringEntry
{
    default Description = "Target far away";
    default bIsMultiplier = true;
    default GroupTag = GameplayTag::Item_Range;

    float Distance = 800.0f;
    float CapScoreAtDistance = 3000.0f;

    float RangedMinScoreMultiplier = 1.00f;
    float RangedMaxScoreMultiplier = 2.0f;

    float MeleeMinScoreMultiplier = 0.75f;
    float MeleeMaxScoreMultiplier = 1.0f;

    float MagicMinScoreMultiplier = 1.0f;
    float MagicMaxScoreMultiplier = 2.0f;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_TargetFarAway::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (AI.CharacterOfInterest.GetDistanceTo(AI.Self) < Distance)
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_TargetFarAway::CalculateScore"));
        float CurrentDistance = AI.CharacterOfInterest.GetDistanceTo(AI.Character);
        float Ratio = (Math::Min(CurrentDistance, CapScoreAtDistance) - Distance) / (CapScoreAtDistance - Distance); // 0 to 1

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::Item_Range_Long))
            return RangedMinScoreMultiplier + (RangedMaxScoreMultiplier - RangedMinScoreMultiplier) * Ratio;

        return MeleeMinScoreMultiplier + (MeleeMaxScoreMultiplier - MeleeMinScoreMultiplier) * (1.0f - Ratio);
    }
}

UCLASS()
class UAIItemScoringEntry_Mlt_RangedWeapon_PenalizedIfBeingAttackedInMelee : UGothicAIItemActionScoringEntry
{
    default Description = "Being attacked in melee";
    default bIsMultiplier = true;
    default GroupTag = GameplayTag::Item_Range_Long;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_AttackedInMelee::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        // if (AI.Character.Perception.Memory
        //         .FilterByType(GameplayTag::Event_Damaged_Me)
        //         .FilterAffectedCharacterIs(AI.Character)
        //         .)
        //     return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_AttackedInMelee::CalculateScore"));

        return 0.33f;
    }
}

// UCLASS()
// class UAIItemScoringEntry_Mlt_RangedWeapon_BonusIfTargetOutsidePreferredLocationRadius : UGothicAIItemActionScoringEntry
// {
//     default Description = "Target is outside PreferredLocation";
//     default bIsMultiplier = true;
//     default GroupTag = GameplayTag::Item_Range_Long;

//     UFUNCTION(BlueprintOverride)
//     bool DoesEntryApplyToCurrentSituation() const
//     {
//         //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_AttackedInMelee::DoesEntryApplyToCurrentSituation"));

//         if (AI.CharacterOfInterest == nullptr)
//             return false;

//         if (!AI.HasPreferredLocation())
//             return false;

//         if (AI.PreferredLocation.GetDistanceFromActor(AI.CharacterOfInterest) < AI.PreferredLocationConflictRadius + 200.0f)
//             return false;

//         return true;
//     }

//     UFUNCTION(BlueprintOverride)
//     float CalculateScore(const FItemActionHandler ItemActionHandler) const
//     {
//         //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_AttackedInMelee::CalculateScore"));

//         return 3.00f;
//     }
// }

UCLASS()
class UAIItemScoringEntry_RangedWeapon_PrioritizeIfPassiveAttackerRole : UGothicAIItemActionScoringEntry
{
    default Description = "Role is passive attacker";
    default GroupTag = GameplayTag::Item_Range_Long;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_PassiveAttacker::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        auto CombatState = AI.FindActiveStateByClass(UAIState_Combat_G1R);

        if (!IsValid(CombatState))
            return false;

        if (!CombatState.IsCurrentRole(ECombatRole::PassiveAttacker))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_RangedWeapon_PassiveAttacker::CalculateScore"));

        return 1.0f;
    }
}

//////////////////////////////////////////////////////////////////////////////
//  Spell score modifiers
//////////////////////////////////////////////////////////////////////////////

UCLASS()
class UAIItemScoringEntry_Spell_DisableAnySpell_TargetImmune : UGothicAIItemActionScoringEntry
{
    default Description = "Target is immune to spell";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_TargetImmune::IsEntryRelevantToItemAction"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (!ItemActionHandler.ItemDefinition.IsA(USpellContainer))
            return false;

        if (!AI.Character.CanUseSpell(Cast<USpellContainer>(ItemActionHandler.ItemDefinition)))
            return false;
        
        if(AI.GetCurrentState() == nullptr)
            return false;

        if (AI.GetCurrentState().IsA(UAIState_DailyRoutine))
            return false;

        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_ImmuneEntities) && 
            !ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_AffectedEntities))
        {
            return false;
        }

        bool bAffectsCreatures = false;
        bool bAffectsHumans = false;
        bool bAffectsUndead = false;

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_ImmuneEntities))
        {
            bAffectsCreatures = true;
            bAffectsHumans = true;
            bAffectsUndead = true;
        }

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_AffectedEntities_Creatures))
        {
            bAffectsCreatures = true;
        }

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_AffectedEntities_Humans))
        {
            bAffectsHumans = true;
        }

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_AffectedEntities_Undead))
        {
            bAffectsUndead = true;
        }

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_ImmuneEntities_Creatures))
        {
            bAffectsCreatures = false;
        }

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_ImmuneEntities_Humans))
        {
            bAffectsHumans = false;
        }

        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_ImmuneEntities_Undead))
        {
            bAffectsUndead = false;
        }

        if (!bAffectsCreatures && AI.CharacterOfInterest.IsCreature())
            return true;

        if (!bAffectsHumans && AI.CharacterOfInterest.IsHuman())
            return true;

        if (!bAffectsUndead && AI.CharacterOfInterest.IsUndead())
            return true;

        return false;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_TargetImmune::VetoActionUsage"));

        return true;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeAreaSpells_MultipleEnemies : UGothicAIItemActionScoringEntry
{
    default Description = "Area spell and multiple enemies";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_MultipleEnemies::DoesEntryApplyToCurrentSituation"));

        if (AI.GetNumberOfEnemiesSensed() > 1)
            return true;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_MultipleEnemies::IsEntryRelevantToItemAction"));
        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_MultipleEnemies::CalculateScore"));

        float Score = 0.0f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Area))
            Score += 0.33f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Control))
            Score += 0.33f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Chain))
            Score += 0.33f;

        return Score;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeChargedSpells_EnemyFarOrImpaired : UGothicAIItemActionScoringEntry
{
    default Description = "Charged spell and target impaired";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_EnemyFarOrImpaired::IsEntryRelevantToItemAction"));
        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Casting_Charged))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_EnemyFarOrImpaired::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;
        
        if (AI.CharacterOfInterest.IsFrozen())
            return true;

        if (AI.CharacterOfInterest.IsParalized())
            return true;

        // TODO: Add sleep

        if (AI.CharacterOfInterest.GetDistanceTo(AI.Self) > 400.0f)
            return true;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_EnemyFarOrImpaired::CalculateScore"));

        return 0.15f;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeComboSpells : UGothicAIItemActionScoringEntry
{
    default Description = "Combo spell";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_ComboSpells::IsEntryRelevantToItemAction"));
        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Casting_Combo))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_ComboSpells::CalculateScore"));

        return 0.33f;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeDamage : UGothicAIItemActionScoringEntry
{
    default Description = "Damage spell";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Damage::IsEntryRelevantToItemAction"));
        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Damage))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Damage::CalculateScore"));
        
        return 0.33f;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeDamageEffects : UGothicAIItemActionScoringEntry
{
    default Description = "Spell has damage effects";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_DamageEffects::IsEntryRelevantToItemAction"));
        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Burn))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_DamageEffects::CalculateScore"));

        return 0.33f;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PenalizeSlowProjectiles : UGothicAIItemActionScoringEntry
{
    default Description = "Slow projectile";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_SlowProjectile::IsEntryRelevantToItemAction"));
        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Slow))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_SlowProjectile::CalculateScore"));

        return -0.33f;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeControl_TargetIsStronger : UGothicAIItemActionScoringEntry
{
    default Description = "Control and target is stronger";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Control_TargetStronger::IsEntryRelevantToItemAction"));

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Control_TargetStronger::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (AI.CharacterOfInterest.IsFrozen())
            return false;

        if (AI.CharacterOfInterest.IsParalized())
            return false;
        // TODO: Check other states

        // if (!AI.CharacterOfInterest.IsStrongerThan(AI.Self))
        //     return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Control_TargetStronger::CalculateScore"));

        float Score = 0.0f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Control))
            Score += 0.1f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Freeze))
            Score += 0.33f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Sleep))
            Score += 0.33f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Fear))
            Score += 0.33f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Paralize))
            Score += 0.33f;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Knockback))
            Score += 0.15f;

        return Score;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_IncreasePriorityWithTimeSinceLastUse : UGothicAIItemActionScoringEntry
{
    default Description = "Increase priority with time since last use";
    default GroupTag = GameplayTag::Spell;

    float ScoreAtMaxTime = 1.0f;
    float ScoreAtMinTime = -3.0f;

    float TimeMaxSeconds = 20.0f;
    float TimeMinSeconds = 5.0f;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_TimeSinceLastUse::IsEntryRelevantToItemAction"));

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_TimeSinceLastUse::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;
        
        if (AI.CharacterOfInterest.IsFrozen())
            return false;

        if (AI.CharacterOfInterest.IsParalized())
            return false;
        
        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_TimeSinceLastUse::CalculateScore"));

        float LastUseTimeSeconds = -MAX_flt;
        AI.LastTimeItemActionUsages.Find(ItemActionHandler.ActionTag, LastUseTimeSeconds);
        float Time = AI.World.TimeSeconds - LastUseTimeSeconds;
        
        float Score = Math::GetMappedRangeValueClamped(FVector2D(TimeMinSeconds, TimeMaxSeconds), FVector2D(ScoreAtMinTime, ScoreAtMaxTime), Time);

        return Score;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeDamageSpells_WithControl_EnemyNotImpaired : UGothicAIItemActionScoringEntry
{
    default Description = "Damage and control while target not impaired";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_DamageControl_TargetNotImpaired::IsEntryRelevantToItemAction"));

        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Damage) ||
            !ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Control))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_DamageControl_TargetNotImpaired::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (AI.CharacterOfInterest.IsFrozen())
            return false;

        if (AI.CharacterOfInterest.IsParalized())
            return false;

        // TODO: Add sleep

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_DamageControl_TargetNotImpaired::CalculateScore"));

        return 0.33f;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_DisableControlSpells_NotSustained_NoDamage_CharacterImpaired : UGothicAIItemActionScoringEntry
{
    default Description = "Target impaired, control with no damage and not sustained";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_ControlOnly_CharacterImpaired::IsEntryRelevantToItemAction"));

        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Control))
            return false;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Damage))
            return false;
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Casting_Sustained))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_ControlOnly_CharacterImpaired::DoesEntryApplyToCurrentSituation"));

        if (AI.CharacterOfInterest == nullptr)
            return false;

        if (!AI.CharacterOfInterest.IsFrozen() && !AI.CharacterOfInterest.IsParalized())
            return false;
        // TODO: Check other states

        return true;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_ControlOnly_CharacterImpaired::VetoActionUsage"));

        return true;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_PrioritizeKillSpells : UGothicAIItemActionScoringEntry
{
    default Description = "Kill spell";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Kill::IsEntryRelevantToItemAction"));

        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Effect_Kill))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Kill::CalculateScore"));

        return 5.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_DisableUnusableSpells : UGothicAIItemActionScoringEntry
{
    default Description = "Not enough skill or mana";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Unusable::IsEntryRelevantToItemAction"));

        if (!ItemActionHandler.ItemDefinition.IsA(USpellContainer) && ItemActionHandler.ItemDefinition.m_ActionsKeywords.Contains(USpellActionKeywords))
            return false;

        if (ItemActionHandler.ItemDefinition.IsA(USpellContainer) && AI.Character.CanUseSpell(Cast<USpellContainer>(ItemActionHandler.ItemDefinition)))
            return false;

        return true;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Unusable::VetoActionUsage"));

        return true;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_BannedSpells_Always : UGothicAIItemActionScoringEntry
{
    default Description = "Banned spell - Always";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Banned_Always))
            return true;

        return false;
    }
    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        return true;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_BannedSpells_AgainstPlayer : UGothicAIItemActionScoringEntry
{
    default Description = "Banned spell - Against Player";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        if (ItemActionHandler.Keywords.HasTag(GameplayTag::AISpellKeywords_Usage_Banned_AgainstPlayer))
            return true;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        if (!IsValid(AI.CharacterOfInterest))
            return false;

        if (!AI.CharacterOfInterest.IsPlayerCharacterOrPlayerControlled())
            return false;

        return true;
    }
    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        return true;
    }
}

UCLASS()
class UAIItemScoringEntry_Spell_Base : UGothicAIItemActionScoringEntry
{
    default Description = "Spell base score";
    default GroupTag = GameplayTag::Spell;

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Spell_Base::CalculateScore"));

        return 1.0f;
    }
}

////////////////////////////////////////////////////////////
//  Consumable score modifiers
////////////////////////////////////////////////////////////

UCLASS()
class UAIItemScoringEntry_Consumable_HealthItems : UGothicAIItemActionScoringEntry
{
    default Description = "health restoring item";
    float HealthRatioToAllowRestore = 0.5f;
    float RatioOfWastedPotionToMaxHealthAllowed = 0.15f;
    float MinWasteEfficiencyAllowed = 0.3f;
    float MinHealEfficiencyAllowed = 0.05f;

    default GroupTag = GameplayTag::Action_QuickConsume;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Health::IsEntryRelevantToItemAction"));

        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::GE_Param_Heal))
            return false;

        if (!ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_QuickConsumable))
            return false;

        return true;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Health::VetoActionUsage"));
        if (!AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_CombatEndActions) &&
            AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict) &&
            !AI.CharacterState.HasGameplayTag(GameplayTag::State_Combat))
            return true;

        return CalculateScore_Internal(ItemActionHandler.ItemDefinition) < 0.0f;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Health::CalculateScore"));
        if (!AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_CombatEndActions) &&
            AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict) &&
            !AI.CharacterState.HasGameplayTag(GameplayTag::State_Combat))
            return -1000.0f;
            
        return Math::Max(0.0f, CalculateScore_Internal(ItemActionHandler.ItemDefinition));
    }

    private float CalculateScore_Internal(const UItemDefinition ItemDefinition) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Health::CalculateScore_Internal"));

        float32 CharacterCurrentHealth = AI.Character.GetHealthAttribute();
        float32 CharacterMaxHealth = AI.Character.GetMaxHealthAttribute();

        if (CharacterCurrentHealth == CharacterMaxHealth)
            return -1000.0f;

        if (AI.Self.HasGameplayTag(GameplayTag::AIState_DailyRoutine))
            return -1000.0f;
        
        bool bIsInCombatState = AI.Self.HasGameplayTag(GameplayTag::AIState_Conflict_Combat);
        bool bIsInCombatEndActionsState = AI.Self.HasGameplayTag(GameplayTag::AIState_Conflict_CombatEndActions);

        if (bIsInCombatState && (CharacterCurrentHealth >= CharacterMaxHealth * HealthRatioToAllowRestore || !AI.Self.HasDrawnWeapon()))
            return -1000.0f;

        if (!bIsInCombatState && !bIsInCombatEndActionsState)
            return -1000.0f;
        
        for (auto Effect : ItemDefinition.m_OnConsumeEffects)
        {
            float32 Magnitude = 0.0f;
            if (!Effect.m_Magnitudes.Find(GameplayTag::GE_Param_Heal, Magnitude))
                continue;

            float32 EfficiencyModifier = 1.0f;
            if (Effect.m_Effect.Get().IsA(UGE_Item_Heal_Overtime))
            {
                float32 Duration = 1.0f;
                Effect.m_Magnitudes.Find(GameplayTag::GE_Param_Duration, Duration);
                Magnitude *= Duration;

                if (bIsInCombatState)
                {
                    EfficiencyModifier = 0.5f;
                }
            }
            else if (Effect.m_Effect.Get().IsA(UGE_Item_Heal_Insta) && bIsInCombatState)
            {
                EfficiencyModifier = 0.2f;
            }

            if (Magnitude == 0.0f)
                continue;

            float HealthDifferenceAfterHealing = CharacterCurrentHealth - CharacterMaxHealth + Magnitude;

            float WastedPotionHealth = Math::Max(HealthDifferenceAfterHealing, 0.0f);
            float WasteEfficiency = 1.0f;
            if (Magnitude != 0.0f)
            {
                WasteEfficiency = 1.0f - Math::Abs((WastedPotionHealth) / Magnitude);
            }
            float HealEfficiency = 1.0f;
            
            if (WastedPotionHealth == 0.0f)
            {
                float HealthToHeal = CharacterMaxHealth - CharacterCurrentHealth;
                if (HealthToHeal != 0.0f)
                {
                    HealEfficiency = Magnitude / HealthToHeal;
                }
                else
                {
                    HealEfficiency = 1.0f;
                }
            }

            if (WastedPotionHealth > CharacterMaxHealth * RatioOfWastedPotionToMaxHealthAllowed)
                return -1000.0f;

            if (WasteEfficiency < MinWasteEfficiencyAllowed)
                return -1000.0f;

            if (HealEfficiency < MinHealEfficiencyAllowed)
                return -1000.0f;

            float TotalEfficiency = WasteEfficiency + HealEfficiency;
            return 1.0f + 10.0f * TotalEfficiency * EfficiencyModifier;
        }

        return 0.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Consumable_ManaItems : UGothicAIItemActionScoringEntry
{
    default Description = "Mana restoring item";
    float ManaRatioToAllowRestore = 0.2f;
    float ManaRatioOfWastedPotionAllowed = 0.15f;
    default GroupTag = GameplayTag::Action_QuickConsume;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Mana::IsEntryRelevantToItemAction"));
        if (!ItemActionHandler.Keywords.HasTag(GameplayTag::GE_Param_Mana))
            return false;

        if (!ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_QuickConsumable))
            return false;

        return true;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Mana::VetoActionUsage"));
        if (!AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_CombatEndActions) &&
            AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict) &&
            !AI.CharacterState.HasGameplayTag(GameplayTag::State_Combat))
            return true;

        return CalculateScore_Internal(ItemActionHandler.ItemDefinition) < 0.0f;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Mana::CalculateScore"));

        return Math::Max(0.0f, CalculateScore_Internal(ItemActionHandler.ItemDefinition));
    }

    private float CalculateScore_Internal(const UItemDefinition ItemDefinition) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_Mana::CalculateScore_Internal"));

        float32 CharacterCurrentMana = AI.Character.GetManaAttribute();
        float32 CharacterMaxMana = AI.Character.GetMaxManaAttribute();

        bool bIsInCombatState = false;

        if (CharacterCurrentMana == CharacterMaxMana)
            return -1000.0f;

        if (AI.GetCurrentState().IsA(UAIState_DailyRoutine))
            return -1000.0f;

        UGothicCharacterAIState State = Cast<UGothicCharacterAIState>(AI.GetCurrentState());
        
        bIsInCombatState = AI.GetCurrentState().IsA(UAIState_Combat);

        if (bIsInCombatState && CharacterCurrentMana >= CharacterMaxMana * ManaRatioToAllowRestore)
            return -1000.0f;
        
        for (auto Effect : ItemDefinition.m_OnConsumeEffects)
        {
            float32 Magnitude = 0.0f;
            if (!Effect.m_Magnitudes.Find(GameplayTag::GE_Param_Mana, Magnitude))
                continue;

            float32 EfficiencyModifier = 1.0f;
            if (Effect.m_Effect.Get().IsA(UGE_Item_Mana_Overtime))
            {
                float32 Duration = 1.0f;
                Effect.m_Magnitudes.Find(GameplayTag::GE_Param_Duration, Duration);
                Magnitude *= Duration;

                if (bIsInCombatState)
                {
                    EfficiencyModifier = 0.5f;
                }
            }
            else if (Effect.m_Effect.Get().IsA(UGE_Item_Heal_Insta) && bIsInCombatState)
            {
                EfficiencyModifier = 0.2f;
            }

            if (Magnitude == 0.0f)
                continue;

            float ManaDifferenceAfterRecovering = CharacterCurrentMana - CharacterMaxMana + Magnitude;
            float Efficiency = 1.0f - Math::Abs((ManaDifferenceAfterRecovering) / Magnitude);
            float WastedPotionMana = Math::Clamp(ManaDifferenceAfterRecovering, 0.0f, MAX_flt);

            if (WastedPotionMana > CharacterMaxMana * ManaRatioOfWastedPotionAllowed)
                return -1000.0f;

            return 1.0f + 10.0f * Efficiency * EfficiencyModifier;
        }

        return 0.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Consumable_DisableHealOvertimeConsumablesIfAlreadyHealing : UGothicAIItemActionScoringEntry
{
    default Description = "Item has heal over time and already healing.";
    default GroupTag = GameplayTag::Action_QuickConsume;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_Consumable_AlreadyHealing::IsEntryRelevantToItemAction"));

        for (auto Effect : ItemActionHandler.ItemDefinition.m_OnConsumeEffects)
        {
            if (Effect.m_Effect.Get().IsA(UGE_Item_Heal_Overtime))
                return true;
        }

        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyToCurrentSituation() const
    {
        FGameplayEffectQuery GameplayEffectQuery = FGameplayEffectQuery();
        GameplayEffectQuery.EffectDefinition = UGE_Item_Heal_Overtime;
        if (AI.Character.GetGothicAbilitySystemComponent().GetActiveEffects(GameplayEffectQuery).Num() > 0)
            return true;

        return false;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        return true;
    }
}

////////////////////////////////////////////////////////////////////////
//  MISC
////////////////////////////////////////////////////////////////////////

UCLASS()
class UAIItemScoringEntry_Weapon_ActualWeaponBonus : UGothicAIItemActionScoringEntry
{
    default Description = "Item is truly a weapon.";
    default GroupTag = GameplayTag::Item_Weapon;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_TrueWeapon::IsEntryRelevantToItemAction"));

        if (ItemActionHandler.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_NoThreat) || ItemActionHandler.ItemDefinition.IsA(UHumanFists) || ItemActionHandler.ItemDefinition.IsA(UTorch1H))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_TrueWeapon::CalculateScore"));

        return 1.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_NoThreatWeapon_NotWeaponBonus : UGothicAIItemActionScoringEntry
{
    default Description = "Item is not really a weapon.";
    default GroupTag = GameplayTag::Item_Property_NoThreat;

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_FalseWeapon::CalculateScore"));
        if (ItemActionHandler.ItemDefinition.IsA(UHumanFists))
            return 0.5f;
        
        if (ItemActionHandler.ItemDefinition.IsA(UTorch1H))
            return 0.75f;

        if (ItemActionHandler.ItemDefinition.ItemType.MatchesTag(GameplayTag::Item_Weapon_Axe_TwoHand))
            return 0.75f;

        return 0.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Fists_NotWeaponBonus : UGothicAIItemActionScoringEntry
{
    default Description = "Item is not really a weapon.";
    default GroupTag = GameplayTag::Item_Weapon_Fist;

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_FalseWeapon::CalculateScore"));

        if (ItemActionHandler.ItemDefinition.IsA(UHumanFists))
            return 0.5f;

        return 0.0f;
    }
}

UCLASS()
class UAIItemScoringEntry_Mlt_Personality_WeaponPreference : UGothicAIItemActionScoringEntry
{
    default Description = "Character's weapon preference.";
    default bIsMultiplier = true;
    default GroupTag = GameplayTag::Item_Weapon;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_WeaponPreference::IsEntryRelevantToItemAction"));

        if (!ItemActionHandler.ItemDefinition.IsA(UWeaponDefinition) && !ItemActionHandler.ItemDefinition.IsA(USpellContainer))
            return false;

        if (!IsValid(AI.CharacterState.CurrentPersonality))
            return false;

        if (AI.CharacterState.CurrentPersonality.DefaultObject.GetPreferenceOfWeaponType(ItemActionHandler.ItemDefinition.ItemType) == 1.0f)
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        if (!IsValid(AI.CharacterState.CurrentPersonality))
            return 1.0f;
        
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"ItemScoring_WeaponPreference::CalculateScore"));
        return AI.CharacterState.CurrentPersonality.DefaultObject.GetPreferenceOfWeaponType(ItemActionHandler.ItemDefinition.ItemType);
    }
}

UCLASS()
class UAIItemScoringEntry_DisableUnequipableWeapons : UGothicAIItemActionScoringEntry
{
    default Description = "Weapon can't be used by this character (skill issue or animconfig missing)";
    default GroupTag = GameplayTag::Item_Weapon;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"UAIItemScoringEntry_DisableUnequipableWeapons::IsEntryRelevantToItemAction"));

        if (AI.Character.Inventory.CanEquipItemOfClass(ItemActionHandler.ItemDefinition.Class))
            return false;

        return true;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"UAIItemScoringEntry_DisableUnequipableWeapons::VetoActionUsage"));

        return true;
    }
}

UCLASS()
class UAIItemScoringEntry_EquipSpecificItemClass : UGothicAIItemActionScoringEntry
{
    default Description = "Specific item class";
    default GroupTag = GameplayTag::Item_Weapon;

    UAIItemScoringEntry_EquipSpecificItemClass(TSubclassOf<UItemDefinition> ItemClass)
    {
        _ItemClass = ItemClass;
    }

    UPROPERTY()
    TSubclassOf<UItemDefinition> _ItemClass;

    UFUNCTION(BlueprintOverride)
    bool IsEntryRelevantToItemAction(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"UAIItemScoringEntry_DisableUnequipableWeapons::IsEntryRelevantToItemAction"));

        

        return true;
    }

    
    UFUNCTION(BlueprintOverride)
    bool VetoActionUsage(const FItemActionHandler ItemActionHandler) const
    {
        //FScopeCycleCounter ScopeCycleCounter(FStatID(n"UAIItemScoringEntry_DisableUnequipableWeapons::VetoActionUsage"));
        if (AI.Character.Inventory.CanEquipItemOfClass(ItemActionHandler.ItemDefinition.Class))
            return true;

        if (ItemActionHandler.ItemDefinition.IsA(_ItemClass))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const FItemActionHandler ItemActionHandler) const
    {
        return 1.0f;
    }
}