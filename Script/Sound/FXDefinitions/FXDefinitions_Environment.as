
class UGothicFXDefinition_Flame_Lit_Small : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Flames_Lit_Small;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_IgniteS_01.SFX_OBJ_Fire_IgniteS_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Flame_Lit_Medium : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Flames_Lit_Medium;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_IgniteM_01.SFX_OBJ_Fire_IgniteM_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Flame_Lit_Large : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Flames_Lit_Large;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_IgniteL_01.SFX_OBJ_Fire_IgniteL_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Flame_Extinguish_Small : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Flames_Extinguish_Small;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_ExtinguishS_01.SFX_OBJ_Fire_ExtinguishS_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Flame_Extinguish_Medium : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Flames_Extinguish_Medium;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_ExtinguishM_01.SFX_OBJ_Fire_ExtinguishM_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Flame_Extinguish_Large : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Flames_Extinguish_Large;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_ExtinguishL_01.SFX_OBJ_Fire_ExtinguishL_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Ice_Melting : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Ice_Melting;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Ice/SFX_OBJ_Ice_Melting_01.SFX_OBJ_Ice_Melting_01'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_Ice_MeltingByFire : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Ice_MeltingFire;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Ice/SFX_OBJ_Ice_MeltingByFire_01.SFX_OBJ_Ice_MeltingByFire_01'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_SleeperDream_Mine_WallExplosion : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Explosion_Wall_SleeperDream_Mine;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/ExplosiveWall/SFX_OBJ_ExplosiveWall_Boom_01.SFX_OBJ_ExplosiveWall_Boom_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Stonehenge_Arm_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_Arm_Hit;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_TargetHit_01.SFX_OBJ_StonehengeApparatus_TargetHit_01'";
    default bIsInstantEffect = true;

    UPROPERTY()
    FName m_SocketName = n"BeamOriginSocket";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        TargetSockets.FindOrAdd(m_SocketName, FVector::ZeroVector);
    }
}

class UGothicFXDefinition_Stonehenge_Arm_Ray_Start : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_Arm_Ray_Start;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_BeamStart_01.SFX_OBJ_StonehengeApparatus_BeamStart_01'";
    default bIsInstantEffect = true;

    UPROPERTY()
    FName m_SocketName = n"BeamOriginSocket";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        TargetSockets.FindOrAdd(m_SocketName, FVector::ZeroVector);
    }
}

class UGothicFXDefinition_Stonehenge_Arm_Ray_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_Arm_Ray_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_BeamLoop_01.SFX_OBJ_StonehengeApparatus_BeamLoop_01'";
    default bIsInstantEffect = false;

    UPROPERTY()
    FName m_SocketName = n"BeamOriginSocket";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        auto skeletalMesh = USkeletalMeshComponent::Get(Instigator);
        TargetSockets.FindOrAdd(m_SocketName, FVector::ZeroVector);
    }
}

class UGothicFXDefinition_Stonehenge_Arm_Ray_Trail : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_Arm_Ray_Trail;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_TargetTrail_01.SFX_OBJ_StonehengeApparatus_TargetTrail_01'";
    default bIsInstantEffect = false;

    UPROPERTY()
    FName m_SocketName = n"BeamOriginSocket";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        auto skeletalMesh = USkeletalMeshComponent::Get(Instigator);
        TargetSockets.FindOrAdd(m_SocketName, FVector::ZeroVector);
    }
}

class UGothicFXDefinition_Stonehenge_Arm_Ray_Reset : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_Arm_Reset;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_TargetReset_01.SFX_OBJ_StonehengeApparatus_TargetReset_01'";
    default bIsInstantEffect = true;

    UPROPERTY()
    FName m_SocketName = n"BeamOriginSocket";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        auto skeletalMesh = USkeletalMeshComponent::Get(Instigator);
        TargetSockets.FindOrAdd(m_SocketName, FVector::ZeroVector);
    }
}


