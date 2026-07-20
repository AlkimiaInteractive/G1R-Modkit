UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_TIPL30 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_TIPR30 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_TIPL90 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_Turn90Left.A_SkeletonMage_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_TIPR90 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_Turn90Right.A_SkeletonMage_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_TIPL180 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_Turn180Right.A_SkeletonMage_Turn180Right'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_TIPR180 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_Turn180Left.A_SkeletonMage_Turn180Left'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Skeleton_Mage : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Skeleton_Mage_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Skeleton_Mage_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Skeleton_Mage_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Skeleton_Mage_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Skeleton_Mage_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Skeleton_Mage_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Skeleton_Mage : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Skeleton_Mage::StaticClass();

   //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_WalkTurn180.A_SkeletonMage_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_WalkTurn180.A_SkeletonMage_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkLeft.A_SkeletonMage_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkRight.A_SkeletonMage_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartTurn180Left.A_SkeletonMage_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartTurn180Right.A_SkeletonMage_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkLeft.A_SkeletonMage_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkRight.A_SkeletonMage_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunStarts.Pivot180L.BlendOut = 0.2;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.2;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopSprint.A_SkeletonMage_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopSprint.A_SkeletonMage_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
	
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPL30 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPR30 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPL90 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Turn/A_SkeletonMage_Idle_CombatTurn90Left.A_SkeletonMage_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPR90 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Turn/A_SkeletonMage_Idle_CombatTurn90Right.A_SkeletonMage_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPL180 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Turn/A_SkeletonMage_Idle_CombatTurn180Left.A_SkeletonMage_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPR180 : UTurnOnSpotAssetConfig_Skeleton_Mage
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Turn/A_SkeletonMage_Idle_CombatTurn180Right.A_SkeletonMage_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Skeleton_Mage_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Skeleton_Mage_Combat_TIPR180::StaticClass();
   //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Skeleton_Mage_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Skeleton_Mage_Combat::StaticClass();

    // Pivots
	
    FTurnDirections m_RunPivots;
    default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.0;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.0;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkLeft.A_SkeletonMage_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkRight.A_SkeletonMage_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartTurn180Left.A_SkeletonMage_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartTurn180Right.A_SkeletonMage_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkLeft.A_SkeletonMage_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Start/A_SkeletonMage_StartWalkRight.A_SkeletonMage_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunStarts.Pivot180L.BlendOut = 0.2;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Turn/A_SkeletonMage_RunTurn180.A_SkeletonMage_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.2;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Stop/A_SkeletonMage_StopWalkRun.A_SkeletonMage_StopWalkRun'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	
}