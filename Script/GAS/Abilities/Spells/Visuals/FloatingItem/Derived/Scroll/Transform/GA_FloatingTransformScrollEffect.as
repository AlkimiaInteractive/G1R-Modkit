class UGA_FloatingTransformScrollEffect : UGA_FloatingScrollEffect
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_FloatingItem_Scroll_Transform);

    // default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_SpellCasting);
	// default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
	// default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_DrawItem);
	// default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_QuickConsume);
    // default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Jump);
    // default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_SpellCasting);

    //add list of cancel / block abilities when the debuff is activated.
    //Example
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
    //default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Aim);
}