class UGothicFXDefinition_Stonehenge_Active_Start : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_Active_Start;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_Activate_01.SFX_OBJ_StonehengeApparatus_Activate_01'";
    default bIsInstantEffect = true;

    UPROPERTY()
    FName m_SocketName = n"focus_socket";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        auto skeletalMesh = USkeletalMeshComponent::Get(Instigator);
        TargetSockets.FindOrAdd(m_SocketName, FVector::ZeroVector);
    }
}

class UGothicFXDefinition_Stonehenge_Active_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_Active_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_ActiveLoop_01.SFX_OBJ_StonehengeApparatus_ActiveLoop_01'";
    default bIsInstantEffect = false;

    UPROPERTY()
    FName m_SocketName = n"focus_socket";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        auto skeletalMesh = USkeletalMeshComponent::Get(Instigator);
        TargetSockets.FindOrAdd(m_SocketName, FVector::ZeroVector);
    }
}

class UGothicFXDefinition_Stonehenge_FocusStone_Levitating_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Stonehenge_FocusStone_Levitating_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/StonehengeApparatus/SFX_OBJ_StonehengeApparatus_FocusLoop_01.SFX_OBJ_StonehengeApparatus_FocusLoop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_TelekinesisBridge_Pull_Start : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_TelekinesisBridge_Pull_Start;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/TelekinesisBridge/SFX_OBJ_TelekinesisBridge_PullStart_01.SFX_OBJ_TelekinesisBridge_PullStart_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_TelekinesisBridge_Pull_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_TelekinesisBridge_Pull_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/TelekinesisBridge/SFX_OBJ_TelekinesisBridge_PullLoop_01.SFX_OBJ_TelekinesisBridge_PullLoop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_TelekinesisBridge_Pull_Stop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_TelekinesisBridge_Pull_Stop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/TelekinesisBridge/SFX_OBJ_TelekinesisBridge_PullEnd_01.SFX_OBJ_TelekinesisBridge_PullEnd_01'";
    default bIsInstantEffect = true;
}


class UGothicFXDefinition_BattleBarrier_Wall_Close : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_Wall_Close;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Environment/BattleArenaWall/SFX_MAGIC_ENV_BattleArenaWall_Close_01.SFX_MAGIC_ENV_BattleArenaWall_Close_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_BattleBarrier_Wall_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_Wall_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Environment/BattleArenaCircle/SFX_MAGIC_ENV_BattleArenaCircle_Loop_01.SFX_MAGIC_ENV_BattleArenaCircle_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_BattleBarrier_Wall_Open : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_Wall_Open;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Environment/BattleArenaWall/SFX_MAGIC_ENV_BattleArenaWall_Open_01.SFX_MAGIC_ENV_BattleArenaWall_Open_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_BattleBarrier_Wall_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_Wall_Hit;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_ImpactM_01.SFX_Magic_Lightning_ImpactM_01'";
    default bIsInstantEffect = true;
}


