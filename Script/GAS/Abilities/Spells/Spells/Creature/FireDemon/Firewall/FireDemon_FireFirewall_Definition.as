UCLASS()
class UFireDemon_FireFirewall_Definition : USpellProjectileDefinition
{
	default m_Name = "FireDemon_FireFirewall";

	default m_HitEffect = UGE_Damage_FireDemon_Firewall::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.00f);

}