UCLASS()
class UParriesData_M2H_Tr_Human : UParriesData
{
    FGameplayTagContainer metadata_parry_idle_left;
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Trained/A_Man_M2H_Tr_Parry_ALeft_Montage.A_Man_M2H_Tr_Parry_ALeft_Montage'");
    FGameplayTagContainer metadata_parry_idle_right;
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Trained/A_Man_M2H_Tr_Parry_ARight_Montage.A_Man_M2H_Tr_Parry_ARight_Montage'");

    FGameplayTagContainer metadata_parry_idle_bottom;
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Trained/A_Man_M2H_Tr_Parry_ABottom_Montage.A_Man_M2H_Tr_Parry_ABottom_Montage'");
    
    FGameplayTagContainer metadata_parry_idle_top;
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Trained/A_Man_M2H_Tr_Parry_ATop_Montage.A_Man_M2H_Tr_Parry_ATop_Montage'");
};

UCLASS()
class UParriesData_M2H_Ma_Human : UParriesData
{
    FGameplayTagContainer metadata_parry_idle_left;
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Master/A_Man_M2H_Ma_Parry_ALeft_Montage.A_Man_M2H_Ma_Parry_ALeft_Montage'");
    FGameplayTagContainer metadata_parry_idle_right;
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Master/A_Man_M2H_Ma_Parry_ARight_Montage.A_Man_M2H_Ma_Parry_ARight_Montage'");

    FGameplayTagContainer metadata_parry_idle_bottom;
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_idle_bottom.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_bottom, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Master/A_Man_M2H_Ma_Parry_ABottom_Montage.A_Man_M2H_Ma_Parry_ABottom_Montage'");
    
    FGameplayTagContainer metadata_parry_idle_top;
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_idle_top.AddTag(GameplayTag::Combat_Pose_Idle);
    default AddParry( metadata_parry_idle_top, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Parries/Master/A_Man_M2H_Ma_Parry_ATop_Montage.A_Man_M2H_Ma_Parry_ATop_Montage'");
};