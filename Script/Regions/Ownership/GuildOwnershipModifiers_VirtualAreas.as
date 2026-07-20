#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_Virtual_OldCamp_Guard : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_Virtual_OldCamp_Guard);

    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
}
#endif

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_Virtual_OldCamp_Guard_Critical : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_Virtual_OldCamp_Guard_Critical);

    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_Virtual_OC_Guard_Critical : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_Virtual_OldCamp_Guard_Critical);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Interaction, 20.0f);
}
#endif

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_Virtual_OldCamp_Gomez : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_Virtual_OldCamp_Gomez);

    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron_Gomez);
}
#endif

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_Virtual_OldCamp_Gomez_Critical : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_Virtual_OldCamp_Gomez_Critical);

    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron_Gomez);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_Virtual_OC_Gomez_Critical : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_Virtual_OldCamp_Gomez_Critical);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Interaction, 20.0f);
}
#endif

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_Virtual_OldCamp_StoneCell : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_Virtual_OldCamp_StoneCell);

    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron_Gomez);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_Virtual_OC_StoneCell_Critical : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_Virtual_OldCamp_StoneCell);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Interaction, 20.0f);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        if (G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 == nullptr || 
            !G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.IsRunning())
            return false;

        return true;
    }
}
#endif