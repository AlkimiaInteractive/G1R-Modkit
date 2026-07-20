UCLASS()
class UParriesData_Default_Human : UParriesData
{
    // LEFT
    FGameplayTagContainer metadata_parry_left;
    default metadata_parry_left.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_parry_left.AddTag(GameplayTag::Combat_Pose_Idle);

    FTagMontage parryData_left;
    default parryData_left.MetaData = metadata_parry_left;
    default parryData_left.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Parry/Parry_Idle_Left.Parry_Idle_Left'";
    default m_Parries.Add(parryData_left);

    // BOTTOM
    FGameplayTagContainer metadata_parry_bottom;
    default metadata_parry_bottom.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_parry_bottom.AddTag(GameplayTag::Combat_Pose_Idle);

    FTagMontage parryData_bottom;
    default parryData_bottom.MetaData = metadata_parry_bottom;
    default parryData_bottom.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Parry/Parry_Idle_Left.Parry_Idle_Left'";
    default m_Parries.Add(parryData_bottom);

    // RIGHT
    FGameplayTagContainer metadata_parry_right;
    default metadata_parry_right.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_parry_right.AddTag(GameplayTag::Combat_Pose_Idle);

    FTagMontage parryData_right;
    default parryData_right.MetaData = metadata_parry_right;
    default parryData_right.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Parry/Parry_Idle_Right.Parry_Idle_Right'";
    default m_Parries.Add(parryData_right);

    // TOP
    FGameplayTagContainer metadata_parry_top;
    default metadata_parry_top.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_parry_top.AddTag(GameplayTag::Combat_Pose_Idle);

    FTagMontage parryData_top;
    default parryData_top.MetaData = metadata_parry_top;
    default parryData_top.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Parry/Parry_Idle_Right.Parry_Idle_Right'";
    default m_Parries.Add(parryData_top);
};