
class UGE_Character_Definition : UGameplayEffect_AbilitySet
{
    default AddAbility(UGA_CancelAbilities_Falling::StaticClass());
    default AddAbility(UGameplayAbilityPivot::StaticClass());
    default AddAbility(UGA_Hit::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_LightHit::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_Deflected::StaticClass());
    default AddAbility(UGA_Riposte::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_BreakSuperArmor::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_Death::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGameplayAbilityRagdoll::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_Falling::StaticClass());
    default AddAbility(UGameplayAbilityLanding::StaticClass());
    default AddAbility(UGameplayAbilityCinematicActor::StaticClass());

    //Abilities that register PerceptionHandlers in case the Character gets controlled by the player
    default AddAbility(UGA_PlayerPerception_CrimeRegistration::StaticClass());
}