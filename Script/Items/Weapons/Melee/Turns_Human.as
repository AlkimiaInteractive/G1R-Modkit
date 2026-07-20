
UCLASS()
class UTurnOnSpotAssetConfig_Human_Melee : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_Melee_TIPL90 : UTurnOnSpotAssetConfig_Human_Melee
{
	default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_90_Left.2Handed_InPlace_Turn_90_Left'";
    default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Melee_TIPR90 : UTurnOnSpotAssetConfig_Human_Melee
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_90_Right.2Handed_InPlace_Turn_90_Right'";
    default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Melee_TIPL180 : UTurnOnSpotAssetConfig_Human_Melee
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_180_Left.2Handed_InPlace_Turn_180_Left'";
    default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_Melee_TIPR180 : UTurnOnSpotAssetConfig_Human_Melee
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_180_Right.2Handed_InPlace_Turn_180_Right'";
    default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Human_Melee : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_Human_Melee_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Human_Melee_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_Human_Melee_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_Human_Melee_TIPR180::StaticClass();    
}

UCLASS()
class UTurnsData_Melee_Human : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Human_Melee::StaticClass();

    // Pivots
	default m_Pivot180.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Pivots/A_Man_N_Run_Pivot_L180.A_Man_N_Run_Pivot_L180'";
}