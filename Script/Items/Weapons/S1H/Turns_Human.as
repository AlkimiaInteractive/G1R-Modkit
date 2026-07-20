UCLASS()
class UTurnOnSpotAssetConfig_S1H_Human : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL30_Combat : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace30L.A_Man_MM_N_Combat_TurnInPlace30L'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.2f;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR30_Combat : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace30R.A_Man_MM_N_Combat_TurnInPlace30R'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.2f;
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL90_Combat : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace90L.A_Man_MM_N_Combat_TurnInPlace90L'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.5;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR90_Combat : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace90R.A_Man_MM_N_Combat_TurnInPlace90R'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.25f;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL180_Combat : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace180L.A_Man_MM_N_Combat_TurnInPlace180L'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.5f;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR180_Combat : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace180R.A_Man_MM_N_Combat_TurnInPlace180R'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.5f;
}


UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL90_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_TurnIP_L90.A_Man_S1H_N_TurnIP_L90'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR90_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_TurnIP_R90.A_Man_S1H_N_TurnIP_R90'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL180_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_TurnIP_L180.A_Man_S1H_N_TurnIP_L180'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR180_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_TurnIP_R180.A_Man_S1H_N_TurnIP_R180'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL90_IB_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IB_TurnIP_L90.A_Man_S1H_N_IB_TurnIP_L90'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR90_IB_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IB_TurnIP_R90.A_Man_S1H_N_IB_TurnIP_R90'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL180_IB_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IB_TurnIP_L180.A_Man_S1H_N_IB_TurnIP_L180'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR180_IB_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IB_TurnIP_R180.A_Man_S1H_N_IB_TurnIP_R180'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL90_IA_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IA_TurnIP_L90.A_Man_S1H_N_IA_TurnIP_L90'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR90_IA_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IA_TurnIP_R90.A_Man_S1H_N_IA_TurnIP_R90'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL180_IA_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IA_TurnIP_L180.A_Man_S1H_N_IA_TurnIP_L180'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR180_IA_SH1 : UTurnOnSpotAssetConfig_S1H_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/old/Movement/Grounded/N/Turn/A_Man_S1H_N_IA_TurnIP_R180.A_Man_S1H_N_IA_TurnIP_R180'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Combat_Human : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Human_TIPL30_Combat::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Human_TIPR30_Combat::StaticClass();
	default m_TIPL90 = UTurnOnSpotAssetConfig_Human_TIPL90_Combat::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Human_TIPR90_Combat::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Human_TIPL180_Combat::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Human_TIPR180_Combat::StaticClass();
   
   default m_TIPCL30 = UTurnOnSpotAssetConfig_Player_TIPCL30::StaticClass();
   default m_TIPCR30 = UTurnOnSpotAssetConfig_Player_TIPCR30::StaticClass();
   default m_TIPCL90 = UTurnOnSpotAssetConfig_Player_TIPCL90::StaticClass();
   default m_TIPCR90 = UTurnOnSpotAssetConfig_Player_TIPCR90::StaticClass();
   default m_TIPCL180 = UTurnOnSpotAssetConfig_Player_TIPCL180::StaticClass();
   default m_TIPCR180 = UTurnOnSpotAssetConfig_Player_TIPCR180::StaticClass(); 
}

UCLASS()
class UTurnOnSpotConfig_S1H_Human : UTurnOnSpotConfig_Melee //OLD
{
	default m_TIPL90 = UTurnOnSpotAssetConfig_Human_TIPL90_SH1::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Human_TIPR90_SH1::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Human_TIPL180_SH1::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Human_TIPR180_SH1::StaticClass();

	default m_TIPL90_IA = UTurnOnSpotAssetConfig_Human_TIPL90_IA_SH1::StaticClass();
	default m_TIPR90_IA = UTurnOnSpotAssetConfig_Human_TIPR90_IA_SH1::StaticClass();
	default m_TIPL180_IA = UTurnOnSpotAssetConfig_Human_TIPL180_IA_SH1::StaticClass();
	default m_TIPR180_IA = UTurnOnSpotAssetConfig_Human_TIPR180_IA_SH1::StaticClass();

	default m_TIPL90_IB = UTurnOnSpotAssetConfig_Human_TIPL90_IB_SH1::StaticClass();
	default m_TIPR90_IB = UTurnOnSpotAssetConfig_Human_TIPR90_IB_SH1::StaticClass();
	default m_TIPL180_IB = UTurnOnSpotAssetConfig_Human_TIPL180_IB_SH1::StaticClass();
	default m_TIPR180_IB = UTurnOnSpotAssetConfig_Human_TIPR180_IB_SH1::StaticClass();
}
UCLASS()
class UTurnsData_S1H_Human : UTurnsData_Default_Human
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Combat_Human::StaticClass();

    // Pivots
	//default m_Pivot180.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Pivots/A_Man_N_Run_Pivot_L180.A_Man_N_Run_Pivot_L180'";
}