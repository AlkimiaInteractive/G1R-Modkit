UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Staff : UWeaponMeleeItemAnimConfig
{
    default m_BlockMontage = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Idles/Transitions/A_OrcM_Sff1H_Idle_to_IB_Montage.A_OrcM_Sff1H_Idle_to_IB_Montage'";

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/OrcM_Sff1H_AnimBP.OrcM_Sff1H_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Orc_Combat_Staff::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Orc_Sff1H::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Orc_Sff1H::StaticClass();
    
    //DRAWS
    default m_EquipData = UEquipData_Orc_Staff::StaticClass();

    // PARRIES
    // default m_ParriesData = UParriesData_S1H_Tr_Human::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc_Combat::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Orc_Staff::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Orc_Staff::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Orc_Staff::StaticClass();

    //SPEED COMBAT
    default m_SpeedsPlayer = USpeedConfig_Orc_Combat::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Orc_Combat::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Orc_Sff1H_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Orc_Sff1H_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Orc_Sff1H_R01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Orc_Sff1H_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Orc_Magic_FireBall::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =    UAttack_Orc_Sff1H_Fake_Fireball::StaticClass();
    //
}

UCLASS()
class UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Staff : UWeaponMeleeItemAnimConfig_Orc_Combat_Staff
{
    // TAUNTS
    default m_TauntData = UTauntData_UndeadOrc_Staff::StaticClass();
}

UCLASS()
class UProjectile_Orc : UItemAnimConfig
{
    default m_EquipData = UEquipData_Orc_Staff_Projectile::StaticClass();
}

