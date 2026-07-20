// Effect used by the fire lizzard flame thrower attack
// Damage can be found in item ULizardFire
// Attack config is in UAttackMeleeConfig_Lizard_Fire_Attack_Top
class UGE_Damage_Fire_Lizard : UGE_Damage_Fire_Infinite
{
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
}