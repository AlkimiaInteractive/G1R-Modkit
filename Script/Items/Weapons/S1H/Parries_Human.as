UCLASS()
class UParriesData_S1H_Tr_Human : UParriesData
{
    FGameplayTagContainer metadata_parry_idle_left;
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Trained/A_Man_S1H_Tr_Parry_ALeft_Montage.A_Man_S1H_Tr_Parry_ALeft_Montage'");

    FGameplayTagContainer metadata_parry_idle_right;
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Trained/A_Man_S1H_Tr_Parry_ARight_Montage.A_Man_S1H_Tr_Parry_ARight_Montage'");

    FGameplayTagContainer metadata_parry_idle_bottom;
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Trained/A_Man_S1H_Tr_Parry_ABottom_Montage.A_Man_S1H_Tr_Parry_ABottom_Montage'");
    
    FGameplayTagContainer metadata_parry_idle_top;
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Trained/A_Man_S1H_Tr_Parry_ATop_Montage.A_Man_S1H_Tr_Parry_ATop_Montage'");
};

UCLASS()
class UParriesData_S1H_Ma_Human : UParriesData
{
    FGameplayTagContainer metadata_parry_idle_left;
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Master/A_Man_S1H_Ma_Parry_ALeft_Montage.A_Man_S1H_Ma_Parry_ALeft_Montage'");

    FGameplayTagContainer metadata_parry_idle_right;
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Master/A_Man_S1H_Ma_Parry_ARight_Montage.A_Man_S1H_Ma_Parry_ARight_Montage'");

    FGameplayTagContainer metadata_parry_idle_bottom;
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Master/A_Man_S1H_Ma_Parry_ABottom_Montage.A_Man_S1H_Ma_Parry_ABottom_Montage'");
    
    FGameplayTagContainer metadata_parry_idle_top;
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/Master/A_Man_S1H_Ma_Parry_ATop_Montage.A_Man_S1H_Ma_Parry_ATop_Montage'");
};

//Old parries using all combat poses: Idle, Right, Left, Bottom, Top
//Now we can only do parries from idle, so we don't need the others
UCLASS()
class UParriesData_S1H_Human_OLD : UParriesData
{
   // SuperArmor
    default m_SuperArmorResistanceMultiplier = 0.5f;

    FGameplayTagContainer metadata_parry_idle_left;
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_L_AnimMontage.A_Man_S1H_IB_Parry_L_AnimMontage'");

