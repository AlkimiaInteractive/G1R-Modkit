
UCLASS()
class UPidgeon_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(400.0f, 300.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(600.0f,250.0f);
    default m_CheckRadius = 1200.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}


//PIDGEON AREA

UCLASS()
class UPidgeonAreaSmall_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(450.0f, 350.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(55.0f,10.0f);
    default m_WaitTime = FVector2D(5.0f,15.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UPidgeonAreaMidDistance_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 4.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(610.0f, 460.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(60.0f, 225.0f);
    default m_WaitTime = FVector2D(5.0f,35.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UPidgeonAreaFar_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(640.0f, 490.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(100.0f, 300.0f);
    default m_WaitTime = FVector2D(20.0f,50.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UPidgeonAreaVeryFar_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(760.0f, 710.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(160.0f, 700.0f);
    default m_WaitTime = FVector2D(45.0f,75.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}


//PIDGEON WARNING

UCLASS()
class UPidgeonWarning_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(400.0f, 300.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(500.0f,200.0f);
    default m_CheckRadius = 350.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

class UPidgeonWarningFar_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 4.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(650.0f, 500.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(650.0f,200.0f);
    default m_CheckRadius = 900.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

class UPidgeonWarningMid_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(600.0f, 450.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(300.0f, 250.0f);
    default m_CheckRadius = 900.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UPidgeonWarningCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Pidgeon/Pidgeon_bp.Pidgeon_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(900.0f, 50.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(300.0f, 0.0f);
    default m_CheckRadius = 1000.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}


//CROW AREA

UCLASS()
class UCrowArea_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 3.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(450.0f, 350.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(55.0f,0.0f);
    default m_WaitTime = FVector2D(10.0f,20.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UCrowAreaMidDistance_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 4.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(600.0f, 450.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(60.0f, 225.0f);
    default m_WaitTime = FVector2D(10.0f,35.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UCrowAreaFar_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(650.0f, 500.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(100.0f, 300.0f);
    default m_WaitTime = FVector2D(20.0f,40.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UCrowAreaVeryFar_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(750.0f, 700.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(160.0f, 700.0f);
    default m_WaitTime = FVector2D(35.0f,55.0f);
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}


//CROW WARNING

UCLASS()
class UCrowWarningArea_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 7.0f;
    default m_RefillHours = 6.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(650.0f, 600.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(400.0f, 300.0f);
    default m_CheckRadius = 1000.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UCrowWarningAreaMid_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(600.0f, 450.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(235.0f, 150.0f);
    default m_CheckRadius = 700.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UCrowWarningAreaSmall_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(450.0f, 350.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(75.0f,55.0f);
    default m_CheckRadius = 1000.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UCrowWarningAreaCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(900.0f, 500.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(250.0f, 0.0f);
    default m_CheckRadius = 1000.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UCrowWarningAreaTree_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Crow/Crow_bp.Crow_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(430.0f, 375.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(350.0f,200.0f);
    default m_CheckRadius = 3000.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}


//RAVEN WARNING

UCLASS()
class URavenNyrasFocusAreaCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Raven/RavenXardas_bp.RavenXardas_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(750.0f, 550.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(55.0f, -10.0f);
    default m_CheckRadius = 400.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;

    default m_RegisterToEvent = GameplayTag::Message_FocusStone_Disable;
    default m_EventId = n"ItMs_Focus_01";
}

UCLASS()
class URavenHarpiesFocusAreaCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Raven/RavenXardas_bp.RavenXardas_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(750.0f, 650.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(275.0f, 100.0f);
    default m_CheckRadius = 400.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;

    default m_RegisterToEvent = GameplayTag::Message_FocusStone_Disable;
    default m_EventId = n"ItMs_Focus_03";
}

UCLASS()
class URavenMonasteryFocusAreaCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Raven/RavenXardas_bp.RavenXardas_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(750.0f, 450.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(155.0f, 50.0f);
    default m_CheckRadius = 400.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;

    default m_RegisterToEvent = GameplayTag::Message_FocusStone_Disable;
    default m_EventId = n"ItMs_Focus_04";
}

UCLASS()
class URavenTrollCanyonFocusAreaCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Raven/RavenXardas_bp.RavenXardas_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(650.0f, 550.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(255.0f, -10.0f);
    default m_CheckRadius = 400.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;

    default m_RegisterToEvent = GameplayTag::Message_FocusStone_Disable;
    default m_EventId = n"ItMs_Focus_02";
}

UCLASS()
class URavenSleeperFocusAreaCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Raven/RavenXardas_bp.RavenXardas_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(650.0f, 550.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(0.0f, -100.0f);
    default m_CheckRadius = 950.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class URavenAmuletFocusAreaCornice_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Raven/RavenXardas_bp.RavenXardas_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(750.0f, 550.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(0.0f, 200.0f);
    default m_CheckRadius = 500.0f;
    default m_PerceptionSettings = UAmbientLifePerceptionSettings;
}

UCLASS()
class UExchangeBeginGame_AmbientLife_Config: UAmbientLifeConfig
{
    default m_CharacterInstanceClass = n"Blueprint'/Game/AI/AmbientLife/Raven/RavenXardas_bp.RavenXardas_bp_C'";
    default m_TimeForEndFleeSpeed = 5.0f;
    default m_RefillHours = 8.0f;
    default m_FleeForwardSpeedMaxMin = FVector2D(350.0f, 850.0f);
    default m_FleeUpwardSpeedMaxMin = FVector2D(000.0f, 500.0f);
    default m_CheckRadius = 500.0f;
    //default m_PerceptionSettings = UAmbientLifePerceptionSettings;
    default m_RegisterToEvent = GameplayTag::Message_FirstXardasCrow;
    default m_EventId = n"FirstXardasCrow";
}

class UAmbientLifePerceptionSettings : UPerceptionAgentSettings
{
    default Normal.Smell.SetCloseRange(250.0f,15.0f);
    default Normal.Smell.SetMidRange(600.0f,10.0f);
    default Normal.Smell.SetFarRange(1000.0f, 5.0f);
    default Normal.Smell.bIgnoreObstacles = true;

    default bEnablePathFindingForPerception = false;
}