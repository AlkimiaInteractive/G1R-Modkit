
UCLASS()
class UGE_Rat_AI : UGE_Character_Definition
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
	
	default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
}

UCLASS()
class UGE_Rat_Player : UGE_Character_Definition
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
	
	default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
}