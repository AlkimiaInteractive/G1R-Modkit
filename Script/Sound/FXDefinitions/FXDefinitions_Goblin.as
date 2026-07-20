class UDeath_Goblin : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Death;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Goblin);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Goblin/SFX_CREA_Goblin_Death.SFX_CREA_Goblin_Death'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Death;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UDodge_Goblin : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dodge;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Goblin);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Goblin/SFX_CREA_Goblin_Dodge.SFX_CREA_Goblin_Dodge'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Dodge;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UAttack_Goblin : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Goblin);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Goblin/SFX_CREA_Goblin_Attack.SFX_CREA_Goblin_Attack'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Attack;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UHit_Goblin : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Hit;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Goblin);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Goblin/SFX_CREA_Goblin_Hit.SFX_CREA_Goblin_Hit'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Hit;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}

UCLASS()
class UFXDefinitions_Goblin_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Goblin);
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Goblin_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Goblin);
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Goblin_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Goblin);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Projectile_Goblin_Stone_Hit : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Projectile_Goblin_Stone_Hit;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/SFX_PHYSICS_Impacts_ProjectileStone.SFX_PHYSICS_Impacts_ProjectileStone'";
    default bIsInstantEffect = true;
}