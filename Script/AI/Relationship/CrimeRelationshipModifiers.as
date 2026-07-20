UCLASS()
class URelationshipModifier_CrimeLevel_Angry : UPersonalRelationshipModifier
{
    default Weight = 1900.0f;
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    default RelationshipTowardsOther = ERelationship::Angry;

    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        auto AI = Cast<UGameplayAbility_CharacterAI_Gothic>(Me.CharacterAI);
        if (!IsValid(AI))
            return false;

        if (AI.CrimeSeverityTowardsPlayer == ECrimeSeverityLevel::None)
            return false;

        if (AI.CrimeSeverityTowardsPlayer == ECrimeSeverityLevel::Minimal || AI.CrimeSeverityTowardsPlayer == ECrimeSeverityLevel::Low)
            return false;

        // if (AI.CrimeSeverityTowardsPlayer != ECrimeSeverityLevel::Medium && AI.CrimeSeverityTowardsPlayer != ECrimeSeverityLevel::High)
        //     return false;

        return true;
    }
    
    UFUNCTION(BlueprintOverride)
    ERelationshipHostility HowHostileAmIAgainst(const AGothicCharacterState Me,
                                                const AGothicCharacterState Other) const
    {
        auto AI = Cast<UGameplayAbility_CharacterAI_Gothic>(Me.CharacterAI);
        if (!IsValid(AI))
            return ERelationshipHostility::Unknown;

        // TODO: Add blocking tag to prevent certain characters from allowing fines
        if (AI.bCanForgivePlayerWithFine && Me.HasGameplayTag(GameplayTag::CampRole_Guard))
            return ERelationshipHostility::DemandPaymentForCrimes;

        return ERelationshipHostility::Unknown;
    }
}

// UCLASS()
// class URelationshipModifier_CrimeLevel_Enemy : UPersonalRelationshipModifier
// {
//     default Weight = 2000.0f;
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);

//     default bApplicableWhenOtherIsPlayer = true;
//     default bApplicableWhenOtherIsNPC = false;

//     default RelationshipTowardsOther = ERelationship::Enemy;

//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         auto AI = Cast<UGameplayAbility_CharacterAI_Gothic>(Me.CharacterAI);
//         if (!IsValid(AI))
//             return false;

//         if (AI.CrimeSeverityTowardsPlayer != ECrimeSeverityLevel::Critical)
//             return false;

//         return true;
//     }
// }