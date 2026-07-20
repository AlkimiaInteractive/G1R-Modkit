
UCLASS()
class UGE_IceGrenade_Freeze_Damage : UGE_Ice_Damage//UGE_Freeze_Damage
{
	//default m_ElementalEffectStack = UGE_IceStack::StaticClass();

	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_IceStack::StaticClass()));
}
