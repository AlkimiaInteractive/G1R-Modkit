class UConfig_Human_M_Ladder : UAttackMeleeLadderConfig
{
    default m_MontageUpLeft = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ladder/PH_Man_Ladder_Left_Attack_Up_Montage.PH_Man_Ladder_Left_Attack_Up_Montage'";
    default m_MontageUpRight = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ladder/PH_Man_Ladder_Right_Attack_Up_Montage.PH_Man_Ladder_Right_Attack_Up_Montage'";
    default m_MontageDownLeft = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ladder/PH_Man_Ladder_Left_Attack_Down_Montage.PH_Man_Ladder_Left_Attack_Down_Montage'";
    default m_MontageDownRight = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ladder/PH_Man_Ladder_Right_Attack_Down_Montage.PH_Man_Ladder_Right_Attack_Down_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.2f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UAttack_Human_Ladder : UComboAttackConfigScript
{
    default m_MetaData = UConfig_Human_M_Ladder::StaticClass();
}

UCLASS()
class UHitData_Human_Ladder : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Hits/Death/DeathMontage.DeathMontage'");
     
    FGameplayTagContainer metadata_loop_right;
    default metadata_loop_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddDefeatedLoopMontage(metadata_loop_right,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedStandUpMontage(metadata_loop_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");

    FGameplayTagContainer metadata_loop_left;
    default metadata_loop_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddDefeatedLoopMontage(metadata_loop_left,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedStandUpMontage(metadata_loop_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");

    FGameplayTagContainer metadata_loop_front;
    default metadata_loop_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddDefeatedLoopMontage(metadata_loop_front,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedStandUpMontage(metadata_loop_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");

    FGameplayTagContainer metadata_loop_back;
    default metadata_loop_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddDefeatedLoopMontage(metadata_loop_back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedStandUpMontage(metadata_loop_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");


    // ADDITIVE
    FGameplayTagContainer metadata_additive_up;
    default metadata_additive_up.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_up.AddTag(GameplayTag::Combat_Direction_Up);
    default metadata_additive_up.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_up, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ladder/PH_Man_Ladder_Hit_Up_Montage.PH_Man_Ladder_Hit_Up_Montage'");

    FGameplayTagContainer metadata_additive_down;
    default metadata_additive_down.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_down.AddTag(GameplayTag::Combat_Direction_Down);
    default metadata_additive_down.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_down, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ladder/PH_Man_Ladder_Hit_Down_Montage.PH_Man_Ladder_Hit_Down_Montage'");
};

UCLASS()
class ULadder_Human : ULadderAnimConfig
{    
    // HITS
    default m_HitsData = UHitData_Human_Ladder::StaticClass();
    //

    // KICK
    default m_Kick = UAttack_Human_Ladder::StaticClass();
    //
}    