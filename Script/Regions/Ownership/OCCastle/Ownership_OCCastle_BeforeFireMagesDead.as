/// CASTLE EXTERIOR, FORGE, TAVERN
#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_OldCamp_Castle_Exterior_BeforeFireMagesDead : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Castle means all areas within the same tag hierarchy will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle);

    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GuardsBarrack);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding);

    // The modifier is set to affect the guilds that will be considered Owners of the Area, for which Trespassing On Guild and Theft crimes will not trigger
    // Note that we could have used just the Guild_Human_OldCamp tag but that would make Diggers also allowed inside the castle
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableNow() const
    {
        return G1R::UStoryG1R::Get().FireMagesDead == 0;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_NoExteriorPermission : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        auto Story = G1R::UStoryG1R::Get();
        if (!IsValid(Story))
            return false;

        return Story.Thorus_Permission_Exterior == 0;
    }

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnPerson, 20.0f);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_ExteriorPermission : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 2.0f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        bool bResult = false;
        auto Story = G1R::UStoryG1R::Get();
        bResult = Story.Thorus_Permission_Exterior != 0 && Story.FireMagesDead == 0;
        return bResult;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

/// GOMEZ BUILDING
#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_OldCamp_GomezBuilding_BeforeFireMagesDead : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Cellar);
    default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_RavenArea);
    // default Except.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_RavenArea);

    // The modifier is set to affect the guilds that will be considered Owners of the Area, for which Trespassing On Guild and Theft crimes will not trigger
    // Note that we could have used just the Guild_Human_OldCamp tag but that would make Diggers also allowed inside the castle
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableNow() const
    {
        return G1R::UStoryG1R::Get().FireMagesDead == 0;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_InteriorTrespassing : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron_Gomez);

    default Weight = 2.5f;

    // If Permission_Exterior is given, pursue trespassing on interiors only at 4.5
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        bool bResult = false;
        auto Story = G1R::UStoryG1R::Get();
        bResult = Story.Thorus_Permission_Exterior != 0 && Story.FireMagesDead == 0;
        return bResult;
    }

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    // We don't pursue in GomezBuilding_Entrance so that forced conversations can happen
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_ArcsRoom);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Armory);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Cellar);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Kitchen);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Stairs);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_ThroneRoom);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_UpperFloor);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_GomezRoom);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_OrebaronsRoom);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_RavenArea);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GuardsBarrack_Room);
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Tower);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 4.5f);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnPerson, 4.5f);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_InteriorPermission : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 3.0f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        bool bResult = false;
        auto Story = G1R::UStoryG1R::Get();
        bResult = Story.Thorus_Permission_Interior != 0 && Story.FireMagesDead == 0;
        return bResult;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Entrance);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_ArcsRoom);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Stairs);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Kitchen);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_ThroneRoom);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

/// CELLAR AND DUNGEON
// #ifdef WITH_STORY_G1R
// class UGuildAreaOwnershipModifier_OldCamp_Castle_OreBaronsOnly_BeforeFireMagesDead : UGuildAreaOwnershipModifier
// {
//     default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons);
//     default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Cellar);
//     default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_RavenArea);

//     // The modifier is set to affect the guilds that will be considered Owners of the Area, for which Trespassing On Guild and Theft crimes will not trigger
//     // Note that we could have used just the Guild_Human_OldCamp tag but that would make Diggers also allowed inside the castle
//     default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);

//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableNow() const
//     {
//         return G1R::UStoryG1R::Get().FireMagesDead == 0;
//     }
// }
// #endif

/// FIRE MAGES BUILDING
#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_OldCamp_Castle_FireMages_BeforeFireMagesDead : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Fire Mage building means all areas within that building will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding);

    // Since Caslte sets this area on Except, only the following guilds will be considered owners
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableNow() const
    {
        return G1R::UStoryG1R::Get().FireMagesDead == 0;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OldCamp_Castle_FireMages : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);

    default Weight = 2.4f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::UStoryG1R::Get().FireMagesPermission == 0;
    }

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 4.5f);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OldCamp_FireMagesBuilding_BeforeFireMagesDead_Permission : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 2.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        auto Story = G1R::UStoryG1R::Get();
        if (!IsValid(Story))
            return false;

        if (Story.FireMagesDead != 0)
            return false;

        if (Story.FireMagesPermission != 0)
            return true;

        return false;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

/// GUARDS BARRACKS
#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_OldCamp_Castle_GuardsBarrack_BeforeFireMagesDead : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Fire Mage building means all areas within that building will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GuardsBarrack);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableNow() const
    {
        return G1R::UStoryG1R::Get().FireMagesDead == 0;
    }

    // Since Caslte sets this area on Except, only the following guilds will be considered owners
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
}
#endif