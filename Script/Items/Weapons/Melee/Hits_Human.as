UCLASS()
class UHitData_Melee_Human : UHitData //HITSTOCHECK
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Hits/Death/DeathMontage.DeathMontage'");
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Death/A_Man_S1H_Death_02_Montage.A_Man_S1H_Death_02_Montage'");
    
    // DEFEATED
    // -- Push hits --
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer metadata_defeated_F;
    default metadata_defeated_F.AddTag(GameplayTag::Combat_Direction_Front);
    default AddDefeatedHitMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer metadata_defeated_B;
    default metadata_defeated_B.AddTag(GameplayTag::Combat_Direction_Back);
    default AddDefeatedHitMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer metadata_defeated_R;
    default metadata_defeated_R.AddTag(GameplayTag::Combat_Direction_Right);
    default AddDefeatedHitMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer metadata_defeated_L;
    default metadata_defeated_L.AddTag(GameplayTag::Combat_Direction_Left);
    default AddDefeatedHitMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    // -- Riposte hits --
    FGameplayTagContainer metadata_defeated_Riposte;
    default metadata_defeated_Riposte.AddTag(GameplayTag::Combat_HitType_Riposte);
    default AddDefeatedHitMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    // -- 360 hits --
    FGameplayTagContainer metadata_defeated_Undirectional;
    default metadata_defeated_Undirectional.AddTag(GameplayTag::Combat_Direction_Undirectional);
    default AddDefeatedHitMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_360_Humanoid_In_Montage.A_Man_S1H_Ma_Hit_Defeated_360_Humanoid_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/A_Man_S1H_Hit_Knockback_F_Montage.A_Man_S1H_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/A_Man_S1H_Hit_Knockback_L_Montage.A_Man_S1H_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/A_Man_S1H_Hit_Knockback_R_Montage.A_Man_S1H_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/A_Man_S1H_Hit_Knockback_B_Montage.A_Man_S1H_Hit_Knockback_B_Montage'");
    ////////////////

    // BLOCKING (no block break)
    // -- Front hits --
    FGameplayTagContainer metadata_F_ARight_block;
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ARight_AnimMontage.A_Man_S1H_HitBlocked_F_ARight_AnimMontage'");

    FGameplayTagContainer metadata_F_ALeft_block;
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ALeft_AnimMontage.A_Man_S1H_HitBlocked_F_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_F_ATop_block;
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ATop_AnimMontage.A_Man_S1H_HitBlocked_F_ATop_AnimMontage'");

    FGameplayTagContainer metadata_F_ABottom_block;
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ABottom_AnimMontage.A_Man_S1H_HitBlocked_F_ABottom_AnimMontage'");

    // -- Back hits -- 
    FGameplayTagContainer metadata_B_ARight_block;
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ARight_AnimMontage.A_Man_S1H_HitBlocked_B_ARight_AnimMontage'");

    FGameplayTagContainer metadata_B_ALeft_block;
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ALeft_AnimMontage.A_Man_S1H_HitBlocked_B_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_B_ATop_block;
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ATop_AnimMontage.A_Man_S1H_HitBlocked_B_ATop_AnimMontage'");

    FGameplayTagContainer metadata_B_ABottom_block;
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ABottom_AnimMontage.A_Man_S1H_HitBlocked_B_ABottom_AnimMontage'");

    // -- Right hits -- 
    FGameplayTagContainer metadata_R_ARight_block;
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ARight_AnimMontage.A_Man_S1H_HitBlocked_R_ARight_AnimMontage'");

    FGameplayTagContainer metadata_R_ALeft_block;
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ALeft_AnimMontage.A_Man_S1H_HitBlocked_R_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_R_ATop_block;
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ATop_AnimMontage.A_Man_S1H_HitBlocked_R_ATop_AnimMontage'");

    FGameplayTagContainer metadata_R_ABottom_block;
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ABottom_AnimMontage.A_Man_S1H_HitBlocked_R_ABottom_AnimMontage'");

    // -- Left hits -- 
    FGameplayTagContainer metadata_L_ARight_block;
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ARight_AnimMontage.A_Man_S1H_HitBlocked_L_ARight_AnimMontage'");

    FGameplayTagContainer metadata_L_ALeft_block;
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ALeft_AnimMontage.A_Man_S1H_HitBlocked_L_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_L_ATop_block;
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ATop_AnimMontage.A_Man_S1H_HitBlocked_L_ATop_AnimMontage'");

    FGameplayTagContainer metadata_L_ABottom_block;
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ABottom_AnimMontage.A_Man_S1H_HitBlocked_L_ABottom_AnimMontage'");

    // ADDITIVE NO BLOCKING
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_F_Montage.A_Man_S1H_Hit_Additive_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_R_Montage.A_Man_S1H_Hit_Additive_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_L_Montage.A_Man_S1H_Hit_Additive_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_B_Montage.A_Man_S1H_Hit_Additive_B_Montage'");
    
    FGameplayTagContainer metadata_actionadditive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::State_Attack);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_F_Montage.A_Man_S1H_Hit_Additive_F_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::State_Attack);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_R_Montage.A_Man_S1H_Hit_Additive_R_Montage'");

     FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_L_Montage.A_Man_S1H_Hit_Additive_L_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Additive/A_Man_S1H_Hit_Additive_B_Montage.A_Man_S1H_Hit_Additive_B_Montage'");
    //////

    // LIGHT BLOCKING
    FGameplayTagContainer metadata_light_F_block;
    default metadata_light_F_block.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_F_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_light_F_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_light_F_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    FGameplayTagContainer metadata_light_R_block;
    default metadata_light_R_block.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_R_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_light_R_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_light_R_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    FGameplayTagContainer metadata_light_L_block;
    default metadata_light_L_block.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_L_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_light_L_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_light_L_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    FGameplayTagContainer metadata_light_B_block;
    default metadata_light_B_block.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_B_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_light_B_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_light_B_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    // LIGHT NO BLOCKING
    FGameplayTagContainer metadata_light_F;
    default metadata_light_F.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_light_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_light_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    FGameplayTagContainer metadata_light_R;
    default metadata_light_R.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_light_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_light_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    FGameplayTagContainer metadata_light_L;
    default metadata_light_L.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_light_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_light_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    FGameplayTagContainer metadata_light_B;
    default metadata_light_B.AddTag(GameplayTag::Combat_HitType_Light);
    default metadata_light_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_light_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_light_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    //////

    // STANDARD BLOCKED
    FGameplayTagContainer metadata_hit_block_standard_front;
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/A_Man_S1H_HitBreakBlock_F_Montage.A_Man_S1H_HitBreakBlock_F_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_back;
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/A_Man_S1H_HitBreakBlock_B_Montage.A_Man_S1H_HitBreakBlock_B_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_left;
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/A_Man_S1H_HitBreakBlock_L_Montage.A_Man_S1H_HitBreakBlock_L_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_right;
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/A_Man_S1H_HitBreakBlock_R_Montage.A_Man_S1H_HitBreakBlock_R_Montage'");
    //////

    ////// STANDARD
    // POSE IDLE
    FGameplayTagContainer metadata_hit_standard_idle_front;
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_F_Montage.A_Man_S1H_RH_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_left;
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_L_Montage.A_Man_S1H_RH_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_back;
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_B_Montage.A_Man_S1H_RH_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_right;
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_R_Montage.A_Man_S1H_RH_Hit_SupAr_R_Montage'");

    // POSE LEFT
    FGameplayTagContainer metadata_hit_standard_left_front;
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_F_Montage.A_Man_S1H_LH_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_hit_standard_left_left;
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_L_Montage.A_Man_S1H_LH_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_hit_standard_left_back;
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_B_Montage.A_Man_S1H_LH_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_hit_standard_left_right;
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_R_Montage.A_Man_S1H_LH_Hit_SupAr_R_Montage'");

    // POSE TOP
    FGameplayTagContainer metadata_hit_standard_top_front;
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_F_Montage.A_Man_S1H_LH_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_hit_standard_top_left;
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_L_Montage.A_Man_S1H_LH_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_hit_standard_top_back;
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_B_Montage.A_Man_S1H_LH_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_hit_standard_top_right;
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_Pose_Top);
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_top_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_top_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_R_Montage.A_Man_S1H_LH_Hit_SupAr_R_Montage'");

    // POSE RIGHT
    FGameplayTagContainer metadata_hit_standard_right_front;
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_F_Montage.A_Man_S1H_RH_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_hit_standard_right_left;
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_L_Montage.A_Man_S1H_RH_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_hit_standard_right_back;
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_B_Montage.A_Man_S1H_RH_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_hit_standard_right_right;
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_Pose_Right);
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_right_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_right_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_RH_Hit_SupAr_R_Montage.A_Man_S1H_RH_Hit_SupAr_R_Montage'");

    // POSE BOTTOM
    FGameplayTagContainer metadata_hit_standard_bottom_front;
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_F_Montage.A_Man_S1H_LH_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_hit_standard_bottom_left;
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_L_Montage.A_Man_S1H_LH_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_hit_standard_bottom_back;
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_B_Montage.A_Man_S1H_LH_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_hit_standard_bottom_right;
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/A_Man_S1H_LH_Hit_SupAr_R_Montage.A_Man_S1H_LH_Hit_SupAr_R_Montage'");
    //////

    // RIPOSTE
    FGameplayTagContainer metadata_Riposte_Humanoid_S1H;
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_Humanoid_S1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_S1H_Montage.A_Man_S1H_Tr_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_S2H;
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_S2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_S1H_Montage.A_Man_S1H_Tr_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_A1H;
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddHit( metadata_Riposte_Humanoid_A1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_A1H_Montage.A_Man_S1H_Tr_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_A2H;
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_A2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_A1H_Montage.A_Man_S1H_Tr_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_M1H;
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddHit( metadata_Riposte_Humanoid_M1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_M1H_Montage.A_Man_S1H_Tr_Hit_Riposte_M1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_M2H;
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_M2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_M1H_Montage.A_Man_S1H_Tr_Hit_Riposte_M1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_Sff2H;
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_Sff2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_S1H_Montage.A_Man_S1H_Tr_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_Fists;
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Item_Weapon_Fist);
    default AddHit( metadata_Riposte_Humanoid_Fists, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_Fists_Montage.A_Man_S1H_Tr_Hit_Riposte_Fists_Montage'");

    //Riposte by orc
    FGameplayTagContainer metadata_Riposte_Humanoid_Orc;
    default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Character_Size_Orc);
    // default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_Humanoid_Orc, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Trained/A_Man_S1H_Tr_Hit_Riposte_Orc_Montage.A_Man_S1H_Tr_Hit_Riposte_Orc_Montage'");
};