// ------- TEST-----

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_Test : UWeaponMeleeItemAnimConfig
{
    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/OrcM_Sff1H_AnimBP.OrcM_Sff1H_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Orc_Combat::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Orc_Sff1H::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Orc_Sff1H::StaticClass();
    
    //DRAWS
    default m_EquipData = UEquipData_Orc_Staff::StaticClass();

    // PARRIES
    // default m_ParriesData = UParriesData_S1H_Tr_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Orc_Staff::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Orc_Staff::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Orc_Staff::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Orc_Sff1H_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Orc_Sff1H_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Orc_Sff1H_R01::StaticClass();
    //
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_Pyrokinesis : UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_Test
{
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =    UAttack_Orc_Sff1H_Fake_Pyrokinesis::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =    UAttack_Orc_Magic_Pyrokinesis::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_BallLighting : UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_Test
{
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =    UAttack_Orc_Sff1H_Fake_BallLighting::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =    UAttack_Orc_Magic_BallLightning::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_ChainLighting : UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_Test
{
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =    UAttack_Orc_Sff1H_Fake_ChainLighting::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =    UAttack_Orc_Magic_ChainLighting::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_StormOfFire : UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_Test
{
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =    UAttack_Orc_Sff1H_Fake_StormOfFire::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =    UAttack_Orc_Magic_StormOfFire::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_BreathOfDeath : UWeaponMeleeItemAnimConfig_Orc_Combat_Staff_Test
{
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =    UAttack_Orc_Sff1H_Fake_BreathOfDeath::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =    UAttack_Orc_Magic_BreathOfDeath::StaticClass();
}

UCLASS()
class UGenericRune_Orc : UGenericRune_Human
{
    default m_OverrideLocomotionConfig = true;

    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc_Combat::StaticClass();
    //
}

UCLASS()
class UFireBallSpell_Orc : UGenericRune_Orc
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/FireBall/A_OrcM_Sff1H_A_Spc_FireBall_Cast_Montage.A_OrcM_Sff1H_A_Spc_FireBall_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/FireBall/A_OrcM_Sff1H_A_Spc_FireBall_CastFail_Montage.A_OrcM_Sff1H_A_Spc_FireBall_CastFail_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/FireBall/A_OrcM_Sff1H_A_Spc_FireBall_Launch_Montage.A_OrcM_Sff1H_A_Spc_FireBall_Launch_Montage'";

    // default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/FireBall/A_OrcM_Sff1H_A_Spc_FireBall_Cast_Montage_v2.A_OrcM_Sff1H_A_Spc_FireBall_Cast_Montage_v2'";
    // default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/FireBall/A_OrcM_Sff1H_A_Spc_FireBall_CastFail_Montage_v2.A_OrcM_Sff1H_A_Spc_FireBall_CastFail_Montage_v2'";
    // default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/FireBall/A_OrcM_Sff1H_A_Spc_FireBall_Launch_Montage_v2.A_OrcM_Sff1H_A_Spc_FireBall_Launch_Montage_v2'";
}

UCLASS()
class UStormOfFireSpell_Orc : UGenericRune_Orc
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire/A_OrcM_Sff1H_A_Spc_StormOfFire_Cast_Montage.A_OrcM_Sff1H_A_Spc_StormOfFire_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire/A_OrcM_Sff1H_A_Spc_StormOfFire_CastFail_Montage.A_OrcM_Sff1H_A_Spc_StormOfFire_CastFail_Montage'";

    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc_Combat_Magic_StormOfFire::StaticClass();
    //
}


UCLASS()
class UBreathOfDeathSpell_Orc : UGenericRune_Orc
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/BreathOfDeath/A_OrcM_Sff1H_A_Spc_BreathOfDeath_Cast_Montage.A_OrcM_Sff1H_A_Spc_BreathOfDeath_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/BreathOfDeath/A_OrcM_Sff1H_A_Spc_BreathOfDeath_CastFail_Montage.A_OrcM_Sff1H_A_Spc_BreathOfDeath_CastFail_Montage'";
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc_Combat_Magic_BreathOfDeath::StaticClass();
    //
}

UCLASS()
class UBallLightningSpell_Orc : UGenericRune_Orc
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/BallLightning/A_OrcM_Sff1H_A_Spc_BallLightning_Cast_Montage.A_OrcM_Sff1H_A_Spc_BallLightning_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/BallLightning/A_OrcM_Sff1H_A_Spc_BallLightning_CastFail_Montage.A_OrcM_Sff1H_A_Spc_BallLightning_CastFail_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/BallLightning/A_OrcM_Sff1H_A_Spc_BallLightning_Launch_Montage.A_OrcM_Sff1H_A_Spc_BallLightning_Launch_Montage'";

    // LOCOMOTION ANIM SETS
    //default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc_Combat_Magic_BallLighting::StaticClass();
    //
}

UCLASS()
class UPyrokinesisSpell_Orc : UGenericRune_Orc
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Cast_Montage.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Cast_End_Montage.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_CastFail_Montage.A_OrcM_Sff1H_A_Spc_Pyrokinesis_CastFail_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Launch_Montage.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Launch_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Launch_End_Montage.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Pyrokinesis/A_OrcM_Sff1H_A_Spc_Pyrokinesis_LaunchFail_Montage.A_OrcM_Sff1H_A_Spc_Pyrokinesis_LaunchFail_Montage'";

    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc_Combat_Magic_Pyrokinesis::StaticClass();
    //
}

UCLASS()
class UChainLightning_Orc : UGenericRune_Orc
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_Cast_Montage.A_OrcM_Sff1H_A_Spc_ChainLighting_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_Cast_End_Montage.A_OrcM_Sff1H_A_Spc_ChainLighting_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_CastFail_Montage.A_OrcM_Sff1H_A_Spc_ChainLighting_CastFail_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_Launch_Montage.A_OrcM_Sff1H_A_Spc_ChainLighting_Launch_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_Launch_End_Montage.A_OrcM_Sff1H_A_Spc_ChainLighting_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/ChainLighting/A_OrcM_Sff1H_A_Spc_ChainLighting_LaunchFail_Montage.A_OrcM_Sff1H_A_Spc_ChainLighting_LaunchFail_Montage'";
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Orc_Combat_Magic_ChainLighting::StaticClass();
    //
}

UCLASS()
class UFirewall_Orc : UGenericRune_Orc
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Firewall/PH_OrcM_Sff1H_A_Spc_Firewall_Cast_Montage.PH_OrcM_Sff1H_A_Spc_Firewall_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/Firewall/PH_OrcM_Sff1H_A_Spc_Firewall_CastFail_Montage.PH_OrcM_Sff1H_A_Spc_Firewall_CastFail_Montage'";
}
