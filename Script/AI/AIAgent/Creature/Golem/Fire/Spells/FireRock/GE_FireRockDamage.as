class UGE_FireRock_Damage : UGE_Damage_Fire
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
}