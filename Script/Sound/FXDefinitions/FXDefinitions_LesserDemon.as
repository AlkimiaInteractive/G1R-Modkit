class UGothicFXDefinition_Creature_LesserDemon_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_LesserDemon_Ambient_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/DemonLesser/SFX_CREA_DemonLesser_AmbientLoop.SFX_CREA_DemonLesser_AmbientLoop'";
    default bIsInstantEffect = false;
}