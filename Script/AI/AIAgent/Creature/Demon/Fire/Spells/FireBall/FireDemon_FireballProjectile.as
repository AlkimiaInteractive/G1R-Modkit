UCLASS()
class UDemonFireballProjectileDefinition : USpellProjectileDefinition
{
    default m_Name = "Demon_Fireball";
    //default m_OnEquipEffect = UGE_Goblin_Equip::StaticClass(); Check if we need any effect

    default SetItemType(GameplayTag::Item_Projectile_Right);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_FireBall_Lvl1_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 20.0f);
	default m_SuperArmorDamageBase = 20.0f;

    //On fireball spell, the lvl 1 is the firebolt projectile
	default m_ItemVisual = n"Blueprint'/Game/Items/Magic/FireDemon/Fireball/BP_FireDemon_Fireball.BP_FireDemon_Fireball_C'";

	default m_Speed = 800.0f;
	//Explosion firebolt is little than fireball explosion, so at level 1 and level 2 we put the firebolt explosion
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_Fireball_Explosion.BP_Fireball_Explosion_C'";
	default m_Radius = 5.0f;
	UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
	float m_RadiusHitSphere = 5.0f;
	default m_DefaultTargetDistance = 100000;
}

UCLASS()
class UDemonFireballLeftProjectileDefinition : UDemonFireballProjectileDefinition
{
	default SetItemType(GameplayTag::Item_Projectile_Left);
    //On fireball spell, the lvl 1 is the firebolt projectile
	default m_ItemVisual = n"Blueprint'/Game/Items/Magic/FireDemon/Fireball/BP_FireDemon_Fireball_Left.BP_FireDemon_Fireball_Left_C'";
}