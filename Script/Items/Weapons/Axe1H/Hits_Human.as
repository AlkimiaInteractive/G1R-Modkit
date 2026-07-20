UCLASS()
class UHitData_A1H_Human : UHitData_Human 
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Hits/Death/DeathMontage.DeathMontage'");
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Death/A_Man_S1H_Death_02_Montage.A_Man_S1H_Death_02_Montage'");

    // ADDITIVE
    default AddAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_Additive_B_Montage.A_Man_A1H_Hit_Additive_B_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_Additive_F_Montage.A_Man_A1H_Hit_Additive_F_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_Additive_L_Montage.A_Man_A1H_Hit_Additive_L_Montage'");
    default AddAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_Additive_R_Montage.A_Man_A1H_Hit_Additive_R_Montage'");

    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_ActionAdditive_B_Montage.A_Man_A1H_Hit_ActionAdditive_B_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_ActionAdditive_F_Montage.A_Man_A1H_Hit_ActionAdditive_F_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_ActionAdditive_L_Montage.A_Man_A1H_Hit_ActionAdditive_L_Montage'");
    default AddActionAdditiveHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Additive/A_Man_A1H_Hit_ActionAdditive_R_Montage.A_Man_A1H_Hit_ActionAdditive_R_Montage'");


    // LIGHT BLOCKING
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Back, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightBlockingHit(GameplayTag::Combat_Direction_Front, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    // LIGHT NO BLOCKING
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");
    default AddLightNonblockingHit(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Hits/Man_Light_Test.Man_Light_Test'");

    // BLOCKED
    // -- Front hits --
    default AddHitDeflected(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Attack_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ARight_AnimMontage.A_Man_S1H_HitBlocked_F_ARight_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Attack_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ALeft_AnimMontage.A_Man_S1H_HitBlocked_F_ALeft_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Attack_Top, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ATop_AnimMontage.A_Man_S1H_HitBlocked_F_ATop_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Front, GameplayTag::Combat_Attack_Bottom, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_F_ABottom_AnimMontage.A_Man_S1H_HitBlocked_F_ABottom_AnimMontage'");

    // -- Back hits -- 
    default AddHitDeflected(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Attack_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ARight_AnimMontage.A_Man_S1H_HitBlocked_B_ARight_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Attack_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ALeft_AnimMontage.A_Man_S1H_HitBlocked_B_ALeft_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Attack_Top, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ATop_AnimMontage.A_Man_S1H_HitBlocked_B_ATop_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Back, GameplayTag::Combat_Attack_Bottom, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_B_ABottom_AnimMontage.A_Man_S1H_HitBlocked_B_ABottom_AnimMontage'");

    // -- Right hits -- 
    default AddHitDeflected(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Attack_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ARight_AnimMontage.A_Man_S1H_HitBlocked_R_ARight_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Attack_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ALeft_AnimMontage.A_Man_S1H_HitBlocked_R_ALeft_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Attack_Top, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ATop_AnimMontage.A_Man_S1H_HitBlocked_R_ATop_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Right, GameplayTag::Combat_Attack_Bottom, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_R_ABottom_AnimMontage.A_Man_S1H_HitBlocked_R_ABottom_AnimMontage'");

    // -- Left hits -- 
    default AddHitDeflected(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Attack_Right, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ARight_AnimMontage.A_Man_S1H_HitBlocked_L_ARight_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Attack_Left, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ALeft_AnimMontage.A_Man_S1H_HitBlocked_L_ALeft_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Attack_Top, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ATop_AnimMontage.A_Man_S1H_HitBlocked_L_ATop_AnimMontage'");
    default AddHitDeflected(GameplayTag::Combat_Direction_Left, GameplayTag::Combat_Attack_Bottom, 
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/HitBlocked/A_Man_S1H_HitBlocked_L_ABottom_AnimMontage.A_Man_S1H_HitBlocked_L_ABottom_AnimMontage'");

    TArray<FName> DefeatedInFrontMontages;
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_F_In_02_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_F_In_02_Montage'");
    default DefeatedInFrontMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_F_In_03_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_F_In_03_Montage'");
    default AddDefeatedInMontageArrayWithDirection(GameplayTag::Combat_Direction_Front, DefeatedInFrontMontages);
    
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_L_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_R_In_Montage'");
    default AddDefeatedInMontageWithDirection(GameplayTag::Combat_Direction_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_360_Humanoid_In_Montage.A_Man_A1H_Ma_Hit_Defeated_360_Humanoid_In_Montage'");
    
    TArray<FName> DefeatedLoopMontages;
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default DefeatedLoopMontages.Add(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedLoopMontageArrayInAllDirections(DefeatedLoopMontages);
    
    default AddDefeatedDeathMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");
};

UCLASS()
class UHitData_A1H_Un_Human : UHitData_A1H_Human
{
    ////// STANDARD
    default HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_RH_Hit_SupAr_F_Montage.A_Man_S1H_Un_RH_Hit_SupAr_F_Montage'";
    default HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_RH_Hit_SupAr_B_Montage.A_Man_S1H_Un_RH_Hit_SupAr_B_Montage'";
    default HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_RH_Hit_SupAr_L_Montage.A_Man_S1H_Un_RH_Hit_SupAr_L_Montage'";
    default HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_RH_Hit_SupAr_R_Montage.A_Man_S1H_Un_RH_Hit_SupAr_R_Montage'";

    default HitSupAr_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_LH_Hit_SupAr_F_Montage.A_Man_S1H_Un_LH_Hit_SupAr_F_Montage'";
    default HitSupAr_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_LH_Hit_SupAr_B_Montage.A_Man_S1H_Un_LH_Hit_SupAr_B_Montage'";
    default HitSupAr_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_LH_Hit_SupAr_L_Montage.A_Man_S1H_Un_LH_Hit_SupAr_L_Montage'";
    default HitSupAr_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/supAr/Untrained/A_Man_S1H_Un_LH_Hit_SupAr_R_Montage.A_Man_S1H_Un_LH_Hit_SupAr_R_Montage'";

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

    // KNOCKBACK
    default AddKnockback(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Untrained/A_Man_S1H_Un_Hit_Knockback_F_Montage.A_Man_S1H_Un_Hit_Knockback_F_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Untrained/A_Man_S1H_Un_Hit_Knockback_L_Montage.A_Man_S1H_Un_Hit_Knockback_L_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Untrained/A_Man_S1H_Un_Hit_Knockback_R_Montage.A_Man_S1H_Un_Hit_Knockback_R_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Knockback/Untrained/A_Man_S1H_Un_Hit_Knockback_B_Montage.A_Man_S1H_Un_Hit_Knockback_B_Montage'");

    // BLOCK BREAK
    default AddBlockBreak(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Untrained/A_Man_S1H_Un_HitBreakBlock_F_Montage.A_Man_S1H_Un_HitBreakBlock_F_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Untrained/A_Man_S1H_Un_HitBreakBlock_B_Montage.A_Man_S1H_Un_HitBreakBlock_B_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Untrained/A_Man_S1H_Un_HitBreakBlock_L_Montage.A_Man_S1H_Un_HitBreakBlock_L_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/BreakBlock/Untrained/A_Man_S1H_Un_HitBreakBlock_R_Montage.A_Man_S1H_Un_HitBreakBlock_R_Montage'");  

    // RIPOSTE
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Sword_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Torch,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Sword_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Axe_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_A1H_Montage.A_Man_S1H_Un_Hit_Riposte_A1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Axe_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_A1H_Montage.A_Man_S1H_Un_Hit_Riposte_A1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Mace_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_M1H_Montage.A_Man_S1H_Un_Hit_Riposte_M1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Orc_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_M1H_Montage.A_Man_S1H_Un_Hit_Riposte_M1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Staff,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Fist,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_Fists_Montage.A_Man_S1H_Un_Hit_Riposte_Fists_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Orc, FGameplayTag::Empty,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_Orc_Montage.A_Man_S1H_Un_Hit_Riposte_Orc_Montage'");

    // DEFEATED
    // -- Push hits --
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    default AddDefeatedStandUpMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Untrained/A_Man_A1H_Un_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_A1H_Un_Hit_Defeated_Push_Humanoid_Out_Montage'");

    // -- Riposte hits --
    default AddDefeatedMontages(GameplayTag::Combat_HitType_Riposte,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Untrained/A_Man_S1H_Un_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_S1H_Un_Hit_Defeated_Push_Humanoid_Out_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");
};

UCLASS()
class UHitData_A1H_Tr_Human : UHitData_A1H_Human
{
    ////// STANDARD
    default HitSupAr_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_LH_Hit_SupAr_B_Montage.A_Man_A1H_Tr_LH_Hit_SupAr_B_Montage'";
    default HitSupAr_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_LH_Hit_SupAr_F_Montage.A_Man_A1H_Tr_LH_Hit_SupAr_F_Montage'";
    default HitSupAr_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_LH_Hit_SupAr_L_Montage.A_Man_A1H_Tr_LH_Hit_SupAr_L_Montage'";
    default HitSupAr_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_LH_Hit_SupAr_R_Montage.A_Man_A1H_Tr_LH_Hit_SupAr_R_Montage'";

    default HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_RH_Hit_SupAr_B_Montage.A_Man_A1H_Tr_RH_Hit_SupAr_B_Montage'";
    default HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_RH_Hit_SupAr_F_Montage.A_Man_A1H_Tr_RH_Hit_SupAr_F_Montage'";
    default HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_RH_Hit_SupAr_L_Montage.A_Man_A1H_Tr_RH_Hit_SupAr_L_Montage'";
    default HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Trained/A_Man_A1H_Tr_RH_Hit_SupAr_R_Montage.A_Man_A1H_Tr_RH_Hit_SupAr_R_Montage'";


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

    // KNOCKBACK
    default AddKnockback(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Trained/A_Man_A1H_Tr_Hit_Knockback_B_Montage.A_Man_A1H_Tr_Hit_Knockback_B_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Trained/A_Man_A1H_Tr_Hit_Knockback_F_Montage.A_Man_A1H_Tr_Hit_Knockback_F_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Trained/A_Man_A1H_Tr_Hit_Knockback_L_Montage.A_Man_A1H_Tr_Hit_Knockback_L_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Trained/A_Man_A1H_Tr_Hit_Knockback_R_Montage.A_Man_A1H_Tr_Hit_Knockback_R_Montage'");

    // BLOCK BREAK
    default AddBlockBreak(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Trained/A_Man_A1H_Tr_HitBreakBlock_B_Montage.A_Man_A1H_Tr_HitBreakBlock_B_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Trained/A_Man_A1H_Tr_HitBreakBlock_F_Montage.A_Man_A1H_Tr_HitBreakBlock_F_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Trained/A_Man_A1H_Tr_HitBreakBlock_L_Montage.A_Man_A1H_Tr_HitBreakBlock_L_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Trained/A_Man_A1H_Tr_HitBreakBlock_R_Montage.A_Man_A1H_Tr_HitBreakBlock_R_Montage'");  

    // RIPOSTE
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Sword_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Torch,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Sword_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Axe_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_A1H_Montage.A_Man_S1H_Un_Hit_Riposte_A1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Axe_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_A1H_Montage.A_Man_S1H_Un_Hit_Riposte_A1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Mace_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_M1H_Montage.A_Man_S1H_Un_Hit_Riposte_M1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Orc_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_M1H_Montage.A_Man_S1H_Un_Hit_Riposte_M1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Staff,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Fist,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_Fists_Montage.A_Man_S1H_Un_Hit_Riposte_Fists_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Orc, FGameplayTag::Empty,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_Orc_Montage.A_Man_S1H_Un_Hit_Riposte_Orc_Montage'");

    // DEFEATED
    // -- Push hits --
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    default AddDefeatedStandUpMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Trained/A_Man_A1H_Tr_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_A1H_Tr_Hit_Defeated_Push_Humanoid_Out_Montage'");

    // -- Riposte hits --
    default AddDefeatedMontages(GameplayTag::Combat_HitType_Riposte,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Trained/A_Man_A1H_Tr_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_A1H_Tr_Hit_Defeated_Push_Humanoid_Out_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");
};

UCLASS()
class UHitData_A1H_Ma_Human : UHitData_A1H_Human 
{
    ////// STANDARD
    default HitSupAr_LH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_LH_Hit_SupAr_B_Montage.A_Man_A1H_Ma_LH_Hit_SupAr_B_Montage'";
    default HitSupAr_LH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_LH_Hit_SupAr_F_Montage.A_Man_A1H_Ma_LH_Hit_SupAr_F_Montage'";
    default HitSupAr_LH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_LH_Hit_SupAr_L_Montage.A_Man_A1H_Ma_LH_Hit_SupAr_L_Montage'";
    default HitSupAr_LH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_LH_Hit_SupAr_R_Montage.A_Man_A1H_Ma_LH_Hit_SupAr_R_Montage'";
    
    default HitSupAr_RH_B = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_RH_Hit_SupAr_B_Montage.A_Man_A1H_Ma_RH_Hit_SupAr_B_Montage'";
    default HitSupAr_RH_F = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_RH_Hit_SupAr_F_Montage.A_Man_A1H_Ma_RH_Hit_SupAr_F_Montage'";
    default HitSupAr_RH_L = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_RH_Hit_SupAr_L_Montage.A_Man_A1H_Ma_RH_Hit_SupAr_L_Montage'";
    default HitSupAr_RH_R = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/supAr/Master/A_Man_A1H_Ma_RH_Hit_SupAr_R_Montage.A_Man_A1H_Ma_RH_Hit_SupAr_R_Montage'";

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

    // KNOCKBACK
    default AddKnockback(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Master/A_Man_A1H_Ma_Hit_Knockback_B_Montage.A_Man_A1H_Ma_Hit_Knockback_B_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Master/A_Man_A1H_Ma_Hit_Knockback_F_Montage.A_Man_A1H_Ma_Hit_Knockback_F_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Master/A_Man_A1H_Ma_Hit_Knockback_L_Montage.A_Man_A1H_Ma_Hit_Knockback_L_Montage'");
    default AddKnockback(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Knockback/Master/A_Man_A1H_Ma_Hit_Knockback_R_Montage.A_Man_A1H_Ma_Hit_Knockback_R_Montage'");

    // BLOCK BREAK
    default AddBlockBreak(GameplayTag::Combat_Direction_Back,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Master/A_Man_A1H_Ma_HitBreakBlock_B_Montage.A_Man_A1H_Ma_HitBreakBlock_B_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Front,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Master/A_Man_A1H_Ma_HitBreakBlock_F_Montage.A_Man_A1H_Ma_HitBreakBlock_F_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Left,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Master/A_Man_A1H_Ma_HitBreakBlock_L_Montage.A_Man_A1H_Ma_HitBreakBlock_L_Montage'");
    default AddBlockBreak(GameplayTag::Combat_Direction_Right,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/BreakBlock/Master/A_Man_A1H_Ma_HitBreakBlock_R_Montage.A_Man_A1H_Ma_HitBreakBlock_R_Montage'");  

    // RIPOSTE
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Sword_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Torch,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Sword_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Axe_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_A1H_Montage.A_Man_S1H_Un_Hit_Riposte_A1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Axe_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_A1H_Montage.A_Man_S1H_Un_Hit_Riposte_A1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Mace_OneHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_M1H_Montage.A_Man_S1H_Un_Hit_Riposte_M1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Orc_TwoHand,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_M1H_Montage.A_Man_S1H_Un_Hit_Riposte_M1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Staff,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_S1H_Montage.A_Man_S1H_Un_Hit_Riposte_S1H_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Humanoid, GameplayTag::Item_Weapon_Fist,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_Fists_Montage.A_Man_S1H_Un_Hit_Riposte_Fists_Montage'");
    default AddRiposte(GameplayTag::Character_Size_Orc, FGameplayTag::Empty,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Riposted/Untrained/A_Man_S1H_Un_Hit_Riposte_Orc_Montage.A_Man_S1H_Un_Hit_Riposte_Orc_Montage'");

    // DEFEATED
    // -- Push hits --
    default AddDeathFromExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");

    default AddDefeatedStandUpMontageInAllDirections(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'");
    
    // -- Riposte hits --
    default AddDefeatedMontages(GameplayTag::Combat_HitType_Riposte,
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_F_In_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Hits/Defeated/Master/A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_A1H_Ma_Hit_Defeated_Push_Humanoid_Out_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated/Master/A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_S1H_Ma_Hit_Defeated_Push_Humanoid_Loop_01_Montage'",
        n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'");
};