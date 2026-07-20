// HITS --
UCLASS()
class UHitData_Wolf_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Death/Wolf_Montage_Death.Wolf_Montage_Death'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Death/Wolf_Montage_WaterDeath.Wolf_Montage_WaterDeath'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Death/Wolf_Montage_DrownDeath.Wolf_Montage_DrownDeath'";
    
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Additive/Wolf_AdditiveHit_F_AnimMontage.Wolf_AdditiveHit_F_AnimMontage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Additive/Wolf_AdditiveHit_R_AnimMontage.Wolf_AdditiveHit_R_AnimMontage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Additive/Wolf_AdditiveHit_L_AnimMontage.Wolf_AdditiveHit_L_AnimMontage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Additive/Wolf_AdditiveHit_B_AnimMontage.Wolf_AdditiveHit_B_AnimMontage'");
    //
};


// ATTACKS --
class UConfig_Wolf_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Wolf_Swimming_L01 : UConfig_Wolf_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/A_Wolf_A_Swim_Montage.A_Wolf_A_Swim_Montage'";
}
class UAttack_Wolf_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Wolf_Swimming_L01 : UAttack_Wolf_Swimming
{
    default m_MetaData = UConfig_Wolf_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Wolf : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Wolf/Wolf_AnimBP_Combat.Wolf_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Wolf_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Wolf_Combat : UWeaponMeleeItemAnimConfig
{
    // HITS
    default m_HitsData = UHitData_Wolf_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UAttack_Wolf_Swimming_L01::StaticClass();
}