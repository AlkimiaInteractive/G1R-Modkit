UCLASS()
class UIceBlockProjectileDefinition_IceGolem : UIceBlockProjectileDefinition
{
	default m_Name = "IceBlock_IceGolem";

	default m_HitEffect = UGE_IceBlock_Freeze_Damage::StaticClass();//UGE_IceBlock_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 80.00f);
}