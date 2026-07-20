// HITS --
UCLASS()
class UHitData_Molerat_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Death/Molerat_Montage_Death.Molerat_Montage_Death'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Death/Molerat_Montage_WaterDeath.Molerat_Montage_WaterDeath'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Death/Molerat_Montage_DrownDeath.Molerat_Montage_DrownDeath'";

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Additive/Molerat_AdditiveHit_F_Montage.Molerat_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Additive/Molerat_AdditiveHit_R_Montage.Molerat_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Additive/Molerat_AdditiveHit_L_Montage.Molerat_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Additive/Molerat_AdditiveHit_B_Montage.Molerat_AdditiveHit_B_Montage'");
    //
};


// ATTACKS --
class UConfig_Molerat_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Molerat_Swimming_L01 : UConfig_Molerat_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Attacks/A_Molerat_A_Swim_Montage.A_Molerat_A_Swim_Montage'";
}
class UAttack_Molerat_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Molerat_Swimming_L01 : UAttack_Molerat_Swimming
{
    default m_MetaData = UConfig_Molerat_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Molerat : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Molerat/Molerat_AnimBP_Combat.Molerat_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Molerat_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Molerat_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Moleratoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Molerat_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Molerat_Swimming_L01::StaticClass();
}