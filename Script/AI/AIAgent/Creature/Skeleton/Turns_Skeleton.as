UCLASS()
class UTurnOnSpotAssetConfig_Skeleton : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_TIPL30 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_TIPR30 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_TIPL90 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Turn/A_Skeleton_Turn90Left.A_Skeleton_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_TIPR90 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Turn/A_Skeleton_Turn90Right.A_Skeleton_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_TIPL180 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Turn/A_Skeleton_Turn180Left.A_Skeleton_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_TIPR180 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Turn/A_Skeleton_Turn180Right.A_Skeleton_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Skeleton : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Skeleton_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Skeleton_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Skeleton_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Skeleton_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Skeleton_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Skeleton_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Skeleton : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Skeleton::StaticClass();

    FTurnDirections m_WalkPivots;
    default m_WalkPivots.Pivot180L.Sequence = n"";
	default m_WalkPivots.Pivot180L.StartTime = 0.0;
	default m_WalkPivots.Pivot180R.Sequence = n"";
	default m_WalkPivots.Pivot180R.StartTime = 0.0;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_WalkPivots);
    default m_Pivots.Add(EWalkSpeed::Sprinting, m_WalkPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Start/A_Skeleton_StartWalkLeft.A_Skeleton_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Start/A_Skeleton_StartWalkRight.A_Skeleton_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Start/A_Skeleton_StartTurn180Left.A_Skeleton_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Start/A_Skeleton_StartTurn180Right.A_Skeleton_StartTurn180Right'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopR.StartTime = 0.32f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"";
	//default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	//default m_SprintStops.QuickStopL.BlendOut = 0.2f;
	//default m_SprintStops.QuickStopL.StartTime = 0.3f;
	default m_SprintStops.QuickStopR.Sequence = n"";
	//default m_SprintStops.QuickStopR.BlendIn = 0.2f;
	//default m_SprintStops.QuickStopR.BlendOut = 0.2f;
	//default m_SprintStops.QuickStopR.StartTime = 0.3f;
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
	
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Combat_TIPL30 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Combat_TIPR30 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Combat_TIPL90 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Turn/A_Skeleton_Idle_CombatTurn90Left.A_Skeleton_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Combat_TIPR90 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Turn/A_Skeleton_Idle_CombatTurn90Right.A_Skeleton_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Combat_TIPL180 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Turn/A_Skeleton_Idle_CombatTurn180Left.A_Skeleton_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Combat_TIPR180 : UTurnOnSpotAssetConfig_Skeleton
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Turn/A_Skeleton_Idle_CombatTurn180Right.A_Skeleton_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Skeleton_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Skeleton_Combat_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Skeleton_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Skeleton_Combat_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Skeleton_Combat_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Skeleton_Combat_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Skeleton_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Skeleton_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Skeleton_Combat::StaticClass();

    // Pivots
	
    FTurnDirections m_RunPivots;
    default m_RunPivots.Pivot180L.Sequence = n"";
	default m_RunPivots.Pivot180L.StartTime = 0.0;
	default m_RunPivots.Pivot180R.Sequence = n"";
	default m_RunPivots.Pivot180R.StartTime = 0.0;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"";
	default m_WalkStarts.Pivot90R.Sequence = n"";
	default m_WalkStarts.Pivot180L.Sequence = n"";
	default m_WalkStarts.Pivot180R.Sequence = n"";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopR.StartTime = 0.32f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);

}