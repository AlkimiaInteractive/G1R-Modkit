// HITS --
UCLASS()
class UHitData_Lizard_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Death/Lizard_Montage_Death.Lizard_Montage_Death'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Death/Lizard_Montage_WaterDeath.Lizard_Montage_WaterDeath'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Death/Lizard_Montage_DrownDeath.Lizard_Montage_DrownDeath'";

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Additive/Lizard_AdditiveHit_F_AnimMontage.Lizard_AdditiveHit_F_AnimMontage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Additive/Lizard_AdditiveHit_R_AnimMontage.Lizard_AdditiveHit_R_AnimMontage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Additive/Lizard_AdditiveHit_L_AnimMontage.Lizard_AdditiveHit_L_AnimMontage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Additive/Lizard_AdditiveHit_B_AnimMontage.Lizard_AdditiveHit_B_AnimMontage'");
    //
};


// ATTACKS --
class UConfig_Lizard_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Lizard_Swimming_L01 : UConfig_Lizard_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Attacks/A_Lizard_A_Swim_Montage.A_Lizard_A_Swim_Montage'";
}
class UAttack_Lizard_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Lizard_Swimming_L01 : UAttack_Lizard_Swimming
{
    default m_MetaData = UConfig_Lizard_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Lizard : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lizard/Lizard_AnimBP_Combat.Lizard_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Lizard_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Lizard_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Lizardoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Lizard_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Lizard_Swimming_L01::StaticClass();
}