UCLASS()
class UFXDefinitions_Razor_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Razor);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Razor/SFX_CREA_Razor_StepSmall.SFX_CREA_Razor_StepSmall'";
    default PreferenceLayer = 1;
}

UCLASS()
class UFXDefinitions_Razor_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Razor);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Razor/SFX_CREA_Razor_Step.SFX_CREA_Razor_Step'";
    default PreferenceLayer = 1;
}


UCLASS()
class UFXDefinitions_Razor_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Razor);
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Razor/SFX_CREA_Razor_Step.SFX_CREA_Razor_Step'";
    default PreferenceLayer = 1;
}
