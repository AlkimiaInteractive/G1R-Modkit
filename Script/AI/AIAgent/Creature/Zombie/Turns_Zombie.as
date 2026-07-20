UCLASS()
class UTurnOnSpotAssetConfig_Zombie : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Zombie_TIPL30 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Left.A_PH_Zombie_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_TIPR30 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Right.A_PH_Zombie_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotAssetConfig_Zombie_TIPL90 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn90Left.A_Zombie_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_TIPR90 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn90Right.A_Zombie_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_TIPL180 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn180Left.A_Zombie_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_TIPR180 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn180Right.A_Zombie_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Zombie : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Zombie_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Zombie_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Zombie_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Zombie_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Zombie_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Zombie_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Zombie : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Zombie::StaticClass();

    // Pivots
    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Walk/A_Zombie_Pose01_WalkTurn180.A_Zombie_Pose01_WalkTurn180'";
    default m_RunPivots.Pivot180L.BlendIn = 0.35;
	default m_RunPivots.Pivot180R.StartTime = 2.3;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Walk/A_Zombie_Pose01_WalkTurn180.A_Zombie_Pose01_WalkTurn180'";
    default m_RunPivots.Pivot180L.BlendIn = 0.35;
	default m_RunPivots.Pivot180R.StartTime = 2.3;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"";
	default m_RunPivots.Pivot180L.BlendIn = 0.35;
	default m_RunPivots.Pivot180R.StartTime = 2.3;
	default m_RunPivots.Pivot180R.Sequence = n"";
	default m_RunPivots.Pivot180L.BlendIn = 0.35;
	default m_RunPivots.Pivot180R.StartTime = 2.3;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartWalkLeft.A_Zombie_Pose01_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartWalkRight.A_Zombie_Pose01_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartTurn180Left.A_Zombie_Pose01_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartTurn180Right.A_Zombie_Pose01_StartTurn180Right'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Left.A_PH_Zombie_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Right.A_PH_Zombie_StopWalkRun_Right'";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopR.StartTime = 0.32f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);

}

UCLASS()
class UTurnOnSpotAssetConfig_Zombie_Combat_TIPL30 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Left.A_PH_Zombie_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_Combat_TIPR30 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Right.A_PH_Zombie_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotAssetConfig_Zombie_Combat_TIPL90 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn90Left.A_Zombie_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_Combat_TIPR90 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn90Right.A_Zombie_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_Combat_TIPL180 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn180Left.A_Zombie_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Zombie_Combat_TIPR180 : UTurnOnSpotAssetConfig_Zombie
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Turn/A_Zombie_Idle_CombatTurn180Right.A_Zombie_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Zombie_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Zombie_Combat_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Zombie_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Zombie_Combat_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Zombie_Combat_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Zombie_Combat_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Zombie_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Zombie_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Zombie_Combat::StaticClass();

    // Pivots
	
    FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Walk/A_Zombie_Pose01_WalkTurn180.A_Zombie_Pose01_WalkTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.35;
	default m_RunPivots.Pivot180L.StartTime = 2.3;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Walk/A_Zombie_Pose01_WalkTurn180.A_Zombie_Pose01_WalkTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.35;
	default m_RunPivots.Pivot180R.StartTime = 2.3;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
    // Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartWalkLeft.A_Zombie_Pose01_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartWalkRight.A_Zombie_Pose01_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartTurn180Left.A_Zombie_Pose01_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Start/A_Zombie_Pose01_StartTurn180Right.A_Zombie_Pose01_StartTurn180Right'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Left.A_PH_Zombie_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Stop/A_PH_Zombie_StopWalkRun_Right.A_PH_Zombie_StopWalkRun_Right'";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopR.StartTime = 0.32f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	
}