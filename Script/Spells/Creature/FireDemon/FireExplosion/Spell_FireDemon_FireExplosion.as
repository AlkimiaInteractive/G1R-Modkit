UCLASS()
class UFireExplosionSpellConfig : USpellConfig
{
   
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration = 0.9f;
    
    //Current value
    default m_AreaRange = 700.f;
    default m_AreaAngle = 360.f;
    default m_SpawnLocationSocket = n"weapon_r";
    
}

UCLASS()
class UFireExplosionProjectile : USpellProjectileDefinition
{
	default m_Name = "Fire_Explosion";

	default m_HitEffect = UGE_FireDemonFireExplosion::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 50.0f);
	//Current value
    //default m_SuperArmorDamageBase = 0.0f;
    //Test V3
    default m_SuperArmorDamageBase = 200.0f;
    
}