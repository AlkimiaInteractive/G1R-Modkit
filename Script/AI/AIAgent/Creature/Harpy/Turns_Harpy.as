UCLASS()
class UTurnOnSpotAssetConfig_Harpy : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Harpy_TIPL30 : UTurnOnSpotAssetConfig_Harpy
{
    default m_Animation = n"";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Harpy_TIPR30 : UTurnOnSpotAssetConfig_Harpy
{
    default m_Animation = n"";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Harpy_TIPL90 : UTurnOnSpotAssetConfig_Harpy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_Turn90Left.A_Harpy_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Harpy_TIPR90 : UTurnOnSpotAssetConfig_Harpy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_Turn90Right.A_Harpy_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Harpy_TIPL180 : UTurnOnSpotAssetConfig_Harpy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_Turn180Left.A_Harpy_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Harpy_TIPR180 : UTurnOnSpotAssetConfig_Harpy
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_Turn180Right.A_Harpy_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Harpy : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Harpy_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Harpy_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Harpy_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Harpy_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Harpy_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Harpy_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Harpy : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Harpy::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_WalkTurn180.A_Harpy_WalkTurn180'"; 
	default m_WalkPivots.Pivot180L.BlendIn = 0.2;
	default m_WalkPivots.Pivot180L.BlendOut = 0.74f;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_WalkTurn180.A_Harpy_WalkTurn180'";
	default m_WalkPivots.Pivot180R.BlendIn = 0.2;
	default m_WalkPivots.Pivot180R.BlendOut = 0.74f;

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_RunTurn180.A_Harpy_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.52f;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_RunTurn180.A_Harpy_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.52f;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Start/A_Harpy_StartTurn180Left.A_Harpy_StartTurn180Left'";
	default m_WalkStarts.Pivot180L.BlendOut = 0.73;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Start/A_Harpy_StartTurn180Right.A_Harpy_StartTurn180Right'";
	default m_WalkStarts.Pivot180R.BlendOut = 0.87;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Start/A_Harpy_StartTurn90Left.A_Harpy_StartTurn90Left'";
	default m_WalkStarts.Pivot90L.BlendOut = 0.77;
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Start/A_Harpy_StartTurn90Right.A_Harpy_StartTurn90Right'";
	default m_WalkStarts.Pivot90R.BlendOut = 0.88;

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_RunTurn180.A_Harpy_RunTurn180'";
	default m_RunStarts.Pivot180L.BlendOut = 0.52;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Turn/A_Harpy_RunTurn180.A_Harpy_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.52;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Start/A_Harpy_StartTurn90Left.A_Harpy_StartTurn90Left'";
	default m_RunStarts.Pivot90L.BlendOut = 0.77;
	default m_RunStarts.Pivot90L.PlayRate = 1.25;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Start/A_Harpy_StartTurn90Right.A_Harpy_StartTurn90Right'";
	default m_RunStarts.Pivot90R.BlendOut = 0.88;
	default m_RunStarts.Pivot90R.PlayRate = 1.25;


	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Stop/A_Harpy_StopWalk.A_Harpy_StopWalk'";
	default m_WalkStops.QuickStopL.BlendIn = 0.2f;
	default m_WalkStops.QuickStopL.BlendOut = 0.8f;
	default m_WalkStops.QuickStopL.StartTime = 1.0f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Stop/A_Harpy_StopWalk.A_Harpy_StopWalk'";
	default m_WalkStops.QuickStopR.BlendIn = 0.3f;
	default m_WalkStops.QuickStopR.BlendOut = 0.8f;
	default m_WalkStops.QuickStopR.StartTime = 0.80f;
	
	FQuickStops m_RunStops;
	default m_RunStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Stop/A_Harpy_StopRun.A_Harpy_StopRun'";
	default m_RunStops.QuickStopL.BlendIn = 0.2f;
	default m_RunStops.QuickStopL.BlendOut = 0.56f;
	default m_RunStops.QuickStopL.StartTime = 0.58f;
	default m_RunStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Stop/A_Harpy_StopRun.A_Harpy_StopRun'";
	default m_RunStops.QuickStopR.BlendIn = 0.2f;
	default m_RunStops.QuickStopR.BlendOut = 0.56f;
	default m_RunStops.QuickStopR.StartTime = 0.34f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_RunStops);
}