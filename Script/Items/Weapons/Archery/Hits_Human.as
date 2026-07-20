UCLASS()
class UHitData_Bow_Human : UHitData_Human
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Hits/Death/DeathMontage.DeathMontage'");
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Death/A_Man_S1H_Death_02_Montage.A_Man_S1H_Death_02_Montage'");
    
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated_Death/A_Man_Bow_Hit_Defeated_01_Death_Montage.A_Man_Bow_Hit_Defeated_01_Death_Montage'");

    TArray<FName> DefeatedInFrontMontages;
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_02_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_02_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_03_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_03_Montage'");
    default AddDefeatedInMontageArrayWithDirection(GameplayTag::Combat_Direction_Front, DefeatedInFrontMontages);
    
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_L_In_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_L_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_R_In_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_R_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_360_Humanoid_In_Montage.A_Man_Bow_Hit_Defeated_360_Humanoid_In_Montage'");
    
    TArray<FName> DefeatedLoopMontages;
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedLoopMontageArrayInAllDirections(DefeatedLoopMontages);    
    
    default AddDefeatedStandUpMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedDeathMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated_Death/A_Man_Bow_Hit_Defeated_01_Death_Montage.A_Man_Bow_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer metadata_defeated_Riposte;
    default metadata_defeated_Riposte.AddTag(GameplayTag::Combat_HitType_Riposte);
    default AddDefeatedHitMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated/A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_Bow_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated_Death/A_Man_Bow_Hit_Defeated_01_Death_Montage.A_Man_Bow_Hit_Defeated_01_Death_Montage'");

    // ADDITIVE
    default AddAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_B_Montage.A_Man_Bow_N_Hit_Additive_B_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_F_Montage.A_Man_Bow_N_Hit_Additive_F_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_L_Montage.A_Man_Bow_N_Hit_Additive_L_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_R_Montage.A_Man_Bow_N_Hit_Additive_R_Montage'");
    
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_B_Montage.A_Man_Bow_N_Hit_Additive_B_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_F_Montage.A_Man_Bow_N_Hit_Additive_F_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_L_Montage.A_Man_Bow_N_Hit_Additive_L_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_R_Montage.A_Man_Bow_N_Hit_Additive_R_Montage'");
    
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_STL_Hit_Additive_B_Montage.A_Man_Bow_STL_Hit_Additive_B_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_STL_Hit_Additive_F_Montage.A_Man_Bow_STL_Hit_Additive_F_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_STL_Hit_Additive_L_Montage.A_Man_Bow_STL_Hit_Additive_L_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_STL_Hit_Additive_R_Montage.A_Man_Bow_STL_Hit_Additive_R_Montage'");

    ////// STANDARD
    default HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/supAr/A_Man_Bow_RH_Hit_SupAr_F_Montage.A_Man_Bow_RH_Hit_SupAr_F_Montage'";
    default HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/supAr/A_Man_Bow_RH_Hit_SupAr_B_Montage.A_Man_Bow_RH_Hit_SupAr_B_Montage'";
    default HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/supAr/A_Man_Bow_RH_Hit_SupAr_L_Montage.A_Man_Bow_RH_Hit_SupAr_L_Montage'";
    default HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/supAr/A_Man_Bow_RH_Hit_SupAr_R_Montage.A_Man_Bow_RH_Hit_SupAr_R_Montage'";

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
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Knockback/A_Man_Bow_Hit_Knockback_F_Montage.A_Man_Bow_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Knockback/A_Man_Bow_Hit_Knockback_L_Montage.A_Man_Bow_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Knockback/A_Man_Bow_Hit_Knockback_R_Montage.A_Man_Bow_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Knockback/A_Man_Bow_Hit_Knockback_B_Montage.A_Man_Bow_Hit_Knockback_B_Montage'");
    //////////////// 
};

