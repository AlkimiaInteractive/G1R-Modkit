class UHit_Bloodfly : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Bloodfly);
    default PreferenceLayer = 1;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Bloodfly/SFX_CREA_Bloodfly_Hit_01.SFX_CREA_Bloodfly_Hit_01'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}

class UGothicFXDefinition_Creature_Bloodfly_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Bloodfly_Ambient_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Bloodfly/SFX_CREA_Bloodfly_Wings_FlyLoop.SFX_CREA_Bloodfly_Wings_FlyLoop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Creature_Bloodfly_Ambient_Loop_Lay : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Bloodfly_Ambient_Loop_Lay;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Bloodfly/SFX_CREA_Bloodfly_Wings_AmbientLoop.SFX_CREA_Bloodfly_Wings_AmbientLoop'";
    default bIsInstantEffect = false;
}