class UGothicFXDefinition_Creature_Golem_Fire_Sizzle : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Golem_Fire_Sizzle;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/GolemFire/SFX_CREA_GolemFire_Sizzle_Loop_01.SFX_CREA_GolemFire_Sizzle_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Impact_Stone_Golem_Fire : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Stone_Golem_Fire; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/GolemFire/SFX_CREA_GolemFire_Grenade_Impact.SFX_CREA_GolemFire_Grenade_Impact'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Golem_Fire_BreakFloor : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Golem_Fire_BreakFloor;  

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/GolemFire/SFX_CREA_GolemFire_GroundBreak.SFX_CREA_GolemFire_GroundBreak'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Golem_Fire_LavaStream_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Golem_Fire_LavaStream_Loop;  

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lava/SFX_OBJ_Lava_GolemLavaPools_Loop.SFX_OBJ_Lava_GolemLavaPools_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Golem_Fire_LavaPuddle : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Golem_Fire_LavaPuddle;  

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lava/SFX_OBJ_Lava_FloorSink.SFX_OBJ_Lava_FloorSink'";
    default bIsInstantEffect = true;
}