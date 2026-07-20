UCLASS()
class UTeleportSpellConfig_MiltenSleeper : USpellConfig
{
    default m_SpellLevels.Empty();
    default AddSpellLevel(-1.0f, 0.2f, -1.0f, UGA_Spell_Teleport_MiltenSleeper::StaticClass());

    default m_SpellTargetType = ESpellTargetType::None;
    default m_SpellManaUsage = ESpellManaUsage::Normal;

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea_MiltenSleeper();
}


UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellFrontArea_MiltenSleeper()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 490.0f;
    Camera.m_SpellPitchLimit = 10.0f;
    Camera.m_SpellYawLimit = 10.0f;
    Camera.m_SocketOffset = FVector(0.0f, 65.0f, -15.0f);
    return Camera;
}

