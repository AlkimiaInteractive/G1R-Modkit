UCLASS()
class UGE_VarragKasorg_AI : UGE_OrcUndead_Shaman_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);

    FConditionalGameplayEffect conditionalSummonGE;
	default conditionalSummonGE.EffectClass = UGE_SummonedNotVisible::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalSummonGE);

    default AddAbility(UGA_Summon_VarragKasorg::StaticClass());
    default AddAbility(UGA_VarragKasorg_EnvironmentAttack_ActivateFireDemons::StaticClass());
    default AddAbility(UGA_Orc_ForceConversation_Varrag::StaticClass());
    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Varrag::StaticClass());

    default AddAbility(UGA_BossHealthBar::StaticClass());
}
