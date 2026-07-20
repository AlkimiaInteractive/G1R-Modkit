////// GENERAL

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_GeneralDisableTrespassingFromOwnedLocations : UStaticRelationshipModifier
{
    // Setting the guild to apply the modifier to all humans and the weight to override the base modifier
    default ForGuild.AddTag(GameplayTag::Guild_Human);
    default Weight = 2.0f;

    // Drawing a weapon in the Tavern is a crime
    default IgnoredCrimes.Add(FIgnoredCrimeSetup());

    /// These owned locations will only apply theft to items inside but not trespassing
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_23); // OC Forge
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_80); // OC Merchant First Floor Hut
    // default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_78); // Arena Betting Hut

    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Kitchen); // NC Tavern Kitchen
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Lee); // NC Lee hut
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_01); // NC Rice field huts
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_02);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_03);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_04);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_05);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Lares); // NC Lares hut
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_CavalornValley_Cohsel_Hut);

    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_SwampCampOutskirts_WildSwamp_ShratCamp_Hut);


    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_ILWM_Cave_Loot); // Weed mixers cave

    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_BanditsCamp_Plateau); // Bandits camp plateau
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_01);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_02);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_LiftStaircase);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_StaircaseExit);


    /// Ignore all types of trespassing
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnPerson);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
    
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
// OLD CAMP
//////////////////////////////////////////////////////////////////////////////////////

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OldCamp_Castle_FireMages_DisableGuildTrespassingInRooms : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 30.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding_Room);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Castle_GomezBuilding_DisableGuildTrespassingInRooms : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 30.5f;

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_OrebaronsRoom);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_RavenArea);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons);
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_GomezRoom);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

//OC Arena betting hut 78 guilds
#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_OC_Arena_Betting_Hut_78 : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_78);

    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
// NEW CAMP
//////////////////////////////////////////////////////////////////////////////////////

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_NC_Tavern : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    /** Having a weapon out is forbidden inside the Tavern (to prevent fighting Rayk with anything but fists)
     *  Player will get warned or immediately attacked based on the severity defined here
     * 
     *  This is adding a new crime that isn't in the base crime setup
     */

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_ThreateningWeaponDrawn, 4.5f);
}
#endif

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_NewCamp_WaterMages : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Fire Mage building means all areas within that building will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages);

    // Since Caslte sets this area on Except, only the following guilds will be considered owners
    default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_WaterMage);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_NC_WaterMages : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::UStoryG1R::Get().WaterMaguesPermission == 0;
    }

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_NC_WaterMages_DisableTrespassing : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 2.0f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        /// Configure condition to allow access
        return G1R::UStoryG1R::Get().WaterMaguesPermission != 0;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_ILWM_Cave : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Castle means all areas within the same tag hierarchy will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_WeedMixers_Cave_01);

    default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_NC_ILWM : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::UStoryG1R::Get().IlegalWeedMixer_Permision == 0;
    }

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_WeedMixers_Cave_01);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_NC_ILWM_DisabledTrespassing : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::UStoryG1R::Get().IlegalWeedMixer_Permision == 1;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_WeedMixers_Cave_01);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
// OLD CAMP ARENA
//////////////////////////////////////////////////////////////////////////////////////
#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_OC_Arena : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human); 

    default Weight = 1.5f;

    /** All weapon-related crimes are ignored except Assault and Murder.
     *  Assault will be regulated through the Training fight modifiers
     */

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_OldCamp_OuterRing_Arena);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Fists);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_ThreateningWeaponTooClose);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_FistsDrawn);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_FistsTooClose);
}
#endif

//////
// Swamp Camp
////////

//SC Training Arena
#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_SC_Arena : UStaticRelationshipModifier
{
    // Setting the guild to apply the modifier to all humans and the weight to override the base modifier
    default ForGuild.AddTag(GameplayTag::Guild_Human);
    default Weight = 1.5f;

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_SwampCamp_Arena);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Fists);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_ThreateningWeaponTooClose);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_FistsDrawn);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_FistsTooClose);
}
#endif


#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_SC_Temple : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Fire Mage building means all areas within that building will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Temple);

    // Since Caslte sets this area on Except, only the following guilds will be considered owners
    default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Guru);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_SC_Temple : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 1.5f;

    // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
    // This should be modifying the existing crime severity.
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::UStoryG1R::Get().SwampCampTemple_Permision == 0;

    }

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_SwampCamp_Temple);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
}
#endif


// Swamp Camp Temple
#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_SC_Temple_DisableTrespassing : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 2.0f;
    
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::UStoryG1R::Get().SwampCampTemple_Permision != 0;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_SwampCamp_Temple);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
}
#endif

