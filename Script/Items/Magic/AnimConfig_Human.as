
UCLASS(Abstract)
class UGenericRune_Human : USpellItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Magic/NH_MM_BipedMagicAnimBP.NH_MM_BipedMagicAnimBP_C'";

    //PickUps
    default m_PicksData = UPicksData_Human_ScrollRune::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_ScrollRune::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_ScrollRune::StaticClass();

    // Throw
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

    // TURNS
    default m_TurnsData = UTurnsData_Default_Human_Magic::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //
    
    //EQUIP 
    default m_EquipData = UEquipData_Human_Magic::StaticClass();

    // HITS
    default m_HitsData = UHitData_Rune_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Rune_Human::StaticClass();
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataRune_Human::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Rune::StaticClass();
    //

    default m_RotateSpeedMagnetAI = 500.0f;

    //default m_PrepareCastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Movement/A_Man_Spell_ScrollRune_In_Montage.A_Man_Spell_ScrollRune_In_Montage'";
}

UCLASS(Abstract)
class UGenericScroll_Human : USpellItemAnimConfig
{    
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Magic/NH_MM_BipedMagicAnimBP.NH_MM_BipedMagicAnimBP_C'";

    //EQUIP 
    default m_EquipData = UEquipData_Human_Magic::StaticClass();

    //PickUps
    default m_PicksData = UPicksData_Human_ScrollRune::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_ScrollRune::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_ScrollRune::StaticClass();

    // HITS
    default m_HitsData = UHitData_Rune_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Rune_Human::StaticClass();
    //

    // TURNS
    default m_TurnsData = UTurnsData_Default_Human_Magic::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataScroll_Human::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Scroll::StaticClass();
    //
    default m_RotateSpeedMagnetAI = 500.0f;
}

UCLASS()
class ULightRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_Cast_Montage.A_Man_Light_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_Cast_Failure_Montage.A_Man_Light_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_Cast_Failure_Montage.A_Man_Light_Cast_Failure_Montage'";
}

UCLASS()
class ULightScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Scroll_Light_Cast_Montage.A_Man_Scroll_Light_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_Cast_Failure_Montage.A_Man_Light_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_Cast_Failure_Montage.A_Man_Light_Cast_Failure_Montage'";
}

UCLASS()
class ULightCastToCancelSpell_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_TurnOff_Montage.A_Man_Light_TurnOff_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_Cast_Failure_Montage.A_Man_Light_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Light/A_Man_Light_Cast_Failure_Montage.A_Man_Light_Cast_Failure_Montage'";
}

UCLASS()
class UPyrokinesisRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Cast_Montage.A_Man_Pyrokinesis_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Cast_End_Montage.A_Man_Pyrokinesis_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Cast_Failure_Montage.A_Man_Pyrokinesis_Cast_Failure_Montage'";   
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Launch_Montage.A_Man_Pyrokinesis_Launch_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Launch_End_Montage.A_Man_Pyrokinesis_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Pyrokinesis_Launch_Failure_Montage.A_Man_Pyrokinesis_Launch_Failure_Montage'";
    
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Magic_Pyrokinesis::StaticClass();
}

UCLASS()
class UPyrokinesisScroll_Human : UPyrokinesisRune_Human
{
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Scroll_Pyrokinesis_Launch_End_Montage.A_Man_Scroll_Pyrokinesis_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Pyrokinesis/A_Man_Scroll_Pyrokinesis_Launch_Failure_Montage.A_Man_Scroll_Pyrokinesis_Launch_Failure_Montage'";
}

UCLASS()
class UHealRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Heal/A_Man_Heal_Cast_Montage.A_Man_Heal_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Heal/A_Man_Heal_Cast_End_Montage.A_Man_Heal_Cast_End_Montage'";   
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Heal/A_Man_Heal_Cast_Failure_Montage.A_Man_Heal_Cast_Failure_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Heal/A_Man_Heal_Launch_Montage.A_Man_Heal_Launch_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Heal/A_Man_Heal_Cast_End_Montage.A_Man_Heal_Cast_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Heal/A_Man_Heal_Launch_Failure_Montage.A_Man_Heal_Launch_Failure_Montage'";
    
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Relax;
}


UCLASS()
class UTeleportRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/A_Man_Teleport_Cast_Montage.A_Man_Teleport_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/A_Man_Teleport_Cast_Failure_Montage.A_Man_Teleport_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/A_Man_Teleport_Cast_Failure_Montage.A_Man_Teleport_Cast_Failure_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Teleport/A_Man_Teleport_Launch_End_Montage.A_Man_Teleport_Launch_End_Montage'";
}

UCLASS()
class UTransformScroll_Human : UGenericScroll_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Man_Transform_Cast_Montage.A_Man_Transform_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Man_Transform_Cast_End_Montage.A_Man_Transform_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Man_Transform_Cast_Failure_Montage.A_Man_Transform_Cast_Failure_Montage'";
}

