// HITS --
UCLASS()
class UHitData_Zombie_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Death/Zombie_Death_Montage.Zombie_Death_Montage'");
    
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Additive/Zombie_AdditiveHit_F_Montage.Zombie_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Additive/Zombie_AdditiveHit_R_Montage.Zombie_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Additive/Zombie_AdditiveHit_L_Montage.Zombie_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Additive/Zombie_AdditiveHit_B_Montage.Zombie_AdditiveHit_B_Montage'");
    //
};


// ATTACKS --
class UConfig_Zombie_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Zombie_Swimming_L01 : UConfig_Zombie_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Attacks/A_Zombie_A_Swim_Montage.A_Zombie_A_Swim_Montage'";
}
class UAttack_Zombie_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Zombie_Swimming_L01 : UAttack_Zombie_Swimming
{
    default m_MetaData = UConfig_Zombie_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Zombie : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Zombie/Zombie_AnimBP_Combat.Zombie_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Zombie_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Zombie_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Zombieoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Zombie_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Zombie_Swimming_L01::StaticClass();
}