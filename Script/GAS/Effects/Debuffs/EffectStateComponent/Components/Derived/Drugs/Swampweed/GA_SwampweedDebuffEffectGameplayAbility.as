class UGA_SwampweedDebuffEffectGameplayAbility : UGA_DrugDebuffEffectGameplayAbilityBase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Drugs_Swampweed);

    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
}