namespace OldCamp
{
    class URS_Guild_OldCamp : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Angry);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Friend);

        default RankOfGuild.Add(GameplayTag::Guild_None, ERelationshipRelativeRank::Scum);

        default Weight = 1.0f;
    }

    class URS_Guild_OldCamp_Convoy : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_Convoy_OldCamp);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Angry);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Friend);

        default RankOfGuild.Add(GameplayTag::Guild_None, ERelationshipRelativeRank::Scum);

        default Weight = 1.0f;
    }

    class URS_Guild_OreBarons : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);

        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipRelativeRank::Scum);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipRelativeRank::Scum);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipHostility::ProtectFromDifferentGuild);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipHostility::ProtectFromDifferentGuild);

        default Weight = 2.0f;        
    }

    class URS_Guild_FireMages : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);

        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationshipRelativeRank::HigherThanMe); 
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipRelativeRank::Scum);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipHostility::ProtectFromDifferentGuild);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipHostility::ProtectFromDifferentGuild);

        default Weight = 2.0f;
    }

    class URS_Guild_Guards : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);

        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationshipRelativeRank::HigherThanMe);        
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipRelativeRank::Scum);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipHostility::ProtectFromDifferentGuild);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipHostility::ProtectFromDifferentGuild);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Orc_Slave, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Orc_Slave, ERelationshipHostility::ProtectFromDifferentGuild);

        default Weight = 2.0f;        
    }

    class URS_Guild_Shadows : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);

        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationshipRelativeRank::HigherThanMe);        
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipRelativeRank::Scum);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipHostility::ProtectFromDifferentGuild);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipHostility::ProtectFromDifferentGuild);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Orc_Slave, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Orc_Slave, ERelationshipHostility::ProtectFromDifferentGuild);

        default Weight = 2.0f;        
    }

    class URS_Guild_Digger : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);

        default RankOfGuild.Add(GameplayTag::Guild_None, ERelationshipRelativeRank::LowerThanMe);

        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationshipRelativeRank::HigherThanMe);        
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipRelativeRank::Scum);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationship::Neutral);

        default Weight = 2.0f;
    }

    class URS_Guild_WomanSlaves_OC : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationship::Friend);

        default RankOfGuild.Add(GameplayTag::Guild_None, ERelationshipRelativeRank::HigherThanMe);

        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationshipRelativeRank::HigherThanMe);

        default Weight = 2.0f;        
    }

    #ifdef WITH_STORY_G1R
    class URS_Guild_WomanSlaves_OC_BeforeEscapePlan : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationship::Friend);
        default Weight = 3.0f;

        UFUNCTION(BlueprintOverride)
        bool IsApplicableForWorld(UWorld CurrentWorld) const
        {
            return !G1R::Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted();
        }
    }
    #endif
}

namespace NewCamp
{
    class URS_Guild_NewCamp : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Angry);

        default RankOfGuild.Add(GameplayTag::Guild_None, ERelationshipRelativeRank::Scum);

        default Weight = 1.0f;
    }

    class URS_Guild_Convoy_NewCamp : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Angry);

        default RankOfGuild.Add(GameplayTag::Guild_None, ERelationshipRelativeRank::Scum);

        default Weight = 1.0f;
    }

    class URS_Guild_WaterMages : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_WaterMage);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);
        
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipRelativeRank::LowerThanMe);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipHostility::ProtectFromDifferentGuild);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipHostility::ProtectFromDifferentGuild);

        default Weight = 2.0f;
    }

    class URS_Guild_Mercenaries : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Mercenary);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);
        
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipRelativeRank::LowerThanMe);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipHostility::ProtectFromDifferentGuild);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipHostility::ProtectFromDifferentGuild);

        default Weight = 2.0f;
    }

    class URS_Guild_Rogues : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue);

        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipRelativeRank::LowerThanMe);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationship::Neutral);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipHostility::ProtectFromDifferentGuild);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipHostility::ProtectFromDifferentGuild);

        default Weight = 2.0f;
    }

    class URS_Guild_Scrapers : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Scraper);
        
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipRelativeRank::Same);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue, ERelationship::Neutral);

        default Weight = 2.0f;
    }

    class URS_Guild_Peasants : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Peasant);
        
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant, ERelationshipRelativeRank::Same);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue, ERelationship::Neutral);

        default Weight = 2.0f;
    }
}

