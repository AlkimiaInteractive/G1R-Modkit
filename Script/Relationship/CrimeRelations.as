namespace CrimeRelations
{
    class URS_Crime_Species_Human : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Human);
        default Weight = 1.0f;

        // GENERAL CRIMES

        // Base crimes everywhere
        default PursuedCrimes.Add(FPursuedCrimeSetup());
        default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_IgnoredWarning, 2.5f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Melee, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Ranged, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Magic_HighThreat, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Magic_LowThreat, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Fists, 2.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_ThreateningWeaponTooClose, 4.5f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_FistsTooClose, 4.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DefeatedAgain, 10.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Murder, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Melee, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Ranged, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Magic_HighThreat, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Magic_LowThreat, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Fists, 3.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_BlockingPath, 0.8f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 4.5f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnPerson, 4.5f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Lockpicking, 1.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Interaction, 1.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Pickpocket_Fail, 0.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Pickpocket_Success, 0.5f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Dialogue_RealFight, 20.5f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath, 20.5f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath, 20.5f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Dialogue_PettyFight, 20.5f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Anti_Defeated_Other, 0.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Anti_Defeated_Self, 0.0f);
    }
    
    class URS_Crime_Species_Orc : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Orc);
        default Weight = 1.0f;

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Orc, ERelationship::Friend);

        // CRIMES

        // Base crimes everywhere
        default PursuedCrimes.Add(FPursuedCrimeSetup());
        default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_IgnoredWarning, 2.5f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Melee, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Ranged, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Magic_HighThreat, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Weapon_Magic_LowThreat, 3.9f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DirectThreat_Fists, 2.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_ThreateningWeaponTooClose, 4.5f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_FistsTooClose, 4.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_DefeatedAgain, 10.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Murder, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Melee, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Ranged, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Magic_HighThreat, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Weapon_Magic_LowThreat, 3.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Assault_Fists, 3.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_BlockingPath, 2.0f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Pickpocket_Fail, 0.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Pickpocket_Success, 0.5f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Dialogue_RealFight, 20.5f);

        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Anti_Defeated_Other, 0.0f);
        default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Anti_Defeated_Self, 0.0f);
    }

    class URS_Crime_SleeperGuilds : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Human);
        default ForGuild.AddTag(GameplayTag::Guild_SleeperTemple);
        default Weight = 2.0f;

        // GENERAL CRIMES
        default IgnoredCrimes.Add(FIgnoredCrimeSetup());
        default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon_Melee);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon_Ranged);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon_Magic_HighThreat);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon_Magic_LowThreat);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Fists);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_ThreateningWeaponTooClose);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_FistsTooClose);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DefeatedAgain);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Assault_Weapon_Melee);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Assault_Weapon_Ranged);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Assault_Weapon_Magic_HighThreat);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Assault_Weapon_Magic_LowThreat);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Assault_Fists);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_BlockingPath);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnPerson);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Lockpicking);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Interaction);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Pickpocket_Fail);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Pickpocket_Success);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Dialogue_RealFight);

        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Anti_Defeated_Other);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Anti_Defeated_Self);
    }
}