UCLASS()
class UFearScroll_Human : UGenericScroll_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fear/A_Man_Fear_Cast_Montage.A_Man_Fear_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fear/A_Man_Fear_Cast_End_Montage.A_Man_Fear_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fear/A_Man_Fear_Cast_Failure_Montage.A_Man_Fear_Cast_Failure_Montage'";
}

UCLASS()
class UFireBoltRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Firebolt_Cast_Montage.A_Man_Firebolt_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Firebolt_Cast_End_Montage.A_Man_Firebolt_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Firebolt_Cast_Failure_Montage.A_Man_Firebolt_Cast_Failure_Montage'";
    
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Firebolt_Launch_Sections_Montage.A_Man_Firebolt_Launch_Sections_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Firebolt_Launch_End_Montage.A_Man_Firebolt_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Firebolt_Launch_Failure_Montage.A_Man_Firebolt_Launch_Failure_Montage'";
}

UCLASS()
class UFireBoltScroll_Human : UFireBoltRune_Human
{   
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Scroll_Firebolt_Launch_End_Montage.A_Man_Scroll_Firebolt_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firebolt/A_Man_Scroll_Firebolt_Launch_Failure_Montage.A_Man_Scroll_Firebolt_Launch_Failure_Montage'";
}

UCLASS()
class UFireBallRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/A_Man_Fireball_Cast_Montage.A_Man_Fireball_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/A_Man_Fireball_Cast_Failure_Montage.A_Man_Fireball_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/A_Man_Fireball_Cast_Failure_Montage.A_Man_Fireball_Cast_Failure_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/A_Man_Fireball_Launch_Montage.A_Man_Fireball_Launch_Montage'";

    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/A_Man_Fireball_Cast_Failure_Montage.A_Man_Fireball_Cast_Failure_Montage'";
}

UCLASS()
class UFireBallScroll_Human : UFireBallRune_Human
{
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/A_Man_Scroll_Fireball_Launch_Montage.A_Man_Scroll_Fireball_Launch_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/A_Man_Scroll_Fireball_Launch_Failure_Montage.A_Man_Scroll_Fireball_Launch_Failure_Montage'";
}

UCLASS()
class UIceBoltRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Icebolt_Cast_Montage.A_Man_Icebolt_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Icebolt_Cast_End_Montage.A_Man_Icebolt_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Icebolt_Cast_Failure_Montage.A_Man_Icebolt_Cast_Failure_Montage'";  
    
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Icebolt_Launch_Sections_Montage.A_Man_Icebolt_Launch_Sections_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Icebolt_Launch_End_Montage.A_Man_Icebolt_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Icebolt_Launch_Failure_Montage.A_Man_Icebolt_Launch_Failure_Montage'";
}

UCLASS()
class UIceBoltScroll_Human : UIceBoltRune_Human
{
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Scroll_Icebolt_Launch_End_Montage.A_Man_Scroll_Icebolt_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/Icebolt/A_Man_Scroll_Icebolt_Launch_Failure_Montage.A_Man_Scroll_Icebolt_Launch_Failure_Montage'";
}

UCLASS()
class UBallLightningRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/BallLightning/A_Man_BallLightning_Cast_Montage.A_Man_BallLightning_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/BallLightning/A_Man_BallLightning_Cast_Failure_Montage.A_Man_BallLightning_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/BallLightning/A_Man_BallLightning_Cast_Failure_Montage.A_Man_BallLightning_Cast_Failure_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/BallLightning/A_Man_BallLightning_Launch_Montage.A_Man_BallLightning_Launch_Montage'";
}

UCLASS()
class UBallLightningScroll_Human : UBallLightningRune_Human
{
   default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/BallLightning/A_Man_Scroll_BallLightning_Launch_Montage.A_Man_Scroll_BallLightning_Launch_Montage'";
}

UCLASS()
class UChainLightningRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLightning_Cast_Montage.A_Man_ChainLightning_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLightning_Cast_End_Montage.A_Man_ChainLightning_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLightning_Cast_Failure_Montage.A_Man_ChainLightning_Cast_Failure_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLightning_Launch_Montage.A_Man_ChainLightning_Launch_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLightning_Launch_End_Montage.A_Man_ChainLightning_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_ChainLightning_Launch_Failure_Montage.A_Man_ChainLightning_Launch_Failure_Montage'";

    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Magic_ChainLighting::StaticClass();
}

UCLASS()
class UChainLightningScroll_Human : UChainLightningRune_Human
{
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_Scroll_ChainLightning_Launch_End_Montage.A_Man_Scroll_ChainLightning_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Electric/ChainLightning/A_Man_Scroll_ChainLightning_Launch_Failure_Montage.A_Man_Scroll_ChainLightning_Launch_Failure_Montage'";
}