class UGothicFXDefinition_BattleBarrier_Circle_Close : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_Circle_Close;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Environment/BattleArenaCircle/SFX_MAGIC_ENV_BattleArenaCircle_Appear_01.SFX_MAGIC_ENV_BattleArenaCircle_Appear_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_BattleBarrier_Circle_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_Circle_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Environment/BattleArenaCircle/SFX_MAGIC_ENV_BattleArenaCircle_Loop_01.SFX_MAGIC_ENV_BattleArenaCircle_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_BattleBarrier_Circle_Open : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_Circle_Open;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Environment/BattleArenaCircle/SFX_MAGIC_ENV_BattleArenaCircle_Vanish_01.SFX_MAGIC_ENV_BattleArenaCircle_Vanish_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_BattleBarrier_SandTornado_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_BattleBarrier_SandTornado_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/SandTornado/SFX_OBJ_SandTornado_01.SFX_OBJ_SandTornado_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_MinecrawlerWall_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_MinecrawlerWall_Hit;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/MinecrawlerWall/SFX_OBJ_MinecrawlerWall_Hit_01.SFX_OBJ_MinecrawlerWall_Hit_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_MinecrawlerWall_Collapse : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_MinecrawlerWall_Collapse;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/MinecrawlerWall/SFX_OBJ_MinecrawlerWall_Collapse_01.SFX_OBJ_MinecrawlerWall_Collapse_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Lava_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Lava_Hit;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lava/SFX_OBJ_Lava_Hit_01.SFX_OBJ_Lava_Hit_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Weather_LightningStrike : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Weather_LightningStrike;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/World/Weather/SFX_WORLD_Weather_LightningStrike_01.SFX_WORLD_Weather_LightningStrike_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Blood_Fountain_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Blood_Fountain_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Blood/SFX_OBJ_Blood_Fountain_Loop_01.SFX_OBJ_Blood_Fountain_Loop_01'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_AdanosShrine_WaterChannels_FlowLoop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_AdanosShrine_WaterChannels_FlowLoop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/AdanosShrine/SFX_OBJ_AdanosShrine_WaterChannels_FlowLoop.SFX_OBJ_AdanosShrine_WaterChannels_FlowLoop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_AdanosShrine_StatueFountain_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_AdanosShrine_StatueFountain_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/AdanosShrine/SFX_OBJ_AdanosShrine_StatueFountain_Loop.SFX_OBJ_AdanosShrine_StatueFountain_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_AdanosShrine_ContainerWaterLevel_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_AdanosShrine_ContainerWaterLevel_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/AdanosShrine/SFX_OBJ_AdanosShrine_ContainerWaterLevel_Loop.SFX_OBJ_AdanosShrine_ContainerWaterLevel_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_AdanosShrine_WaterPool_Flush : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_AdanosShrine_WaterPool_Flush; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/AdanosShrine/SFX_OBJ_AdanosShrine_WaterPool_Flush.SFX_OBJ_AdanosShrine_WaterPool_Flush'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_LavaExtractor_FloorLoop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_LavaExtractor_FloorLoop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/LavaExtractor/SFX_OBJ_LavaExtractor_FloorLoop.SFX_OBJ_LavaExtractor_FloorLoop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_LavaExtractor_Activate : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_LavaExtractor_Activate; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/LavaExtractor/SFX_OBJ_LavaExtractor_Activate.SFX_OBJ_LavaExtractor_Activate'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_SleeperDream_Gorn_ElectrifiedCell_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_Gorn_Electrified_Cell_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Gorn_ElectrifiedFloor_Loop.SFX_VISION_Gorn_ElectrifiedFloor_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_SleeperDream_Gorn_ElectrifiedOreMountain_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_Gorn_Electrified_OreMountain_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Gorn_OreMountain.SFX_VISION_Gorn_OreMountain'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_SleeperDream_Milten_Brazier_Ignite : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_Milten_Brazier_Ignite; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Milten_BrazierIgnite.SFX_VISION_Milten_BrazierIgnite'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_SleeperDream_Milten_Brazier_Collapse : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_Milten_Brazier_Collapse; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Milten_BrazierCollapse.SFX_VISION_Milten_BrazierCollapse'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_SleeperDream_Milten_Brazier_Bonfire_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_Milten_Brazier_Bonfire_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Fire/SFX_OBJ_Fire_Campfire_BurnLoop.SFX_OBJ_Fire_Campfire_BurnLoop'";
    default bIsInstantEffect = false;
}



