// HITS --
UCLASS()
class UHitData_OrcDog_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Death/OrcDog_Montage_Death.OrcDog_Montage_Death'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Death/OrcDog_Montage_WaterDeath.OrcDog_Montage_WaterDeath'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Death/OrcDog_Montage_DrownDeath.OrcDog_Montage_DrownDeath'";
    
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Additive/OrcDog_AdditiveHit_F_AnimMontage.OrcDog_AdditiveHit_F_AnimMontage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Additive/OrcDog_AdditiveHit_R_AnimMontage.OrcDog_AdditiveHit_R_AnimMontage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Additive/OrcDog_AdditiveHit_L_AnimMontage.OrcDog_AdditiveHit_L_AnimMontage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Additive/OrcDog_AdditiveHit_B_AnimMontage.OrcDog_AdditiveHit_B_AnimMontage'");
    //
};


// ATTACKS --
class UConfig_OrcDog_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_OrcDog_Swimming_L01 : UConfig_OrcDog_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Attacks/A_OrcDog_A_Swim_Montage.A_OrcDog_A_Swim_Montage'";
}
class UAttack_OrcDog_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_OrcDog_Swimming_L01 : UAttack_OrcDog_Swimming
{
    default m_MetaData = UConfig_OrcDog_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_OrcDog : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/OrcDog/OrcDog_AnimBP_Combat.OrcDog_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_OrcDog_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_OrcDog_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/OrcDogoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_OrcDog_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_OrcDog_Swimming_L01::StaticClass();
}