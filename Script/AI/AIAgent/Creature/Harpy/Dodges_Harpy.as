UCLASS()
class UDodgesData_Default_Harpy : UDodgesData
{
    // Pose Idle
    FDodgeData dodge_idle_front_front;
    default dodge_idle_front_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Dodges/Harpy_Dodge_F_Montage.Harpy_Dodge_F_Montage'";
    default dodge_idle_front_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front_front);

    FDodgeData dodge_idle_left_front;
    default dodge_idle_left_front.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_left_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Dodges/Harpy_Dodge_L_Montage.Harpy_Dodge_L_Montage'";
    default dodge_idle_left_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left_front);

    FDodgeData dodge_idle_back_front;
    default dodge_idle_back_front.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_back_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Dodges/Harpy_Dodge_B_Montage.Harpy_Dodge_B_Montage'";
    default dodge_idle_back_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back_front);

    FDodgeData dodge_idle_right_front;
    default dodge_idle_right_front.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_right_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Dodges/Harpy_Dodge_R_Montage.Harpy_Dodge_R_Montage'";
    default dodge_idle_right_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right_front);
    //
};