
UCLASS()
class UCampFireDefinition : UWeaponDefinition
{
	default m_Name = "CampFire";

	default m_HitEffect = UGE_CampFireEnvironmentDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.00f);
	default SetItemType(GameplayTag::Item_Weapon_Environment);

	default m_SuperArmorDamageBase = 0.0f;
}

class UGE_CampFireEnvironmentDamage : UGE_FireEnvironmentDamage
{
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
}