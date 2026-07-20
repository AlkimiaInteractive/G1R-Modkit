USTRUCT()
struct FCombatTauntRequestTags
{
    FGameplayTagContainer AllRequired;
    FGameplayTagContainer AnyRequired;
    FGameplayTagContainer Blocked;
}

UCLASS()
class UCombatTauntRequestObject
{
    FGameplayTagContainer AllRequired;
    FGameplayTagContainer AnyRequired;
    FGameplayTagContainer Blocked;

    TSet<UFightAI_CombatSituation> Conditions;

    const bool bUseCooldown = true; 

    /** Access to the combat state that is using this object. */
    UAIState_Combat_G1R Combat;

    UFUNCTION()
    bool IsApplicable() const
    {
        // if cooldown enabled and is in cooldown, option is not available
        if (bUseCooldown && IsInCooldown())
            return false;

        // if conditions are not fulfilled, option is not available
        if (!IsConditionsFulfilled())
            return false;

        return true;
    }

    UFUNCTION()
    bool IsConditionsFulfilled() const
    {
        // if at least 1 condition is failed, conditions are not fulfilled
        for (auto Condition : Conditions)
        {
            if (!Condition.IsInSituation())
                return false;
        }

        return true;
    }

    UFUNCTION()
    bool IsInCooldown() const
    {
        // if any tag in AllRequired has an active cooldown, option is in cooldown
        for (auto Tag : AllRequired.GameplayTags)
        {
            if (Combat.GetTagCooldownSecondsLeft(Tag) > 0.0f)
                return true;
        }

        // if all tags in AnyRequired have an active cooldown, option is in cooldown
        bool bAnyRequiredNotOnCooldown = false;
        for (auto Tag : AnyRequired.GameplayTags)
        {
            if (Combat.GetTagCooldownSecondsLeft(Tag) > 0.0f)
                continue;

            bAnyRequiredNotOnCooldown = true;
        }

        if (!AnyRequired.GameplayTags.IsEmpty() && !bAnyRequiredNotOnCooldown)
            return true;

        return false;
    }
}

class UCombatTauntRequirements_InMovement : UCombatTauntRequestObject
{
    default AllRequired.AddTag(GameplayTag::Combat_Taunt_InMovement);

    default Conditions.Add(UCS_Or(UCS_Moving(), UCS_AttackSelected()));
}

class UCombatTauntRequirements_Running : UCombatTauntRequestObject
{
    default AllRequired.AddTag(GameplayTag::Combat_Taunt_InMovement_Running);

    default Conditions.Add(UCS_RunningOrSprinting());
}

class UCombatTauntRequirements_InPlace : UCombatTauntRequestObject
{
    default AllRequired.AddTag(GameplayTag::Combat_Taunt_InPlace);

    default Conditions.Add(UCS_Not(UCS_Moving()));
    default Conditions.Add(UCS_Not(UCS_AttackSelected()));
}

class UCombatTauntRequirements_Close : UCombatTauntRequestObject
{
    default AnyRequired.AddTag(GameplayTag::Combat_Taunt_Short);
    default AnyRequired.AddTag(GameplayTag::Combat_Taunt_CanBeCancelled);

    default Conditions.Add(UCS_EnemyCloserThan(300.0f));
}

class UCombatTauntRequirements_Gross : UCombatTauntRequestObject
{
    default Blocked.AddTag(GameplayTag::Combat_Taunt_Gross);

    default Conditions.Add(UCS_Or(UCS_IsFemale(), UCS_IsMage()));
}

// class UCombatTauntRequirements_Fatigued : UCombatTauntRequestObject
// {
//     default Blocked.AddTag(GameplayTag::Combat_Taunt_Fatigued);

//     default Conditions.Add(UCS_IsDamageReceivedInLastSecondsHigherThanPercent());
// }

// class UCombatTauntRequirements_Noticeable : UCombatTauntOptionPreset
// {
//     default Blocked.AddTag(GameplayTag::Combat_Taunt_Noticeable);

//     default Conditions.Add(UCS_Enemy)
// }