UCLASS()
class UTurnOnSpotAssetConfig_Swampshark : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_TIPL30 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation =  n"";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_TIPR30 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation =  n"";
	default m_AnimatedAngle = 30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_TIPL90 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_TIPR90 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_TIPL180 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_TIPR180 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Swampshark : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Swampshark_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Swampshark_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Swampshark_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Swampshark_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Swampshark_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Swampshark_TIPR180::StaticClass();
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_Combat_TIPL30 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_Combat_TIPR30 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = 30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_Combat_TIPL90 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_Combat_TIPR90 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_Combat_TIPL180 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Swampshark_Combat_TIPR180 : UTurnOnSpotAssetConfig_Swampshark
{
    default m_Animation = n"";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Swampshark_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Swampshark_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Swampshark_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Swampshark_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Swampshark_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Swampshark_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Swampshark_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Swampshark : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Swampshark::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving - OLD
    // default m_StartMoving90R = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Movement/Grounded/N/Start/Swampshark_StartMoving90R_Montage.Swampshark_StartMoving90R_Montage'";
    // default m_StartMoving90L = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Movement/Grounded/N/Start/Swampshark_StartMoving90L_Montage.Swampshark_StartMoving90L_Montage'";
    // default m_StartMoving180R = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Movement/Grounded/N/Start/Swampshark_StartMoving180R_Montage.Swampshark_StartMoving180R_Montage'";
    // default m_StartMoving180L = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Movement/Grounded/N/Start/Swampshark_StartMoving180L_Montage.Swampshark_StartMoving180L_Montage'";
	
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"";
	default m_WalkStarts.Pivot90R.Sequence =  n"";
	default m_WalkStarts.Pivot180L.Sequence = n"";
	default m_WalkStarts.Pivot180R.Sequence = n"";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	default m_WalkStops.QuickStopR.StartTime = 0.32f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"";
	//default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	//default m_SprintStops.QuickStopL.BlendOut = 0.2f;
	//default m_SprintStops.QuickStopL.StartTime = 0.6f;
	default m_SprintStops.QuickStopR.Sequence = n"";
	//default m_SprintStops.QuickStopR.BlendIn = 0.2f;
	//default m_SprintStops.QuickStopR.BlendOut = 0.2f;
	//default m_SprintStops.QuickStopR.StartTime = 0.6f;
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Swampshark_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Swampshark_Combat::StaticClass();

    // Pivots
    
    FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"";
	default m_RunPivots.Pivot180L.StartTime = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"";
	default m_RunPivots.Pivot180R.StartTime = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    //default m_StartMoving90R = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Movement/Grounded/N/Start/Swampshark_StartMoving90R_Montage.Swampshark_StartMoving90R_Montage'";
    //default m_StartMoving90L = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Movement/Grounded/N/Start/Swampshark_StartMoving90L_Montage.Swampshark_StartMoving90L_Montage'";
    //default m_StartMoving180R = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Movement/Grounded/N/Start/Swampshark_StartMoving180R_Montage.Swampshark_StartMoving180R_Montage'";
    //default m_StartMoving180L = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Movement/Grounded/N/Start/Swampshark_StartMoving180L_Montage.Swampshark_StartMoving180L_Montage'";
	
	FStartTurnDirections m_CombatStarts;
	default m_CombatStarts.Pivot90L.Sequence = n"";
	default m_CombatStarts.Pivot90R.Sequence =  n"";
	default m_CombatStarts.Pivot180L.Sequence = n"";
	default m_CombatStarts.Pivot180R.Sequence = n"";

	default m_Starts.Add(EWalkSpeed::Walking, m_CombatStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_CombatStarts);
}