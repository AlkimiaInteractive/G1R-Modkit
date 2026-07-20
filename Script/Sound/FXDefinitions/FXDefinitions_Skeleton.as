class UHit_Skeleton : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Skeleton/SFX_CREA_Skeleton_Hit_01.SFX_CREA_Skeleton_Hit_01'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}


class UGothicFXDefinition_Creature_Skeleton_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Skeleton_Ambient_Loop;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Skeleton/SFX_CREA_Skeleton_Bones_Loop.SFX_CREA_Skeleton_Bones_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Creature_Skeleton_Mage_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_SkeletonMage_Ambient_Loop;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/SkeletonMage/SFX_CREA_SkeletonMage_Ambient_Loop.SFX_CREA_SkeletonMage_Ambient_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Creature_Skeleton_Death : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Skeleton_Death;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Skeleton/SFX_CREA_Skeleton_Bones_Death.SFX_CREA_Skeleton_Bones_Death'";
    default bIsInstantEffect = false;
}


UCLASS()
class UFXDefinitions_Skeleton_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Undead_Skeleton);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Skeleton/SFX_CREA_Skeleton_StepSmall.SFX_CREA_Skeleton_StepSmall'";
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Skeleton_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Undead_Skeleton);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Skeleton/SFX_CREA_Skeleton_Step.SFX_CREA_Skeleton_Step'";
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Skeleton_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Undead_Skeleton);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Skeleton/SFX_CREA_Skeleton_Step.SFX_CREA_Skeleton_Step'";
    default PreferenceLayer = 1;
}