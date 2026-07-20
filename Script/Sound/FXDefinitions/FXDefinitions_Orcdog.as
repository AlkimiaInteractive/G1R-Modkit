class UHit_OrcDog : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Orcdog);
    default PreferenceLayer = 1;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Orcdog/SFX_CREA_Orcdog_Hit_01.SFX_CREA_Orcdog_Hit_01'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}

UCLASS()
class UFXDefinitions_Orcdog_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Orcdog);
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Orcdog_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Orcdog);
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Orcdog_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Orcdog);
    default PreferenceLayer = 1;
}