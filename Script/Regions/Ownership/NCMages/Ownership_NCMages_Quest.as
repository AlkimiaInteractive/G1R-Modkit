#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_NC_OreMountain_AllowTrespassing_AfterSucceeded_URIZIEL_OBJ_MILTEN : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 2.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        /// Configure condition to allow access
        return G1R::Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN.HasSucceeded();
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_OreMountain);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnPerson);
}
#endif