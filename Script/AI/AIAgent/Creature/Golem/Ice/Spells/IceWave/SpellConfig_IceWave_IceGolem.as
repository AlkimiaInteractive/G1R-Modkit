UCLASS()
class UIceWaveSpellConfig_IceGolem : UIceBlockSpellConfig
{
    default m_SpellLevels.Empty();
    default AddSpellLevel(-1.0f, 0.2f, -1.0f, UGA_Spell_IceBlock_IceGolem::StaticClass());

    default m_AreaRange = 1300.f;
    default m_AreaAngle = 45.f;
    default m_Duration = 0.8f;

    default m_BoxDepth = 75.0f;
        
    default m_BoxZRadius = 60.0f;

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea_IceGolem();
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellFrontArea_IceGolem()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 650.0f;
    Camera.m_SpellPitchLimit = 10.0f;
    Camera.m_SpellYawLimit = 10.0f;
    Camera.m_SocketOffset = FVector(0.0f, 65.0f, -15.0f);
    return Camera;
}
