
UCLASS()
class UGE_TheSleeper_AI : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CantBeTarget);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());
}

UCLASS()
class UGE_TheSleeper_Player : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CantBeTarget);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Perceptions_GetIgnored);
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());
}