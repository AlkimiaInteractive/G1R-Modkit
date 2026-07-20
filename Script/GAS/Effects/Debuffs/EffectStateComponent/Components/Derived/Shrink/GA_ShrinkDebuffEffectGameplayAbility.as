class UGA_ShrinkDebuffEffectGameplayAbility : UGA_DebuffEffectGameplayAbilityGASbase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Shrink);

    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
}