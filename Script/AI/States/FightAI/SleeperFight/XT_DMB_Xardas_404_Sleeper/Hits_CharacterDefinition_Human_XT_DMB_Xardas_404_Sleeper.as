UCLASS()
class UHitData_S1H_Ma_XardasSleeper : UHitData_Human 
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");

    // ADDITIVE
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_F_Montage.A_XardasSleeeper_S1H_Hit_Additive_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_R_Montage.A_XardasSleeeper_S1H_Hit_Additive_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_L_Montage.A_XardasSleeeper_S1H_Hit_Additive_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_B_Montage.A_XardasSleeeper_S1H_Hit_Additive_B_Montage'");
    ////////////////

    
    ////// STANDARD
    default HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_RH_Hit_SupAr_F_Montage.A_Man_S1H_Ma_RH_Hit_SupAr_F_Montage'";
    default HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_RH_Hit_SupAr_B_Montage.A_Man_S1H_Ma_RH_Hit_SupAr_B_Montage'";
    default HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_RH_Hit_SupAr_L_Montage.A_Man_S1H_Ma_RH_Hit_SupAr_L_Montage'";
    default HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_RH_Hit_SupAr_R_Montage.A_Man_S1H_Ma_RH_Hit_SupAr_R_Montage'";

    default HitSupAr_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_LH_Hit_SupAr_F_Montage.A_Man_S1H_Ma_LH_Hit_SupAr_F_Montage'";
    default HitSupAr_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_LH_Hit_SupAr_B_Montage.A_Man_S1H_Ma_LH_Hit_SupAr_B_Montage'";
    default HitSupAr_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_LH_Hit_SupAr_L_Montage.A_Man_S1H_Ma_LH_Hit_SupAr_L_Montage'";
    default HitSupAr_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Master/A_Man_S1H_Ma_LH_Hit_SupAr_R_Montage.A_Man_S1H_Ma_LH_Hit_SupAr_R_Montage'";

    // -- Pose idle --
    FGameplayTagContainer metadata_hit_standard_idle_front;
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_front, HitSupAr_RH_F);

    FGameplayTagContainer metadata_hit_standard_idle_left;
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_left, HitSupAr_RH_L);

    FGameplayTagContainer metadata_hit_standard_idle_back;
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_back, HitSupAr_RH_B);

    FGameplayTagContainer metadata_hit_standard_idle_right;
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_right, HitSupAr_RH_R);

    // -- Pose left --
    FGameplayTagContainer metadata_hit_standard_left_front;
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_front, HitSupAr_LH_F);

    FGameplayTagContainer metadata_hit_standard_left_left;
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_left, HitSupAr_LH_L);

    FGameplayTagContainer metadata_hit_standard_left_back;
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_back, HitSupAr_LH_B);

    FGameplayTagContainer metadata_hit_standard_left_right;
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_right, HitSupAr_LH_R);

    // -- Pose top --
    FGameplayTagContainer metadata_hit_standard_top_front;
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_front, HitSupAr_RH_F);

    FGameplayTagContainer metadata_hit_standard_top_left;
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_left, HitSupAr_RH_L);

    FGameplayTagContainer metadata_hit_standard_top_back;
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_back, HitSupAr_RH_B);

    FGameplayTagContainer metadata_hit_standard_top_right;
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_right, HitSupAr_RH_R);

    // -- Pose right --
    FGameplayTagContainer metadata_hit_standard_right_front;
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_front, HitSupAr_RH_F);

    FGameplayTagContainer metadata_hit_standard_right_left;
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_left, HitSupAr_RH_L);

    FGameplayTagContainer metadata_hit_standard_right_back;
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_back, HitSupAr_RH_B);

    FGameplayTagContainer metadata_hit_standard_right_right;
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_right, HitSupAr_RH_R);

    // -- Pose bottom --
    FGameplayTagContainer metadata_hit_standard_bottom_front;
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_front, HitSupAr_LH_F);

    FGameplayTagContainer metadata_hit_standard_bottom_left;
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_left, HitSupAr_LH_L);

    FGameplayTagContainer metadata_hit_standard_bottom_back;
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_back, HitSupAr_LH_B);

    FGameplayTagContainer metadata_hit_standard_bottom_right;
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_right, HitSupAr_LH_R);    
    ////////////////

    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Master/A_Man_S1H_Ma_Hit_Knockback_F_Montage.A_Man_S1H_Ma_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Master/A_Man_S1H_Ma_Hit_Knockback_L_Montage.A_Man_S1H_Ma_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Master/A_Man_S1H_Ma_Hit_Knockback_R_Montage.A_Man_S1H_Ma_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Master/A_Man_S1H_Ma_Hit_Knockback_B_Montage.A_Man_S1H_Ma_Hit_Knockback_B_Montage'");
    ////////////////

    // BLOCK BREAK
    FGameplayTagContainer metadata_hit_block_standard_front;
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Master/A_Man_S1H_Ma_HitBreakBlock_F_Montage.A_Man_S1H_Ma_HitBreakBlock_F_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_back;
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Master/A_Man_S1H_Ma_HitBreakBlock_B_Montage.A_Man_S1H_Ma_HitBreakBlock_B_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_left;
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Master/A_Man_S1H_Ma_HitBreakBlock_L_Montage.A_Man_S1H_Ma_HitBreakBlock_L_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_right;
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Master/A_Man_S1H_Ma_HitBreakBlock_R_Montage.A_Man_S1H_Ma_HitBreakBlock_R_Montage'");
    ////////////////

    // RIPOSTE
    FGameplayTagContainer metadata_Riposte_Humanoid_S1H;
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Item_Weapon_Torch);
    default AddHit( metadata_Riposte_Humanoid_S1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_S1H_Montage.A_Man_S1H_Ma_Hit_Riposte_S1H_Montage'");
    // default AddHit( metadata_Riposte_Humanoid_S1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Test/Riposte/A_Man_TestS1H_HitRiposted_Montage.A_Man_TestS1H_HitRiposted_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_S2H;
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_S2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_S1H_Montage.A_Man_S1H_Ma_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_A1H;
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddHit( metadata_Riposte_Humanoid_A1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_A1H_Montage.A_Man_S1H_Ma_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_A2H;
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_A2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_A1H_Montage.A_Man_S1H_Ma_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_M1H;
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddHit( metadata_Riposte_Humanoid_M1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_M1H_Montage.A_Man_S1H_Ma_Hit_Riposte_M1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_M2H;
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_M2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_M1H_Montage.A_Man_S1H_Ma_Hit_Riposte_M1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_Sff2H;
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Item_Weapon_Staff);
    default AddHit( metadata_Riposte_Humanoid_Sff2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_S1H_Montage.A_Man_S1H_Ma_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_Fists;
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Item_Weapon_Fist);
    default AddHit( metadata_Riposte_Humanoid_Fists, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_Fists_Montage.A_Man_S1H_Ma_Hit_Riposte_Fists_Montage'");

    //Riposte by orc
    FGameplayTagContainer metadata_Riposte_Humanoid_Orc;
    default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Character_Size_Orc);
    // default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_Humanoid_Orc, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Master/A_Man_S1H_Ma_Hit_Riposte_Orc_Montage.A_Man_S1H_Ma_Hit_Riposte_Orc_Montage'");
    ////////////////

    // DEFEATED
    // -- Push hits --
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");

    FGameplayTagContainer metadata_defeated_F;
    default metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);
    default AddDefeatedHitMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");

    FGameplayTagContainer metadata_defeated_B;
    default metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);
    default AddDefeatedHitMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");

    FGameplayTagContainer metadata_defeated_R;
    default metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);
    default AddDefeatedHitMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");

    FGameplayTagContainer metadata_defeated_L;
    default metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);
    default AddDefeatedHitMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");

    // -- Riposte hits --
    FGameplayTagContainer metadata_defeated_Riposte;
    default metadata_defeated_Riposte.AddTag(GameplayTag::Combat_HitType_Riposte);
    default AddDefeatedHitMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");

    // -- 360 hits --
    FGameplayTagContainer metadata_defeated_Undirectional;
    default metadata_defeated_Undirectional.AddTag(GameplayTag::Combat_Direction_Undirectional);
    default AddDefeatedHitMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_360_Humanoid_In_Montage.A_Man_S1H_Ma_Hit_Defeated_360_Humanoid_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Death/A_XardasSleeper_S1H_Hit_Death_Montage.A_XardasSleeper_S1H_Hit_Death_Montage'");
}


UCLASS()
class UHitData_XardasSleeper : UHitData_Default_Human
{
        // ADDITIVE
    default AddAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_B_Montage.A_XardasSleeeper_S1H_Hit_Additive_B_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_F_Montage.A_XardasSleeeper_S1H_Hit_Additive_F_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_L_Montage.A_XardasSleeeper_S1H_Hit_Additive_L_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_R_Montage.A_XardasSleeeper_S1H_Hit_Additive_R_Montage'");

    // ADDITIVE
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_B_Montage.A_XardasSleeeper_S1H_Hit_Additive_B_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_F_Montage.A_XardasSleeeper_S1H_Hit_Additive_F_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_L_Montage.A_XardasSleeeper_S1H_Hit_Additive_L_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Stunned/A_XardasSleeeper_S1H_Hit_Additive_R_Montage.A_XardasSleeeper_S1H_Hit_Additive_R_Montage'");
    
}
