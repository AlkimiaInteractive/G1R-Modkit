// HITS --
UCLASS()
class UHitData_Swampshark_Swimming : UHitData
{
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Death/Swampshark_Death_Montage.Swampshark_Death_Montage'");

    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_F_Montage.A_Swampshark_AdditiveHit_F_Montage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_R_Montage.A_Swampshark_AdditiveHit_R_Montage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_L_Montage.A_Swampshark_AdditiveHit_L_Montage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Additive/A_Swampshark_AdditiveHit_B_Montage.A_Swampshark_AdditiveHit_B_Montage'");
    //
};


// ATTACKS --
class UConfig_Swampshark_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Swampshark_Swimming_L01 : UConfig_Swampshark_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Attacks/A_Swampshark_AttackLeft_Montage.A_Swampshark_AttackLeft_Montage'";
}
class UAttack_Swampshark_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Swampshark_Swimming_L01 : UAttack_Swampshark_Swimming
{
    default m_MetaData = UConfig_Swampshark_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Swampshark : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Swampshark/SwampShark_AnimBP_Combat.SwampShark_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Swampshark_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Swampshark_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Swampsharkoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Swampshark_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Swampshark_Swimming_L01::StaticClass();
}