UCLASS()
class UFXDefinition_TrollTemplate : UGothicFXDefinition
{
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Troll);

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        auto InstigatorCharacter = Cast<AGothicCharacter>(Instigator);
        if (InstigatorCharacter.HasGameplayTag(GameplayTag::State_ScaledDown))
        {
            FModEvent.EventParameters.FindOrAdd(n"TrollShrunk") = 1.0f;
        }
        else
        {
            FModEvent.EventParameters.FindOrAdd(n"TrollShrunk") = 0.0f;
        }
    }
}

UCLASS()
class UFXDefinitions_TrollFootstep_Small : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Troll);
    default PreferenceLayer = 1;

     default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_StepSmall.SFX_CREA_Troll_StepSmall'";
}

UCLASS()
class UFXDefinitions_TrollFootstep_Medium : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Troll);
    default PreferenceLayer = 1;

     default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_StepSmall.SFX_CREA_Troll_StepSmall'";
}

UCLASS()
class UFXDefinitions_TrollFootstep_Big : UFootsteps_Creature_Large
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Troll);
    default PreferenceLayer = 1;

     default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_Step.SFX_CREA_Troll_Step'";
}

UCLASS()
class UFXDefinitions_TrollFootstep_Small_Shrunk : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Troll);
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 2;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_StepSmall.SFX_CREA_Troll_StepSmall'";
    default FModEvent.EventParameters.FindOrAdd(n"TrollShrunk") = 1.0f;
}

UCLASS()
class UFXDefinitions_TrollFootstep_Medium_Shrunk : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Troll);
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 2;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_StepSmall.SFX_CREA_Troll_StepSmall'";
    default FModEvent.EventParameters.FindOrAdd(n"TrollShrunk") = 1.0f;
}


UCLASS()
class UFXDefinitions_TrollFootstep_Big_Shrunk : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Troll);
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 2;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_Step.SFX_CREA_Troll_Step'";
    default FModEvent.EventParameters.FindOrAdd(n"TrollShrunk") = 1.0f;
}


class UGothicFXDefinition_Impact_Stone_Troll : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Stone_Troll; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_Throw_RockImpact.SFX_CREA_Troll_Throw_RockImpact'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Impact_Stone_Troll_Shrinked : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Stone_Troll_Shrinked; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/SFX_PHYSICS_Impacts_ProjectileStone.SFX_PHYSICS_Impacts_ProjectileStone'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Impact_Goblin_Troll : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Goblin_Troll; 

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_Throw_GoblinImpact.SFX_CREA_Troll_Throw_GoblinImpact'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Projectile_Goblin_Troll_PickUp : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Projectile_Goblin_Troll_PickUp;
    
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Goblin/SFX_CREA_Goblin_IsThrown_Pickup.SFX_CREA_Goblin_IsThrown_Pickup'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_Projectile_Goblin_Troll_PickUp_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Projectile_Goblin_Troll_PickUp_Loop;
    
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Goblin/SFX_CREA_Goblin_IsThrown_Loop.SFX_CREA_Goblin_IsThrown_Loop'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_Projectile_Goblin_Troll_PickUp_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Projectile_Goblin_Troll_PickUp_Impact;
    
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Goblin/SFX_CREA_Goblin_IsThrown_Impact.SFX_CREA_Goblin_IsThrown_Impact'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_MonasteryRuins_SkullDoor_JawDown : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Environment_MonasteryRuins_SkullDoor_JawDown;
    default bIsInstantEffect = true;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/SkullDoor/SFX_OBJ_SkullDoor_JawDownFull_01.SFX_OBJ_SkullDoor_JawDownFull_01'";
}

class UGothicFXDefinition_JuvenileTroll_Taunt01 : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Creature_Troll_JuvenileTroll_Taunt01;
    default bIsInstantEffect = true;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Troll/SFX_CREA_Troll_Taunt01.SFX_CREA_Troll_Taunt01'";
}