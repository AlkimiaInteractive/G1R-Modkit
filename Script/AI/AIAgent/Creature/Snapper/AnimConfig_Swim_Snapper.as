// HITS --
UCLASS()
class UHitData_Snapper_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Death/Shadow_Beast_Death_Montage.Shadow_Beast_Death_Montage'");
   default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Death/Snapper_WaterDeath_Montage.Snapper_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Death/Snapper_DrownDeath_Montage.Snapper_DrownDeath_Montage'";
    
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Additive/Shadow_Beast_AdditiveHit_F_AnimMontage.Shadow_Beast_AdditiveHit_F_AnimMontage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Additive/Shadow_Beast_AdditiveHit_R_AnimMontage.Shadow_Beast_AdditiveHit_R_AnimMontage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Additive/Shadow_Beast_AdditiveHit_L_AnimMontage.Shadow_Beast_AdditiveHit_L_AnimMontage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Additive/Shadow_Beast_AdditiveHit_B_AnimMontage.Shadow_Beast_AdditiveHit_B_AnimMontage'");
    //
};


// ATTACKS --
class UConfig_Snapper_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Snapper_Swimming_L01 : UConfig_Snapper_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Attacks/A_Snapper_A_Swim_Montage.A_Snapper_A_Swim_Montage'";
}
class UAttack_Snapper_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Snapper_Swimming_L01 : UAttack_Snapper_Swimming
{
    default m_MetaData = UConfig_Snapper_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Snapper : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Snapper/Snapper_AnimBP_Combat.Snapper_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Snapper_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Snapper_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Snapperoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Snapper_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Snapper_Swimming_L01::StaticClass();
}