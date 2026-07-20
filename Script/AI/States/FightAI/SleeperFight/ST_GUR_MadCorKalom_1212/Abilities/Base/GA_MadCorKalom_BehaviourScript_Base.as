class UGA_Creature_BehaviourScript_Base : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;

    //default AbilityTags.AddTag(GameplayTag::Ability_Action_Teleport_XardasSleeper);
    //default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Teleport_XardasSleeper);
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

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Falling);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Falling);

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {

    }

}

class UGA_MadCorKalom_BehaviourScript_Base : UGA_Creature_BehaviourScript_Base
{

}
