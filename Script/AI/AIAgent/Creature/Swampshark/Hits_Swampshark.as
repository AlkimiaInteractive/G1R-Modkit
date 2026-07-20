UCLASS()
class UHitData_Default_Swampshark : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Death/Swampshark_Death_Montage.Swampshark_Death_Montage'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Death/Swampshark_Death_Montage.Swampshark_Death_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Death/Swampshark_Death_Montage.Swampshark_Death_Montage'";
    

    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Knockback/Swampshark_Hit_Knockback_F_Montage.Swampshark_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Knockback/Swampshark_Hit_Knockback_L_Montage.Swampshark_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Knockback/Swampshark_Hit_Knockback_R_Montage.Swampshark_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Knockback/Swampshark_Hit_Knockback_B_Montage.Swampshark_Hit_Knockback_B_Montage'");
    ////////////////

    ////// STANDARD
    FGameplayTagContainer metadata_standard_idle_front;
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/SupAr/Swampshark_N_Hit_SupAr_F_Montage.Swampshark_N_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_standard_idle_back;
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle); 
    default AddHit( metadata_standard_idle_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/SupAr/Swampshark_N_Hit_SupAr_B_Montage.Swampshark_N_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_standard_idle_left;
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/SupAr/Swampshark_N_Hit_SupAr_L_Montage.Swampshark_N_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_standard_idle_right;
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/SupAr/Swampshark_N_Hit_SupAr_R_Montage.Swampshark_N_Hit_SupAr_R_Montage'");
    //////

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_F_Montage.A_Swampshark_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_R_Montage.A_Swampshark_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_L_Montage.A_Swampshark_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_B_Montage.A_Swampshark_AdditiveHit_B_Montage'");
    
     FGameplayTagContainer metadata_actionadditive_F;
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_F.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/Swampshark_ActionAdditiveHit_F_Montage.Swampshark_ActionAdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_R.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/Swampshark_ActionAdditiveHit_R_Montage.Swampshark_ActionAdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/Swampshark_ActionAdditiveHit_L_Montage.Swampshark_ActionAdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/Swampshark_ActionAdditiveHit_B_Montage.Swampshark_ActionAdditiveHit_B_Montage'");
    //
};