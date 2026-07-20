UCLASS()
class URollConfig_Fists_Human : URollConfig_Human
{

};

UCLASS()
class UDodgesData_Fists_Human_Base : UDodgesData_Human_Base
{
    default m_RollConfig = URollConfig_Fists_Human;
};

UCLASS()
class UDodgesData_Fists_Un_Human : UDodgesData_Fists_Human_Base
{
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

UCLASS()
class UDodgesData_Fists_Tr_Human : UDodgesData_Fists_Human_Base
{
    default m_Roll = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/Roll/A_Man_Fists_Tr_Roll_F_Montage.A_Man_Fists_Tr_Roll_F_Montage'";

    default Dodge_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/RH/A_Man_Fists_Tr_Dodge_RH_F_Montage.A_Man_Fists_Tr_Dodge_RH_F_Montage'";
    default Dodge_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/RH/A_Man_Fists_Tr_Dodge_RH_B_Montage.A_Man_Fists_Tr_Dodge_RH_B_Montage'";
    default Dodge_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/RH/A_Man_Fists_Tr_Dodge_RH_L_Montage.A_Man_Fists_Tr_Dodge_RH_L_Montage'";
    default Dodge_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/RH/A_Man_Fists_Tr_Dodge_RH_R_Montage.A_Man_Fists_Tr_Dodge_RH_R_Montage'";

    default Dodge_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/LH/A_Man_Fists_Tr_Dodge_LH_F_Montage.A_Man_Fists_Tr_Dodge_LH_F_Montage'";
    default Dodge_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/LH/A_Man_Fists_Tr_Dodge_LH_B_Montage.A_Man_Fists_Tr_Dodge_LH_B_Montage'";
    default Dodge_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/LH/A_Man_Fists_Tr_Dodge_LH_L_Montage.A_Man_Fists_Tr_Dodge_LH_L_Montage'";
    default Dodge_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Trained/LH/A_Man_Fists_Tr_Dodge_LH_R_Montage.A_Man_Fists_Tr_Dodge_LH_R_Montage'";

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
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Left, Dodge_LH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Left, Dodge_LH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Left, Dodge_LH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Left, Dodge_LH_R);

    // Pose Bottom
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Bottom, Dodge_LH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Bottom, Dodge_LH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Bottom, Dodge_LH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Bottom, Dodge_LH_R);

    // Pose Top
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Top, Dodge_RH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Top, Dodge_RH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Top, Dodge_RH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Top, Dodge_RH_R);
};

UCLASS()
class UDodgesData_Fists_Ma_Human : UDodgesData_Fists_Human_Base
{
    default m_Roll = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/Roll/A_Man_Fists_Ma_Roll_F_Montage.A_Man_Fists_Ma_Roll_F_Montage'";

    default Dodge_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/RH/A_Man_Fists_Ma_Dodge_RH_F_Montage.A_Man_Fists_Ma_Dodge_RH_F_Montage'";
    default Dodge_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/RH/A_Man_Fists_Ma_Dodge_RH_B_Montage.A_Man_Fists_Ma_Dodge_RH_B_Montage'";
    default Dodge_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/RH/A_Man_Fists_Ma_Dodge_RH_L_Montage.A_Man_Fists_Ma_Dodge_RH_L_Montage'";
    default Dodge_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/RH/A_Man_Fists_Ma_Dodge_RH_R_Montage.A_Man_Fists_Ma_Dodge_RH_R_Montage'";

    default Dodge_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/LH/A_Man_Fists_Ma_Dodge_LH_F_Montage.A_Man_Fists_Ma_Dodge_LH_F_Montage'";
    default Dodge_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/LH/A_Man_Fists_Ma_Dodge_LH_B_Montage.A_Man_Fists_Ma_Dodge_LH_B_Montage'";
    default Dodge_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/LH/A_Man_Fists_Ma_Dodge_LH_L_Montage.A_Man_Fists_Ma_Dodge_LH_L_Montage'";
    default Dodge_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Dodges/Master/LH/A_Man_Fists_Ma_Dodge_LH_R_Montage.A_Man_Fists_Ma_Dodge_LH_R_Montage'";

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
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Left, Dodge_LH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Left, Dodge_LH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Left, Dodge_LH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Left, Dodge_LH_R);

    // Pose Bottom
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Bottom, Dodge_LH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Bottom, Dodge_LH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Bottom, Dodge_LH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Bottom, Dodge_LH_R);

    // Pose Top
    default AddDodge(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Top, Dodge_RH_F);
    default AddDodge(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Top, Dodge_RH_L);
    default AddDodge(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Top, Dodge_RH_B);
    default AddDodge(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Top, Dodge_RH_R);
};
