UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_TIPL30 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_PH_StoneGolem_StopWalkRun_Left.A_PH_StoneGolem_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.2;

}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_TIPR30 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_PH_StoneGolem_StopWalkRun_Right.A_PH_StoneGolem_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.2;
	
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_TIPL90 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_Turn90Left.A_StoneGolem_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;

}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_TIPR90 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_Turn90Right.A_StoneGolem_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
	
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_TIPL180 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_Turn180Left.A_StoneGolem_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
	
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_TIPR180 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_Turn180Right.A_StoneGolem_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
	
}

UCLASS()
class UTurnOnSpotConfig_Golem_Stone : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Golem_Stone_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Golem_Stone_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Golem_Stone_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Golem_Stone_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Golem_Stone_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Golem_Stone_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Golem_Stone : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Golem_Stone::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_WalkTurn180.A_StoneGolem_WalkTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_WalkTurn180.A_StoneGolem_WalkTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_RunTurn180.A_StoneGolem_RunTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_RunTurn180.A_StoneGolem_RunTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Start/A_StoneGolem_StartWalkLeft.A_StoneGolem_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Start/A_StoneGolem_StartWalkRight.A_StoneGolem_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Start/A_StoneGolem_StartTurn180Left.A_StoneGolem_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Start/A_StoneGolem_StartTurn180Right.A_StoneGolem_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Start/A_StoneGolem_StartWalkLeft.A_StoneGolem_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.25;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Start/A_StoneGolem_StartWalkRight.A_StoneGolem_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.25;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_RunTurn180.A_StoneGolem_RunTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Turn/A_StoneGolem_RunTurn180.A_StoneGolem_RunTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_StoneGolem_StopWalkRun_Left.A_StoneGolem_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_StoneGolem_StopWalkRun_Right.A_StoneGolem_StopWalkRun_Right'";
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_WalkStops);
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPL30 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_StoneGolem_StopWalkRun_Left.A_StoneGolem_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPR30 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_StoneGolem_StopWalkRun_Right.A_StoneGolem_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPL90 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_CombatTurn90Left.A_StoneGolem_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPR90 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_CombatTurn90Right.A_StoneGolem_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPL180 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_CombatTurn180left.A_StoneGolem_CombatTurn180left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPR180 : UTurnOnSpotAssetConfig_Golem_Stone
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_CombatTurn180Right.A_StoneGolem_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Golem_Stone_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Golem_Stone_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Golem_Stone_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Golem_Stone_Combat::StaticClass();

	//Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_WalkCombatTurn180.A_StoneGolem_WalkCombatTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_WalkCombatTurn180.A_StoneGolem_WalkCombatTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_RunCombatTurn180.A_StoneGolem_RunCombatTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_RunCombatTurn180.A_StoneGolem_RunCombatTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Start/A_StoneGolem_StartWalkCombatLeft.A_StoneGolem_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Start/A_StoneGolem_StartWalkCombatRight.A_StoneGolem_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Start/A_StoneGolem_StartWalkCombat180Left.A_StoneGolem_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Start/A_StoneGolem_StartWalkCombat180Right.A_StoneGolem_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Start/A_StoneGolem_StartWalkCombatLeft.A_StoneGolem_StartWalkCombatLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.25;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Start/A_StoneGolem_StartWalkCombatRight.A_StoneGolem_StartWalkCombatRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.25;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_RunCombatTurn180.A_StoneGolem_RunCombatTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Turn/A_StoneGolem_RunCombatTurn180.A_StoneGolem_RunCombatTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_StoneGolem_StopWalkRun_Left.A_StoneGolem_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Stop/A_StoneGolem_StopWalkRun_Right.A_StoneGolem_StopWalkRun_Right'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	
}