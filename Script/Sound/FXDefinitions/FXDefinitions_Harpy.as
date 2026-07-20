class UHit_Harpy : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Harpy);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Actions/SFX_ACTIONS_Death.SFX_ACTIONS_Death'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}

UCLASS()
class UFXDefinitions_Harpy_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Harpy);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Harpy/SFX_CREA_Harpy_StepSmall.SFX_CREA_Harpy_StepSmall'";
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Harpy_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Harpy);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Harpy/SFX_CREA_Harpy_Step.SFX_CREA_Harpy_Step'";
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Harpy_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Harpy);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Harpy/SFX_CREA_Harpy_Step.SFX_CREA_Harpy_Step'";
    default PreferenceLayer = 1;
}


class UGothicFXDefinition_Projectile_Harpy_Feather_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Projectile_Harpy_Feather_Hit;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/SFX_PHYSICS_Impacts_ProjectileFeather.SFX_PHYSICS_Impacts_ProjectileFeather'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Projectile_Harpy_Feather_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Projectile_Harpy_Feather_Loop;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Harpy/SFX_CREA_Harpy_FeatherProjectile_Loop.SFX_CREA_Harpy_FeatherProjectile_Loop'";
    default bIsInstantEffect = false;
}