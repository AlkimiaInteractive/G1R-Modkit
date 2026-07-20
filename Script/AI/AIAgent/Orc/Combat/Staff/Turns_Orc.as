UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPL90 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Movement/Turn/A_OrcM_Sff1H_Turn_IP_90L.A_OrcM_Sff1H_Turn_IP_90L'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
    default m_BlendOut = 0.4f;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPR90 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Movement/Turn/A_OrcM_Sff1H_Turn_IP_90R.A_OrcM_Sff1H_Turn_IP_90R'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
    default m_BlendOut = 0.4f;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPL180 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Movement/Turn/A_OrcM_Sff1H_Turn_IP_180L.A_OrcM_Sff1H_Turn_IP_180L'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
    default m_BlendOut = 0.4f;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPR180 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Movement/Turn/A_OrcM_Sff1H_Turn_IP_180R.A_OrcM_Sff1H_Turn_IP_180R'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
    default m_BlendOut = 0.4f;
}

UCLASS()
class UTurnOnSpotConfig_Orc_Combat_Staff : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_Orc_Combat_Staff_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Orc_Combat_Staff : UTurnsData_Orc_Combat
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Orc_Combat_Staff::StaticClass();
}