UCLASS()
class UHitData_Crossbow_Human : UHitData_Human
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Hits/Death/DeathMontage.DeathMontage'");
    
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Defeated_Death/A_Man_Bow_Hit_Defeated_01_Death_Montage.A_Man_Bow_Hit_Defeated_01_Death_Montage'");
    
    TArray<FName> DefeatedInFrontMontages;
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_02_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_02_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_03_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_03_Montage'");
    default AddDefeatedInMontageArrayWithDirection(GameplayTag::Combat_Direction_Front, DefeatedInFrontMontages);
    
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_L_In_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_L_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_R_In_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_R_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_360_Humanoid_In_Montage.A_Man_Crossbow_Hit_Defeated_360_Humanoid_In_Montage'");
    
    TArray<FName> DefeatedLoopMontages;
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedLoopMontageArrayInAllDirections(DefeatedLoopMontages);    
    
    default AddDefeatedStandUpMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedDeathMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated_Death/A_Man_Crossbow_Hit_Defeated_01_Death_Montage.A_Man_Crossbow_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer metadata_defeated_Riposte;
    default metadata_defeated_Riposte.AddTag(GameplayTag::Combat_HitType_Riposte);
    default AddDefeatedHitMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated/A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_Crossbow_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Defeated_Death/A_Man_Crossbow_Hit_Defeated_01_Death_Montage.A_Man_Crossbow_Hit_Defeated_01_Death_Montage'");



    // ADDITIVE
    default AddAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_N_Hit_Additive_B_Montage.A_Man_Crossbow_N_Hit_Additive_B_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_N_Hit_Additive_F_Montage.A_Man_Crossbow_N_Hit_Additive_F_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_N_Hit_Additive_L_Montage.A_Man_Crossbow_N_Hit_Additive_L_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_N_Hit_Additive_R_Montage.A_Man_Crossbow_N_Hit_Additive_R_Montage'");
    
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_B_Montage.A_Man_Bow_N_Hit_Additive_B_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_F_Montage.A_Man_Bow_N_Hit_Additive_F_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_L_Montage.A_Man_Bow_N_Hit_Additive_L_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Hits/Additive/A_Man_Bow_N_Hit_Additive_R_Montage.A_Man_Bow_N_Hit_Additive_R_Montage'");
    

    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_STL_Hit_Additive_B_Montage.A_Man_Crossbow_STL_Hit_Additive_B_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_STL_Hit_Additive_F_Montage.A_Man_Crossbow_STL_Hit_Additive_F_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_STL_Hit_Additive_L_Montage.A_Man_Crossbow_STL_Hit_Additive_L_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Additive/A_Man_Crossbow_STL_Hit_Additive_R_Montage.A_Man_Crossbow_STL_Hit_Additive_R_Montage'");

    ////// STANDARD
    default HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/supAr/A_Man_Crossbow_RH_Hit_SupAr_F_Montage.A_Man_Crossbow_RH_Hit_SupAr_F_Montage'";
    default HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/supAr/A_Man_Crossbow_RH_Hit_SupAr_B_Montage.A_Man_Crossbow_RH_Hit_SupAr_B_Montage'";
    default HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/supAr/A_Man_Crossbow_RH_Hit_SupAr_L_Montage.A_Man_Crossbow_RH_Hit_SupAr_L_Montage'";
    default HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/supAr/A_Man_Crossbow_RH_Hit_SupAr_R_Montage.A_Man_Crossbow_RH_Hit_SupAr_R_Montage'";

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
    default AddHit( metadata_hit_knockback_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Knockback/A_Man_Crossbow_Hit_Knockback_F_Montage.A_Man_Crossbow_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_left;
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddHit( metadata_hit_knockback_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Knockback/A_Man_Crossbow_Hit_Knockback_L_Montage.A_Man_Crossbow_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_right;
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddHit( metadata_hit_knockback_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Knockback/A_Man_Crossbow_Hit_Knockback_R_Montage.A_Man_Crossbow_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_back;
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddHit( metadata_hit_knockback_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Hits/Knockback/A_Man_Crossbow_Hit_Knockback_B_Montage.A_Man_Crossbow_Hit_Knockback_B_Montage'");
    //////////////// 
};

