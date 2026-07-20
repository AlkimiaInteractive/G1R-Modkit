UCLASS()
class UGA_MiltenSleeper_BrazierMontage : UGameplayAbilitySpellCreaturePlayMontage
{
    

    default AbilityTags.AddTag(GameplayTag::Ability_Action_Montage_MiltenSleeper_Brazier);
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Montage_MiltenSleeper_Brazier);
    default AbilityTags.RemoveTag(GameplayTag::AbilitySpec_Transient);
    default AbilityTags.AddTag(GameplayTag::AbilitySpec_Continuous);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Interact);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_DrawItem);
	
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);

    default ActivationOwnedTags.AddTag(GameplayTag::State_IgnoreMovementInput);
    default ActivationOwnedTags.AddTag(GameplayTag::State_BlockState);
    default ActivationOwnedTags.AddTag(GameplayTag::State_LockMovement);
    default ActivationOwnedTags.AddTag(GameplayTag::State_Rotation_Lock);

    default TriggerBeginOn(GameplayTag::Debuff_Milten_Brazier, EGameplayAbilityTriggerSource::OwnedTagPresent);

    default m_ActivateAbilityOnGranted = false;

    default m_StopWhenAbilityEnds = true;

    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Milten/BrazierDamage/A_MiltenSleeper_Rune_BrazierDamage_Montage.A_MiltenSleeper_Rune_BrazierDamage_Montage'";

    
}