// Caine Hut
#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_SC_CaineHut_DisableTrespassing : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human);

    default Weight = 2.0f;
    
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        return G1R::UStoryG1R::Get().CaineVanished != 0;
    }

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Caine);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnPerson);
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
// Bandits Camp
//////////////////////////////////////////////////////////////////////////////////////

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_BanditsCamp : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Bandits Camp means all areas within that camp will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_BanditsCamp);

    // Since the camp sets this area on Except, only the following guilds will be considered owners
    default ForGuild.AddTag(GameplayTag::Guild_Human_Bandit);
}
#endif

#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_BC_LootCave : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human_Bandit);

    default Weight = 3.0f;

    default PursuedCrimes.Add(FPursuedCrimeSetup());
    default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_BanditsCamp_Plateau_MainCamp_LootCave);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 4.5f);
    default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnPerson, 4.5f);
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
// ORC TOWN
//////////////////////////////////////////////////////////////////////////////////////

#ifdef WITH_STORY_G1R
class UGuildAreaOwnershipModifier_OrcTown_SleeperSquare : UGuildAreaOwnershipModifier
{
    // Setting this modifier to define ownership for the Castle means all areas within the same tag hierarchy will inherit that ownership
    default OwnedAreas.AddTag(GameplayTag::Area_OrcTown_SleepersSquare);

    // The modifier is set to affect the guilds that will be considered Owners of the Area, for which Trespassing On Guild and Theft crimes will not trigger
    // Note that we could have used just the Guild_Human_OldCamp tag but that would make Diggers also allowed inside the castle
    default ForGuild.AddTag(GameplayTag::Guild_Orc_Shaman);
    default ForGuild.AddTag(GameplayTag::Guild_Orc_Warrior);
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
// FREE MINE
//////////////////////////////////////////////////////////////////////////////////////
// #ifdef WITH_STORY_G1R
// class URS_Guild_Human_Crimes_FM_Interior : UStaticRelationshipModifier
// {
//     default ForGuild.AddTag(GameplayTag::Guild_Human);

//     default Weight = 1.5f;

//     // Trespassing on guild ownership results in instant aggression, no warnings (base severity set to critical >8.0).
//     // This should be modifying the existing crime severity.

//     default PursuedCrimes.Add(FPursuedCrimeSetup());
//     default PursuedCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_FreeMine_Interior);
//     default PursuedCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).CrimeAndSeverity.Add(GameplayTag::Crime_Trespassing_OnGuild, 20.0f);
// }
// #endif

// #ifdef WITH_STORY_G1R
// class URS_Guild_Human_Crimes_FM_Interior_Diggers : UStaticRelationshipModifier
// {
//     // Setting the guild to apply the modifier to all humans and the weight to override the base modifier
//     default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
//     default Weight = 2.0f;

//     default IgnoredCrimes.Add(FIgnoredCrimeSetup());
//     default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_FreeMine_Interior);
//     default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
// }
// #endif

// #ifdef WITH_STORY_G1R
// class UGuildAreaOwnershipModifier_FreeMine : UGuildAreaOwnershipModifier
// {
//     // Setting this modifier to define ownership for the Bandits Camp means all areas within that camp will inherit that ownership
//     default OwnedAreas.AddTag(GameplayTag::Area_FreeMine_Interior);

//     // Since the camp sets this area on Except, only the following guilds will be considered owners
//     default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
//     default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
//     default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
// }
// #endif

//////////////////////////////////////////////////////////////////////////
//  JAN OCTAGON TRAINING AREA
//////////////////////////////////////////////////////////////////////////
#ifdef WITH_STORY_G1R
class URS_Guild_Human_Crimes_JanOctagon : UStaticRelationshipModifier
{
    default ForGuild.AddTag(GameplayTag::Guild_Human); 

    default Weight = 1.5f;

    /** All weapon-related crimes are ignored except Assault and Murder.
     *  Assault will be regulated through the Training fight modifiers
     */

    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_JanOctagon);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Fists);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_ThreateningWeaponTooClose);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_FistsDrawn);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_FistsTooClose);
}
#endif

// TEST - NO TRESPASSING CRIME
class URS_Guild_Testing_DisableTrespassingCrimes : UStaticRelationshipModifier
{
    default Weight = 10.0f;
    default ForGuild.AddTag(GameplayTag::Guild);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld ThisWorld) const
    {
        auto Player = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));

        if (Player == nullptr)
            return false;

        if (Player.HasGameplayTag(GameplayTag::Debug_Disable_Trespassing))
            return true;

        return false;
    }
    
    default IgnoredCrimes.Add(FIgnoredCrimeSetup());
    default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnGuild);
    default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing_OnPerson);
}

class UGuildAreaOwnershipModifier_Test_Theft : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_Test_Theft);

    default ForGuild.AddTag(GameplayTag::Guild_Test_Theft);
}

class UGuildAreaOwnershipModifier_Test_Trespassing : UGuildAreaOwnershipModifier
{
    default OwnedAreas.AddTag(GameplayTag::Area_Test_Trespassing);

    default ForGuild.AddTag(GameplayTag::Guild_Test_Trespassing);
}