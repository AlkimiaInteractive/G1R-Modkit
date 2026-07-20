//////////////////
// UCLASS()
// class UAttackMeleeConfig_Skeleton_Mage_Attack_Bottom : UAttackMeleeConfig
// {
//     default m_AttackMontage = n"";

// 	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
// 	default m_SuperArmorDamageMultiplier = 1.0f;
// }


// UCLASS()
// class UComboAttackConfig_Skeleton_Mage_Attack_Bottom : UComboAttackConfigScript
// {
//     default m_MetaData = UAttackMeleeConfig_Skeleton_Mage_Attack_Bottom::StaticClass();
//     default m_GA_Attack = UGA_AttackMelee::StaticClass();
// }

UCLASS()
class UComboAttackConfig_Skeleton_Mage_Attack_SoulHarvest : UComboAttackConfigScript
{
    default m_GA_Attack = UGA_CastSpell_SoulHarvest_SkeletonMage::StaticClass();
}

UCLASS()
class UComboAttackConfig_Skeleton_Mage_Attack_MagicBeam : UComboAttackConfigScript
{

    default m_GA_Attack = UGA_CastSpell_MagicBeam_SkeletonMage::StaticClass();
}

UCLASS()
class UComboAttackConfig_Skeleton_Mage_Attack_SummonSkeletons : UComboAttackConfigScript
{
    default m_GA_Attack = UGA_CastSpell_SummonSkeletons_SkeletonMage::StaticClass();
}

UCLASS()
class UComboAttackConfig_Skeleton_Mage_Attack_Teleport : UComboAttackConfigScript
{
    default m_GA_Attack = UGA_CastSpell_Teleport_SkeletonMage::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Skeleton_Mage : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Skeleton_Mage/Skeleton_Mage_AnimBP.Skeleton_Mage_AnimBP_C'";
	
    
    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Idles/Breaker/A_SkeletonMage_IdleBreaker_01.A_SkeletonMage_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Idles/Breaker/A_SkeletonMage_IdleBreaker_02.A_SkeletonMage_IdleBreaker_02'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Idles/Breaker/A_SkeletonMage_IdleBreaker_03.A_SkeletonMage_IdleBreaker_03'", 0.6f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Breaker/A_SkeletonMage_WalkBreaker_01.A_SkeletonMage_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Breaker/A_SkeletonMage_WalkBreaker_02.A_SkeletonMage_WalkBreaker_02'", 2.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Breaker/A_SkeletonMage_WalkBreaker_03.A_SkeletonMage_WalkBreaker_03'", 0.8f, 1);
    
    

   // TURNS
   default m_TurnsData = UTurnsData_Skeleton_Mage::StaticClass();
   //

