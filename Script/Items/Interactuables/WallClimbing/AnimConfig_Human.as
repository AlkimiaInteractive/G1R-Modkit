UCLASS()
class UHitData_Human_WallClimbing : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/old/Hits/Death/DeathMontage.DeathMontage'");
    
      /// DEFEATED
    FGameplayTagContainer defeatedInMetadata_Front;
    default defeatedInMetadata_Front.AddTag(GameplayTag::Combat_Direction_Front);
    default AddDefeatedHitMontage(defeatedInMetadata_Front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Front,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Front,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Front,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Front,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedStandUpMontage(defeatedInMetadata_Front, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDeathFromDefeatedMontage(defeatedInMetadata_Front,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated_Death/A_Man_NWpn_Hit_Defeated_01_Death_Montage.A_Man_NWpn_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer defeatedInMetadata_Back;
    default defeatedInMetadata_Back.AddTag(GameplayTag::Combat_Direction_Back);
    default AddDefeatedHitMontage(defeatedInMetadata_Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_B_In_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_B_In_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedStandUpMontage(defeatedInMetadata_Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDeathFromDefeatedMontage(defeatedInMetadata_Back,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated_Death/A_Man_NWpn_Hit_Defeated_01_Death_Montage.A_Man_NWpn_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer defeatedInMetadata_Right;
    default defeatedInMetadata_Right.AddTag(GameplayTag::Combat_Direction_Right);
    default AddDefeatedHitMontage(defeatedInMetadata_Right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_L_In_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_L_In_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Right,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Right,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Right,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Right,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedStandUpMontage(defeatedInMetadata_Right, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDeathFromDefeatedMontage(defeatedInMetadata_Right,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated_Death/A_Man_NWpn_Hit_Defeated_01_Death_Montage.A_Man_NWpn_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer defeatedInMetadata_Left;
    default defeatedInMetadata_Left.AddTag(GameplayTag::Combat_Direction_Left);
    default AddDefeatedHitMontage(defeatedInMetadata_Left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_R_In_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_R_In_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Left,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Left,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Left,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Left,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedStandUpMontage(defeatedInMetadata_Left, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDeathFromDefeatedMontage(defeatedInMetadata_Left,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated_Death/A_Man_NWpn_Hit_Defeated_01_Death_Montage.A_Man_NWpn_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer defeatedInMetadata_Undirectional;
    default defeatedInMetadata_Undirectional.AddTag(GameplayTag::Combat_Direction_Undirectional);
    default AddDefeatedHitMontage(defeatedInMetadata_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_360_Humanoid_In_Montage.A_Man_NWpn_Hit_Defeated_360_Humanoid_In_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Undirectional,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Undirectional,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_02_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Undirectional,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_03_Montage'");
    default AddDefeatedLoopMontage(defeatedInMetadata_Undirectional,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_04_Montage'");
    default AddDefeatedStandUpMontage(defeatedInMetadata_Undirectional, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDeathFromDefeatedMontage(defeatedInMetadata_Undirectional,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated_Death/A_Man_NWpn_Hit_Defeated_01_Death_Montage.A_Man_NWpn_Hit_Defeated_01_Death_Montage'");

    FGameplayTagContainer metadata_defeated_Riposte;
    default metadata_defeated_Riposte.AddTag(GameplayTag::Combat_HitType_Riposte);
    default AddDefeatedHitMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_F_In_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_F_In_Montage'");
    default AddDefeatedStandUpMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Out_Montage'");
    default AddDefeatedLoopMontage(metadata_defeated_Riposte,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated/A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage.A_Man_NWpn_Hit_Defeated_Push_Humanoid_Loop_01_Montage'");
    default AddDeathFromDefeatedMontage(metadata_defeated_Riposte, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Hits/Defeated_Death/A_Man_NWpn_Hit_Defeated_01_Death_Montage.A_Man_NWpn_Hit_Defeated_01_Death_Montage'");


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
    ///
};

UCLASS()
class UWallClimbing_Human : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Human_WallClimbing::StaticClass();
    //
}

UCLASS()
class UWallClimbing_Human_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Human_WallClimbing::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_Climbing_Down::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Climbing_Up::StaticClass();
    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Climbing_Up::StaticClass();
    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_Climbing_Down::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_TopRight) =      UAttack_Human_Climbing_UpRight::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_TopLeft) =      UAttack_Human_Climbing_UpLeft::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_BottomRight) =   UAttack_Human_Climbing_DownRight::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_BottomLeft) =   UAttack_Human_Climbing_DownLeft::StaticClass();
}