#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OldCamp_FireMagesBuilding_AfterFireMagesDead_DisableTrespassingUntilBartholoAttacks : UStaticRelationshipModifier
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

        if (Story.FireMagesDead == 0)
            return false;

        if (Story.FireMagesPermission != 0)
            return true;

        auto Bartholo = AGothicCharacterState::FindByUniqueName(n"OC_EBR_Bartholo_106");
        if (!IsValid(Bartholo))
            return false;

        if (Story.FireMagesDead != 0 && !Bartholo.HasKnowledgeOf(G1R::Conversation::UChoiceBartholo221528))
            return true;

        return false;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_DisableTrespassing_Gomez : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron_Gomez);

    default Weight = 3.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        auto Story = G1R::UStoryG1R::Get();
        return Story.Chapter == 5;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnPerson);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_DisableTrespassing_Women : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);
    default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);

    default Weight = 3.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted();
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnPerson);
}
#endif