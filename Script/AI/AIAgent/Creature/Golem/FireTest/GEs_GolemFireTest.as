UCLASS()
class UGE_Golem_Fire_AI_Test_CanFreeze : UGE_Golem_AI
{
    // default AddAbility(UGA_FireGolem_SpecialState_Heated::StaticClass());
    // default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    // default AddAbility(UGA_BreakSuperArmor_FireGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_FireGolem_EnvironmentAttack_ArenaLavaStreams::StaticClass());
    // default AddAbility(UGA_FireGolem_EnvironmentAttack_ArenaFloorSinking::StaticClass());
    //default InheritableOwnedTagsContainer.RemoveTag(GameplayTag::State_Cant_Freeze);    
    default AssetTagsComponent.InheritableAssetTags.RemoveTag(GameplayTag::State_Cant_Freeze);
}
