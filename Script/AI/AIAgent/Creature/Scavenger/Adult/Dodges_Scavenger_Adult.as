
UCLASS()
class UDodgesData_Scavenger_Adult : UDodgesData
{
    // Pose Idle
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Dodge/Scavenger_Adult_Dodge_Fwd_Montage.Scavenger_Adult_Dodge_Fwd_Montage'";
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front);

    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Dodge/Scavenger_Adult_Dodge_Left_Montage.Scavenger_Adult_Dodge_Left_Montage'";
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left);

    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Dodge/Scavenger_Adult_Dodge_Bwd_Montage.Scavenger_Adult_Dodge_Bwd_Montage'";
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back);

    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Dodge/Scavenger_Adult_Dodge_Right_Montage.Scavenger_Adult_Dodge_Right_Montage'";
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right);
    //
};