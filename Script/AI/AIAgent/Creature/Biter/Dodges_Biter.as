UCLASS()
class UDodgesData_Biter : UDodgesData
{
    // Orientation Front
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Dodges/Biter_DodgeFwd_Montage.Biter_DodgeFwd_Montage'";
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front);


    // Orientation Right
    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Dodges/Biter_DodgeRight_Montage.Biter_DodgeRight_Montage'";
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right);
    //

    // Orientation Back
    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Dodges/Biter_DodgeBwd_Montage.Biter_DodgeBwd_Montage'";
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back);
    //

    // Orientation Left
    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Dodges/Biter_DodgeLeft_Montage.Biter_DodgeLeft_Montage'";
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left);
    //
};