namespace SwampCamp
{
    class URS_Guild_SwampCamp : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp);

        default IgnoredCrimes.Add(FIgnoredCrimeSetup());
        default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area); // Where is it allowed
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_DirectThreat_Weapon_Magic_LowThreat);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist, ERelationship::Angry);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationship::Neutral);

        default Weight = 1.0f;
    }

     class URS_Guild_SwampCamp_Kalomnist : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist, ERelationship::Friend);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage, ERelationship::Neutral);

        default Weight = 1.5f;
    }

    class URS_Guild_Gurus : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Guru);
        
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_WomanSlave, ERelationshipRelativeRank::LowerThanMe);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice, ERelationshipRelativeRank::LowerThanMe);

        default Weight = 2.0f;
    }

    class URS_Guild_Kalomnist_Gurus : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru);
        
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_WomanSlave, ERelationshipRelativeRank::LowerThanMe);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice, ERelationshipRelativeRank::LowerThanMe);

        default Weight = 2.0f;
    }

    class URS_Guild_Templars : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Templar);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_WomanSlave, ERelationshipRelativeRank::LowerThanMe);

        default Weight = 2.0f;
    }

    class URS_Guild_Kalomnist_Templars : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice, ERelationshipRelativeRank::LowerThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_WomanSlave, ERelationshipRelativeRank::LowerThanMe);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice, ERelationshipRelativeRank::LowerThanMe);

        default Weight = 2.0f;
    }

    class URS_Guild_Novices : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Novice);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_WomanSlave, ERelationshipRelativeRank::LowerThanMe);

        default Weight = 2.0f;
    }

    class URS_Guild_Kalomnist_Novices : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice, ERelationshipRelativeRank::Same);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_WomanSlave, ERelationshipRelativeRank::LowerThanMe);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice, ERelationshipRelativeRank::Same);

        default Weight = 2.0f;
    }

    class URS_Guild_WomanSlaves_SC : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);

        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice, ERelationshipRelativeRank::HigherThanMe);
        default RankOfGuild.Add(GameplayTag::Guild_Human_SwampCamp_WomanSlave, ERelationshipRelativeRank::Same);

        default Weight = 2.0f;
    }
}

namespace BanditCamp
{
    class URS_Guild_Bandit : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_Bandit);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Bandit, ERelationship::Friend);
    }
}

namespace DemonSummoner
{
    class URS_Guild_DemonSummoner : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Human_DemonSummoner);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species, ERelationship::Neutral);

        // Xardas is friends with Scrapers in the OGs matrix... why though?
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper, ERelationship::Friend);

        default Weight = 1.0f;
    }
}

namespace Orcs
{
    class URS_Guild_Orc_Shaman : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Orc_Shaman);
        default Weight = 5.0f;
    }

    class URS_Guild_Orc_Slave : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Orc_Slave);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default Weight = 2.0f;
    }
}

namespace TestGuilds
{
    class URS_Guild_Test_A : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Test_A);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_A, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_B, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_C, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_D, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_None, ERelationshipHostility::AttackOnSight);

        default Weight = 2.0f;
    }

    class URS_Guild_Test_B : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Test_B);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_A, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_B, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_C, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_D, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Test_D, ERelationshipHostility::AttackOnSight);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_None, ERelationshipHostility::AttackOnSight);

        default Weight = 2.0f;
    }

    class URS_Guild_Test_C : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Test_C);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_A, ERelationship::Angry);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_B, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_C, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_D, ERelationship::Neutral);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_None, ERelationshipHostility::AttackOnSight);

        default Weight = 2.0f;
    }

    class URS_Guild_Test_D : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Test_D);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_A, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Test_A, ERelationshipHostility::AttackOnSight);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_B, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_Test_B, ERelationshipHostility::AttackOnSight);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_C, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_D, ERelationship::Friend);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_None, ERelationshipHostility::AttackOnSight);

        default Weight = 2.0f;
    }

    class URS_Guild_Test_Trespassing : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Test_Trespassing);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_Trespassing, ERelationship::Friend);      

        default Weight = 2.0f;
    }

    class URS_Guild_Test_Theft: UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_Test_Theft);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_Theft, ERelationship::Friend);

        default IgnoredCrimes.Add(FIgnoredCrimeSetup());
        default IgnoredCrimes.Last().AffectedLocations.AddTag(GameplayTag::Area_Test);
        default IgnoredCrimes.Last().ByGuild.FindOrAdd(GameplayTag::Guild).AddTag(GameplayTag::Crime_Trespassing);

        default Weight = 2.0f;
    }

    class URS_Guild_Test_HostileToAITestDummy : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Test_AITestDummy, ERelationship::Enemy);
    }
}

namespace SleeperTempleGuilds
{
    class URS_Guild_SleeperTemple : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_SleeperTemple);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild, ERelationship::Enemy);
        default HostilityTowardsGuild.Add(GameplayTag::Guild, ERelationshipHostility::AttackOnSight);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_SleeperTemple, ERelationship::Friend);
        default HostilityTowardsGuild.Add(GameplayTag::Guild_SleeperTemple, ERelationshipHostility::Help);


        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationship::Neutral);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationshipHostility::None);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Neutral);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationshipHostility::None);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Neutral);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationshipHostility::None);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Neutral);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::None);

        default Weight = 5.0f;
    }

    class URS_Guild_SleeperTemple_Gorn : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_SleeperTemple_Gorn);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild, ERelationship::Neutral);

        default Weight = 6.0f;
    }

    class URS_Guild_SleeperTemple_Lester : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_SleeperTemple_Lester);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild, ERelationship::Neutral);

        default Weight = 6.0f;
    }

    class URS_Guild_SleeperTemple_Xardas : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_SleeperTemple_Xardas);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild, ERelationship::Neutral);

        default Weight = 6.0f;
    }

    class URS_Guild_SleeperTemple_Mud : UStaticRelationshipModifier
    {
        default ForGuild.AddTag(GameplayTag::Guild_SleeperTemple_Mud);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild, ERelationship::Neutral);

        default Weight = 6.0f;
    }
}