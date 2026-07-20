UCLASS()
class UTeleportSpellConfig_SkeletonMage : USpellConfig
{
    default m_SpellLevels.Empty();
    default AddSpellLevel(-1.0f, 0.2f, -1.0f, UGA_Spell_Teleport_SkeletonMage::StaticClass());

    default m_SpellTargetType = ESpellTargetType::None;
    default m_SpellManaUsage = ESpellManaUsage::Normal;

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea_SkeletonMage();
}


UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellFrontArea_SkeletonMage()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 490.0f;
    Camera.m_SpellPitchLimit = 10.0f;
    Camera.m_SpellYawLimit = 10.0f;
    Camera.m_SocketOffset = FVector(0.0f, 65.0f, -15.0f);
    return Camera;
}

