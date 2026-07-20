class UGothicFXDefinition_Creature_Golem_Stone_Crackle : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Golem_Stone_Crackle;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath =  n"SFX_CREA_GolemStone_Crackle_Loop/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/GolemStone/SFX_CREA_GolemStone_Crackle_Loop.SFX_CREA_GolemStone_Crackle_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Impact_Stone_Golem_Stone : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Stone_Golem_Stone; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_Throw_RockImpact.SFX_CREA_Troll_Throw_RockImpact'";
    default bIsInstantEffect = true;
}