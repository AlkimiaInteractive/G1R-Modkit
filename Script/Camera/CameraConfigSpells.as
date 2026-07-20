

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellProjectileCharging()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 190.0f;
    Camera.m_SpellPitchLimit = 35.0f;
    Camera.m_SpellYawLimit = 35.0f;
    Camera.m_SocketOffset = FVector(0.0f, 60.00, -15.0f);
    return Camera;

}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellProjectileStatic()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 150.0f;
    Camera.m_SpellPitchLimit = 35.0f;
    //Camera.m_SpellYawLimit = 35.0f;
    Camera.m_SocketOffset = FVector(0.0f, 65.0f, 0.0f);
    return Camera;

}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellProjectileMoving()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 150.0f;
    Camera.m_SpellPitchLimit = 35.0f;
    //Camera.m_SpellYawLimit = 150.0f;
    Camera.m_SocketOffset = FVector(0.0f, 65.0f, 0.0f);
    Camera.m_LagSpeed = 9990.0f;
    //Camera.m_LagMaxDistance = 0.0f;
    return Camera;

}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellFrontArea()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 190.0f;
    Camera.m_SpellPitchLimit = 10.0f;
    Camera.m_SpellYawLimit = 10.0f;
    Camera.m_SocketOffset = FVector(0.0f, 65.0f, -15.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellAroundArea()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 500.0f;
    Camera.m_SpellPitchLimit = 0.0f;
    Camera.m_SpellYawLimit = 0.0f;
    Camera.m_SocketOffset = FVector(0.0f, -0.20f, 0.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetUrizielWaveOfDeathCameraBehaviour()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 500.0f;
    Camera.m_SpellPitchLimit = 0.0f;
    Camera.m_SpellYawLimit = 0.0f;
    Camera.m_SocketOffset = FVector(0.0f, -0.20f, 0.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellCloseTarget()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 100.0f;
    Camera.m_SpellPitchLimit = 10.0f;
    Camera.m_SpellYawLimit = 10.0f;
    Camera.m_SocketOffset = FVector(0.0f, 90.0f, 0.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellFireRain()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 190.0f;
    Camera.m_SocketOffset = FVector(-250.0f, 0.0f, 45.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellInnosPray()
{
   return GetCameraBehaviourSpellFireRain();
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellTransform()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 190.0f;
    Camera.m_SocketOffset = FVector(-200.0f, 0.0f, 60.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-250.0f, 0.0f, 100.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Swampshark()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-450.0f, 0.0f, 100.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Medium()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-150.0f, 0.0f, 50.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Biter()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-50.0f, 0.0f, 50.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Shadowbeast()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-300.0f, 0.0f, 50.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Snapper()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-100.0f, 0.0f, 100.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Wolf()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-100.0f, 20.0f, 50.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Bloodfly()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-100.0f, 0.0f, 100.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Molerat()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-70.0f, 20.0f, 50.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Scavenger()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 210.0f;
    Camera.m_SocketOffset = FVector(-50.0f, 0.0f, 100.0f);
    return Camera;
}

UFUNCTION()
FCameraBehaviour GetCameraBehaviourSpellUnTransform_Meatbug()
{
    FCameraBehaviour Camera;
    Camera.m_IsAim = true;
    Camera.m_ArmLength = 100.0f;
    Camera.m_SocketOffset = FVector(-50.0f, 0.0f, 50.0f);
    return Camera;
}