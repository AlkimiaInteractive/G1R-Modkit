// HITS --
UCLASS()
class UHitData_Goblin_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Death/GreenGoblin_Death_Montage.GreenGoblin_Death_Montage'");
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Death/GreenGoblin_WaterDeath_Montage.GreenGoblin_WaterDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Death/GreenGoblin_DrownDeath_Montage.GreenGoblin_DrownDeath_Montage'";

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Additive/GreenGoblin_AdditiveHit_F_Montage.GreenGoblin_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Additive/GreenGoblin_AdditiveHit_R_Montage.GreenGoblin_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Additive/GreenGoblin_AdditiveHit_L_Montage.GreenGoblin_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Additive/GreenGoblin_AdditiveHit_B_Montage.GreenGoblin_AdditiveHit_B_Montage'");
    //
};


// ATTACKS --
class UConfig_Goblin_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Goblin_Swimming_L01 : UConfig_Goblin_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Attacks/A_GreenGoblin_A_Swim_Montage.A_GreenGoblin_A_Swim_Montage'";
}
class UAttack_Goblin_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Goblin_Swimming_L01 : UAttack_Goblin_Swimming
{
    default m_MetaData = UConfig_Goblin_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Goblin : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Green_Goblin/GreenGoblin_AnimBP_Combat.GreenGoblin_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Goblin_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Goblin_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Goblinoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Goblin_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Goblin_Swimming_L01::StaticClass();
}