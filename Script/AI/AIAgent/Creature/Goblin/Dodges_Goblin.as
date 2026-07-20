UCLASS()
class UDodgesData_Goblin : UDodgesData
{
    // Orientation Front
    FDodgeData dodge_idle_front_front;
    default dodge_idle_front_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Dodges/GreenGoblin_Dodge_F_Fwd_Montage.GreenGoblin_Dodge_F_Fwd_Montage'";
    default dodge_idle_front_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front_front);


    // Orientation Right
    FDodgeData dodge_idle_right_right;
    default dodge_idle_right_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right_right.Orientation = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Dodges/GreenGoblin_Dodge_R_Right_Montage.GreenGoblin_Dodge_R_Right_Montage'";
    default dodge_idle_right_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right_right);
    //

    // Orientation Back
    FDodgeData dodge_idle_back_back;
    default dodge_idle_back_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back_back.Orientation = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Dodges/GreenGoblin_Dodge_B_Bwd_Montage.GreenGoblin_Dodge_B_Bwd_Montage'";
    default dodge_idle_back_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back_back);
    //

    // Orientation Left
    FDodgeData dodge_idle_left_left;
    default dodge_idle_left_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left_left.Orientation = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Dodges/GreenGoblin_Dodge_L_Left_Montage.GreenGoblin_Dodge_L_Left_Montage'";
    default dodge_idle_left_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left_left);
    //
};