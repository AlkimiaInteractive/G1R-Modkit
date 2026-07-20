UCLASS()
class UProjectileSpellConfig_IceBolt_IceGolem : UProjectileSpellConfig_IceBolt
{
    default m_SpellLevels.Empty();
    default m_SpawnLocationSocket = n"jawSocket";
    default AddSpellLevel(-1.0f, 0.01f, -1.0f, UGA_Spell_IceGolem_IceBolt::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 1.0f;

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))     
    void ChangeCameraBehaviour_Scriptable(bool moving)
    {         
        m_CameraBehaviour = GetCameraBehaviourSpellFrontProjectile_IceGolem();
    }


    UFUNCTION()
    FCameraBehaviour GetCameraBehaviourSpellFrontProjectile_IceGolem()
    {
        FCameraBehaviour Camera;
        Camera.m_IsAim = true;
        Camera.m_ArmLength = 1090.0f;
        Camera.m_SpellPitchLimit = 180.0f;
        Camera.m_SpellYawLimit = 180.0f;
        Camera.m_SocketOffset = FVector(0.0f, 650.0f, -15.0f);
        return Camera;
    }

}

