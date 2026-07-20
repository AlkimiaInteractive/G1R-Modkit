
class UGA_Creature_PlayMontage_Base : UGameplayAbilitySpellCreaturePlayMontage
{    
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Creature_PlayMontage);
    default ActivationOwnedTags.AddTag(GameplayTag::State_Scripting_Action);
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Creature_PlayMontage);
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);
    default BlockAbilitiesWithTag.AddTag((GameplayTag::Ability_Interact));
	
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);
    default CancelAbilitiesWithTag.AddTag((GameplayTag::Ability_Interact));

    default ActivationOwnedTags.AddTag(GameplayTag::State_NonInteractable);


    default m_ActivateAbilityOnGranted = false;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
       
    }

}