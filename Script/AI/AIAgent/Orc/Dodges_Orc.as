UCLASS()
class URollConfig_Default_Orc : URollConfig
{
	default m_MaxFallingRollHeight = 300;
	default m_MaxFallingFallHeight = 1000;
	default m_RollPlayRate = 1;
	default m_BreakFallPlayRate = 1.35;
};

UCLASS()
class UDodgesData_Default_Orc : UDodgesData
{
    default m_RollConfig = URollConfig_Default_Orc::StaticClass();

	default m_Roll = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Dodges/A_OrcM_NWpn_Dodge_F_Montage.A_OrcM_NWpn_Dodge_F_Montage'";


	// Pose Idle
    FDodgeData dodge_idle_front;
    default dodge_idle_front.Direction = GameplayTag::Combat_Direction_Front;
    default dodge_idle_front.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_front.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Dodges/A_OrcM_NWpn_Dodge_F_Montage.A_OrcM_NWpn_Dodge_F_Montage'";
    default dodge_idle_front.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_front);

    FDodgeData dodge_idle_left;
    default dodge_idle_left.Direction = GameplayTag::Combat_Direction_Left;
    default dodge_idle_left.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_left.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Dodges/A_OrcM_NWpn_Dodge_L_Montage.A_OrcM_NWpn_Dodge_L_Montage'";
    default dodge_idle_left.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_left);

    FDodgeData dodge_idle_back;
    default dodge_idle_back.Direction = GameplayTag::Combat_Direction_Back;
    default dodge_idle_back.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_back.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Dodges/A_OrcM_NWpn_Dodge_B_Montage.A_OrcM_NWpn_Dodge_B_Montage'";
    default dodge_idle_back.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_back);

    FDodgeData dodge_idle_right;
    default dodge_idle_right.Direction = GameplayTag::Combat_Direction_Right;
    default dodge_idle_right.Pose = GameplayTag::Combat_Pose_Idle;
    default dodge_idle_right.Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Dodges/A_OrcM_NWpn_Dodge_R_Montage.A_OrcM_NWpn_Dodge_R_Montage'";
    default dodge_idle_right.m_SuperArmorResistanceMultiplier = 1.0f;
    default m_Dodges.Add(dodge_idle_right);
    //

};