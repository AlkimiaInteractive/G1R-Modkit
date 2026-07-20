UCLASS()
class UProjectileSpellConfig_FireBall_Orc : UProjectileSpellConfig_FireBall
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

    default m_SpellLevels.Empty();

    // default AddSpellLevel(0.0f, -1.0f, UGA_Spell_FireBall_Orc::StaticClass(), USpellConfigLevelData_FireBall_Orc_Lvl1::StaticClass());
    // default AddSpellLevel(0.5f, 1.0f, UGA_Spell_BallLightning_Orc::StaticClass(), USpellConfigLevelData_BallLightning_Orc_Lvl2::StaticClass());
    // default AddSpellLevel(0.8f, 1.0f, UGA_Spell_BallLightning_Orc::StaticClass(), USpellConfigLevelData_BallLightning_Orc_Lvl3::StaticClass());
    // default AddSpellLevel(1.03f, 1.0f, UGA_Spell_FireBall_Orc::StaticClass(), USpellConfigLevelData_FireBall_Orc_Lvl4::StaticClass());
    
    //version v1
    default AddSpellLevel(-1.0f, 2.081517f, -1.0f, UGA_Spell_FireBall_Orc::StaticClass(), USpellConfigLevelData_FireBall_Orc_Lvl4::StaticClass());
    //Version v2
    // default AddSpellLevel(1.251885f, 1.0f, UGA_Spell_FireBall_Orc::StaticClass(), USpellConfigLevelData_FireBall_Orc_Lvl4::StaticClass());

    default m_CameraBehaviour = FCameraBehaviour();

     UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = FCameraBehaviour();;
    }
}