
class UGothicFXDefinition_Human_Spell_FloatingRune : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Rune_Floating;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Runes/SFX_Magic_Runes_FlyAround_01.SFX_Magic_Runes_FlyAround_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Human_Spell_FireRain : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_FireRain;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireRain/SFX_Magic_FireRain_Rain_01.SFX_Magic_FireRain_Rain_01'";
}

class UGothicFXDefinition_Human_Spell_IceBolt : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_IceBolt_HoldLoop;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/IceBolt/SFX_Magic_IceBolt_Hold_Loop_01.SFX_Magic_IceBolt_Hold_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Human_Spell_FireBall_Hold : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_FireBall_HoldLoop;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_Hold_Loop_01.SFX_Magic_FireBall_Hold_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Human_Spell_FireBall_Launch_1 : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level1;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_Cast_LaunchS_01.SFX_Magic_FireBall_Cast_LaunchS_01'";
}

class UGothicFXDefinition_Human_Spell_FireBall_Launch_2 : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level2;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_Cast_LaunchM_01.SFX_Magic_FireBall_Cast_LaunchM_01'";
}

class UGothicFXDefinition_Human_Spell_FireBall_Launch_3 : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level3;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_Cast_LaunchL_01.SFX_Magic_FireBall_Cast_LaunchL_01'";
}

class UGothicFXDefinition_Human_Spell_FistOfWind : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_FistOfWind_Launch;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/WindFist/SFX_Magic_WindFist_Cast_Launch_01.SFX_Magic_WindFist_Cast_Launch_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Human_Spell_BreathOfDeath : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_BreathOfDeath_Launch; 
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/BreathOfDeath/SFX_Magic_BreathOfDeath_Exhale_01.SFX_Magic_BreathOfDeath_Exhale_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Human_Spell_Summon_Skeletons_Rising_Ground : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_Summon_Skeletons_RisingGround;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Summon/SFX_Magic_Summon_GroundEffect_01.SFX_Magic_Summon_GroundEffect_01'";
}

class UGothicFXDefinition_Human_Spell_Light_Moving : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_Light_Moving;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Light/SFX_Magic_Light_Projectile_Loop_01.SFX_Magic_Light_Projectile_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Human_Spell_Untransform : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_Untransform;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Transform/SFX_Magic_Transform_Back_01.SFX_Magic_Transform_Back_01'";
}

class UGothicFXDefinition_Human_Spell_ControlStart : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_Control_Start;
    default bIsInstantEffect = false;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Control/SFX_Magic_Control_EnterLoop_01.SFX_Magic_Control_EnterLoop_01'";
}
class UGothicFXDefinition_Human_Spell_ControlLoop : UGothicFXDefinition
{

    default EffectTag = GameplayTag::FX_Magic_Spell_Control_Loop;
    default bIsInstantEffect = false;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Control/SFX_Magic_Control_ControlLoop_01.SFX_Magic_Control_ControlLoop_01'";
}
class UGothicFXDefinition_Human_Spell_ControlEnd : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_Control_End;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Control/SFX_Magic_Control_ControlEnd_01.SFX_Magic_Control_ControlEnd_01'";
}

class UGothicFXDefinition_Human_Spell_Telekenesis : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Ray_Telekenesis;
    default bIsInstantEffect = false;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Telekinesis/SFX_Magic_Telekinesis_BeamLoop_01.SFX_Magic_Telekinesis_BeamLoop_01'";
}

class UGothicFXDefinition_Human_Spell_Lightning : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Ray_Lightning;
    default bIsInstantEffect = false;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_ChainLoop_01.SFX_Magic_Lightning_ChainLoop_01'";
}

class UGothicFXDefinition_Human_Spell_Lightning_Pulse : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Ray_Lightning_Pulse;
    default bIsInstantEffect = false;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_ChainPulse_01.SFX_Magic_Lightning_ChainPulse_01'";
}


class UGothicFXDefinition_Human_Spell_Pyrokinesis : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Ray_Pyrokinesis;
    default bIsInstantEffect = false;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Pyrokinesis/SFX_Magic_Pyrokinesis_BeamLoop_01.SFX_Magic_Pyrokinesis_BeamLoop_01'";
}

