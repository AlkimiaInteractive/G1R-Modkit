UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1;
	default m_ScaleTurnAngle = true;
	default m_SlotName = FName("(N) Turn/Rotate");
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPL90 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/N/Turn/A_Man_Bow_N_Combat_TurnInPlace_90L.A_Man_Bow_N_Combat_TurnInPlace_90L'";
    default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPR90 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/N/Turn/A_Man_Bow_N_Combat_TurnInPlace_90R.A_Man_Bow_N_Combat_TurnInPlace_90R'";
    default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPL180 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/N/Turn/A_Man_Bow_N_Combat_TurnInPlace_180L.A_Man_Bow_N_Combat_TurnInPlace_180L'";
    default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPR180 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/N/Turn/A_Man_Bow_N_Combat_TurnInPlace_180R.A_Man_Bow_N_Combat_TurnInPlace_180R'";
    default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPCL90 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/STL/Turns/A_Man_Bow_STL_TurnInPlace_90L.A_Man_Bow_STL_TurnInPlace_90L'";
	default m_AnimatedAngle = -90;
	default m_SlotName = FName("(CLF) Turn/Rotate");
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPCR90 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/STL/Turns/A_Man_Bow_STL_TurnInPlace_90R.A_Man_Bow_STL_TurnInPlace_90R'";
	default m_AnimatedAngle = 90;
	default m_SlotName = FName("(CLF) Turn/Rotate");
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPCL180 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/N/Turn/A_Man_Bow_N_TurnIP_L180.A_Man_Bow_N_TurnIP_L180'";
	default m_AnimatedAngle = -180;
	default m_SlotName = FName("(CLF) Turn/Rotate");
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Bow_TIPCR180 : UTurnOnSpotAssetConfig_Human_Bow
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Movement/Grounded/N/Turn/A_Man_Bow_N_TurnIP_R180.A_Man_Bow_N_TurnIP_R180'";
	default m_AnimatedAngle = 180;
	default m_SlotName = FName("(CLF) Turn/Rotate");
}

UCLASS()
class UTurnOnSpotConfig_Human_Bow : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_Human_Bow_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Human_Bow_TIPR90::StaticClass();
   //default m_TIPL180 = UTurnOnSpotAssetConfig_Human_Bow_TIPL180::StaticClass();
   //default m_TIPR180 = UTurnOnSpotAssetConfig_Human_Bow_TIPR180::StaticClass(); 
   
   default m_TIPCL90 = UTurnOnSpotAssetConfig_Human_Bow_TIPCL90::StaticClass();
   default m_TIPCR90 = UTurnOnSpotAssetConfig_Human_Bow_TIPCR90::StaticClass();
   //default m_TIPCL180 = UTurnOnSpotAssetConfig_Human_Bow_TIPCL180::StaticClass();
   //default m_TIPCR180 = UTurnOnSpotAssetConfig_Human_Bow_TIPCR180::StaticClass(); 
}

UCLASS()
class UTurnsData_Bow_Human : UTurnsData_Default_Human
{
    // Turn in place
    //default m_TurnOnSpotConfig = UTurnOnSpotConfig_Human_Bow::StaticClass();
}