class UGothicFXDefinition_SleeperDream_Milten_Brazier_Flamethrower_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_Milten_Brazier_Flamethrower_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Milten_Flamethrower_Loop.SFX_VISION_Milten_Flamethrower_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_SleeperDream_Xardas_Ruby_Break : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_Xardas_Ruby_Break; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Xardas_GlassBreak.SFX_VISION_Xardas_GlassBreak'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_SleeperDream_InvulnerableVisual_Activate : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_InvulnerableVisual_Activate; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Shield_Activate.SFX_VISION_Shield_Activate'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_SleeperDream_InvulnerableVisual_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_InvulnerableVisual_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Shield_Loop.SFX_VISION_Shield_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_SleeperDream_InvulnerableVisual_Deactivate : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_SleeperDream_InvulnerableVisual_Deactivate; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/SleeperVisions/SFX_VISION_Shield_Deactivate.SFX_VISION_Shield_Deactivate'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Bonfire_Environment_Damage : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Bonfire_Damage; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/EnvironmentDamage/SFX_PHYSICS_EnvDamage_Fire.SFX_PHYSICS_EnvDamage_Fire'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Magic_Wall_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Magic_Wall_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Environment/MagicPortal/SFX_MAGIC_ENV_MagicPortal_Loop.SFX_MAGIC_ENV_MagicPortal_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Lava_Ignite : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Lava_Ignite;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lava/SFX_OBJ_Lava_IgniteScene.SFX_OBJ_Lava_IgniteScene'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Blood_Wall_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Blood_Wall_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/World/Temple/SFX_WORLD_Temple_Blood_Wall.SFX_WORLD_Temple_Blood_Wall'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_Blood_Wall_Explode : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Blood_Wall_Explode; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Blood/SFX_OBJ_Blood_Explode.SFX_OBJ_Blood_Explode'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Blood_Fountain_Tank_Fill_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Blood_Fountain_Tank_Fill_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Blood/SFX_OBJ_Blood_Cylinder_Fill_Loop.SFX_OBJ_Blood_Cylinder_Fill_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Blood_Fountain_Tank_Spill_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Blood_Fountain_Tank_Spill_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Blood/SFX_OBJ_Blood_Cylinder_Spill_Loop.SFX_OBJ_Blood_Cylinder_Spill_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Uriziel_Barrier_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Barrier_Loop;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/World/Temple/SFX_WORLD_Temple_Uriziel_Barrier.SFX_WORLD_Temple_Uriziel_Barrier'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_Uriziel_Beam_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Beam_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/World/Temple/SFX_WORLD_Temple_Uriziel_Beam.SFX_WORLD_Temple_Uriziel_Beam'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_Uriziel_Bridge_Activation : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Bridge_Activation; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/UrizielLightBridge/SFX_OBJ_UrizielLightBridge_AccentBig.SFX_OBJ_UrizielLightBridge_AccentBig'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Uriziel_Bridge_Activation_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Bridge_Activation_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/UrizielLightBridge/SFX_OBJ_UrizielLightBridge_BridgeLoop.SFX_OBJ_UrizielLightBridge_BridgeLoop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Uriziel_Bridge_Door_SoulConsumption_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Bridge_Door_SoulConsumption_Loop; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/UrizielLightBridge/SFX_OBJ_UrizielLightBridge_SuctionLoop.SFX_OBJ_UrizielLightBridge_SuctionLoop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Uriziel_Bridge_Door_SoulConsumption_End : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Bridge_Door_SoulConsumption_End; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/UrizielLightBridge/SFX_OBJ_UrizielLightBridge_AccentSmall.SFX_OBJ_UrizielLightBridge_AccentSmall'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Uriziel_Bridge_Door_SoulConsumption_Dissolve : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Bridge_Door_SoulConsumption_Dissolve; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/UrizielLightBridge/SFX_OBJ_UrizielLightBridge_Dissolve.SFX_OBJ_UrizielLightBridge_Dissolve'";
    default bIsInstantEffect = true;
}


class UGothicFXDefinition_Uriziel_Bridge_Door_SoulConsumption_Completed : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Bridge_Door_SoulConsumption_Completed; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/UrizielLightBridge/SFX_OBJ_UrizielLightBridge_Crack.SFX_OBJ_UrizielLightBridge_Crack'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Uriziel_Temple_Implosion: UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Temple_Implosion; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/World/Temple/SFX_WORLD_Temple_Uriziel_Phase_Implosion.SFX_WORLD_Temple_Uriziel_Phase_Implosion'";
    default bIsInstantEffect = true;
}


class UGothicFXDefinition_Uriziel_Temple_Suction: UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_Uriziel_Temple_Suction; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/World/Temple/SFX_WORLD_Temple_Uriziel_Phase_Suction.SFX_WORLD_Temple_Uriziel_Phase_Suction'";
    default bIsInstantEffect = true;
}


class UGothicFXDefinition_InExtremo_Concert: UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_InExtremo_Concert; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/MUSIC/Cutscenes/MUSIC_chapter2.MUSIC_chapter2'";
    default bIsInstantEffect = false;
}





