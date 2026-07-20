// HITS --
UCLASS()
class UHitData_Biter_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Death/Biter_Death_Montage.Biter_Death_Montage'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Death/Biter_WaterDeath_Montage.Biter_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Death/Biter_DrownDeath_Montage.Biter_DrownDeath_Montage'";

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Additive/Biter_AdditiveHit_F_Montage.Biter_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Additive/Biter_AdditiveHit_R_Montage.Biter_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Additive/Biter_AdditiveHit_L_Montage.Biter_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Additive/Biter_AdditiveHit_B_Montage.Biter_AdditiveHit_B_Montage'");
    //
};


// ATTACKS --
class UConfig_Biter_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Biter_Swimming_L01 : UConfig_Biter_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Attacks/Biter_A_Swim_Montage.Biter_A_Swim_Montage'";
}
class UAttack_Biter_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Biter_Swimming_L01 : UAttack_Biter_Swimming
{
    default m_MetaData = UConfig_Biter_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Biter : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Biter/Biter_AnimBP_Combat.Biter_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Biter_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Biter_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Biteroid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Biter_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Biter_Swimming_L01::StaticClass();
}