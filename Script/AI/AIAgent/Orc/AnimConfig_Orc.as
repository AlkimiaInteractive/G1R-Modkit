
UCLASS()
class UDefault_Orc : UItemAnimConfig
{
    
    // TURNS
    default m_TurnsData = UTurnsData_Orc::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Orc::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc::StaticClass();
    //

	// DODGE
    default m_DodgesData = UDodgesData_Default_Orc::StaticClass();
    //

    // CONSUME
    default m_ConsumablesData = UConsumablesData_Orc::StaticClass();
    //

    //PICKUPS
    default m_PicksData = UPicksData_Orc::StaticClass();
}

UCLASS()
class UAnimConfig_Orc : UAnimConfig
{
    // Anim system for each item category
	default SetDefaultMovementAnimData(UDefault_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Sword_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Sword::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Axe::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Mace_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Mace::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Mace::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand_Spell, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Fist, UWeaponMeleeItemAnimConfig_Orc_Combat_Fists::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_WatchFight, UWeaponMeleeItemAnimConfig_Orc_WatchFight::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Orc_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Orc_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile_Right, UProjectile_Orc_ThrowRock::StaticClass());
    // default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_Orc::StaticClass());

    //----TEST
    // default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    // default AddAnimForItem(GameplayTag::Item_Weapon_Axe_OneHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    // default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Tail, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Claw, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    // default AddAnimForItem(GameplayTag::Item_Weapon_PickaxeDemo, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Foot, UWeaponMeleeItemAnimConfig_Orc_FakeNoWeapon::StaticClass());
    //----END TEST

    //default AddAnimForItem(GameplayTag::Item_Weapon_Rune_StormFire, UStormOfFireRune_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_Fireball, UFireBallSpell_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_StormOfFire, UStormOfFireSpell_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_BreathOfDeath, UBreathOfDeathSpell_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_BallLightning, UBallLightningSpell_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_Pyrokinesis, UPyrokinesisSpell_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_ChainLightning, UChainLightning_Orc::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_Firewall, UFirewall_Orc::StaticClass());

    default AddAnimForAction(GameplayTag::Action_Door_OrcSecretDoor, UInteractAnimConfig_Door_OrcSecretDoor::StaticClass());

    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();
}

UCLASS()
class UAnimConfig_UndeadOrc : UAnimConfig_Orc
{
    default AddAnimForItem(GameplayTag::Item_Weapon_Fist, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Fists::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Sword_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Sword::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Axe::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Mace::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Mace_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Mace::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Staff, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand_Spell, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Staff::StaticClass());
}

UCLASS()
class UAnimConfig_Orc_Shaman : UAnimConfig_Orc
{
    default AddAnimForItem(GameplayTag::Item_Weapon_Fist, UWeaponMeleeItemAnimConfig_Orc_Shaman_Combat_Fists::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Sword_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Sword::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Axe::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Mace::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Mace_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Mace::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Staff, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand_Spell, UWeaponMeleeItemAnimConfig_Orc_Combat_Staff::StaticClass());
}

UCLASS()
class UAnimConfig_UndeadOrc_Shaman : UAnimConfig_Orc
{
    default AddAnimForItem(GameplayTag::Item_Weapon_Fist, UWeaponMeleeItemAnimConfig_UndeadOrc_Shaman_Combat_Fists::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Sword_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Sword::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Axe::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Mace::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Mace_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Mace::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Staff, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Staff::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Staff_TwoHand_Spell, UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Staff::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Door_OrcSecretDoor : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Orc_Town_Secret_Door/OrcM_Orc_Town_Secret_Door_Montage.OrcM_Orc_Town_Secret_Door_Montage'";
}