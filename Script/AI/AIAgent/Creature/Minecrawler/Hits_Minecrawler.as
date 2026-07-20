UCLASS()
class UHitData_Default_Minecrawler_Warrior : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Death/MCrawler_Warrior_Death_Montage.MCrawler_Warrior_Death_Montage'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Death/MCrawler_Warrior_WaterDeath_Montage.MCrawler_Warrior_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Death/MCrawler_Warrior_WaterDeath_Montage.MCrawler_Warrior_WaterDeath_Montage'";
   
    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Knockback/A_MCrawler_Warrior_Hit_Knockback_F_Montage.A_MCrawler_Warrior_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Knockback/A_MCrawler_Warrior_Hit_Knockback_L_Montage.A_MCrawler_Warrior_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Knockback/A_MCrawler_Warrior_Hit_Knockback_R_Montage.A_MCrawler_Warrior_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Knockback/A_MCrawler_Warrior_Hit_Knockback_B_Montage.A_MCrawler_Warrior_Hit_Knockback_B_Montage'");
    ////////////////

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/A_MCrawler_Warrior_AdditiveHit_F_Montage.A_MCrawler_Warrior_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/A_MCrawler_Warrior_AdditiveHit_R_Montage.A_MCrawler_Warrior_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/A_MCrawler_Warrior_AdditiveHit_L_Montage.A_MCrawler_Warrior_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/A_MCrawler_Warrior_AdditiveHit_B_Montage.A_MCrawler_Warrior_AdditiveHit_B_Montage'");
    
     FGameplayTagContainer metadata_actionadditive_F;
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_F.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/MCrawler_Warrior_ActionAdditiveHit_F_Montage.MCrawler_Warrior_ActionAdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_R.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/MCrawler_Warrior_ActionAdditiveHit_R_Montage.MCrawler_Warrior_ActionAdditiveHit_R_Montage'");

     FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/MCrawler_Warrior_ActionAdditiveHit_L_Montage.MCrawler_Warrior_ActionAdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Additive/MCrawler_Warrior_ActionAdditiveHit_B_Montage.MCrawler_Warrior_ActionAdditiveHit_B_Montage'");
    
    //

    ////// STANDARD
    FGameplayTagContainer metadata_standard_idle_front;
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_front, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/SupAr/A_MCrawler_Hit_SupAr_F_Montage.A_MCrawler_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_standard_idle_back;
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle); 
    default AddHit( metadata_standard_idle_back, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/SupAr/A_MCrawler_Hit_SupAr_B_Montage.A_MCrawler_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_standard_idle_left;
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_left, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/SupAr/A_MCrawler_Hit_SupAr_L_Montage.A_MCrawler_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_standard_idle_right;
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_right, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/SupAr/A_MCrawler_Hit_SupAr_R_Montage.A_MCrawler_Hit_SupAr_R_Montage'");
    //////

    // RIPOSTE
    FGameplayTagContainer metadata_Riposte_S1H;
    default metadata_Riposte_S1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_S1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_S1H.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_S1H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_S1H_Montage.A_MCrawler_Warrior_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_S2H;
    default metadata_Riposte_S2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_S2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_S2H.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddHit( metadata_Riposte_S2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_S1H_Montage.A_MCrawler_Warrior_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_A1H;
    default metadata_Riposte_A1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_A1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_A1H.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddHit( metadata_Riposte_A1H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_A1H_Montage.A_MCrawler_Warrior_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_A2H;
    default metadata_Riposte_A2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_A2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_A2H.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddHit( metadata_Riposte_A2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_A1H_Montage.A_MCrawler_Warrior_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_M1H;
    default metadata_Riposte_M1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_M1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_M1H.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddHit( metadata_Riposte_M1H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_Fists_Montage.A_MCrawler_Warrior_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_M2H;
    default metadata_Riposte_M2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_M2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_M2H.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddHit( metadata_Riposte_M2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_A1H_Montage.A_MCrawler_Warrior_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Sff2H;
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddHit( metadata_Riposte_Sff2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_S1H_Montage.A_MCrawler_Warrior_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Fists;
    default metadata_Riposte_Fists.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Fists.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Fists.AddTag(GameplayTag::Item_Weapon_Fist);
    default AddHit( metadata_Riposte_Fists, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Riposted/A_MCrawler_Warrior_Hit_Riposte_Fists_Montage.A_MCrawler_Warrior_Hit_Riposte_Fists_Montage'");
    //

    
};

UCLASS()
class UHitData_Combat_Minecrawler : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Death/Minecrawler_Death_Montage.Minecrawler_Death_Montage'");
    default m_DrownDeath = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Actions/MCrawler_Montage_Drown.MCrawler_Montage_Drown'";
    default m_SwimDeath = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Actions/MCrawler_Montage_Drown.MCrawler_Montage_Drown'";
    
    // KNOCKBACK
    FGameplayTagContainer metadata_hit_knockback_front;
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Knockback/A_MCrawler_Hit_Knockback_F_Montage.A_MCrawler_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Knockback/A_MCrawler_Hit_Knockback_L_Montage.A_MCrawler_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Knockback/A_MCrawler_Hit_Knockback_R_Montage.A_MCrawler_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Knockback/A_MCrawler_Hit_Knockback_B_Montage.A_MCrawler_Hit_Knockback_B_Montage'");
    // ////////////////

    ////// STANDARD
    FGameplayTagContainer metadata_standard_idle_front;
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_front.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_front, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/supAr/MCrawler_N_Hit_SupAr_F_Montage.MCrawler_N_Hit_SupAr_F_Montage'");

    FGameplayTagContainer metadata_standard_idle_back;
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_back.AddTag(GameplayTag::Combat_BlockState_Idle); 
    default AddHit( metadata_standard_idle_back, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/supAr/MCrawler_N_Hit_SupAr_B_Montage.MCrawler_N_Hit_SupAr_B_Montage'");

    FGameplayTagContainer metadata_standard_idle_left;
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_left.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_left, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/supAr/MCrawler_N_Hit_SupAr_L_Montage.MCrawler_N_Hit_SupAr_L_Montage'");

    FGameplayTagContainer metadata_standard_idle_right;
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_standard_idle_right.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_standard_idle_right, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/supAr/MCrawler_N_Hit_SupAr_R_Montage.MCrawler_N_Hit_SupAr_R_Montage'");
    //////

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_AdditiveHit_F_Montage.MCrawler_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_AdditiveHit_R_Montage.MCrawler_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_AdditiveHit_L_Montage.MCrawler_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_AdditiveHit_B_Montage.MCrawler_AdditiveHit_B_Montage'");
    
     FGameplayTagContainer metadata_actionadditive_F;
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_F.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_actionadditive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_ActionAdditiveHit_F_Montage.MCrawler_ActionAdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_actionadditive_R;
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_R.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_actionadditive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_ActionAdditiveHit_R_Montage.MCrawler_ActionAdditiveHit_R_Montage'");

     FGameplayTagContainer metadata_actionadditive_L;
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_L.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_actionadditive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_ActionAdditiveHit_L_Montage.MCrawler_ActionAdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_actionadditive_B;
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_actionadditive_B.AddTag(GameplayTag::State_Attack);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_actionadditive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_actionadditive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Additive/MCrawler_ActionAdditiveHit_B_Montage.MCrawler_ActionAdditiveHit_B_Montage'");
    
    //

    // RIPOSTE
    FGameplayTagContainer metadata_Riposte_S1H;
    default metadata_Riposte_S1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_S1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_S1H.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddHit( metadata_Riposte_S1H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_S1H_Montage.A_Mcrawler_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_S2H;
    default metadata_Riposte_S2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_S2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_S2H.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddHit( metadata_Riposte_S2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_S1H_Montage.A_Mcrawler_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_A1H;
    default metadata_Riposte_A1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_A1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_A1H.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddHit( metadata_Riposte_A1H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_A1H_Montage.A_Mcrawler_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_A2H;
    default metadata_Riposte_A2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_A2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_A2H.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddHit( metadata_Riposte_A2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_A1H_Montage.A_Mcrawler_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_M1H;
    default metadata_Riposte_M1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_M1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_M1H.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddHit( metadata_Riposte_M1H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_Fists_Montage.A_Mcrawler_Hit_Riposte_Fists_Montage'");

    FGameplayTagContainer metadata_Riposte_M2H;
    default metadata_Riposte_M2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_M2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_M2H.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddHit( metadata_Riposte_M2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_A1H_Montage.A_Mcrawler_Hit_Riposte_A1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Sff2H;
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Sff2H.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddHit( metadata_Riposte_Sff2H, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_S1H_Montage.A_Mcrawler_Hit_Riposte_S1H_Montage'");

    FGameplayTagContainer metadata_Riposte_Fists;
    default metadata_Riposte_Fists.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Fists.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Fists.AddTag(GameplayTag::Item_Weapon_Fist);
    default AddHit( metadata_Riposte_Fists, n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Riposted/A_Mcrawler_Hit_Riposte_Fists_Montage.A_Mcrawler_Hit_Riposte_Fists_Montage'");
    //
};