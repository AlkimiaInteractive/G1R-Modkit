class UGE_IceBolt_Damage : UGE_Ice_Damage
{
	//default m_ElementalEffectStack = UGE_IceStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_IceStack::StaticClass()));
}