class UFXDefinition_Shadowbeast_Rage : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Rage;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    default RequiredTags.AddTag(GameplayTag::Combat);

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/ShadowBeast/P_Shadowbeast_Rage_Trails.P_Shadowbeast_Rage_Trails'";
}

class UFXDefinition_Shadowbeast_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    default PreferenceLayer = 1;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Shadowbeast/SFX_CREA_Shadowbeast_Hit_01.SFX_CREA_Shadowbeast_Hit_01'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}

UCLASS()
class UFXDefinition_Shadowbeast_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Shadowbeast/SFX_CREA_Shadowbeast_StepSmall.SFX_CREA_Shadowbeast_StepSmall'";
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinition_Shadowbeast_Footstep_Medium : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Shadowbeast/SFX_CREA_Shadowbeast_Step.SFX_CREA_Shadowbeast_Step'";
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinition_Shadowbeast_Footstep_Big : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Shadowbeast/SFX_CREA_Shadowbeast_Step.SFX_CREA_Shadowbeast_Step'";
    default PreferenceLayer = 1;
}

class UFXDefinition_Shadowbeast_Land : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Land;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Shadowbeast/SFX_CREA_Shadowbeast_StepLand.SFX_CREA_Shadowbeast_StepLand'";

    default bUseVolcityThreshold = false;
    default PreferenceLayer = 1;
}