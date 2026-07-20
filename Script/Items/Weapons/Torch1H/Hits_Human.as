UCLASS()
class UHitData_Torch_Human : UHitData_Human
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Hits/Death/DeathMontage.DeathMontage'");
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Death/A_Man_S1H_Death_02_Montage.A_Man_S1H_Death_02_Montage'");

    // LIGHT BLOCKING
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    // LIGHT NO BLOCKING
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");


    ////////////////

    /// DEATH RIDING

    default AddRidingDeath(GameplayTag::Combat_Direction_Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Deaths/A_Man_Ride_Hit_Death_B_Montage.A_Man_Ride_Hit_Death_B_Montage'");
    default AddRidingDeath(GameplayTag::Combat_Direction_Front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Deaths/A_Man_Ride_Hit_Death_F_Montage.A_Man_Ride_Hit_Death_F_Montage'");
    default AddRidingDeath(GameplayTag::Combat_Direction_Right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Deaths/A_Man_Ride_Hit_Death_R_Montage.A_Man_Ride_Hit_Death_R_Montage'");
    default AddRidingDeath(GameplayTag::Combat_Direction_Left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Deaths/A_Man_Ride_Hit_Death_L_Montage.A_Man_Ride_Hit_Death_L_Montage'");
    ///

    // BLOCKED
    // -- Front hits --
    FGameplayTagContainer metadata_F_ARight_block;
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_F_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_F_ARight_AnimMontage.A_Man_S2H_HitBlocked_F_ARight_AnimMontage'");

    FGameplayTagContainer metadata_F_ALeft_block;
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_F_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_F_ALeft_AnimMontage.A_Man_S2H_HitBlocked_F_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_F_ATop_block;
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_F_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_F_ATop_AnimMontage.A_Man_S2H_HitBlocked_F_ATop_AnimMontage'");

    FGameplayTagContainer metadata_F_ABottom_block;
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_F_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_F_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_F_ABottom_AnimMontage.A_Man_S2H_HitBlocked_F_ABottom_AnimMontage'");

    // -- Back hits -- 
    FGameplayTagContainer metadata_B_ARight_block;
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_B_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_B_ARight_AnimMontage.A_Man_S2H_HitBlocked_B_ARight_AnimMontage'");

    FGameplayTagContainer metadata_B_ALeft_block;
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_B_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_B_ALeft_AnimMontage.A_Man_S2H_HitBlocked_B_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_B_ATop_block;
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_B_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_B_ATop_AnimMontage.A_Man_S2H_HitBlocked_B_ATop_AnimMontage'");

    FGameplayTagContainer metadata_B_ABottom_block;
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_B_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_B_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_B_ABottom_AnimMontage.A_Man_S2H_HitBlocked_B_ABottom_AnimMontage'");

    // -- Right hits -- 
    FGameplayTagContainer metadata_R_ARight_block;
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_R_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_R_ARight_AnimMontage.A_Man_S2H_HitBlocked_R_ARight_AnimMontage'");

    FGameplayTagContainer metadata_R_ALeft_block;
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_R_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_R_ALeft_AnimMontage.A_Man_S2H_HitBlocked_R_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_R_ATop_block;
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_R_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_R_ATop_AnimMontage.A_Man_S2H_HitBlocked_R_ATop_AnimMontage'");

    FGameplayTagContainer metadata_R_ABottom_block;
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_R_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_R_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_R_ABottom_AnimMontage.A_Man_S2H_HitBlocked_R_ABottom_AnimMontage'");

    // -- Left hits -- 
    FGameplayTagContainer metadata_L_ARight_block;
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_Attack_Right);
    default metadata_L_ARight_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ARight_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_L_ARight_AnimMontage.A_Man_S2H_HitBlocked_L_ARight_AnimMontage'");

    FGameplayTagContainer metadata_L_ALeft_block;
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_Attack_Left);
    default metadata_L_ALeft_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ALeft_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_L_ALeft_AnimMontage.A_Man_S2H_HitBlocked_L_ALeft_AnimMontage'");

    FGameplayTagContainer metadata_L_ATop_block;
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_Attack_Top);
    default metadata_L_ATop_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ATop_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_L_ATop_AnimMontage.A_Man_S2H_HitBlocked_L_ATop_AnimMontage'");

    FGameplayTagContainer metadata_L_ABottom_block;
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_HitType_Deflected);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_Attack_Bottom);
    default metadata_L_ABottom_block.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_L_ABottom_block, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Hits/HitBlocked/A_Man_S2H_HitBlocked_L_ABottom_AnimMontage.A_Man_S2H_HitBlocked_L_ABottom_AnimMontage'");
    ////////////////

    // ADDITIVE
    default AddAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_Additive_B_Montage.A_Man_T1H_N_Hit_Additive_B_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_Additive_F_Montage.A_Man_T1H_N_Hit_Additive_F_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_Additive_L_Montage.A_Man_T1H_N_Hit_Additive_L_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_Additive_R_Montage.A_Man_T1H_N_Hit_Additive_R_Montage'");

    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_ActionAdditive_B_Montage.A_Man_T1H_N_Hit_ActionAdditive_B_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_ActionAdditive_F_Montage.A_Man_T1H_N_Hit_ActionAdditive_F_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_ActionAdditive_L_Montage.A_Man_T1H_N_Hit_ActionAdditive_L_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_N_Hit_ActionAdditive_R_Montage.A_Man_T1H_N_Hit_ActionAdditive_R_Montage'");


    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_STL_Hit_Additive_B_Montage.A_Man_T1H_STL_Hit_Additive_B_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_STL_Hit_Additive_F_Montage.A_Man_T1H_STL_Hit_Additive_F_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_STL_Hit_Additive_L_Montage.A_Man_T1H_STL_Hit_Additive_L_Montage'");
    default AddAdditiveHitCrouched(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Additive/A_Man_T1H_STL_Hit_Additive_R_Montage.A_Man_T1H_STL_Hit_Additive_R_Montage'");
    
//Additive riding
    FGameplayTagContainer metadata_additive_riding_R;
    default metadata_additive_riding_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_riding_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_riding_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_riding_R.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_additive_riding_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Man_T1H_Ride_AdditiveHit_R_Montage.A_Man_T1H_Ride_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_riding_L;
    default metadata_additive_riding_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_riding_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_riding_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_riding_L.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_additive_riding_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Man_T1H_Ride_AdditiveHit_L_Montage.A_Man_T1H_Ride_AdditiveHit_L_Montage'");
    
    FGameplayTagContainer metadata_additive_riding_F;
    default metadata_additive_riding_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_riding_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_riding_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_riding_F.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_additive_riding_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Man_T1H_Ride_AdditiveHit_F_Montage.A_Man_T1H_Ride_AdditiveHit_F_Montage'");
    
    FGameplayTagContainer metadata_additive_riding_B;
    default metadata_additive_riding_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_riding_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_riding_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_riding_B.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_additive_riding_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Man_T1H_Ride_AdditiveHit_B_Montage.A_Man_T1H_Ride_AdditiveHit_B_Montage'");

    ////////////////

    ////// STANDARD
    default HitSupAr_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_LH_Hit_SupAr_B_Montage.A_Man_T1H_LH_Hit_SupAr_B_Montage'";
    default HitSupAr_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_LH_Hit_SupAr_F_Montage.A_Man_T1H_LH_Hit_SupAr_F_Montage'";
    default HitSupAr_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_LH_Hit_SupAr_L_Montage.A_Man_T1H_LH_Hit_SupAr_L_Montage'";
    default HitSupAr_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_LH_Hit_SupAr_R_Montage.A_Man_T1H_LH_Hit_SupAr_R_Montage'";

    default HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_RH_Hit_SupAr_B_Montage.A_Man_T1H_RH_Hit_SupAr_B_Montage'";
    default HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_RH_Hit_SupAr_F_Montage.A_Man_T1H_RH_Hit_SupAr_F_Montage'";
    default HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_RH_Hit_SupAr_L_Montage.A_Man_T1H_RH_Hit_SupAr_L_Montage'";
    default HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/supAr/A_Man_T1H_RH_Hit_SupAr_R_Montage.A_Man_T1H_RH_Hit_SupAr_R_Montage'";


    // -- Pose idle --
    default AddStandardHit(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Idle, HitSupAr_RH_F);
    default AddStandardHit(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Idle, HitSupAr_RH_L);
    default AddStandardHit(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Idle, HitSupAr_RH_B);
    default AddStandardHit(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Idle, HitSupAr_RH_R);

    // -- Pose left --
    default AddStandardHit(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Left, HitSupAr_LH_F);
    default AddStandardHit(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Left, HitSupAr_LH_L);
    default AddStandardHit(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Left, HitSupAr_LH_B);
    default AddStandardHit(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Left, HitSupAr_LH_R);

    // -- Pose top --
    default AddStandardHit(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Top, HitSupAr_RH_F);
    default AddStandardHit(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Top, HitSupAr_RH_L);
    default AddStandardHit(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Top, HitSupAr_RH_B);
    default AddStandardHit(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Top, HitSupAr_RH_R);

    // -- Pose right --
    default AddStandardHit(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Right, HitSupAr_RH_F);
    default AddStandardHit(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Right, HitSupAr_RH_L);
    default AddStandardHit(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Right, HitSupAr_RH_B);
    default AddStandardHit(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Right, HitSupAr_RH_R);

    // -- Pose bottom --
    default AddStandardHit(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Pose_Bottom, HitSupAr_LH_F);
    default AddStandardHit(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Pose_Bottom, HitSupAr_LH_L);
    default AddStandardHit(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Pose_Bottom, HitSupAr_LH_B);
    default AddStandardHit(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Pose_Bottom, HitSupAr_LH_R);
    ////////////////

    // KNOCKBACK
    default AddKnockback(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Knockback/A_Man_T1H_Hit_Knockback_B_Montage.A_Man_T1H_Hit_Knockback_B_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Knockback/A_Man_T1H_Hit_Knockback_F_Montage.A_Man_T1H_Hit_Knockback_F_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Knockback/A_Man_T1H_Hit_Knockback_L_Montage.A_Man_T1H_Hit_Knockback_L_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Knockback/A_Man_T1H_Hit_Knockback_R_Montage.A_Man_T1H_Hit_Knockback_R_Montage'");
    ////////////////

    // KNOCKBACK RIDING
    FGameplayTagContainer metadata_hit_knockback_riding_front;
    default metadata_hit_knockback_riding_front.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_riding_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_knockback_riding_front.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_hit_knockback_riding_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Man_Ride_Hit_Knockback_F_Montage.A_Man_Ride_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_knockback_riding_left;
    default metadata_hit_knockback_riding_left.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_riding_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_knockback_riding_left.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_hit_knockback_riding_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Man_Ride_Hit_Knockback_L_Montage.A_Man_Ride_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_knockback_riding_right;
    default metadata_hit_knockback_riding_right.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_riding_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_knockback_riding_right.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_hit_knockback_riding_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Man_Ride_Hit_Knockback_R_Montage.A_Man_Ride_Hit_Knockback_R_Montage'");

    FGameplayTagContainer metadata_hit_knockback_riding_back;
    default metadata_hit_knockback_riding_back.AddTag(GameplayTag::Combat_HitType_Knockback);
    default metadata_hit_knockback_riding_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_knockback_riding_back.AddTag(GameplayTag::State_RidingPose);
    default AddHit( metadata_hit_knockback_riding_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Man_Ride_Hit_Knockback_B_Montage.A_Man_Ride_Hit_Knockback_B_Montage'");
    ////////////////

    // BLOCK BREAK
    FGameplayTagContainer metadata_hit_block_standard_front;
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_front.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/BreakBlock/A_Man_T1H_HitBreakBlock_F_Montage.A_Man_T1H_HitBreakBlock_F_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_back;
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_back.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/BreakBlock/A_Man_T1H_HitBreakBlock_B_Montage.A_Man_T1H_HitBreakBlock_B_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_left;
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_left.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/BreakBlock/A_Man_T1H_HitBreakBlock_L_Montage.A_Man_T1H_HitBreakBlock_L_Montage'");

    FGameplayTagContainer metadata_hit_block_standard_right;
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_block_standard_right.AddTag(GameplayTag::Combat_BlockState_Block);
    default AddHit( metadata_hit_block_standard_right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/BreakBlock/A_Man_T1H_HitBreakBlock_R_Montage.A_Man_T1H_HitBreakBlock_R_Montage'");
    ////////////////    

    // RIPOSTE
    FGameplayTagContainer metadata_Riposte_Humanoid_S1H;
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Combat_HitType_Riposte);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Character_Size_Humanoid);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default metadata_Riposte_Humanoid_S1H.AddTag(GameplayTag::Item_Weapon_Torch);
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
    default metadata_Riposte_Humanoid_Sff2H.AddTag(GameplayTag::Item_Weapon_Staff);
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
    ////////////////

    // DEFEATED
    // -- Push hits --
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    TArray<FName> DefeatedInFrontMontages;
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_F_In_02_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_F_In_02_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_F_In_03_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_F_In_03_Montage'");
    default AddDefeatedInMontageArrayWithDirection(GameplayTag::Combat_Direction_Front, DefeatedInFrontMontages);
    
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_360_Humanoid_In_Montage.A_Man_T1H_Ma_Hit_Defeated_360_Humanoid_In_Montage'");
    
    TArray<FName> DefeatedLoopMontages;
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_T1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedLoopMontageArrayInAllDirections(DefeatedLoopMontages);
    
    default AddDefeatedDeathMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");
    default AddDefeatedStandUpMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_T1H_Hit_Defeated_Push_Humanoid_Out_Montage'");

    // DEFTEATED RIDING
    FGameplayTagContainer metadata_defeated_riding_B;
    default metadata_defeated_riding_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_defeated_riding_B.AddTag(GameplayTag::State_RidingPose);
    default AddDefeatedHitMontage(metadata_defeated_riding_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_B_In_Montage.A_Man_Ride_Hit_Defeated_B_In_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_riding_B,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_B_Loop_Montage.A_Man_Ride_Hit_Defeated_B_Loop_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_riding_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_B_Out_Montage.A_Man_Ride_Hit_Defeated_B_Out_Montage'");
    default metadata_defeated_riding_B.AddTag(GameplayTag::Combat_Direction_Execution);
    default AddDeathFromDefeatedMontage(metadata_defeated_riding_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Deaths/A_Man_Ride_Hit_Defeated_Death_B_Montage.A_Man_Ride_Hit_Defeated_Death_B_Montage'");

    FGameplayTagContainer metadata_defeated_riding_F;
    default metadata_defeated_riding_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_defeated_riding_F.AddTag(GameplayTag::State_RidingPose);
    default AddDefeatedHitMontage(metadata_defeated_riding_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_F_In_Montage.A_Man_Ride_Hit_Defeated_F_In_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_riding_F,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_F_Loop_Montage.A_Man_Ride_Hit_Defeated_F_Loop_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_riding_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_F_Out_Montage.A_Man_Ride_Hit_Defeated_F_Out_Montage'");
    default metadata_defeated_riding_F.AddTag(GameplayTag::Combat_Direction_Execution);
    default AddDeathFromDefeatedMontage(metadata_defeated_riding_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Deaths/A_Man_Ride_Hit_Defeated_Death_F_Montage.A_Man_Ride_Hit_Defeated_Death_F_Montage'");

    FGameplayTagContainer metadata_defeated_riding_R;
    default metadata_defeated_riding_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_defeated_riding_R.AddTag(GameplayTag::State_RidingPose);
    default AddDefeatedHitMontage(metadata_defeated_riding_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_R_In_Montage.A_Man_Ride_Hit_Defeated_R_In_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_riding_R,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_R_Loop_Montage.A_Man_Ride_Hit_Defeated_R_Loop_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_riding_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_R_Out_Montage.A_Man_Ride_Hit_Defeated_R_Out_Montage'");
     default metadata_defeated_riding_R.AddTag(GameplayTag::Combat_Direction_Execution);
    default AddDeathFromDefeatedMontage(metadata_defeated_riding_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Deaths/A_Man_Ride_Hit_Defeated_Death_R_Montage.A_Man_Ride_Hit_Defeated_Death_R_Montage'");

    FGameplayTagContainer metadata_defeated_riding_L;
    default metadata_defeated_riding_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_defeated_riding_L.AddTag(GameplayTag::State_RidingPose);
    default AddDefeatedHitMontage(metadata_defeated_riding_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_L_In_Montage.A_Man_Ride_Hit_Defeated_L_In_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_riding_L,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_L_Loop_Montage.A_Man_Ride_Hit_Defeated_L_Loop_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_riding_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Defeated/A_Man_Ride_Hit_Defeated_L_Out_Montage.A_Man_Ride_Hit_Defeated_L_Out_Montage'");
    default metadata_defeated_riding_L.AddTag(GameplayTag::Combat_Direction_Execution);
    default AddDeathFromDefeatedMontage(metadata_defeated_riding_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Deaths/A_Man_Ride_Hit_Defeated_Death_L_Montage.A_Man_Ride_Hit_Defeated_Death_L_Montage'");


    // -- Riposte hits --
    FGameplayTagContainer metadata_defeated_Riposte;
    default metadata_defeated_Riposte.AddTag(GameplayTag::Combat_HitType_Riposte);
    default AddDefeatedHitMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Defeated/A_Man_T1H_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_T1H_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");
};
