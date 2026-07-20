UCLASS()
class UHitData_Scavenger_Adult : UHitData
{
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Death/Scavenger_Adult_WaterDeath_Montage.Scavenger_Adult_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Death/Scavenger_Adult_DrownDeath_Montage.Scavenger_Adult_DrownDeath_Montage'";
    
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Death/Scavenger_Adult_Death_Montage.Scavenger_Adult_Death_Montage'");

    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Knockback/A_Scavenger_Adult_Hit_Knockback_F_Montage.A_Scavenger_Adult_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Knockback/A_Scavenger_Adult_Hit_Knockback_L_Montage.A_Scavenger_Adult_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Knockback/A_Scavenger_Adult_Hit_Knockback_R_Montage.A_Scavenger_Adult_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Knockback/A_Scavenger_Adult_Hit_Knockback_B_Montage.A_Scavenger_Adult_Hit_Knockback_B_Montage'");
    ////////////////

    ////// STANDARD
    FGameplayTagContainer metadata_hit_standard_idle_front;
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_front, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/supAr/Scavenger_Adult_N_Hit_SupAr_F_Montage.Scavenger_Adult_N_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_left;
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_left, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/supAr/Scavenger_Adult_N_Hit_SupAr_L_Montage.Scavenger_Adult_N_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_back;
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_back, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/supAr/Scavenger_Adult_N_Hit_SupAr_B_Montage.Scavenger_Adult_N_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_right;
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_hit_standard_idle_right, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/supAr/Scavenger_Adult_N_Hit_SupAr_R_Montage.Scavenger_Adult_N_Hit_SupAr_R_Montage'");
    //////

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_AdditiveHit_F_Montage.Scavenger_Adult_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_AdditiveHit_R_Montage.Scavenger_Adult_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_AdditiveHit_L_Montage.Scavenger_Adult_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_AdditiveHit_B_Montage.Scavenger_Adult_AdditiveHit_B_Montage'");
    
     FGameplayTagContainer metadata_actionadditive_F;
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_F.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_ActionAdditiveHit_F_Montage.Scavenger_Adult_ActionAdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_R.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_ActionAdditiveHit_R_Montage.Scavenger_Adult_ActionAdditiveHit_R_Montage'");

     FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_ActionAdditiveHit_L_Montage.Scavenger_Adult_ActionAdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Additive/Scavenger_Adult_ActionAdditiveHit_B_Montage.Scavenger_Adult_ActionAdditiveHit_B_Montage'");
    
    //

    // RIPOSTE
    FGameplayTagContainer metadata_Riposte_S1H;
    default metadata_Riposte_S1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_S1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_S1H.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_S1H, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_S1H_Montage.A_Scavenger_Adult_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_S2H;
    default metadata_Riposte_S2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_S2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_S2H.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddHit( metadata_Riposte_S2H, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_S1H_Montage.A_Scavenger_Adult_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_A1H;
    default metadata_Riposte_A1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_A1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_A1H.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddHit( metadata_Riposte_A1H, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_A1H_Montage.A_Scavenger_Adult_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_A2H;
    default metadata_Riposte_A2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_A2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_A2H.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddHit( metadata_Riposte_A2H, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_A1H_Montage.A_Scavenger_Adult_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_M1H;
    default metadata_Riposte_M1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_M1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_M1H.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddHit( metadata_Riposte_M1H, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_Fists_Montage.A_Scavenger_Adult_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_M2H;
    default metadata_Riposte_M2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_M2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_M2H.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddHit( metadata_Riposte_M2H, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_A1H_Montage.A_Scavenger_Adult_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Sff2H;
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddHit( metadata_Riposte_Sff2H, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_S1H_Montage.A_Scavenger_Adult_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Fists;
    default metadata_Riposte_Fists.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Fists.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Fists.AddTag(GameplayTag::Item_Weapon_Fist);
    default AddHit( metadata_Riposte_Fists, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Riposted/A_Scavenger_Adult_Hit_Riposte_Fists_Montage.A_Scavenger_Adult_Hit_Riposte_Fists_Montage'");
    //
};