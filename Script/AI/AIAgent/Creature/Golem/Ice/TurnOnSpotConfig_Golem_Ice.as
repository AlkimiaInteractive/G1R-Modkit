UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_TIPL30 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_TIPR30 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_TIPL90 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn90Left.A_IceGolem_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_TIPR90 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn90Right.A_IceGolem_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_TIPL180 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn180Left.A_IceGolem_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_TIPR180 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn180Right.A_IceGolem_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Golem_Ice : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Golem_Ice_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Golem_Ice_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Golem_Ice_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Golem_Ice_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Golem_Ice_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Golem_Ice_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Golem_Ice : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Golem_Ice::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_WalkTurn180.A_IceGolem_WalkTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.65;
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180L.StartTime = 0.75;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_WalkTurn180.A_IceGolem_WalkTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.65;
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	default m_RunPivots.Pivot180L.StartTime = 0.75;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.65;
	default m_RunPivots.Pivot180L.StartTime = 0.65;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunPivots.Pivot180R.BlendIn = 0.65;
	default m_RunPivots.Pivot180R.StartTime = 0.65;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkLeft.A_IceGolem_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkRight.A_IceGolem_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartTurn180Right.A_IceGolem_StartTurn180Right'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartTurn180Right.A_IceGolem_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkLeft.A_IceGolem_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.2;
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkRight.A_IceGolem_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.2;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunStarts.Pivot180L.BlendIn = 0.65;
	default m_RunStarts.Pivot180L.StartTime = 0.65;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunStarts.Pivot180R.BlendIn = 0.65;
	default m_RunStarts.Pivot180R.StartTime = 0.65;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Stop/A_IceGolem_StopWalkRun_Left.A_IceGolem_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Stop/A_IceGolem_StopWalkRun_Left.A_IceGolem_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopR.StartTime = 0.32f;
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_WalkStops);
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPL30 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPR30 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPL90 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn90Left.A_IceGolem_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPR90 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn90Right.A_IceGolem_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPL180 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn180Left.A_IceGolem_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPR180 : UTurnOnSpotAssetConfig_Golem_Ice
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_Turn180Right.A_IceGolem_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Golem_Ice_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPL30::StaticClass();
  	default m_TIPR30 = UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Golem_Ice_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Golem_Ice_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Golem_Ice_Combat::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_WalkTurn180.A_IceGolem_WalkTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.65;
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180L.StartTime = 0.75;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_WalkTurn180.A_IceGolem_WalkTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.65;
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	default m_RunPivots.Pivot180L.StartTime = 0.75;
	
	FTurnDirections m_RunPivots;
    default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.65;
	default m_RunPivots.Pivot180L.StartTime = 0.65;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunPivots.Pivot180R.BlendIn = 0.65;
	default m_RunPivots.Pivot180R.StartTime = 0.65;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkLeft.A_IceGolem_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkRight.A_IceGolem_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartTurn180Left.A_IceGolem_StartTurn180Left'";
	default m_WalkStarts.Pivot180L.BlendOut = 0.0;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartTurn180Right.A_IceGolem_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkLeft.A_IceGolem_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.2;
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Start/A_IceGolem_StartWalkRight.A_IceGolem_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.2;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunStarts.Pivot180L.BlendIn = 0.65;
	default m_RunStarts.Pivot180L.StartTime = 0.65;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Turn/A_IceGolem_RunFastTurn180.A_IceGolem_RunFastTurn180'";
	default m_RunStarts.Pivot180R.BlendIn = 0.65;
	default m_RunStarts.Pivot180R.StartTime = 0.65;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Stop/A_IceGolem_StopWalkRun_Left.A_IceGolem_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem/Movement/Grounded/N/Stop/A_IceGolem_StopWalkRun_Left.A_IceGolem_StopWalkRun_Left'";
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_WalkStops);
	
}