    FGameplayTagContainer metadata_parry_bottom_left;
    default metadata_parry_bottom_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_bottom_left.AddTag(GameplayTag::Combat_Pose_Bottom);
    default AddParry( metadata_parry_bottom_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_L_AnimMontage.A_Man_S1H_IB_Parry_L_AnimMontage'");

    FGameplayTagContainer metadata_parry_right_left;
    default metadata_parry_right_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_right_left.AddTag(GameplayTag::Combat_Pose_Right);
    default AddParry( metadata_parry_right_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_L_AnimMontage.A_Man_S1H_IB_Parry_L_AnimMontage'");

    FGameplayTagContainer metadata_parry_top_left;
    default metadata_parry_top_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_top_left.AddTag(GameplayTag::Combat_Pose_Top);
    default AddParry( metadata_parry_top_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_L_AnimMontage.A_Man_S1H_IB_Parry_L_AnimMontage'");

    FGameplayTagContainer metadata_parry_left_left;
    default metadata_parry_left_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_left_left.AddTag(GameplayTag::Combat_Pose_Left);
    default AddParry( metadata_parry_left_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_L_AnimMontage.A_Man_S1H_IB_Parry_L_AnimMontage'");
    
    FGameplayTagContainer metadata_parry_idle_bottom;
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_T_AnimMontage.A_Man_S1H_IB_Parry_T_AnimMontage'");

    FGameplayTagContainer metadata_parry_bottom_bottom;
    default metadata_parry_bottom_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_bottom_bottom.AddTag(GameplayTag::Combat_Pose_Bottom);
    default AddParry( metadata_parry_bottom_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_T_AnimMontage.A_Man_S1H_IB_Parry_T_AnimMontage'");

    FGameplayTagContainer metadata_parry_right_bottom;
    default metadata_parry_right_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_right_bottom.AddTag(GameplayTag::Combat_Pose_Right);
    default AddParry( metadata_parry_right_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_T_AnimMontage.A_Man_S1H_IB_Parry_T_AnimMontage'");

    FGameplayTagContainer metadata_parry_top_bottom;
    default metadata_parry_top_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_top_bottom.AddTag(GameplayTag::Combat_Pose_Top);
    default AddParry( metadata_parry_top_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_T_AnimMontage.A_Man_S1H_IB_Parry_T_AnimMontage'");

    FGameplayTagContainer metadata_parry_left_bottom;
    default metadata_parry_left_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_left_bottom.AddTag(GameplayTag::Combat_Pose_Left);
    default AddParry( metadata_parry_left_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_T_AnimMontage.A_Man_S1H_IB_Parry_T_AnimMontage'");

    FGameplayTagContainer metadata_parry_idle_right;
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_R_AnimMontage.A_Man_S1H_IB_Parry_R_AnimMontage'");

    FGameplayTagContainer metadata_parry_bottom_right;
    default metadata_parry_bottom_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_bottom_right.AddTag(GameplayTag::Combat_Pose_Bottom);
    default AddParry( metadata_parry_bottom_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_R_AnimMontage.A_Man_S1H_IB_Parry_R_AnimMontage'");

    FGameplayTagContainer metadata_parry_right_right;
    default metadata_parry_right_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_right_right.AddTag(GameplayTag::Combat_Pose_Right);
    default AddParry( metadata_parry_right_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_R_AnimMontage.A_Man_S1H_IB_Parry_R_AnimMontage'");

    FGameplayTagContainer metadata_parry_top_right;
    default metadata_parry_top_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_top_right.AddTag(GameplayTag::Combat_Pose_Top);
    default AddParry( metadata_parry_top_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_R_AnimMontage.A_Man_S1H_IB_Parry_R_AnimMontage'");

    FGameplayTagContainer metadata_parry_left_right;
    default metadata_parry_left_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_left_right.AddTag(GameplayTag::Combat_Pose_Left);
    default AddParry( metadata_parry_left_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_R_AnimMontage.A_Man_S1H_IB_Parry_R_AnimMontage'");

    FGameplayTagContainer metadata_parry_idle_top;
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Pose_Idle); 
    default AddParry( metadata_parry_idle_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_B_AnimMontage.A_Man_S1H_IB_Parry_B_AnimMontage'");

    FGameplayTagContainer metadata_parry_bottom_top;
    default metadata_parry_bottom_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_bottom_top.AddTag(GameplayTag::Combat_Pose_Bottom);
    default AddParry( metadata_parry_bottom_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_B_AnimMontage.A_Man_S1H_IB_Parry_B_AnimMontage'");

    FGameplayTagContainer metadata_parry_right_top;
    default metadata_parry_right_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_right_top.AddTag(GameplayTag::Combat_Pose_Right);
    default AddParry( metadata_parry_right_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_B_AnimMontage.A_Man_S1H_IB_Parry_B_AnimMontage'");

    FGameplayTagContainer metadata_parry_top_top;
    default metadata_parry_top_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_top_top.AddTag(GameplayTag::Combat_Pose_Top);
    default AddParry( metadata_parry_top_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_B_AnimMontage.A_Man_S1H_IB_Parry_B_AnimMontage'");

    FGameplayTagContainer metadata_parry_left_top;
    default metadata_parry_left_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_left_top.AddTag(GameplayTag::Combat_Pose_Left);
    default AddParry( metadata_parry_left_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Parries/A_Man_S1H_IB_Parry_B_AnimMontage.A_Man_S1H_IB_Parry_B_AnimMontage'");
};

