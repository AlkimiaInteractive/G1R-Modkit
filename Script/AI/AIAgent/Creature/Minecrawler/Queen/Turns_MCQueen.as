UCLASS()
class UTurnOnSpotAssetConfig_MCQueen : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPL30 : UTurnOnSpotAssetConfig_MCQueen
{
    default m_Animation = n"";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPR30 : UTurnOnSpotAssetConfig_MCQueen
{
    default m_Animation = n"";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPL90 : UTurnOnSpotAssetConfig_MCQueen
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Movement/Grounded/N/Turn/A_MCQueen_Ph2_Turn90Left.A_MCQueen_Ph2_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPR90 : UTurnOnSpotAssetConfig_MCQueen
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Movement/Grounded/N/Turn/A_MCQueen_Ph2_Turn90Right.A_MCQueen_Ph2_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPL180 : UTurnOnSpotAssetConfig_MCQueen
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Movement/Grounded/N/Turn/A_MCQueen_Ph2_Turn180Left.A_MCQueen_Ph2_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPR180 : UTurnOnSpotAssetConfig_MCQueen
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Movement/Grounded/N/Turn/A_MCQueen_Ph2_Turn180Right.A_MCQueen_Ph2_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_MCQueen_Phase2 : UTurnOnSpotConfig
{
	// default m_TIPL30 = UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPL30::StaticClass();
	// default m_TIPR30 = UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_MCQueen_Phase2_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_MCQueen_Phase2 : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_MCQueen_Phase2::StaticClass();

	FQuickStops m_WalkStops;
	//default m_WalkStops.QuickStopL.Sequence = n"";
	// default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	// default m_WalkStops.QuickStopL.BlendOut = 0.2f;
	// default m_WalkStops.QuickStopL.StartTime = 0.35f;
	// //default m_WalkStops.QuickStopR.Sequence = n"";
	// default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	// default m_WalkStops.QuickStopR.BlendOut = 0.2f;
	// default m_WalkStops.QuickStopR.StartTime = 0.32f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
}