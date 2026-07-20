
UCLASS()
class UGE_IceWave_Freeze_Damage : UGE_Ice_Damage//UGE_Freeze_Damage
{
	//default m_ElementalEffectStack = UGE_IceStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_IceStack::StaticClass()));
	// FConditionalGameplayEffect condEffect;
	// default condEffect.EffectClass = UGE_IceWave_Freeze::StaticClass();
	// //Add the freeze effect to Damage GameplayEffectExecutionDefinition (UGE_Ex_Damage) 
	// //So if the UGE_Ex_Damage is executed, we also exeute the UGE_IceWave effect

	// default Executions[0].ConditionalGameplayEffects.Add(condEffect);
}


// UCLASS()
// class UGE_IceWave_Freeze: UGE_Freeze
// {
//     default DurationMagnitude.ScalableFloatMagnitude.Value = 10.f; // Duration in seconds of the effect

//     default Resistance_Blunt_Debuff = 25.f; 
// }