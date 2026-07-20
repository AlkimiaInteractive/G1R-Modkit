//This anim Sets are used in some Node Sequences to change Dinamically depending on the character State, like normal, combat etc. It will use one anim or anoher dynamically.
// Look at the functions inside the AnimBP like FindCrouchToIdle and UGothicAnimInstance::LoadAnimInstanceConfigs()
UCLASS()
class ULocomotionSequencesData_Default_Human : ULocomotionSequencesData
{
    default m_CrouchToIdle = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_STL_To_Idle.A_Man_MM_STL_To_Idle'";
    default m_IdleToCrouch = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_Idle_To_STL.A_Man_MM_Idle_To_STL'";
    default m_AimingCrouchToIdle = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_STL_To_Idle.A_Man_MM_STL_To_Idle'";
    default m_AimingIdleToCrouch = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_Idle_To_STL.A_Man_MM_Idle_To_STL'";
}

UCLASS()
class ULocomotionSequencesData_Default_Human_Combat : ULocomotionSequencesData
{
    default m_CrouchToIdle = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_STL_To_Combat.A_Man_MM_STL_To_Combat'";
    default m_IdleToCrouch = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_Combat_To_STL.A_Man_MM_Combat_To_STL'";
    default m_AimingCrouchToIdle = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_STL_To_Combat.A_Man_MM_STL_To_Combat'";
    default m_AimingIdleToCrouch = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_Combat_To_STL.A_Man_MM_Combat_To_STL'";
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace90L.A_Man_MM_N_Combat_TurnInPlace90L'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/Combat/A_Man_MM_N_Combat_TurnInPlace90R.A_Man_MM_N_Combat_TurnInPlace90R'";
}

UCLASS()
class ULocomotionSequencesData_Default_Human_Combat_Bow : ULocomotionSequencesData_Default_Human_Combat
{
    default m_CrouchToIdle = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_STL_To_Idle.A_Man_MM_STL_To_Idle'";
    default m_IdleToCrouch = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_Idle_To_STL.A_Man_MM_Idle_To_STL'";
    default m_AimingCrouchToIdle = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_STL_To_Combat.A_Man_MM_STL_To_Combat'";
    default m_AimingIdleToCrouch = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/A_Man_MM_Combat_To_STL.A_Man_MM_Combat_To_STL'";
}

UCLASS()
class ULocomotionSequencesData_Default_Human_Combat_Magic_Pyrokinesis : ULocomotionSequencesData_Default_Human_Combat
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Turn90Left.A_Man_Pyrokinesis_Turn90Left'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Turn90Right.A_Man_Pyrokinesis_Turn90Right'";
}

UCLASS()
class ULocomotionSequencesData_Default_Human_Combat_Magic_ChainLighting : ULocomotionSequencesData_Default_Human_Combat
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLight_Turn90Left.A_Man_ChainLight_Turn90Left'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLight_Turn90Right.A_Man_ChainLight_Turn90Right'";
}

UCLASS()
class ULocomotionSequencesData_Default_Human_Combat_Relax : ULocomotionSequencesData_Default_Human_Combat
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace90L.A_Man_MM_N_TurnInPlace90L'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace90R.A_Man_MM_N_TurnInPlace90R'";
}