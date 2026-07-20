UCLASS()
class UHitData_Default_Harpy : UHitData
{
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Death/Harpy_WaterDeath_Montage.Harpy_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Death/Harpy_WaterDeath_Montage.Harpy_WaterDeath_Montage'";

    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Death/Harpy_Fly_Death_Montage.Harpy_Fly_Death_Montage'");
    
    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Fly/A_Harpy_Hit_Knockback_F_Montage.A_Harpy_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Fly/A_Harpy_Hit_Knockback_L_Montage.A_Harpy_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Fly/A_Harpy_Hit_Knockback_R_Montage.A_Harpy_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Fly/A_Harpy_Hit_Knockback_B_Montage.A_Harpy_Hit_Knockback_B_Montage'");
    ////////////////

    ////// STANDARD
    FGameplayTagContainer metadata_standard_idle_front;
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Fly/Harpy_Fly_Hit_SupAr_F_Montage.Harpy_Fly_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_standard_idle_back;
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle); 
    default AddHit( metadata_standard_idle_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Fly/Harpy_Fly_Hit_SupAr_B_Montage.Harpy_Fly_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_standard_idle_left;
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Fly/Harpy_Fly_Hit_SupAr_L_Montage.Harpy_Fly_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_standard_idle_right;
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Fly/Harpy_Fly_Hit_SupAr_R_Montage.Harpy_Fly_Hit_SupAr_R_Montage'");
    //////

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_AdditiveHit_Fwd_Montage.A_Harpy_Fly_AdditiveHit_Fwd_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_AdditiveHit_Right_Montage.A_Harpy_Fly_AdditiveHit_Right_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_AdditiveHit_Left_Montage.A_Harpy_Fly_AdditiveHit_Left_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_AdditiveHit_Bwd_Montage.A_Harpy_Fly_AdditiveHit_Bwd_Montage'");
    
     FGameplayTagContainer metadata_actionadditive_F;
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_F.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_ActionAdditiveHit_Fwd_Montage.A_Harpy_Fly_ActionAdditiveHit_Fwd_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_R.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_ActionAdditiveHit_Right_Montage.A_Harpy_Fly_ActionAdditiveHit_Right_Montage'");

     FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_ActionAdditiveHit_Left_Montage.A_Harpy_Fly_ActionAdditiveHit_Left_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/A_Harpy_Fly_ActionAdditiveHit_Bwd_Montage.A_Harpy_Fly_ActionAdditiveHit_Bwd_Montage'");
    
    //
};

UCLASS()
class UHitData_Default_Harpy_Grounded : UHitData
{
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Death/Harpy_Death_Montage.Harpy_Death_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Death/Harpy_Death_Montage.Harpy_Death_Montage'";

    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Death/Harpy_Death_Montage.Harpy_Death_Montage'");
    
    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Grounded/A_Harpy_Hit_Grounded_Knockback_F_Montage.A_Harpy_Hit_Grounded_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Grounded/A_Harpy_Hit_Grounded_Knockback_L_Montage.A_Harpy_Hit_Grounded_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Grounded/A_Harpy_Hit_Grounded_Knockback_R_Montage.A_Harpy_Hit_Grounded_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Knockback/Grounded/A_Harpy_Hit_Grounded_Knockback_B_Montage.A_Harpy_Hit_Grounded_Knockback_B_Montage'");

    ////// STANDARD
    FGameplayTagContainer metadata_standard_idle_front;
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Grounded/Harpy_Hit_Grounded_SupAr_F_Montage.Harpy_Hit_Grounded_SupAr_F_Montage'");

    FGameplayTagContainer metadata_standard_idle_back;
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle); 
    default AddHit( metadata_standard_idle_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Grounded/Harpy_Hit_Grounded_SupAr_B_Montage.Harpy_Hit_Grounded_SupAr_B_Montage'");

    FGameplayTagContainer metadata_standard_idle_left;
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Grounded/Harpy_Hit_Grounded_SupAr_L_Montage.Harpy_Hit_Grounded_SupAr_L_Montage'");

    FGameplayTagContainer metadata_standard_idle_right;
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/supAr/Grounded/Harpy_Hit_Grounded_SupAr_R_Montage.Harpy_Hit_Grounded_SupAr_R_Montage'");
    //////

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_AdditiveHit_Fwd_Montage.Harpy_N_AdditiveHit_Fwd_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_AdditiveHit_Right_Montage.Harpy_N_AdditiveHit_Right_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_AdditiveHit_Left_Montage.Harpy_N_AdditiveHit_Left_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_AdditiveHit_Bwd_Montage.Harpy_N_AdditiveHit_Bwd_Montage'");
    
     FGameplayTagContainer metadata_actionadditive_F;
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_F.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_ActionAdditiveHit_Fwd_Montage.Harpy_N_ActionAdditiveHit_Fwd_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_R.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_ActionAdditiveHit_Right_Montage.Harpy_N_ActionAdditiveHit_Right_Montage'");

     FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_ActionAdditiveHit_Left_Montage.Harpy_N_ActionAdditiveHit_Left_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Additive/Harpy_N_ActionAdditiveHit_Bwd_Montage.Harpy_N_ActionAdditiveHit_Bwd_Montage'");
    //
};