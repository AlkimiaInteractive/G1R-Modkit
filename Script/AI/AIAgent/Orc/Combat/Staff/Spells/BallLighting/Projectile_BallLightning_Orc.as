class UBallLightningDefinition_Base_Orc : UBallLightningDefinition_Base
{
	default m_Name = "BallLightning_Base";
	default m_HitEffect = UGE_BallLightning_Damage::StaticClass();
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 0.f); 
	default m_Speed = 0.f;
	default m_ExplosionPath = n"Blueprint'/Game/Items/Magic/BallLightning/BP_BallLightning_Explosion.BP_BallLightning_Explosion_C'";
	default m_Radius = 0.f;
	default m_LifeTime = 0.f;

	default m_CoolDownActorTime = 1.5f;
	
}

UCLASS()
//Specific behaviour for the BallLightning Level 1
class UBallLightningDefinition_Orc_Lvl1 : UBallLightningDefinition_Base_Orc
{
	default m_Name = "BallLightning_Orc_Lvl1";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 80.0f);

	default m_Speed = 500.f;
	default m_Radius = 30.f;
	default m_LifeTime = 4.f;
}
UCLASS()
class UBallLightningDefinition_Orc_Lvl2 : UBallLightningDefinition_Base_Orc
{
	default m_Name = "BallLightning_Orc_Lvl2";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 100.0f);
	default m_Speed = 550.f;
	default m_Radius = 50.f;
	default m_LifeTime = 6.f;
}
UCLASS()
class UBallLightningDefinition_Orc_Lvl3 : UBallLightningDefinition_Base_Orc
{
	default m_Name = "BallLightning_Orc_Lvl3";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 120.0f);
	default m_Speed = 600.f;
	default m_Radius = 70.f;
	default m_LifeTime = 8.f;
}
UCLASS()
class UBallLightningDefinition_Orc_Lvl4 : UBallLightningDefinition_Base_Orc
{
	default m_Name = "BallLightning_Orc_Lvl4";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 140.0f);
	default m_Speed = 650.f;
	default m_Radius = 100.f;
	default m_LifeTime = 10.f;
}