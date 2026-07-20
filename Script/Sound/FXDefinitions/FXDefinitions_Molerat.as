class UDeath_Molerat : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Death;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Molerat);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Molerat/SFX_CREA_Molerat_Death.SFX_CREA_Molerat_Death'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Death;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UDodge_Molerat : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dodge;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Molerat);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Molerat/SFX_CREA_Molerat_Dodge.SFX_CREA_Molerat_Dodge'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Dodge;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UAttack_Molerat : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Molerat);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Molerat/SFX_CREA_Molerat_Attack.SFX_CREA_Molerat_Attack'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Attack;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UHit_Molerat : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Molerat);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Molerat/SFX_CREA_Molerat_Hit.SFX_CREA_Molerat_Hit'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}

UCLASS()
class UFXDefinitions_Molerat_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Molerat);
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Molerat_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Molerat);
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Molerat_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Molerat);
    default PreferenceLayer = 1;
}




