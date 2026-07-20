namespace GuildRelationsAfterFireMagesDeath
{
    #ifdef WITH_STORY_G1R    
    class URS_AfterFireMagesDeath : UStaticRelationshipModifier
    {
        UFUNCTION(BlueprintOverride)
        bool IsApplicableForWorld(UWorld CurrentWorld) const
        {
            return G1R::UStoryG1R::Get().FireMagesDead == 1;
        }
    }

    namespace OldCamp
    {
        class URS_Guild_OldCamp_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Angry);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Angry);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Angry);

            default RankOfGuild.Add(GameplayTag::Guild_None, ERelationshipRelativeRank::Scum);

            default Weight = 4.0f;
        }

        class URS_Guild_OreBarons_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationship::Angry);

            default Weight = 5.0f;        
        }

        class URS_Guild_FireMages_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            // ONLY MILTEN ?
            default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationship::Angry);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow, ERelationship::Angry);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard, ERelationship::Angry);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationship::Neutral);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Friend);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Friend);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);

            default Weight = 5.0f;
        }

        class URS_Guild_Guards_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationship::Angry);

            default Weight = 5.0f;        
        }

        class URS_Guild_Shadows_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationship::Angry);

            default Weight = 5.0f;        
        }

        class URS_Guild_Digger_AfterFireMagesDeath : UStaticRelationshipModifier
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

            default Weight = 5.0f;
        }

        class URS_Guild_WomanSlaves_OC_AfterFireMagesDeath : UStaticRelationshipModifier
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

            default Weight = 5.0f;        
        }

        #ifdef WITH_STORY_G1R
        class URS_Guild_WomanSlaves_OC_BeforeEscapePlan_AfterFireMagesDeath : UStaticRelationshipModifier
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron, ERelationship::Friend);
            default Weight = 6.0f;

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
        class URS_Guild_NewCamp_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Friend);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Angry);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationship::Friend);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Friend);

            default Weight = 4.0f;
        }

        class URS_Guild_WaterMages_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_WaterMage);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);

            default Weight = 5.0f;
        }

        class URS_Guild_Mercenaries_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Mercenary);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);

            default Weight = 5.0f;
        }

        class URS_Guild_Rogues_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_DemonSummoner, ERelationship::Friend);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Neutral);

            default Weight = 5.0f;
        }

        class URS_Guild_Scrappers_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Scraper);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);

            default Weight = 5.0f;
        }

        class URS_Guild_Peasants_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            default ForGuild.AddTag(GameplayTag::Guild_Human_NewCamp_Peasant);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_SwampCamp, ERelationship::Neutral);

            default Weight = 5.0f;
        }
    }

    namespace SwampCamp
    {
        class URS_Guild_SwampCamp_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            // AFTER FIRE MAGES CINEMATIC
            default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Neutral);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp, ERelationship::Angry);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage, ERelationship::Friend);
            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger, ERelationship::Neutral);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_None, ERelationship::Friend);

            default Weight = 4.0f;
        }

        class URS_Guild_Templars_AfterFireMagesDeath : URS_AfterFireMagesDeath
        {
            // AFTER FIRE MAGES CINEMATIC
            default ForGuild.AddTag(GameplayTag::Guild_Human_SwampCamp_Templar);

            default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_NewCamp, ERelationship::Friend);

            default Weight = 5.0f;
        }
    }
    #endif
}