UCLASS()
class UFXDefinitions_BloodHound_Footstep_Small : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Bloodhound);
    default PreferenceLayer = 1;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Bloodhound/SFX_CREA_Bloodhound_DoubleStep.SFX_CREA_Bloodhound_DoubleStep'";
}

UCLASS()
class UFXDefinitions_BloodHound_Footstep_Medium : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Bloodhound);
    default PreferenceLayer = 1;

     default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Bloodhound/SFX_CREA_Bloodhound_DoubleStep.SFX_CREA_Bloodhound_DoubleStep'";
}


UCLASS()
class UFXDefinitions_BloodHound_Footstep_Big : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Bloodhound);
    default PreferenceLayer = 1;

     default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Bloodhound/SFX_CREA_Bloodhound_DoubleStep.SFX_CREA_Bloodhound_DoubleStep'";
}
