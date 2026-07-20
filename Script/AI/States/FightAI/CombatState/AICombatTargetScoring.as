

UCLASS()
class UGothicAICombatTargetScoringEntryManager : UAICombatTargetScoringEntryManager
{
}

class UGothicAICombatTargetScoringEntry : UAICombatTargetScoringEntry
{
    UGameplayAbility_CharacterAI_Gothic AI = GetTypedOuter(UGameplayAbility_CharacterAI_Gothic);
}

//////////////////////////////////////////////////////////////////////////////
// Weapon Score Modifiers
//////////////////////////////////////////////////////////////////////////////

UCLASS()
class UAICombatTargetScoringEntry_PlayerBias : UGothicAICombatTargetScoringEntry
{
    default Description = "Prioritize player";

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return 0.0f;

        if (!Character.IsPlayerControlled())
            return 0.0f;
            
        return 1.0f;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_ZombieBias : UGothicAICombatTargetScoringEntry
{
    default Description = "Ignore Zombie";

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return 0.0f;

        if (Character.CharacterUniqueName == "SH_Zombie_01")
            return 0.0f;
            
        return 1.0f;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_CharacterTargetGroupLimits : UGothicAICombatTargetScoringEntry
{
    default Description = "Character target group size";

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return 0.0f;

        if (!Character.IsBeingTargetedInCombat())
            return 1.0f;

        auto AvailableGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Combat::StaticClass());

        for (auto Group : AvailableGroups)
        {
            UAIGroup_Combat CGroup = Cast<UAIGroup_Combat>(Group);
            if (!IsValid(CGroup)) continue;
            if (CGroup.TargetEnemy != Character) continue;

            if (CGroup.RoleSystem.GetFreeSizeForRole(ECombatRole::ActiveAttacker) >= 1.0f && CGroup.RoleSystem.GetNumFreeSlotsForRole(ECombatRole::ActiveAttacker) >= 1)
                return 0.75f;
            
            if (CGroup.RoleSystem.GetFreeSizeForRole(ECombatRole::PassiveAttacker) >= 1.0f && CGroup.RoleSystem.GetNumFreeSlotsForRole(ECombatRole::PassiveAttacker) >= 1)
                return 0.5f;

            if (CGroup.RoleSystem.GetNumCharactersInRole(ECombatRole::Observer) == 0)
                return 0.25f;

            if (CGroup.JoinedCharacters.Num() > 0)
                return 1.0f / CGroup.JoinedCharacters.Num();

            return 0.0f;
        }

        return 0.0f;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_CharacterDistance : UGothicAICombatTargetScoringEntry
{
    default Description = "Character distance";

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI) || !IsValid(AI.Character))
            return 0.0f;

        /**
         * ReturnValueWhenClose --> |-----------,
         *                          |           ·`-_                       
         *                          |           ·   `-_
         *                          |           ·      `-_
         *                          |           ·         `-_
         *   ReturnValueWhenFar --> | · · · · · · · · · · · ·`-------
         *                          |           ·             ·
         *               (0, 0) --> |-----------+-------------+----------
         *                                      ^             ^
         *                                      |             |
         *                                  MinDistance       |
         *                                                MaxDistance 
         */


        float MinDistance = 0.0f; // Return maximum value at this distance and closer
        float MaxDistance = 2000.0f; // Return minimum value at this distance and farther
        float ReturnValueWhenFar = 0.0f; // Value to return at maximum distance and farther
        float ReturnValueWhenClose = 1.0f; // Value to return at minimum distance and closer

        float Distance = Character.ActorLocation.Distance(AI.Character.ActorLocation);

        float M = (ReturnValueWhenFar - ReturnValueWhenClose) / (MaxDistance - MinDistance); // Incline
        float N = -MinDistance * M + ReturnValueWhenClose; // Offset

        float MinValue = Math::Min(ReturnValueWhenClose, ReturnValueWhenFar);
        float MaxValue = Math::Max(ReturnValueWhenClose, ReturnValueWhenFar);
        return Math::Clamp(M * Distance + N, MinValue, MaxValue);
    }
}

UCLASS()
class UAICombatTargetScoringEntry_AlreadyTargeting : UGothicAICombatTargetScoringEntry
{
    default Description = "Already targeting this character";

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return 0.0f;

        if (AI.CharacterOfInterest == Character)
            return 1.0f;

