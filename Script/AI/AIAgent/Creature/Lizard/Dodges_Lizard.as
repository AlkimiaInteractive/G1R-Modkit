
UCLASS()
class UDodgesData_Default_Lizard : UDodgesData
{
    // Pose Idle
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Dodges/Lizard_Dodge_Fwd_Montage.Lizard_Dodge_Fwd_Montage'";
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front);

    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Dodges/Lizard_Dodge_Left_Montage.Lizard_Dodge_Left_Montage'";
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left);

    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Dodges/Lizard_Dodge_Bwd_Montage.Lizard_Dodge_Bwd_Montage'";
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back);

    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Dodges/Lizard_Dodge_Right_Montage.Lizard_Dodge_Right_Montage'";
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right);
    //
};


UCLASS()
class UDodgesData_Default_Lizard_Fire : UDodgesData
{
    // Pose Idle
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Dodges/A_Lizard_Fire_DodgeFwd_Montage.A_Lizard_Fire_DodgeFwd_Montage'";
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front);

    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Dodges/A_Lizard_Fire_DodgeLeft_Montage.A_Lizard_Fire_DodgeLeft_Montage'";
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left);

    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Dodges/A_Lizard_Fire_DodgeBwd_Montage.A_Lizard_Fire_DodgeBwd_Montage'";
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back);

    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Dodges/A_Lizard_Fire_DodgeRight_Montage.A_Lizard_Fire_DodgeRight_Montage'";
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right);
    //
};