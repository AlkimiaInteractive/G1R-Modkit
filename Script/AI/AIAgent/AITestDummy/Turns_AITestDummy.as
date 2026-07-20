UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_TIPL90 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace90L.A_Man_MM_N_TurnInPlace90L'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_TIPR90 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace90R.A_Man_MM_N_TurnInPlace90R'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_TIPL180 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace180L.A_Man_MM_N_TurnInPlace180L'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_TIPR180 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace180R.A_Man_MM_N_TurnInPlace180R'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_AITestDummy : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_AITestDummy_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_AITestDummy_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_AITestDummy_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_AITestDummy_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_AITestDummy : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_AITestDummy::StaticClass();

    // Pivots
	default m_Pivot180.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AITestDummy/Movement/Grounded/N/Turn/A_PH_AITestDummy_WalkTurn180.A_PH_AITestDummy_WalkTurn180'";

    // Start Moving
    default m_StartMoving90R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving90R_Montage.Wolf_StartMoving90R_Montage'";
    default m_StartMoving90L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving90L_Montage.Wolf_StartMoving90L_Montage'";
    default m_StartMoving180R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving180R_Montage.Wolf_StartMoving180R_Montage'";
    default m_StartMoving180L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving180L_Montage.Wolf_StartMoving180L_Montage'";
	
}

UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPL90 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AITestDummy/Combat/Movement/Grounded/N/Turn/A_AITestDummy_Idle_CombatTurn90Left.A_AITestDummy_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPR90 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AITestDummy/Combat/Movement/Grounded/N/Turn/A_AITestDummy_Idle_CombatTurn90Right.A_AITestDummy_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPL180 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AITestDummy/Combat/Movement/Grounded/N/Turn/A_AITestDummy_Idle_CombatTurn180Left.A_AITestDummy_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPR180 : UTurnOnSpotAssetConfig_AITestDummy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AITestDummy/Combat/Movement/Grounded/N/Turn/A_AITestDummy_Idle_CombatTurn180Right.A_AITestDummy_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_AITestDummy_Combat : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_AITestDummy_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_AITestDummy_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_AITestDummy_Combat::StaticClass();

    // Pivots
	default m_Pivot180.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AITestDummy/Combat/Movement/Grounded/N/Turn/A_PH_AITestDummy_RunCombatTurn180.A_PH_AITestDummy_RunCombatTurn180'";

    // Start Moving
	
    //default m_StartMoving90R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving90R_Montage.Wolf_StartMoving90R_Montage'";
    //default m_StartMoving90L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving90L_Montage.Wolf_StartMoving90L_Montage'";
    
	//default m_StartMoving180R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving180R_Montage.Wolf_StartMoving180R_Montage'";
    //default m_StartMoving180L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving180L_Montage.Wolf_StartMoving180L_Montage'";
	
}