// HITS --
UCLASS()
class UHitData_Skeleton_Swimming : UHitData
{
    default m_SwimDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Death/Skeleton_SwimDeath_Montage.Skeleton_SwimDeath_Montage'";
    default m_DrownDeath = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Death/Skeleton_SwimDeath_Montage.Skeleton_SwimDeath_Montage'";

    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Death/Skeleton_Death_Montage.Skeleton_Death_Montage'");
    
    // ADDITIVES
    FGameplayTagContainer metadata_additive_F;
    default metadata_additive_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_F, n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Additive/Skeleton_AdditiveHit_B_AnimMontage.Skeleton_AdditiveHit_B_AnimMontage'");

    FGameplayTagContainer metadata_additive_R;
    default metadata_additive_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_R, n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Additive/Skeleton_AdditiveHit_B_AnimMontage.Skeleton_AdditiveHit_B_AnimMontage'");

    FGameplayTagContainer metadata_additive_L;
    default metadata_additive_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_L, n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Additive/Skeleton_AdditiveHit_B_AnimMontage.Skeleton_AdditiveHit_B_AnimMontage'");

    FGameplayTagContainer metadata_additive_B;
    default metadata_additive_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default AddHit( metadata_additive_B, n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Additive/Skeleton_AdditiveHit_B_AnimMontage.Skeleton_AdditiveHit_B_AnimMontage'");
    //
};


// ATTACKS --
class UConfig_Skeleton_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Skeleton_Swimming_L01 : UConfig_Skeleton_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Attacks/A_Skeleton_A_Swim_Montage.A_Skeleton_A_Swim_Montage'";
}
class UAttack_Skeleton_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Skeleton_Swimming_L01 : UAttack_Skeleton_Swimming
{
    default m_MetaData = UConfig_Skeleton_Swimming_L01::StaticClass();
}

// ANIM CONFIG --
UCLASS()
class USwimming_Skeleton : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Skeleton/Skeleton_AnimBP_Combat.Skeleton_AnimBP_Combat_C'";

    // HITS
    default m_HitsData = UHitData_Skeleton_Swimming::StaticClass();
    //
}

UCLASS()
class USwimming_Skeleton_Combat : UWeaponMeleeItemAnimConfig
{
    //default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Skeletonoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Skeleton_Swimming::StaticClass();
    
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Skeleton_Swimming_L01::StaticClass();
}