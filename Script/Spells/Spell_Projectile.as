
UCLASS()
class USpellProjectileConfig : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::NormalContinuous;
    default m_CameraBehaviour = GetCameraBehaviourSpellProjectileStatic();
    default m_SpawnLocationSocket = n"weapon_r";

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        if (moving)
        {
            m_CameraBehaviour = GetCameraBehaviourSpellProjectileMoving();
        }
        else
        {
            m_CameraBehaviour = GetCameraBehaviourSpellProjectileStatic();
        }
    }
}

UCLASS()
class UProjectileSpellConfig_IceBolt : USpellProjectileConfig
{
    default AddSpellLevel(1.f, 0.1f, 1.0f, UGA_Spell_IceBolt::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.8f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Ice;

    UFUNCTION(BlueprintOverride)     
    void ChangeCameraBehaviour_Scriptable(bool moving)
    {         
       Super::ChangeCameraBehaviour_Scriptable(true);
    }
}

UCLASS()
class UProjectileSpellConfig_FireBolt : USpellProjectileConfig
{
    default AddSpellLevel(1.f, 0.1f, 1.0f, UGA_Spell_FireBolt::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.8f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Fire;

    UFUNCTION(BlueprintOverride)     
    void ChangeCameraBehaviour_Scriptable(bool moving)
    {         
       Super::ChangeCameraBehaviour_Scriptable(true);
    }
}

UCLASS()
class UProjectileSpellConfig_FireBall : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Rechargeable;
    
    default AddSpellLevel(1.f, 0.4f, 0.f, UGA_Spell_SpawnRechargeableProjectile::StaticClass(), USpellConfigLevelData_FireBall_lvl1::StaticClass());
    default AddSpellLevel(2.f, 0.6f, 0.0f, UGA_Spell_SpawnRechargeableProjectile::StaticClass(), USpellConfigLevelData_FireBall_lvl2::StaticClass());
    default AddSpellLevel(2.f, 0.8f, 2.0f, UGA_Spell_SpawnRechargeableProjectile::StaticClass(), USpellConfigLevelData_FireBall_lvl3::StaticClass());

    default m_TimePercentageFromWhichCantCancelSpell = 0.9f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Fire;

    default m_CameraBehaviour = GetCameraBehaviourSpellProjectileCharging();
        UFUNCTION(BlueprintOverride)     
    void ChangeCameraBehaviour_Scriptable(bool moving)
    {         
       m_CameraBehaviour = GetCameraBehaviourSpellProjectileCharging();
    }
    

   //FCameraBehaviour SpellFireball;
   //default SpellFireball.m_IsAim = true;
   //default SpellFireball.m_ArmLength = 200.0f;
   //default SpellFireball.m_SocketOffset = FVector(0.0f, 95.0f, -30.0f);
   //default SpellFireball.m_SpellPitchLimit = 35.0f;
   //default SpellFireball.m_SpellYawLimit = 45.0f;
   ////default SpellFireball.m_SocketOffset = FVector(0.0f, 50.0f, -20.0f)
   //default m_CameraBehaviour = SpellFireball;
}

UCLASS()
class UProjectileSpellConfig_BallLightning : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Rechargeable;

    //This spell is special. The behaviour is in the gameplay cue due the ball is created on the cast and not on the spell
    //The NewCastTime cannot be greater than the charge_i animation.
    //for this cases, 1, 1.03, 1.03, 1.03 (are the max casttime for the 4 levels)
    // default AddSpellLevel(0.3f, 1.0f, UGA_Spell_BallLightning_Lvl1::StaticClass());
    // default AddSpellLevel(0.5f, 1.0f, UGA_Spell_BallLightning_Lvl2::StaticClass());
    // default AddSpellLevel(0.8f, 1.0f, UGA_Spell_BallLightning_Lvl3::StaticClass());
    // default AddSpellLevel(1.03f, 1.0f, UGA_Spell_BallLightning_Lvl4::StaticClass());

    default AddSpellLevel(5.f, 0.3f, 0.0f, UGA_Spell_BallLightning::StaticClass(), USpellConfigLevelData_BallLightning_Lvl1::StaticClass());
    default AddSpellLevel(1.f,1.03f, .0f, UGA_Spell_BallLightning::StaticClass(), USpellConfigLevelData_BallLightning_Lvl2::StaticClass());
    default AddSpellLevel(1.f,1.03f, .0f, UGA_Spell_BallLightning::StaticClass(), USpellConfigLevelData_BallLightning_Lvl3::StaticClass());
    default AddSpellLevel(2.f,1.03f, .0f, UGA_Spell_BallLightning::StaticClass(), USpellConfigLevelData_BallLightning_Lvl4::StaticClass());

    default m_CameraBehaviour = GetCameraBehaviourSpellProjectileCharging();

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Energy;

    UPROPERTY()
    float m_InvocationForwardDistance = 150;
    UPROPERTY()
    float m_LightIntensity = 2000;
    UPROPERTY()
    FColor m_LightColor = FColor(0, 141 , 255, 255);

    default m_SpawnLocationSocket = n"weapon_r";

     UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellProjectileCharging();
    }
}