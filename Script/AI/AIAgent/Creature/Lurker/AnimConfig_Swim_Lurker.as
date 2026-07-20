// HITS --
UCLASS()
class UHitData_Lurker_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Death/Lurker_Montage_Death.Lurker_Montage_Death'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Death/Lurker_Montage_WaterDeath.Lurker_Montage_WaterDeath'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Death/Lurker_Montage_DrownDeath.Lurker_Montage_DrownDeath'";
   
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Additive/Lurker_AdditiveHit_F_AnimMontage.Lurker_AdditiveHit_F_AnimMontage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Additive/Lurker_AdditiveHit_R_AnimMontage.Lurker_AdditiveHit_R_AnimMontage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Additive/Lurker_AdditiveHit_L_AnimMontage.Lurker_AdditiveHit_L_AnimMontage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Additive/Lurker_AdditiveHit_B_AnimMontage.Lurker_AdditiveHit_B_AnimMontage'");
    //
};


// ATTACKS --
class UConfig_Lurker_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Lurker_Swimming_L01 : UConfig_Lurker_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/A_Lurker_A_Swim_Montage.A_Lurker_A_Swim_Montage'";
}
class UAttack_Lurker_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Lurker_Swimming_L01 : UAttack_Lurker_Swimming
{
    default m_MetaData = UConfig_Lurker_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Lurker : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lurker/Lurker_AnimBP_Combat.Lurker_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Lurker_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Lurker_Combat_Swimming : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Lurkeroid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Lurker_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Lurker_Swimming_L01::StaticClass();
}

UCLASS()
class USwimming_Lurker_Combat_Diving : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Lurkeroid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Lurker_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Lurker_Swimming_L01::StaticClass();
}