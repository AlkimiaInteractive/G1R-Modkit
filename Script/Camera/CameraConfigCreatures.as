UCLASS()
class UMeatbugCamera : UCameraDefinition
{
    default m_ArmLength = 75.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 20.0f);
    default m_LagSpeed = 3.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 5.0f;
    default m_EaseSpeedNormal = Ease(2.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(2.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(2.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(4.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(2.5f, EEasingFunc::EaseOut);
    default m_CameraFadeDist = 20.0f;
    default m_TargetViewPitchMin = -30.0f;
    default m_BottomPitchLimit = 5.0f;
    default m_UpPitchLimit = -80.0f;
    //default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default Idle.m_CameraPitchId= 2;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_CameraPitchId= 2;
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_CameraPitchId= 2;
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
}

UCLASS()
class UWolfCamera : UCameraDefinition
{
    default m_ArmLength = 275.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 20.0f, 60.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 75.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 10.0f, 65.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 70.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);

/*
    UNightVisionSettings visionSettings;
    default m_PostProcessSettings =  UNightVisionSettings.GetDefaultObject().PostProcessSettings;
    default m_PostProcessingDuration = 1.5f;*/
}

UCLASS()
class UOrcdogCamera : UCameraDefinition
{
    default m_ArmLength = 310.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 20.0f, 80.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 50.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 10.0f, 85.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 90.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UScavengerYoungCamera : UCameraDefinition
{
    default m_ArmLength = 235.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 40.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UScavengerMediumCamera : UCameraDefinition
{
    default m_ArmLength = 235.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 100.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 105.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 110.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UScavengerAdultCamera : UCameraDefinition
{
    default m_ArmLength = 235.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 100.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 105.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 110.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);   
}

UCLASS()
class UScavengerAdultRidingCamera : UCameraDefinition
{
    default m_ArmLength = 300.0f; 
    default m_Fov = 75.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 20.0f);
    default m_LagSpeed = 50.0f;
    default m_RotationLagSpeed = 100.0f;
    default m_RotationLagSpeedPitch = 30.0f;
    default m_LagMaxDistance = 100.0f;
    default m_EaseNavigationUp = Ease(3.0f, EEasingFunc::EaseOut);
    default m_EaseNavigationDown = Ease(2.0f, EEasingFunc::EaseOut);
    default m_EaseSpeedMenu = Ease(0.75f, EEasingFunc::EaseOut);
    default m_EaseSpeedNormal = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.5f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(1.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;
    default m_BottomPitchLimit = 60.9f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_ArmLength = 400.0f; 
    default Running.m_Fov = 75.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_ArmLength = 550.0f; 
    default Sprinting.m_Fov = 75.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 70.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);

    FCameraBehaviour Swim;
    default Swim.m_PitchLimit = 60.0f;
    default m_CamBehaviours.Add(ECamConditions::Swim, Swim);
}

UCLASS()
class URazorCamera : UCameraDefinition
{
    default m_ArmLength = 350.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 100.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 105.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 110.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UBiterCamera : UCameraDefinition
{
    default m_ArmLength = 235.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 40.0f, 100.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 30.0f, 105.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 20.0f, 110.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UBloodflyCamera : UCameraDefinition
{
    default m_ArmLength = 305.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 100.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 105.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 110.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UBloodhoundCamera : UCameraDefinition
{
    default m_ArmLength = 390.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 40.0f, 60.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 10.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;
   
    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 30.0f, 65.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 20.0f, 70.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
}

UCLASS()
class UShadowBeastCamera : UCameraDefinition
{
    default m_ArmLength = 400.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 40.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class ULizardCamera : UCameraDefinition
{
    default m_ArmLength = 300.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 40.0f, 60.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 30.0f, 65.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 20.0f, 70.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UMinecrawlerCamera : UCameraDefinition
{
    default m_ArmLength = 235.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 40.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UMinecrawlerQueenCamera : UCameraDefinition
{
    default m_ArmLength = 235.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(-600.0f, 0.0f, 200.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(-500.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(-500.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UMinecrawlerQueenPh1Camera : UCameraDefinition
{
    default m_ArmLength = 0.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 600.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(-500.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(-500.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class USwampsharkCamera : UCameraDefinition
{
    default m_ArmLength = 235.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(-500.0f, 0.0f, 40.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 30.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(-500.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(-500.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UGolemCamera : UCameraDefinition
{
    default m_ArmLength = 350.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 40.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 6.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UTrollCamera : UCameraDefinition
{
    default m_ArmLength = 400.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 220.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 6.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 225.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 230.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
}

UCLASS()
class UDemonCamera : UCameraDefinition
{
    default m_ArmLength = 400.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 40.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 6.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);
   
}

UCLASS()
class UOrcCamera : UCameraDefinition
{
    default m_ArmLength = 350.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 100.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 6.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);

    FCameraBehaviour CombatCamOneTwo;
    default CombatCamOneTwo.m_LagSpeed = 20.0f;
    default CombatCamOneTwo.m_RotationLagSpeed = 60.0f;
    default CombatCamOneTwo.m_SocketOffset = FVector(0.0f, 100.0f, 80.0f); //Offset far
    default CombatCamOneTwo.m_SocketMinCombatOffset = FVector(0.0f, 200.0f, 80.0f); //Offset close
    default m_CamBehaviours.Add(ECamConditions::CombatOneTwo, CombatCamOneTwo);   
}

UCLASS()
class USkeletonCamera : UCameraDefinition
{
    default m_ArmLength = 350.0f; 
    default m_Fov = 90.0f;
    default m_SocketOffset = FVector(0.0f, 0.0f, 100.0f);
    default m_LagSpeed = 7.0f;
    default m_RotationLagSpeed = 6.0f;
    default m_LagMaxDistance = 150.0f;
    default m_EaseSpeedNormal = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.1f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(0.5f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;

    FCameraBehaviour Idle;
    default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

    FCameraBehaviour Running;
    default Running.m_Fov = 95.0f;
    default Running.m_SocketOffset = FVector(0.0f, 0.0f, 45.0f);
    default m_CamBehaviours.Add(ECamConditions::Running, Running);

    FCameraBehaviour Sprinting;
    default Sprinting.m_Fov = 100.0f;
    default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 50.0f);
    default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);

    FCameraBehaviour CombatCamOneTwo;
    default CombatCamOneTwo.m_LagSpeed = 20.0f;
    default CombatCamOneTwo.m_RotationLagSpeed = 60.0f;
    default CombatCamOneTwo.m_SocketOffset = FVector(0.0f, 100.0f, 80.0f); //Offset far
    default CombatCamOneTwo.m_SocketMinCombatOffset = FVector(0.0f, 200.0f, 80.0f); //Offset close
    default m_CamBehaviours.Add(ECamConditions::CombatOneTwo, CombatCamOneTwo);   
}