UCLASS()
class UFXDefinitions_Biter_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Biter);
    default PreferenceLayer = 1;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Biter/SFX_CREA_Biter_StepSmall.SFX_CREA_Biter_StepSmall'";
}

UCLASS()
class UFXDefinitions_Biter_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Biter);
    default PreferenceLayer = 1;

     default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Biter/SFX_CREA_Biter_Step.SFX_CREA_Biter_Step'";
}


UCLASS()
class UFXDefinitions_Biter_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Biter);
    default PreferenceLayer = 1;

     default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Biter/SFX_CREA_Biter_Step.SFX_CREA_Biter_Step'";
}
