class UDeath_Scavenger : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Death;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Scavenger/SFX_CREA_Scavenger_Death.SFX_CREA_Scavenger_Death'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Death;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UDodge_Scavenger : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dodge;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Scavenger/SFX_CREA_Scavenger_Dodge.SFX_CREA_Scavenger_Dodge'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Dodge;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UAttack_Scavenger : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Scavenger/SFX_CREA_Scavenger_Attack.SFX_CREA_Scavenger_Attack'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Attack;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UHit_Scavenger : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Scavenger/SFX_CREA_Scavenger_Hit.SFX_CREA_Scavenger_Hit'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}

UCLASS()
class UFXDefinitions_Scavenger_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Scavenger_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Scavenger_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    default PreferenceLayer = 1;
}
