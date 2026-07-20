UCLASS()
class UDodgesData_Minecrawler : UDodgesData
{
    // Orientation Front
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Dodges/Minecrawler_DodgeFwd_Montage.Minecrawler_DodgeFwd_Montage'";
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front);

    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Dodges/Minecrawler_DodgeLeft_Montage.Minecrawler_DodgeLeft_Montage'";
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left);

    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Dodges/Minecrawler_DodgeBwd_Montage.Minecrawler_DodgeBwd_Montage'";
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back);

    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Dodges/Minecrawler_DodgeRight_Montage.Minecrawler_DodgeRight_Montage'";
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right);
    //

    
};

UCLASS()
class UDodgesData_Minecrawler_Warrior : UDodgesData
{
    // Orientation Front
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Dodges/MCrawler_Warrior_DodgeFwd_Montage.MCrawler_Warrior_DodgeFwd_Montage'";
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front);

    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Dodges/MCrawler_Warrior_DodgeLeft_Montage.MCrawler_Warrior_DodgeLeft_Montage'";
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left);

    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Dodges/MCrawler_Warrior_DodgeBwd_Montage.MCrawler_Warrior_DodgeBwd_Montage'";
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back);

    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Orientation = GameplayTag::Combat_Direction_Front;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Dodges/MCrawler_Warrior_DodgeRight_Montage.MCrawler_Warrior_DodgeRight_Montage'";
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right);
    //

    
};