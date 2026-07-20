class UGA_FloatingRuneEffect : UGA_FloatingItemEffectGASbase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_FloatingItem_Rune);



    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
}