   // HITS
   default m_HitsData = UHitData_Skeleton_Mage::StaticClass();
   //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Skeleton_Mage_Combat : UWeaponMeleeItemAnimConfig
{

    //default m_AttackRotateSpeedManualReorient = 10.0f;
    // default m_RotateSpeedMagnetPlayer = 40.0f;
    // default m_RotateSpeedMagnetAI = 10.0f;
    // default m_RotateSpeedReorient = 1.0f;

    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Skeleton_Mage/Skeleton_Mage_AnimBP_Combat.Skeleton_Mage_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Idles/Breaker/A_SkeletonMage_CombatIdleBreaker_01.A_SkeletonMage_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Idles/Breaker/A_SkeletonMage_CombatIdleBreaker_02.A_SkeletonMage_CombatIdleBreaker_02'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Idles/Breaker/A_SkeletonMage_CombatIdleBreaker_03.A_SkeletonMage_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Idles/Breaker/A_SkeletonMage_CombatIdleBreaker_04.A_SkeletonMage_CombatIdleBreaker_04'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Idles/Breaker/A_SkeletonMage_CombatIdleBreaker_05.A_SkeletonMage_CombatIdleBreaker_05'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Idles/Breaker/A_SkeletonMage_CombatIdleBreaker_06.A_SkeletonMage_CombatIdleBreaker_06'", 0.7f, 1);
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Breaker/A_SkeletonMage_CombatWalkBreaker_01.A_SkeletonMage_CombatWalkBreaker_01'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Breaker/A_SkeletonMage_CombatWalkBreaker_02.A_SkeletonMage_CombatWalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Breaker/A_SkeletonMage_CombatWalkBreaker_03.A_SkeletonMage_CombatWalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Breaker/A_SkeletonMage_CombatWalkBreaker_04.A_SkeletonMage_CombatWalkBreaker_04'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Breaker/A_SkeletonMage_CombatWalkBreaker_05.A_SkeletonMage_CombatWalkBreaker_05'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Movement/Grounded/N/Breaker/A_SkeletonMage_CombatWalkBreaker_06.A_SkeletonMage_CombatWalkBreaker_06'", 1.0f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Skeleton_Mage_Combat::StaticClass();
    //
    
    // Equip
    default m_EquipData = UEquipData_Skeleton_Mage::StaticClass();

     // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =      UComboAttackConfig_Skeleton_Mage_Attack_MagicBeam::StaticClass();
   	default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_Skeleton_Mage_Attack_SummonSkeletons::StaticClass();
     default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Skeleton_Mage_Attack_MagicBeam::StaticClass();
     default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Skeleton_Mage_Attack_SoulHarvest::StaticClass();

    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =      UComboAttackConfig_Skeleton_Mage_Attack_SoulHarvest::StaticClass();
    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_Skeleton_Mage_Attack_SoulHarvest::StaticClass();
    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Skeleton_Mage_Attack_SoulHarvest::StaticClass();
    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Skeleton_Mage_Attack_SoulHarvest::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Skeleton_Mage::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_SkeletonMage::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_SkeletonMage::StaticClass();
    //
}

UCLASS()
class UAnimConfig_Skeleton_Mage : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();

	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Skeleton_Mage::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand, UWeaponMeleeItemAnimConfig_Skeleton_Mage_Combat::StaticClass());

    default AddAnimForItem(GameplayTag::Spell_Summon_Skeletons_SkeletonMage, USummonSkeletons_SkeletonMage::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_SoulHarvest, USoulHarvest_SkeletonMage::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_MagicBeam, UMagicBeam_SkeletonMage::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_Teleport_SkeletonMage, UTeleport_SkeletonMage::StaticClass());
}


UCLASS()
class USummonSkeletons_SkeletonMage : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SummoningSkeletons/A_SkeletonMage_SummoningSkeletons_New_v2_Montage.A_SkeletonMage_SummoningSkeletons_New_v2_Montage'";
    //default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_SkeletonMage_SummoningSkeletons_New_v2_Cast_FailureMontage.A_SkeletonMage_SummoningSkeletons_New_v2_Cast_FailureMontage'";
}

UCLASS()
class USoulHarvest_SkeletonMage : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SoulHarvest/A_SkeletonMage_SoulHarvest_Cast_Montage.A_SkeletonMage_SoulHarvest_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SoulHarvest/A_SkeletonMage_SoulHarvest_Cast_Failure_Montage.A_SkeletonMage_SoulHarvest_Cast_Failure_Montage'";
    
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SoulHarvest/A_SkeletonMage_SoulHarvest_Launch_Montage.A_SkeletonMage_SoulHarvest_Launch_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SoulHarvest/A_SkeletonMage_SoulHarvest_Launch_Failure_Montage.A_SkeletonMage_SoulHarvest_Launch_Failure_Montage'";
}

UCLASS()
class UMagicBeam_SkeletonMage : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/MagicBeam/A_SkeletonMage_MagicBeam_New_Cast_Montage.A_SkeletonMage_MagicBeam_New_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/MagicBeam/A_SkeletonMage_MagicBeam_New_Cast_Failure_Montage.A_SkeletonMage_MagicBeam_New_Cast_Failure_Montage'";
    
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/MagicBeam/A_SkeletonMage_MagicBeam_New_Launch_Montage.A_SkeletonMage_MagicBeam_New_Launch_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/MagicBeam/A_SkeletonMage_MagicBeam_New_Launch_Failure_Montage.A_SkeletonMage_MagicBeam_New_Launch_Failure_Montage'";
}


UCLASS()
class UTeleport_SkeletonMage : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/Teleport/A_SkeletonMage_Disappear_Cast_Montage.A_SkeletonMage_Disappear_Cast_Montage'";
    //default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/Teleport/A_SkeletonMage_Appear_Launch_Montage.A_SkeletonMage_Appear_Launch_Montage'";
}
