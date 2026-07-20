UCLASS()
class URollConfig_Melee_Human : URollConfig_Human
{
	
};

UCLASS()
class UDodgesData_Melee_Human : UDodgesData_Human_Base
{
    default m_RollConfig = URollConfig_Melee_Human::StaticClass();
    default m_Roll = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Untrained/Roll/A_Man_Fists_Un_Roll_F_Montage.A_Man_Fists_Un_Roll_F_Montage'";

    default Dodge_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Untrained/RH/A_Man_Fists_Un_Dodge_RH_F_Montage.A_Man_Fists_Un_Dodge_RH_F_Montage'";
    default Dodge_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Untrained/RH/A_Man_Fists_Un_Dodge_RH_B_Montage.A_Man_Fists_Un_Dodge_RH_B_Montage'";
    default Dodge_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Untrained/RH/A_Man_Fists_Un_Dodge_RH_L_Montage.A_Man_Fists_Un_Dodge_RH_L_Montage'";
    default Dodge_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Untrained/RH/A_Man_Fists_Un_Dodge_RH_R_Montage.A_Man_Fists_Un_Dodge_RH_R_Montage'";

    // Pose Idle
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Idle, Dodge_RH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Idle, Dodge_RH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Idle, Dodge_RH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Idle, Dodge_RH_R);

    // Pose Right
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Right, Dodge_RH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Right, Dodge_RH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Right, Dodge_RH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Right, Dodge_RH_R);

    // Pose Left
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Left, Dodge_RH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Left, Dodge_RH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Left, Dodge_RH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Left, Dodge_RH_R);

    // Pose Bottom
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Bottom, Dodge_RH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Bottom, Dodge_RH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Bottom, Dodge_RH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Bottom, Dodge_RH_R);

    // Pose Top
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Top, Dodge_RH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Top, Dodge_RH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Top, Dodge_RH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Top, Dodge_RH_R);
};