class UDodge_Player : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dodge;
    default RequiredTags.AddTag(GameplayTag::Character_Player);
    default PreferenceLayer = 1;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/Vocals/SFX_COMBAT_Vocals_Human_Dodge_PC.SFX_COMBAT_Vocals_Human_Dodge_PC'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Dodge;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}