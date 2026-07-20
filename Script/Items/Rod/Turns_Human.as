UCLASS()
class UTurnOnSpotAssetConfig_Player_Fish : UTurnOnSpotAssetConfig
{
    default m_PlayRate = 1;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Player_Fish_TIPL90 : UTurnOnSpotAssetConfig_Player_Fish
{
	default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_90_Left.2Handed_InPlace_Turn_90_Left'";
    default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_Fish_TIPR90 : UTurnOnSpotAssetConfig_Player_Fish
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_90_Right.2Handed_InPlace_Turn_90_Right'";
    default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_Fish_TIPL180 : UTurnOnSpotAssetConfig_Player_Fish
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_180_Left.2Handed_InPlace_Turn_180_Left'";
    default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_Fish_TIPR180 : UTurnOnSpotAssetConfig_Player_Fish
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Locomotion/TurnInPlace/2Handed_InPlace_Turn_180_Right.2Handed_InPlace_Turn_180_Right'";
    default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Player_Fish : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_Player_Fish_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Player_Fish_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_Player_Fish_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_Player_Fish_TIPR180::StaticClass();    
}


UCLASS()
class UTurnsData_Rod_Human : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Player_Fish::StaticClass();
}