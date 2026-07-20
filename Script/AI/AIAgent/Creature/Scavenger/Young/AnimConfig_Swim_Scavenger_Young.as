// HITS --
UCLASS()
class UHitData_Scavenger_Young_Swimming : UHitData
{
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Death/Scavenger_Young_WaterDeath_Montage.Scavenger_Young_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Death/Scavenger_Young_DrownDeath_Montage.Scavenger_Young_DrownDeath_Montage'";
    
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Death/Scavenger_Young_Death_Montage.Scavenger_Young_Death_Montage'");
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Additive/Scavenger_Young_AdditiveHit_F_Montage.Scavenger_Young_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Additive/Scavenger_Young_AdditiveHit_R_Montage.Scavenger_Young_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Additive/Scavenger_Young_AdditiveHit_L_Montage.Scavenger_Young_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Additive/Scavenger_Young_AdditiveHit_B_Montage.Scavenger_Young_AdditiveHit_B_Montage'");
    //
};


// ATTACKS --
class UConfig_Scavenger_Young_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Scavenger_Young_Swimming_L01 : UConfig_Scavenger_Young_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Attacks/A_Scavenger_A_Swim_Montage.A_Scavenger_A_Swim_Montage'";
}
class UAttack_Scavenger_Young_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Scavenger_Young_Swimming_L01 : UAttack_Scavenger_Young_Swimming
{
    default m_MetaData = UConfig_Scavenger_Young_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Scavenger_Young : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Young/Scavenger_Young_AnimBP_Combat.Scavenger_Young_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Scavenger_Young_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Scavenger_Young_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Scavenger_Youngoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Scavenger_Young_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Scavenger_Young_Swimming_L01::StaticClass();
}