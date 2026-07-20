class UGE_VarragArushat_AI : UGE_OrcUndead_Shaman_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);

    FConditionalGameplayEffect conditionalSummonGE;
	default conditionalSummonGE.EffectClass = UGE_SummonedNotVisible::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalSummonGE);

    default AddAbility(UGA_Summon_VarragArushat::StaticClass());
    default AddAbility(UGA_Orc_ForceConversation_Varrag::StaticClass());
    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Varrag::StaticClass());
}
