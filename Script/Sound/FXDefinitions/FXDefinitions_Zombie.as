class UGothicFXDefinition_Creature_Zombie_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Zombie_Ambient_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Zombie/SFX_CREA_Zombie_Ambient_Loop.SFX_CREA_Zombie_Ambient_Loop'";
    default bIsInstantEffect = false;
}

UCLASS()
class UFXDefinitions_Zombie_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Undead_Zombie);
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Zombie_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Undead_Zombie);
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Zombie_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Undead_Zombie);
    default PreferenceLayer = 1;
}