UCLASS()
class UStormOfFireRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/StormFire/A_Man_StormOfFire_Cast_Montage.A_Man_StormOfFire_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/StormFire/A_Man_StormOfFire_Cast_Failure_Montage.A_Man_StormOfFire_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/StormFire/A_Man_StormOfFire_Cast_Failure_Montage.A_Man_StormOfFire_Cast_Failure_Montage'";
}

UCLASS()
class UStormOfFireScroll_Human : UStormOfFireRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/StormFire/A_Man_Scroll_StormOfFire_Cast_Montage.A_Man_Scroll_StormOfFire_Cast_Montage'";
}

UCLASS()
class UFireRainRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firerain/A_Man_FireRain_Cast_Montage.A_Man_FireRain_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firerain/A_Man_FireRain_Cast_Failure_Montage.A_Man_FireRain_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firerain/A_Man_FireRain_Cast_Failure_Montage.A_Man_FireRain_Cast_Failure_Montage'";
}

UCLASS()
class UFireRainScroll_Human : UFireRainRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Firerain/A_Man_Scroll_FireRain_Cast_Montage.A_Man_Scroll_FireRain_Cast_Montage'";
}

UCLASS()
class UInnosPrayScroll_Human : UFireRainRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/InnosPray/A_Man_Scroll_InnosPray_Cast_Montage.A_Man_Scroll_InnosPray_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/InnosPray/A_Man_Scroll_InnosPray_Cast_Failure_Montage.A_Man_Scroll_InnosPray_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/InnosPray/A_Man_Scroll_InnosPray_Cast_Failure_Montage.A_Man_Scroll_InnosPray_Cast_Failure_Montage'";
}

UCLASS()
class UIceBlockRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceBlock/A_Man_IceBlock_Cast_Montage.A_Man_IceBlock_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceBlock/A_Man_IceBlock_Cast_Failure_Montage.A_Man_IceBlock_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceBlock/A_Man_IceBlock_Cast_Failure_Montage.A_Man_IceBlock_Cast_Failure_Montage'";
}

UCLASS()
class UIceBlockScroll_Human : UIceBlockRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceBlock/A_Man_Scroll_IceBlock_Cast_Montage.A_Man_Scroll_IceBlock_Cast_Montage'";
}

UCLASS()
class  UIceWaveRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceWave/A_Man_IceWave_Cast_Montage.A_Man_IceWave_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceWave/A_Man_IceWave_Cast_Failure_Montage.A_Man_IceWave_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceWave/A_Man_IceWave_Cast_Failure_Montage.A_Man_IceWave_Cast_Failure_Montage'";
}

UCLASS()
class  UIceWaveScroll_Human : UIceWaveRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Ice/IceWave/A_Man_Scroll_IceWave_Cast_Montage.A_Man_Scroll_IceWave_Cast_Montage'";
}

UCLASS()
class  UFistOfWindRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/FistOfWind/A_Man_FistOfWind_Cast_Montage.A_Man_FistOfWind_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/FistOfWind/A_Man_FistOfWind_Cast_Failure_Montage.A_Man_FistOfWind_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/FistOfWind/A_Man_FistOfWind_Cast_Failure_Montage.A_Man_FistOfWind_Cast_Failure_Montage'";
}

UCLASS()
class  UFistOfWindScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/FistOfWind/A_Man_Scroll_FistOfWind_Cast_Montage.A_Man_Scroll_FistOfWind_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/FistOfWind/A_Man_FistOfWind_Cast_Failure_Montage.A_Man_FistOfWind_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/FistOfWind/A_Man_FistOfWind_Cast_Failure_Montage.A_Man_FistOfWind_Cast_Failure_Montage'";
}

UCLASS()
class  UStormFistRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/StormFist/A_Man_StormFist_Cast_Montage.A_Man_StormFist_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/StormFist/A_Man_StormFist_Cast_Failure_Montage.A_Man_StormFist_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/StormFist/A_Man_StormFist_Cast_Failure_Montage.A_Man_StormFist_Cast_Failure_Montage'";
}

UCLASS()
class  UStormFistScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/StormFist/A_Man_Scroll_StormFist_Cast_Montage.A_Man_Scroll_StormFist_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/StormFist/A_Man_StormFist_Cast_Failure_Montage.A_Man_StormFist_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/StormFist/A_Man_StormFist_Cast_Failure_Montage.A_Man_StormFist_Cast_Failure_Montage'";
}

UCLASS()
class  UBreathOfDeathRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/BreathOfDeath/A_Man_BreathOfDeath_Cast_Montage.A_Man_BreathOfDeath_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/BreathOfDeath/A_Man_BreathOfDeath_Cast_Failure_Montage.A_Man_BreathOfDeath_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Wind/BreathOfDeath/A_Man_BreathOfDeath_Cast_Failure_Montage.A_Man_BreathOfDeath_Cast_Failure_Montage'";
}

