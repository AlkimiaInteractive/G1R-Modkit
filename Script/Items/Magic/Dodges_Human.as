UCLASS()
class URollConfig_Rune_Human : URollConfig
{
	default m_MaxFallingRollHeight = 400;
	default m_MaxFallingFallHeight = 1100;
	default m_RollPlayRate = 1;
	default m_BreakFallPlayRate = 1.35;
};

UCLASS()
class UDodgesData_Rune_Human : UDodgesData
{
    default m_RollConfig = URollConfig_Rune_Human::StaticClass();

	default m_Roll = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Dodges/Roll/A_Man_ScrollRune_Roll_F_Montage.A_Man_ScrollRune_Roll_F_Montage'";

    FName Dodge_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Dodges/A_Man_ScrollRune_Dodge_F_Montage.A_Man_ScrollRune_Dodge_F_Montage'";
    FName Dodge_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Dodges/A_Man_ScrollRune_Dodge_B_Montage.A_Man_ScrollRune_Dodge_B_Montage'";
    FName Dodge_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Dodges/A_Man_ScrollRune_Dodge_L_Montage.A_Man_ScrollRune_Dodge_L_Montage'";
    FName Dodge_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Dodges/A_Man_ScrollRune_Dodge_R_Montage.A_Man_ScrollRune_Dodge_R_Montage'";

    // Pose Idle
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = Dodge_RH_F;
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_idle_front);

    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = Dodge_RH_L;
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_idle_left);

    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = Dodge_RH_B;
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_idle_back);

    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = Dodge_RH_R;
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_idle_right);
    //

    // Pose Right
    FDodgeData dodge_right_front;
    default dodge_right_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_right_front.Pose = GameplayTag::Combat_Pose_Right;
    default dodge_right_front.Montage = Dodge_RH_F;
    default dodge_right_front.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_right_front);

    FDodgeData dodge_right_left;
    default dodge_right_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_right_left.Pose = GameplayTag::Combat_Pose_Right;
    default dodge_right_left.Montage = Dodge_RH_L;
    default dodge_right_left.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_right_left);

    FDodgeData dodge_right_back;
    default dodge_right_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_right_back.Pose = GameplayTag::Combat_Pose_Right;
    default dodge_right_back.Montage = Dodge_RH_B;
    default dodge_right_back.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_right_back);

    FDodgeData dodge_right_right;
    default dodge_right_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_right_right.Pose = GameplayTag::Combat_Pose_Right;
    default dodge_right_right.Montage = Dodge_RH_R;
    default dodge_right_right.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_right_right);
    //

    // Pose Left
    FDodgeData dodge_left_front;
    default dodge_left_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_left_front.Pose = GameplayTag::Combat_Pose_Left;
    default dodge_left_front.Montage = Dodge_RH_F;
    default dodge_left_front.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_left_front);

    FDodgeData dodge_left_left;
    default dodge_left_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_left_left.Pose = GameplayTag::Combat_Pose_Left;
    default dodge_left_left.Montage = Dodge_RH_L;
    default dodge_left_left.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_left_left);

    FDodgeData dodge_left_back;
    default dodge_left_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_left_back.Pose = GameplayTag::Combat_Pose_Left;
    default dodge_left_back.Montage = Dodge_RH_B;
    default dodge_left_back.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_left_back);

    FDodgeData dodge_left_right;
    default dodge_left_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_left_right.Pose = GameplayTag::Combat_Pose_Left;
    default dodge_left_right.Montage = Dodge_RH_R;
    default dodge_left_right.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_left_right);
    //

    // Pose Bottom
    FDodgeData dodge_bottom_front;
    default dodge_bottom_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_bottom_front.Pose = GameplayTag::Combat_Pose_Bottom;
    default dodge_bottom_front.Montage = Dodge_RH_F;
    default dodge_bottom_front.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_bottom_front);

    FDodgeData dodge_bottom_left;
    default dodge_bottom_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_bottom_left.Pose = GameplayTag::Combat_Pose_Bottom;
    default dodge_bottom_left.Montage = Dodge_RH_L;
    default dodge_bottom_left.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_bottom_left);

    FDodgeData dodge_bottom_back;
    default dodge_bottom_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_bottom_back.Pose = GameplayTag::Combat_Pose_Bottom;
    default dodge_bottom_back.Montage = Dodge_RH_B;
    default dodge_bottom_back.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_bottom_back);

    FDodgeData dodge_bottom_right;
    default dodge_bottom_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_bottom_right.Pose = GameplayTag::Combat_Pose_Bottom;
    default dodge_bottom_right.Montage = Dodge_RH_R;
    default dodge_bottom_right.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_bottom_right);
    //

    // Pose Top
    FDodgeData dodge_top_front;
    default dodge_top_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_top_front.Pose = GameplayTag::Combat_Pose_Top;
    default dodge_top_front.Montage = Dodge_RH_F;
    default dodge_top_front.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_top_front);

    FDodgeData dodge_top_left;
    default dodge_top_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_top_left.Pose = GameplayTag::Combat_Pose_Top;
    default dodge_top_left.Montage = Dodge_RH_L;
    default dodge_top_left.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_top_left);

    FDodgeData dodge_top_back;
    default dodge_top_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_top_back.Pose = GameplayTag::Combat_Pose_Top;
    default dodge_top_back.Montage = Dodge_RH_B;
    default dodge_top_back.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_top_back);

    FDodgeData dodge_top_right;
    default dodge_top_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_top_right.Pose = GameplayTag::Combat_Pose_Top;
    default dodge_top_right.Montage = Dodge_RH_R;
    default dodge_top_right.m_SuperArmorResistanceMultiplier = 0.4f;
    default m_Dodges.Add(dodge_top_right);
    //
};