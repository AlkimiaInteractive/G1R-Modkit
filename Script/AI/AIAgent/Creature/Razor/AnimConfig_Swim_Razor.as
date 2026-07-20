// HITS --
UCLASS()
class UHitData_Razor_Swimming : UHitData
{
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Death/Razor_WaterDeath_Montage.Razor_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Death/Razor_DrownDeath_Montage.Razor_DrownDeath_Montage'";
   
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Death/Razor_Death_Montage.Razor_Death_Montage'");
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Additive/Razor_AdditiveHit_F_AnimMontage.Razor_AdditiveHit_F_AnimMontage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Additive/Razor_AdditiveHit_R_AnimMontage.Razor_AdditiveHit_R_AnimMontage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Additive/Razor_AdditiveHit_L_AnimMontage.Razor_AdditiveHit_L_AnimMontage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Additive/Razor_AdditiveHit_B_AnimMontage.Razor_AdditiveHit_B_AnimMontage'");
    //
};


// ATTACKS --
class UConfig_Razor_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Razor_Swimming_L01 : UConfig_Razor_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Attacks/A_Razor_A_Swim_Montage.A_Razor_A_Swim_Montage'";
}
class UAttack_Razor_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Razor_Swimming_L01 : UAttack_Razor_Swimming
{
    default m_MetaData = UConfig_Razor_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Razor : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Razor/Razor_AnimBP_Combat.Razor_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Razor_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Razor_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Razoroid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Razor_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Razor_Swimming_L01::StaticClass();
}