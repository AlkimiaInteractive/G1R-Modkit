class UHit_Snapper : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Snapper);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Snapper/SFX_CREA_Snapper_Hit_01.SFX_CREA_Snapper_Hit_01'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}

UCLASS()
class UFXDefinitions_Snapper_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Snapper);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Snapper/SFX_CREA_Snapper_StepSmall.SFX_CREA_Snapper_StepSmall'";
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Snapper_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Snapper);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Snapper/SFX_CREA_Snapper_Step.SFX_CREA_Snapper_Step'";
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Snapper_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Snapper);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Snapper/SFX_CREA_Snapper_Step.SFX_CREA_Snapper_Step'";
    default PreferenceLayer = 1;
}