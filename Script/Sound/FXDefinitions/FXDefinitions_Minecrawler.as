class UGothicFXDefinition_Creature_Minecrawler_Normal_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Minecrawler_Normal_Ambient_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Minecrawler/SFX_CREA_Minecrawler_Ambient_Loop.SFX_CREA_Minecrawler_Ambient_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Creature_Minecrawler_Warrior_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Minecrawler_Warrior_Ambient_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/MinecrawlerWarrior/SFX_CREA_MinecrawlerWarrior_Ambient_Loop.SFX_CREA_MinecrawlerWarrior_Ambient_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Creature_Minecrawler_Queen_Ambient_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Minecrawler_Queen_Ambient_Loop;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/MinecrawlerQueen/SFX_CREA_MinecrawlerQueen_Ambient_Loop.SFX_CREA_MinecrawlerQueen_Ambient_Loop'";
    default bIsInstantEffect = false;
}

UCLASS()
class UFXDefinitions_MineCrawler_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Minecrawler);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Minecrawler/SFX_CREA_Minecrawler_StepSmall.SFX_CREA_Minecrawler_StepSmall'";
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_MineCrawler_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Minecrawler);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Minecrawler/SFX_CREA_Minecrawler_Step.SFX_CREA_Minecrawler_Step'";
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_MineCrawler_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Minecrawler);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Minecrawler/SFX_CREA_Minecrawler_Step.SFX_CREA_Minecrawler_Step'";
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_MineCrawlerWarrior_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Minecrawler_Warrior);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/MinecrawlerWarrior/SFX_CREA_MinecrawlerWarrior_StepSmall.SFX_CREA_MinecrawlerWarrior_StepSmall'";
    default PreferenceLayer = 2;
}

UCLASS()
class UFXDefinitions_MineCrawlerWarrior_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Minecrawler_Warrior);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/MinecrawlerWarrior/SFX_CREA_MinecrawlerWarrior_Step.SFX_CREA_MinecrawlerWarrior_Step'";
    default PreferenceLayer = 2;
}


UCLASS()
class UFXDefinitions_MineCrawlerWarrior_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Minecrawler_Warrior);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/MinecrawlerWarrior/SFX_CREA_MinecrawlerWarrior_Step.SFX_CREA_MinecrawlerWarrior_Step'";
    default PreferenceLayer = 2;
}

class UGothicFXDefinition_Creature_Minecrawler_Queen_Projectile_Slime : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Minecrawler_Queen_Projectile_Slime;
    
    // default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Creature;
    // default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    // default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/SFX_PHYSICS_Impacts_ProjectileSlime.SFX_PHYSICS_Impacts_ProjectileSlime'";
    default bIsInstantEffect = true;
}