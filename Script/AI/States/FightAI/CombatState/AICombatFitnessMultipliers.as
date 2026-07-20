/** If Agent is in front and close to the enemy, should be more aggressive */
UCLASS()
class UCFM_NotInFrontOfTarget : UCombatFitnessMultiplier
{
    // default DefaultValue = 0.5f;
    // default Description = "Not in front of the target";

    // bool ShouldApply() override
    // {
    //     FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_InFrontAndCloseToEnemy::ShouldApply"));
    //     if (!Super::ShouldApply())
    //         return false;

    //     if (!Combat.IsEnemyFacingMe())
    //         return true;
        
    //     return true;
    // }
}

/** If Agent is closer to target, they're more fit */
UCLASS()
class UCFM_RangeToTarget : UCombatFitnessMultiplier
{
    default DefaultValue = 1.0f;
    default Description = "By distance to the target";

    bool ShouldApply() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_RangeToTarget::ShouldApply"));
        if (!Super::ShouldApply())
            return false;

        if (Combat.CharacterOfInterest == nullptr)
            return false;
        
        return true;
    }

    float GetValue() override property
    {
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


        float MinDistance = 100.0f; // Return maximum value at this distance and closer
        float MaxDistance = 10000.0f; // Return minimum value at this distance and farther
        float ReturnValueWhenFar = 1.0f; // Value to return at maximum distance and farther
        float ReturnValueWhenClose = 20.0f; // Value to return at minimum distance and closer

        float M = (ReturnValueWhenFar - ReturnValueWhenClose) / (MaxDistance - MinDistance); // Incline
        float N = -MinDistance * M + ReturnValueWhenClose; // Offset

        float Distance = Combat.Self.GetDistanceTo(Combat.CharacterOfInterest);
        float MinValue = Math::Min(ReturnValueWhenClose, ReturnValueWhenFar);
        float MaxValue = Math::Max(ReturnValueWhenClose, ReturnValueWhenFar);
        return Math::Clamp(M * Distance + N, MinValue, MaxValue);
    }
}

/** If Agent is closer to target, they're more fit */
UCLASS()
class UCFM_MovementAndAttackFailures : UCombatFitnessMultiplier
{
    default DefaultValue = 1.0f;
    default Description = "By movement and attack failure count";

    bool ShouldApply() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_MovementAndAttackFailures::ShouldApply"));
        if (!Super::ShouldApply())
            return false;

        auto OGCombat = Cast<UAIState_Combat_G1R>(Combat);
        if (OGCombat == nullptr)
            return false;

        if (OGCombat.FailureToAttackCounter + OGCombat.FailureToMoveCounter == 0)
            return false;
        
        return true;
    }

    float GetValue() override property
    {
        auto OGCombat = Cast<UAIState_Combat_G1R>(Combat);
        if (OGCombat == nullptr)
            return DefaultValue;

        float FailureToMoveMultiplier = OGCombat.FailureToMoveCounter <= 1 ? 1.0f : (1.0f / (OGCombat.FailureToMoveCounter - 1));
        float FailureToAttackMultiplier = OGCombat.FailureToAttackCounter <= 1 ? 1.0f : (1.0f / (OGCombat.FailureToAttackCounter - 1));

        return Math::Max(FailureToAttackMultiplier * FailureToMoveMultiplier, 0.5f);
    }
}

/** Agent got hit by the target recently, should be more aggressive */
UCLASS()
class UCFM_HitByTargetRecently : UCombatFitnessMultiplier
{
    default DefaultValue = 2.5f;
    default Description = "Hit by target recently";

    bool ShouldApply() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_HitByTargetRecently::ShouldApply"));
        if (!Super::ShouldApply())
            return false;

        if (Combat.HasNoticedDamageOnSelfLastSeconds(4.0f))
            return true;
        
        return false;
    }
}

/** Agent is already an Active Attacker*/
UCLASS()
class UCFM_CurrentlyActiveAttacker : UCombatFitnessMultiplier
{
    // default DefaultValue = 1.0f;
    // default Description = "Already Active Attacker";

    // bool ShouldApply() override
    // {
    //     FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_CurrentlyActiveAttacker::ShouldApply"));
    //     if (!Super::ShouldApply())
    //         return false;

    //     if (!Combat.IsCurrentRole(ECombatRole::ActiveAttacker))
    //         return false;
        
    //     return true;
    // }
}

/** Agent is currently a Passive Attacker*/
UCLASS()
class UCFM_CurrentlyPassiveAttacker : UCombatFitnessMultiplier
{
    // default DefaultValue = 1.0f;
    // default Description = "Currently Passive Attacker";

    // bool ShouldApply() override
    // {
    //     FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_CurrentlyPassiveAttacker::ShouldApply"));
    //     if (!Super::ShouldApply())
    //         return false;

    //     if (!Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
    //         return false;
        
    //     return true;
    // }
}

/** Agent is currently a Passive Attacker*/
UCLASS()
class UCFM_CurrentlyIsUsingArcherWeapon : UCombatFitnessMultiplier
{
    default DefaultValue = 0.6f;
    default Description = "Currently using Bow / Crossbow";

    bool ShouldApply() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_CurrentlyIsUsingArcherWeapon::ShouldApply"));
        if (!Super::ShouldApply())
            return false;

        if (!Combat.Self.HasDrawnBow() && !Combat.Self.HasDrawnCrossbow())
            return false;
        
        return true;
    }
}

/** Agent should not attack */
UCLASS()
class UCFM_ShouldNotAttack : UCombatFitnessMultiplier
{
    default DefaultValue = 0.5f;
    default Description = "Agent should not attack";

    bool ShouldApply() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_ShouldNotAttack::ShouldApply"));
        if (!Super::ShouldApply())
            return false;

        if (Combat.ShouldAttack())
            return false;
        
        return true;
    }
}

/** Agent's Strength ratio in the combat group */
UCLASS()
class UCFM_StrengthRatio : UCombatFitnessMultiplier
{
    default DefaultValue = 1.0f;
    default Description = "Character Strength Ratio";

    bool ShouldApply() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_StrengthRatio::ShouldApply"));
        if (!Super::ShouldApply())
            return false;
        
        return true;
    }

    float GetValue() override property
    {
        return Combat.CombatGroup.GetStrengthRatioOf(Combat.Self);
    }
}

/** Agent's combat priority */
UCLASS()
class UCFM_Priority : UCombatFitnessMultiplier
{
    default DefaultValue = 1.0f;
    default Description = "Character Priority";

    bool ShouldApply() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCFM_Priority::ShouldApply"));
        if (!Super::ShouldApply())
            return false;
        
        return true;
    }

    float GetValue() override property
    {
        return (/*1.0f + */Combat.GetAgentTotalPriority());
    }
}