UCLASS()
class UOrcBallLightningProjectileDefinition : UBallLightningDefinition_Base
{
    default m_Name = "BallLightning_Orc";

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

	default m_HitEffect = UGE_BallLightning_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 20.0f);

	default m_Radius = 30.0f;
	default m_DefaultTargetDistance = 100000;
	default m_LifeTime = 4.f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Magic/Orc/Balllightning/BP_Orc_BallLightning.BP_Orc_BallLightning_C'";
	default m_ExplosionPath = n"Blueprint'/Game/Items/Magic/BallLightning/BP_BallLightning_Explosion.BP_BallLightning_Explosion_C'";
}