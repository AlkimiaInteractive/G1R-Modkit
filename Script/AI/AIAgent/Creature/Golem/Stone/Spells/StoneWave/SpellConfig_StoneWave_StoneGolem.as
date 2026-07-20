UCLASS()
class UStoneWaveSpellConfig_StoneGolem : UFistOfWindSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;

    default m_SpellLevels.Empty();
    
    default AddSpellLevel(-1.0f, 0.1f, -1.0f, UGA_Spell_StoneWave_StoneGolem::StaticClass());

    default m_Duration = 1.5f; //3.5
    default m_AreaRange = 1200.f;
    default m_AreaAngle = 35.f;
    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea_StoneGolem();

    default m_BoxDepth = 75.0f;
        
    default m_BoxZRadius = 50.0f;

}


UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellFrontArea_StoneGolem()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 490.0f;
    Camera.m_SpellPitchLimit = 10.0f;
    Camera.m_SpellYawLimit = 10.0f;
    Camera.m_SocketOffset = FVector(0.0f, 65.0f, -15.0f);
    return Camera;
}