        return 0.0f;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_AttackedMe : UGothicAICombatTargetScoringEntry
{
    default Description = "Target is attacking me";

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI) || !IsValid(AI.Character))
            return 0.0f;

        auto CharacterAttacksTowardsMe = AI.Character.CharacterState.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Combat_WasDamaged_Intentionally).CausedBy(Character.GetCharacterGlobalId()).GetArrayNewestToOldest();

        if (CharacterAttacksTowardsMe.Num() == 0)
            return 0.0f;

        if (CharacterAttacksTowardsMe[0].Time.AgeInRealtimeSeconds > 10.0f)
            return 0.0f;

        return 20.0f;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_DistanceToPreferredLocation : UGothicAICombatTargetScoringEntry
{
    default Description = "Target distance to preferredlocation";

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return 0.0f;

        /**
         * ReturnValueWhenClose --> |-----------,
         *                          |           ·`-_                       
         *                          |           ·   `-_
         *                          |           ·      `-_
         *                          |           ·         `-_
         *   ReturnValueWhenFar --> | · · · · · · · · · · · ·`-------
         *                          |           ·             ·
         *               (0, 0) --> |-----------+-------------+----------
         *                                      ^             ^
         *                                      |             |
         *                                  MinDistance       |
         *                                                MaxDistance 
         */


        float MinDistance = 0.0f; // Return maximum value at this distance and closer
        float MaxDistance = AI.DisengageDistanceFromPreferredLocation; // Return minimum value at this distance and farther
        float ReturnValueWhenFar = 0.0f; // Value to return at maximum distance and farther
        float ReturnValueWhenClose = 1.0f; // Value to return at minimum distance and closer

        float Distance = AI.PreferredLocation.GetDistanceFromActor(Character);

        if (Distance > AI.DisengageDistanceFromPreferredLocation)
            return -1.0f;

        float M = (ReturnValueWhenFar - ReturnValueWhenClose) / (MaxDistance - MinDistance); // Incline
        float N = -MinDistance * M + ReturnValueWhenClose; // Offset

        float MinValue = Math::Min(ReturnValueWhenClose, ReturnValueWhenFar);
        float MaxValue = Math::Max(ReturnValueWhenClose, ReturnValueWhenFar);
        return Math::Clamp(M * Distance + N, MinValue, MaxValue);
    }
}

UCLASS()
class UAICombatTargetScoringEntry_IgnoreDefeatedCharacterInCombat : UGothicAICombatTargetScoringEntry
{
    default Description = "Ignore defeated character in combat";

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyTo(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return false;

        if (!Character.IsDefeated())
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool VetoUsage(const AGothicCharacter Character) const
    {
        return true;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_IgnoreDefeatedPlayerInCombat : UGothicAICombatTargetScoringEntry
{
    default Description = "Ignore defeated player in combat";

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyTo(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return false;

        if (!Character.IsDefeated())
            return false;

        if (!Character.IsPlayerCharacterOrPlayerControlled())
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool VetoUsage(const AGothicCharacter Character) const
    {
        return true;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_IgnoreUnkillableDefeatedInCombat : UGothicAICombatTargetScoringEntry
{
    default Description = "Ignore unkillable defeated character in combat";

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyTo(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return false;

        if (!Character.IsDefeated())
            return false;

        if (!Character.HasGameplayTag(GameplayTag::State_UnKillable))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool VetoUsage(const AGothicCharacter Character) const
    {
        return true;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_TargetForCombatExecution : UGothicAICombatTargetScoringEntry
{
    default Description = "Target for combat execution";

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyTo(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return false;

        if (AI.Self.GetCharactersWithTagTargetingThisCharacterInCombat().Num() > 0)
            return false;

        if (!Character.IsDefeated())
            return false;

        if (Character.IsPlayerCharacterOrPlayerControlled())
            return false;

        if (Character.HasGameplayTag(GameplayTag::State_UnKillable))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        return 1.0f;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_InsideSameTerritory : UGothicAICombatTargetScoringEntry
{
    default Description = "Target territory";

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyTo(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI))
            return false;

        if (AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Character))
            return true;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    float CalculateScore(const AGothicCharacter Character) const
    {
        return 5.0f;
    }
}

UCLASS()
class UAICombatTargetScoringEntry_IgnoreFleeingOrDisengagingTarget : UGothicAICombatTargetScoringEntry
{
    default Description = "Ignore fleeing or disengaging targets beyond distance threshold";

    float MinDistanceToIgnore = 700.0f;

    UFUNCTION(BlueprintOverride)
    bool DoesEntryApplyTo(const AGothicCharacter Character) const
    {
        if (!IsValid(Character) || !IsValid(AI) || !IsValid(AI.Character))
            return false;

        if (!Character.HasGameplayTag(GameplayTag::AIState_Conflict_Disengage)
            && !Character.HasGameplayTag(GameplayTag::AIState_Conflict_Flee))
            return false;

        float Distance = Character.ActorLocation.Distance(AI.Character.ActorLocation);
        if (Distance <= MinDistanceToIgnore)
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool VetoUsage(const AGothicCharacter Character) const
    {
        return true;
    }
}