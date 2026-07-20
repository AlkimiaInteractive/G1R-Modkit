// Effect used by the Hashor firewall
class UGE_Damage_Hashor_Firewall : UGE_Damage_Fire_Infinite
{
	//default m_ForceOverflowElementalEffectStack = true;
	default Period.Value = 0.5f;
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass(), true));
}

