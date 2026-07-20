#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_OldCamp_Castle_AfterFireMagesDead : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Castle means all areas within the same tag hierarchy will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_RavenArea);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_OrebaronsRoom);

    // The modifier is set to affect the guilds that will be considered Owners of the Area, for which Trespassing On Guild and Theft crimes will not trigger
    // Note that we could have used just the Guild_Human_OldCamp tag but that would make Diggers also allowed inside the castle
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableNow() const
    {
        return G1R::UStoryG1R::Get().FireMagesDead != 0;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_AfterFireMagesDead : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);

    default Weight = 1.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        auto Story = G1R::UStoryG1R::Get();
        if (!IsValid(Story))
            return false;

        return Story.FireMagesDead != 0;
    }

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnPerson, 20.0f);
}
#endif