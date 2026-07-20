class UGE_BallLightning_Damage : UGE_Damage_Electrified
{
	//default m_ElementalEffectStack = UGE_Electrified_Impact_Paralyze_BallLigthning::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_Electrified_Impact_Paralyze_BallLigthning::StaticClass()));
    // FConditionalGameplayEffect condEffect;
	// default condEffect.EffectClass = UGE_Electrified_Impact_Paralyze_BallLigthning::StaticClass();
	// //Add the paralice effect to Damage GameplayEffectExecutionDefinition (UGE_Ex_Damage) 
	// //So if the UGE_Ex_Damage is executed, we also exeute the UGE_Electrified_Paralyze_BallLigthning effect

	// default Executions[0].ConditionalGameplayEffects.Add(condEffect);
}


UCLASS()
class UGE_Electrified_Impact_Paralyze_BallLigthning: UGE_Electrified_Impact_Paralyze
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5.0f; 
}