class UGE_FireBall_Lvl3_Damage : UGE_Damage_Fire
{
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
}