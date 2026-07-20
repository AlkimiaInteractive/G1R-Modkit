class UGothicFXDefinition_Creature_Golem_Ice_Crackle : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Golem_Ice_Crackle;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/GolemIce/SFX_CREA_GolemIce_Crackle_Loop.SFX_CREA_GolemIce_Crackle_Loop'";
    default bIsInstantEffect = false;
}