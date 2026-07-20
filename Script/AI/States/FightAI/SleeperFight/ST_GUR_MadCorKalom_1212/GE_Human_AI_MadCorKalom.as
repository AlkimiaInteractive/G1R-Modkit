UCLASS()
class UGE_Human_AI_MadCorKalom : UGE_Human_AI_Mage_SixthCircle_Sleeper_Extended
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.RemoveTag(GameplayTag::State_Killable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invulnerable);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Simulation_NoVisuals);
    

    default AddAbility(UGA_MadCorKalom_CombatTrigger::StaticClass());
    default RemoveAbility(UGameplayAbility_EquipItem::StaticClass());
    default RemoveAbility(UGA_BossHealthBar::StaticClass());
    default RemoveAbility(UGA_ForceEnemyRelationship::StaticClass());  
}

UCLASS()
class UGE_Human_AI_MadCorKalom_Into_Trance : UGE_Human_AI_MadCorKalom
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.RemoveTag(GameplayTag::State_Killable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invulnerable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CantBeTarget);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default AddAbility(UGA_Into_Trance_MadCorKalom_PlayMontage::StaticClass());
    default RemoveAbility(UGA_MadCorKalom_CombatTrigger::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}

UCLASS()
class UGE_Human_AI_MadCorKalom_Trance : UGE_Human_AI_MadCorKalom
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.RemoveTag(GameplayTag::State_Killable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invulnerable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CantBeTarget);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Perceptions_GetIgnored);

    default AddAbility(UGA_Trance_MadCorKalom_PlayMontage::StaticClass());
    default RemoveAbility(UGA_MadCorKalom_CombatTrigger::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}


UCLASS()
class UGE_Human_AI_MadCorKalom_Trance_End : UGE_Human_AI_MadCorKalom_Trance
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transforming);
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}
