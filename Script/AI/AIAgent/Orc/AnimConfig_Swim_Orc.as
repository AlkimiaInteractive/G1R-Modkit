// HITS --
UCLASS()
class UHitData_Orc_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Hits/Death/PH_OrcM_NWpn_Hit_Death_Montage.PH_OrcM_NWpn_Hit_Death_Montage'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Death/OrcM_Swim_Death_Montage.OrcM_Swim_Death_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Death/OrcM_Drown_Death_Montage.OrcM_Drown_Death_Montage'";
    
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Hits/Additive/A_OrcM_NWpn_Hit_Additive_F_Montage.A_OrcM_NWpn_Hit_Additive_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Hits/Additive/A_OrcM_NWpn_Hit_Additive_R_Montage.A_OrcM_NWpn_Hit_Additive_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Hits/Additive/A_OrcM_NWpn_Hit_Additive_L_Montage.A_OrcM_NWpn_Hit_Additive_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/NoWeapon/Hits/Additive/A_OrcM_NWpn_Hit_Additive_B_Montage.A_OrcM_NWpn_Hit_Additive_B_Montage'");
    //
};


// ATTACKS --
class UConfig_Orc_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_Swimming_L01 : UConfig_Orc_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Swim/A_OrcM_A_Swim_Montage.A_OrcM_A_Swim_Montage'";
}
class UAttack_Orc_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Orc_Swimming_L01 : UAttack_Orc_Swimming
{
    default m_MetaData = UConfig_Orc_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Orc : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/OrcM_Fists_AnimBP.OrcM_Fists_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Orc_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Orc_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Orcoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Orc_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Orc_Swimming_L01::StaticClass();
}