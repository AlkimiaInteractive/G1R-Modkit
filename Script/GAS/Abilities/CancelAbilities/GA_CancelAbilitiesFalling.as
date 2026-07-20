class UGA_CancelAbilities_Falling : UGameplayAbilityBase
{
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Interact);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Throw);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit_BreakArmorHit);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_DrawItem);

    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Interact);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement_Throw);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit_BreakArmorHit);

    default ActivationOwnedTags.AddTag(GameplayTag::Block_Action_EndEquip);

    default TriggerBeginOn(GameplayTag::CancelAbilities_Falling);
    default TriggerEndOn(GameplayTag::End_CancelAbilities_Falling);
}