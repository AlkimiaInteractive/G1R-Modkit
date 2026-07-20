//This anim Sets are used in some Node Sequences to change Dinamically depending on the character State, like normal, combat etc. It will use one anim or anoher dynamically.
// Look at the functions inside the AnimBP like FindCrouchToIdle and UGothicAnimInstance::LoadAnimInstanceConfigs()
UCLASS()
class ULocomotionSequencesData_Default_Orc : ULocomotionSequencesData
{
}

UCLASS()
class ULocomotionSequencesData_Default_Orc_Combat : ULocomotionSequencesData
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Movement/Turn/A_OrcM_Sff1H_Turn_IP_90L.A_OrcM_Sff1H_Turn_IP_90L'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Movement/Turn/A_OrcM_Sff1H_Turn_IP_90R.A_OrcM_Sff1H_Turn_IP_90R'";
}

UCLASS()
class ULocomotionSequencesData_Default_Orc_Combat_Magic_Pyrokinesis : ULocomotionSequencesData_Default_Orc_Combat
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90L.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90L'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90R.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90R'";
}

UCLASS()
class ULocomotionSequencesData_Default_Orc_Combat_Magic_ChainLighting : ULocomotionSequencesData_Default_Orc_Combat
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_Turn_90L.A_OrcM_Sff1H_A_Spc_ChainLighting_Turn_90L'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_Turn_90R.A_OrcM_Sff1H_A_Spc_ChainLighting_Turn_90R'";
}

UCLASS()
class ULocomotionSequencesData_Default_Orc_Combat_Magic_BallLighting : ULocomotionSequencesData_Default_Orc_Combat
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90L.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90L'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90R.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90R'";
}

UCLASS()
class ULocomotionSequencesData_Default_Orc_Combat_Magic_StormOfFire : ULocomotionSequencesData_Default_Orc_Combat
{
    default m_TurnIP90L = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90L.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90L'";
    default m_TurnIP90R = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90R.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Turn_90R'";
}

UCLASS()
class ULocomotionSequencesData_Default_Orc_Combat_Magic_BreathOfDeath : ULocomotionSequencesData_Default_Orc_Combat
{
}