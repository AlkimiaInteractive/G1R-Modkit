
UCLASS()
class UHitData_Orc_Staff : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Death/OrcM_Death_Montage.OrcM_Death_Montage'");
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Death/A_OrcM_Death_02_Montage.A_OrcM_Death_02_Montage'");

    // BLOCKED
    // -- Front hits --
    FGameplayTagContainer metadata_F_ARight_block;
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_F_ARight_AnimMontage.A_OrcM_Sff1H_HitBlocked_F_ARight_AnimMontage'");

    FGameplayTagContainer metadata_F_ALeft_block;
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_F_ALeft_AnimMontage.A_OrcM_Sff1H_HitBlocked_F_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_F_ATop_block;
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_F_ATop_AnimMontage.A_OrcM_Sff1H_HitBlocked_F_ATop_AnimMontage'");

    FGameplayTagContainer metadata_F_ABottom_block;
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_F_ABottom_AnimMontage.A_OrcM_Sff1H_HitBlocked_F_ABottom_AnimMontage'");

    // -- Back hits -- 
    FGameplayTagContainer metadata_B_ARight_block;
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_B_ARight_AnimMontage.A_OrcM_Sff1H_HitBlocked_B_ARight_AnimMontage'");

    FGameplayTagContainer metadata_B_ALeft_block;
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_B_ALeft_AnimMontage.A_OrcM_Sff1H_HitBlocked_B_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_B_ATop_block;
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_B_ATop_AnimMontage.A_OrcM_Sff1H_HitBlocked_B_ATop_AnimMontage'");

    FGameplayTagContainer metadata_B_ABottom_block;
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_B_ABottom_AnimMontage.A_OrcM_Sff1H_HitBlocked_B_ABottom_AnimMontage'");

    // -- Right hits -- 
    FGameplayTagContainer metadata_R_ARight_block;
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_R_ARight_AnimMontage.A_OrcM_Sff1H_HitBlocked_R_ARight_AnimMontage'");

    FGameplayTagContainer metadata_R_ALeft_block;
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_R_ALeft_AnimMontage.A_OrcM_Sff1H_HitBlocked_R_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_R_ATop_block;
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_R_ATop_AnimMontage.A_OrcM_Sff1H_HitBlocked_R_ATop_AnimMontage'");

    FGameplayTagContainer metadata_R_ABottom_block;
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_R_ABottom_AnimMontage.A_OrcM_Sff1H_HitBlocked_R_ABottom_AnimMontage'");

    // -- Left hits -- 
    FGameplayTagContainer metadata_L_ARight_block;
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_L_ARight_AnimMontage.A_OrcM_Sff1H_HitBlocked_L_ARight_AnimMontage'");

    FGameplayTagContainer metadata_L_ALeft_block;
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_L_ALeft_AnimMontage.A_OrcM_Sff1H_HitBlocked_L_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_L_ATop_block;
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_L_ATop_AnimMontage.A_OrcM_Sff1H_HitBlocked_L_ATop_AnimMontage'");

    FGameplayTagContainer metadata_L_ABottom_block;
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/HitBlocked/A_OrcM_Sff1H_HitBlocked_L_ABottom_AnimMontage.A_OrcM_Sff1H_HitBlocked_L_ABottom_AnimMontage'");
    ////////////////    
    
    // ADDITIVE
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_Additive_F_Montage.A_OrcM_Sff1H_Hit_Additive_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_Additive_R_Montage.A_OrcM_Sff1H_Hit_Additive_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_Additive_L_Montage.A_OrcM_Sff1H_Hit_Additive_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_Additive_B_Montage.A_OrcM_Sff1H_Hit_Additive_B_Montage'");
    
     FGameplayTagContainer metadata_actionadditive_F;
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_F.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_ActionAdditive_F_Montage.A_OrcM_Sff1H_Hit_ActionAdditive_F_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_R.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_ActionAdditive_R_Montage.A_OrcM_Sff1H_Hit_ActionAdditive_R_Montage'");

     FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_ActionAdditive_L_Montage.A_OrcM_Sff1H_Hit_ActionAdditive_L_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Additive/A_OrcM_Sff1H_Hit_ActionAdditive_B_Montage.A_OrcM_Sff1H_Hit_ActionAdditive_B_Montage'");
    ////////////////

    ////// STANDARD
    FName HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_RH_Hit_SupAr_F_Montage.A_OrcM_Sff1H_RH_Hit_SupAr_F_Montage'";
    FName HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_RH_Hit_SupAr_B_Montage.A_OrcM_Sff1H_RH_Hit_SupAr_B_Montage'";
    FName HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_RH_Hit_SupAr_L_Montage.A_OrcM_Sff1H_RH_Hit_SupAr_L_Montage'";
    FName HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_RH_Hit_SupAr_R_Montage.A_OrcM_Sff1H_RH_Hit_SupAr_R_Montage'";

    FName HitSupAr_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_LH_Hit_SupAr_F_Montage.A_OrcM_Sff1H_LH_Hit_SupAr_F_Montage'";
    FName HitSupAr_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_LH_Hit_SupAr_B_Montage.A_OrcM_Sff1H_LH_Hit_SupAr_B_Montage'";
    FName HitSupAr_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_LH_Hit_SupAr_L_Montage.A_OrcM_Sff1H_LH_Hit_SupAr_L_Montage'";
    FName HitSupAr_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/supAr/A_OrcM_Sff1H_LH_Hit_SupAr_R_Montage.A_OrcM_Sff1H_LH_Hit_SupAr_R_Montage'";

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
    default AddHit( metadata_hit_standard_left_front, HitSupAr_RH_F);

    FGameplayTagContainer metadata_hit_standard_left_left;
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_left, HitSupAr_RH_L);

    FGameplayTagContainer metadata_hit_standard_left_back;
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_back, HitSupAr_RH_B);

    FGameplayTagContainer metadata_hit_standard_left_right;
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_Pose_Left);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_left_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_left_right, HitSupAr_RH_R);

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
    default AddHit( metadata_hit_standard_bottom_front, HitSupAr_RH_F);

    FGameplayTagContainer metadata_hit_standard_bottom_left;
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_left, HitSupAr_RH_L);

    FGameplayTagContainer metadata_hit_standard_bottom_back;
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_back, HitSupAr_RH_B);

    FGameplayTagContainer metadata_hit_standard_bottom_right;
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_Pose_Bottom);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_bottom_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_bottom_right, HitSupAr_RH_R);
    ////////////////

    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Knockback/A_OrcM_Sff1H_Hit_Knockback_F_Montage.A_OrcM_Sff1H_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Knockback/A_OrcM_Sff1H_Hit_Knockback_L_Montage.A_OrcM_Sff1H_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Knockback/A_OrcM_Sff1H_Hit_Knockback_R_Montage.A_OrcM_Sff1H_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Knockback/A_OrcM_Sff1H_Hit_Knockback_B_Montage.A_OrcM_Sff1H_Hit_Knockback_B_Montage'");
    ////////////////

    // BLOCK BREAK
    FGameplayTagContainer metadata_hit_block_standard_front;
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/BreakBlock/A_OrcM_Sff1H_HitBreakBlock_F_Montage.A_OrcM_Sff1H_HitBreakBlock_F_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_back;
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/BreakBlock/A_OrcM_Sff1H_HitBreakBlock_B_Montage.A_OrcM_Sff1H_HitBreakBlock_B_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_left;
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/BreakBlock/A_OrcM_Sff1H_HitBreakBlock_L_Montage.A_OrcM_Sff1H_HitBreakBlock_L_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_right;
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/BreakBlock/A_OrcM_Sff1H_HitBreakBlock_R_Montage.A_OrcM_Sff1H_HitBreakBlock_R_Montage'");
    ////////////////    

    // RIPOSTE
    FGameplayTagContainer metadata_Riposte_Humanoid_S1H;
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_Humanoid_S1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_S2H;
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_S2H.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_S2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_A1H;
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_A1H.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddHit( metadata_Riposte_Humanoid_A1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_A2H;
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_A2H.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_A2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_M1H;
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_M1H.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddHit( metadata_Riposte_Humanoid_M1H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_M2H;
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_M2H.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_M2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_Sff2H;
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddHit( metadata_Riposte_Humanoid_Sff2H, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_Humanoid_Fists;
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_Fists.AddTag(GameplayTag::Item_Weapon_Fist);
    default AddHit( metadata_Riposte_Humanoid_Fists, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");

    //Riposte by orc
    FGameplayTagContainer metadata_Riposte_Humanoid_Orc;
    default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Character_Size_Orc);
    // default metadata_Riposte_Humanoid_Orc.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_Humanoid_Orc, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Riposted/A_OrcM_Sff1H_Hit_Riposte_Fists_Montage.A_OrcM_Sff1H_Hit_Riposte_Fists_Montage'");
    ////////////////
};