UCLASS()
class UCharmRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Charm/A_Man_Charm_Cast_Montage.A_Man_Charm_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Charm/A_Man_Charm_Cast_End_Montage.A_Man_Charm_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Charm/A_Man_Charm_Cast_Failure_Montage.A_Man_Charm_Cast_Failure_Montage'";

    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Relax;
}

UCLASS()
class USleepRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleep/A_Man_Sleep_Cast_Montage.A_Man_Sleep_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleep/A_Man_Sleep_Cast_End_Montage.A_Man_Sleep_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleep/A_Man_Sleep_Cast_Failure_Montage.A_Man_Sleep_Cast_Failure_Montage'";
    
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Relax;
}

UCLASS()
class UControlRune_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Control_Cast_Montage.A_Man_Control_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Control_Cast_Failure_Montage.A_Man_Control_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Control_Cast_Failure_Montage.A_Man_Control_Cast_Failure_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Control_Launch_Montage.A_Man_Control_Launch_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Control_Launch_End_Montage.A_Man_Control_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Control_Launch_Failure_Montage.A_Man_Control_Launch_Failure_Montage'";
    
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Relax;
}

UCLASS()
class UControlScroll_Human : UControlRune_Human
{
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Scroll_Control_Launch_End_Montage.A_Man_Scroll_Control_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Scroll_Control_Launch_Failure_Montage.A_Man_Scroll_Control_Launch_Failure_Montage'";
    
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Relax;
}

UCLASS()
class USummonSkeletonsScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Skeletons_Cast_Montage.A_Man_Summon_Skeletons_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
}

UCLASS()
class USummonArmyOfDarknessScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_ArmyOfDarkness_Cast_Montage.A_Man_Summon_ArmyOfDarkness_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
}

UCLASS()
class USummonGolemScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Golem_Cast_Montage.A_Man_Summon_Golem_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
}

UCLASS()
class USummonDemonScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Demon_Cast_Montage.A_Man_Summon_Demon_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Man_Summon_Cast_Failure_Montage.A_Man_Summon_Cast_Failure_Montage'";
}

UCLASS()
class UTelekinesis_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Cast_Montage.A_Man_Telekinesis_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Cast_End_Montage.A_Man_Telekinesis_Cast_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Cast_Failure_Montage.A_Man_Telekinesis_Cast_Failure_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Launch_Montage.A_Man_Telekinesis_Launch_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Launch_End_Montage.A_Man_Telekinesis_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Launch_Failure_Montage.A_Man_Telekinesis_Launch_Failure_Montage'";
    default m_CustomLaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Launch_PickUp_End_Montage.A_Man_Telekinesis_Launch_PickUp_End_Montage'";
}

UCLASS()
class UUrizielWaveOfDeath_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/UrizielWaveOfDeath/A_Man_UrizielWaveOfDeath_Cast_Montage.A_Man_UrizielWaveOfDeath_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/UrizielWaveOfDeath/A_Man_UrizielWaveOfDeath_Cast_Failure_Montage.A_Man_UrizielWaveOfDeath_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/UrizielWaveOfDeath/A_Man_UrizielWaveOfDeath_Cast_Failure_Montage.A_Man_UrizielWaveOfDeath_Cast_Failure_Montage'";
}

UCLASS()
class UUrizielWaveOfDeathCastToCancelSpell_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/UrizielWaveOfDeath/A_Man_UrizielWaveOfDeath_TurnOff_Montage.A_Man_UrizielWaveOfDeath_TurnOff_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/UrizielWaveOfDeath/A_Man_UrizielWaveOfDeath_Cast_Failure_Montage.A_Man_UrizielWaveOfDeath_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/UrizielWaveOfDeath/A_Man_UrizielWaveOfDeath_Cast_Failure_Montage.A_Man_UrizielWaveOfDeath_Cast_Failure_Montage'";
}

UCLASS()
class  UDeathToTheUndead_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/DeathToTheUndead/A_Man_DeathToTheUndead_Cast_Montage.A_Man_DeathToTheUndead_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/DeathToTheUndead/A_Man_DeathToTheUndead_Cast_Failure_Montage.A_Man_DeathToTheUndead_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/DeathToTheUndead/A_Man_DeathToTheUndead_Cast_Failure_Montage.A_Man_DeathToTheUndead_Cast_Failure_Montage'";
}

UCLASS()
class UShrinkScroll_Human : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Shrink/A_Man_Shrink_Cast_Montage.A_Man_Shrink_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Shrink/A_Man_Shrink_Cast_Failure_Montage.A_Man_Shrink_Cast_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Shrink/A_Man_Shrink_Cast_Failure_Montage.A_Man_Shrink_Cast_Failure_Montage'";
}