class UGothicFXDefinition_Human_Spell_Pyrokinesis_Ray_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Ray_Pyrokinesis_Hit; 
    default bIsInstantEffect = true;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Pyrokinesis/SFX_Magic_Pyrokinesis_Damage_01.SFX_Magic_Pyrokinesis_Damage_01'";
}


class UGothicFXDefinition_Human_Spell_Teleport : UGothicFXDefinition
{    
    default EffectTag = GameplayTag::FX_Magic_Teleport;
    default bIsInstantEffect = false;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Teleport/SFX_Magic_Teleport_SwirlLoop_01.SFX_Magic_Teleport_SwirlLoop_01'";
}

class UGothicFXDefinition_Magic_Barrier_Proximity : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Barrier_Proximity;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Barrier/SFX_MAGIC_Barrier_Proximity_01.SFX_MAGIC_Barrier_Proximity_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Magic_Barrier_Orange : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Barrier_Warning;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Barrier/SFX_MAGIC_Barrier_Warning_01.SFX_MAGIC_Barrier_Warning_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Magic_Barrier_Orange_NPC : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Barrier_Warning_NPC;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Barrier/SFX_MAGIC_Barrier_Warning_NPC_01.SFX_MAGIC_Barrier_Warning_NPC_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Magic_Barrier_Red : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Barrier_Zap;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Barrier/SFX_MAGIC_Barrier_Zap_01.SFX_MAGIC_Barrier_Zap_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Magic_Barrier_Red_NPC : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Barrier_Zap_NPC;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Barrier/SFX_MAGIC_Barrier_Zap_NPC_01.SFX_MAGIC_Barrier_Zap_NPC_01'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_SkeletonMage_Spell_MagicBeam : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_SkeletonMage_MagicBeam;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/MagicBeam/SFX_Magic_MagicBeam_Impact.SFX_Magic_MagicBeam_Impact'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_SkeletonMage_Spell_SoulHarvest_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_SkeletonMage_SoulHarvest_Loop;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/SoulHarvest/SFX_Magic_SoulHarvest_Skull_Loop.SFX_Magic_SoulHarvest_Skull_Loop'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_SkeletonMage_Spell_SoulHarvest_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_SkeletonMage_SoulHarvest_Impact;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/SoulHarvest/SFX_Magic_SoulHarvest_Skull_Impact.SFX_Magic_SoulHarvest_Skull_Impact'";
    default bIsInstantEffect = true;
}


class UGothicFXDefinition_SkeletonMage_Spell_SoulHarvest_Fizzle : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_SkeletonMage_SoulHarvest_Fizzle;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/SoulHarvest/SFX_Magic_SoulHarvest_Skull_Fizzle.SFX_Magic_SoulHarvest_Skull_Fizzle'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Magic_Dissolve_Default : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Dissolve_Default;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Mummy/SFX_OBJ_Mummy_Dissolve_01.SFX_OBJ_Mummy_Dissolve_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Magic_Dissolve_SleeperDream : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Dissolve_SleeperDream;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/SleeperDream/SFX_Magic_SleeperDream_Dissolve.SFX_Magic_SleeperDream_Dissolve'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Magic_Dissolve_SleeperDream_Storm : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Dissolve_SleeperDreamStorm;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/SleeperDream/SFX_Magic_SleeperDream_DissolveStorm.SFX_Magic_SleeperDream_DissolveStorm'";
    default bIsInstantEffect = true;
}


class UGothicFXDefinition_Magic_UrizielWaveOfDeath_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_UrizielWaveOfDeath_Loop;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/WaveOfDeath/SFX_Magic_WaveOfDeath_Loop.SFX_Magic_WaveOfDeath_Loop'";
    default bIsInstantEffect = false;
}


class UGothicFXDefinition_Human_Spell_Heal_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Spell_Heal_Loop;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Heal/SFX_Magic_Heal_EffectLoop.SFX_Magic_Heal_EffectLoop'";
    default bIsInstantEffect = false;
}