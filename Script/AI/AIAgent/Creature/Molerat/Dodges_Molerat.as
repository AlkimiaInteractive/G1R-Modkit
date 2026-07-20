
UCLASS()
class UDodgesData_Default_Molerat : UDodgesData
{
    // Orientation Front
    FDodgeData dodge_idle_front_front;
    default dodge_idle_front_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_Fwd_Montage.Molerat_Dodge_Fwd_Montage'";
    default dodge_idle_front_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front_front);

    FDodgeData dodge_idle_left_front;
    default dodge_idle_left_front.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_left_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_Left_Montage.Molerat_Dodge_Left_Montage'";
    default dodge_idle_left_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left_front);

    FDodgeData dodge_idle_back_front;
    default dodge_idle_back_front.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_back_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_Bwd_Montage.Molerat_Dodge_Bwd_Montage'";
    default dodge_idle_back_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back_front);

    FDodgeData dodge_idle_right_front;
    default dodge_idle_right_front.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_right_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_Right_Montage.Molerat_Dodge_Right_Montage'";
    default dodge_idle_right_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right_front);
    //

    // // Orientation Right
    // FDodgeData dodge_idle_front_right;
    // default dodge_idle_front_right.Direction = GameplayTag::Combat_Direction_Front;
    // default dodge_idle_front_right.Orientation = GameplayTag::Combat_Direction_Right;
    // default dodge_idle_front_right.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_front_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_R_Left_Montage.Molerat_Dodge_R_Left_Montage'";
    // default dodge_idle_front_right.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_front_right);

    // FDodgeData dodge_idle_left_right;
    // default dodge_idle_left_right.Direction = GameplayTag::Combat_Direction_Left;
    // default dodge_idle_left_right.Orientation = GameplayTag::Combat_Direction_Right;
    // default dodge_idle_left_right.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_left_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_R_Bwd_Montage.Molerat_Dodge_R_Bwd_Montage'";
    // default dodge_idle_left_right.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_left_right);

    // FDodgeData dodge_idle_back_right;
    // default dodge_idle_back_right.Direction = GameplayTag::Combat_Direction_Back;
    // default dodge_idle_back_right.Orientation = GameplayTag::Combat_Direction_Right;
    // default dodge_idle_back_right.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_back_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_R_Right_Montage.Molerat_Dodge_R_Right_Montage'";
    // default dodge_idle_back_right.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_back_right);

    // FDodgeData dodge_idle_right_right;
    // default dodge_idle_right_right.Direction = GameplayTag::Combat_Direction_Right;
    // default dodge_idle_right_right.Orientation = GameplayTag::Combat_Direction_Right;
    // default dodge_idle_right_right.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_right_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_R_Fwd_Montage.Molerat_Dodge_R_Fwd_Montage'";
    // default dodge_idle_right_right.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_right_right);
    // //

    // // Orientation Back
    // FDodgeData dodge_idle_front_back;
    // default dodge_idle_front_back.Direction = GameplayTag::Combat_Direction_Front;
    // default dodge_idle_front_back.Orientation = GameplayTag::Combat_Direction_Back;
    // default dodge_idle_front_back.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_front_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_B_Bwd_Montage.Molerat_Dodge_B_Bwd_Montage'";
    // default dodge_idle_front_back.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_front_back);

    // FDodgeData dodge_idle_left_back;
    // default dodge_idle_left_back.Direction = GameplayTag::Combat_Direction_Left;
    // default dodge_idle_left_back.Orientation = GameplayTag::Combat_Direction_Back;
    // default dodge_idle_left_back.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_left_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_B_Right_Montage.Molerat_Dodge_B_Right_Montage'";
    // default dodge_idle_left_back.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_left_back);

    // FDodgeData dodge_idle_back_back;
    // default dodge_idle_back_back.Direction = GameplayTag::Combat_Direction_Back;
    // default dodge_idle_back_back.Orientation = GameplayTag::Combat_Direction_Back;
    // default dodge_idle_back_back.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_back_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_B_Fwd_Montage.Molerat_Dodge_B_Fwd_Montage'";
    // default dodge_idle_back_back.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_back_back);

    // FDodgeData dodge_idle_right_back;
    // default dodge_idle_right_back.Direction = GameplayTag::Combat_Direction_Right;
    // default dodge_idle_right_back.Orientation = GameplayTag::Combat_Direction_Back;
    // default dodge_idle_right_back.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_right_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_B_Left_Montage.Molerat_Dodge_B_Left_Montage'";
    // default dodge_idle_right_back.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_right_back);
    // //

    // // Orientation Left
    // FDodgeData dodge_idle_front_left;
    // default dodge_idle_front_left.Direction = GameplayTag::Combat_Direction_Front;
    // default dodge_idle_front_left.Orientation = GameplayTag::Combat_Direction_Left;
    // default dodge_idle_front_left.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_front_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_L_Right_Montage.Molerat_Dodge_L_Right_Montage'";
    // default dodge_idle_front_left.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_front_left);

    // FDodgeData dodge_idle_left_left;
    // default dodge_idle_left_left.Direction = GameplayTag::Combat_Direction_Left;
    // default dodge_idle_left_left.Orientation = GameplayTag::Combat_Direction_Left;
    // default dodge_idle_left_left.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_left_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_L_Fwd_Montage.Molerat_Dodge_L_Fwd_Montage'";
    // default dodge_idle_left_left.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_left_left);

    // FDodgeData dodge_idle_back_left;
    // default dodge_idle_back_left.Direction = GameplayTag::Combat_Direction_Back;
    // default dodge_idle_back_left.Orientation = GameplayTag::Combat_Direction_Left;
    // default dodge_idle_back_left.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_back_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_L_Left_Montage.Molerat_Dodge_L_Left_Montage'";
    // default dodge_idle_back_left.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_back_left);

    // FDodgeData dodge_idle_right_left;
    // default dodge_idle_right_left.Direction = GameplayTag::Combat_Direction_Right;
    // default dodge_idle_right_left.Orientation = GameplayTag::Combat_Direction_Left;
    // default dodge_idle_right_left.Pose = GameplayTag::Combat_Pose_Idle;
    // default dodge_idle_right_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Dodges/Molerat_Dodge_L_Bwd_Montage.Molerat_Dodge_L_Bwd_Montage'";
    // default dodge_idle_right_left.m_SuperArmorResistanceMultiplier = 1.0f;
    // default m_Dodges.Add(dodge_idle_right_left);
    // //

};