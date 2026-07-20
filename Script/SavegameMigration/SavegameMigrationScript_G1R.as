#ifdef WITH_STORY_G1R

class USavegameMigrationScript_G1R_KirgoWrongRoutineDuringRankupGuard : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if (!IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD, EQuestState::Running))
            return false;

        FName KirgoGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OC_GRD_Kirgo_251, KirgoGlobalID))
            return false;

        if (HasNPCDailyRoutine(KirgoGlobalID, UDailyRoutine_OC_GRD_Kirgo_251_Shipment))
            return false;

        SetNPCDailyRoutine(KirgoGlobalID, UDailyRoutine_OC_GRD_Kirgo_251_Shipment);
        return true;
    }
}

class USavegameMigrationScript_G1R_DiegoBadKnowledgeEntryForEscapePlanQuest: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(!HasCharacterKnowledgeOfTopic(n"OC_STT_DIEGO", G1R::Conversation::UChoiceDiego93279))
            return false;

         if(HasCharacterKnowledgeOfTopic(n"OC_STT_DIEGO", G1R::Conversation::UTopic_Diego_100012))
            return false;

        // Diego has knowledge of UChoiceDiego93279 but not of the required next topic UChoiceDiego93279
        // there should be no way to have UChoiceDiego93279 without also having UChoiceDiego93279 
        // We want to remove UChoiceDiego93279 so the player can properly start this topic again

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceDiego93279);
        RemoveKnowledgeOfTopicFromCharacter(n"OC_STT_DIEGO", G1R::Conversation::UChoiceDiego93279);
        return true;
    }

}
class USavegameMigrationScript_G1R_LesterBadKnowledgeEntry4FriendsWaterfall: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(!HasCharacterKnowledgeOfTopic(n"SC_NOV_LESTER", G1R::Conversation::UChoiceLester89073))
            return false;

        if(HasCharacterKnowledgeOfTopic(n"SC_NOV_LESTER", G1R::Conversation::UTopic_Lester_107810))
            return false;

        // Lester has knowledge of UChoiceLester89073 without having seen the required end topic UTopic_Lester_107810
        // Remove UChoiceLester89073 form all participants to restore a proper conversation flow

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceLester89073);
        RemoveKnowledgeOfTopicFromCharacter(n"SC_NOV_LESTER", G1R::Conversation::UChoiceLester89073);
        RemoveKnowledgeOfTopicFromCharacter(n"OC_STT_DIEGO", G1R::Conversation::UChoiceLester89073);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_SLD_Gorn_699", G1R::Conversation::UChoiceLester89073);
        RemoveKnowledgeOfTopicFromCharacter(n"OC_KDF_Milten", G1R::Conversation::UChoiceLester89073);

        return true;
    }
}

class USavegameMigrationScript_G1R_KalomBadKnowledgeAfterFindingAmulet: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(!HasCharacterKnowledgeOfTopic(n"SC_GUR_CorKalom_1201", G1R::Conversation::UChoiceCorkalom85302))
            return false;

        if(HasCharacterKnowledgeOfTopic(n"SC_GUR_CorKalom_1201", G1R::Conversation::UCorKalom_91730) || 
            HasCharacterKnowledgeOfTopic(n"SC_GUR_CorKalom_1201", G1R::Conversation::UCorKalom_89379))
            return false;

        // Kalom Has knowledge of the Force conversation UChoiceCorkalom85302 but not of either sub topics that can exit it
        // Remove UChoiceCorkalom85302

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceCorkalom85302);
        RemoveKnowledgeOfTopicFromCharacter(n"SC_GUR_CorKalom_1201", G1R::Conversation::UChoiceCorkalom85302);

        return true;
    }
}

class USavegameMigrationScript_G1R_YberionBadKnowledgeAfterMCQueen: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(!HasCharacterKnowledgeOfTopic(n"SC_GUR_YBerion_1200", G1R::Conversation::UChoiceYberion113927))
            return false;

        if(HasCharacterKnowledgeOfTopic(n"SC_GUR_YBerion_1200", G1R::Conversation::UYBerion_114055))
            return false;

        // yberion Has knowledge of the Force conversation UChoiceYberion113927 but not of the sub topic that can exit it
        // Remove UChoiceYberion113927

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceYberion113927);
        RemoveKnowledgeOfTopicFromCharacter(n"SC_GUR_YBerion_1200", G1R::Conversation::UChoiceYberion113927);

        return true;
    }
}

class USavegameMigrationScript_G1R_DiegobadKnowledge4FriendsFogtower: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(!HasCharacterKnowledgeOfTopic(n"OC_STT_DIEGO", G1R::Conversation::UChoiceDiego93382))
            return false;

        if(HasCharacterKnowledgeOfTopic(n"OC_STT_DIEGO", G1R::Conversation::UTopic_Diego_106735))
            return false;

        // diego Has knowledge of the Force conversation UChoiceDiego93382 but not of the sub topic that can exit it
        // Remove UChoiceDiego93382

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceDiego93382);
        RemoveKnowledgeOfTopicFromCharacter(n"OC_STT_DIEGO", G1R::Conversation::UChoiceDiego93382);

        return true;
    }
}

class USavegameMigrationScript_G1R_GornBadKnowledgeBeforeFogTowerMeeting: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(!HasCharacterKnowledgeOfTopic(n"NC_SLD_Gorn_699", G1R::Conversation::UChoiceGorn93168))
            return false;

        if(HasCharacterKnowledgeOfText(n"NC_SLD_Gorn_699", LocText("TEXT_WIP_PKRDULC_20240503_135211")))
            return false;

        // gorn Has knowledge of the Force conversation UChoiceGorn93168 but not of the text that can exit it
        // Remove UChoiceGorn93168

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceGorn93168);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_SLD_Gorn_699", G1R::Conversation::UChoiceGorn93168);

        return true;
    }
}

class USavegameMigrationScript_G1R_SaturasBadKnowledgeNews: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if (HasCharacterKnowledgeOfTopic(n"NC_KDW_SATURAS_600", G1R::Conversation::UChoiceSaturasNews) &&
            HasQuestBeenStarted(G1R::Quest::UQuest_NewCamp_NCCHAPTER3_BRINGFOCI))
            return false;

        // Some players reported not being able to talk to Saturas to start the focus collection quest. In that case, 
        // reset the knowledge and all subtopics
        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceSaturasNews);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_KDW_SATURAS_600", G1R::Conversation::UChoiceSaturasNews);

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UTopic_Saturas_101094);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_KDW_SATURAS_600", G1R::Conversation::UTopic_Saturas_101094);

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UTopic_Saturas_101114);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_KDW_SATURAS_600", G1R::Conversation::UTopic_Saturas_101114);

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UTopic_Saturas_104009);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_KDW_SATURAS_600", G1R::Conversation::UTopic_Saturas_104009);

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UTopic_Saturas_104029);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_KDW_SATURAS_600", G1R::Conversation::UTopic_Saturas_104029);

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UTopic_Saturas_106411);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_KDW_SATURAS_600", G1R::Conversation::UTopic_Saturas_106411);

        return true;
    }
}

class USavegameMigrationScript_G1R_FireMagesPermissionNotTrue : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(GetStoryValueInt32(G1R::UStoryG1R, n"FireMagesPermission") == 1)
            return false;

        if (!IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE, EQuestState::Running) && !IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE, EQuestState::Succeeded)
        && !IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE, EQuestState::Failed))
            return false;

        SetStoryValueInt32(G1R::UStoryG1R, n"FireMagesPermission",1);

        return true;
    }
}

class USavegameMigrationScript_G1R_OCGateGuardWrongRoutineAfterFiremagesCinematic : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(GetStoryValueInt32(G1R::UStoryG1R, n"FireMagesDead") == 0)
            return false;

        FName GuardGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OCR_GRD_GateGuard01_212, GuardGlobalID))
            return false;

        if (HasNPCDailyRoutine(GuardGlobalID, UDailyRoutine_OCR_GRD_GateGuard01_212_Fmtaken))
            return false;

        SetNPCDailyRoutine(GuardGlobalID, UDailyRoutine_OCR_GRD_GateGuard01_212_Fmtaken);
        return true;
    }
}

class USavegameMigrationScript_G1R_RecruitDustyQuestRunningAfterChapter3 : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(GetStoryValueInt32(G1R::UStoryG1R, n"Chapter") < 3)
            return false;

        if (IsQuestInState(G1R::Quest::UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY, EQuestState::Running))
        {
            SetQuestState(G1R::Quest::UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY, EQuestState::Failed);
            return true;
        }

        return false;
    }
}

class USavegameMigrationScript_G1R_MiltenHasAssignedWrongFollowRoutine : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
         FName MiltenGlobalID;
         if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OC_KDF_Milten, MiltenGlobalID))
             return false;

        
        if (!HasNPCDailyRoutine(MiltenGlobalID, UDailyRoutine_OC_KDF_Milten_Follow))
             return false;

        SetNPCDailyRoutine(MiltenGlobalID, UDailyRoutine_OC_KDF_Milten_TCFollow);
        return true;
    }
}

class USavegameMigrationScript_G1R_RodriguezIsNotWaitingInDoor : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
         FName RodriguezGlobalID;
         if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OC_KDF_Rodriguez_400, RodriguezGlobalID))
             return false;

        FName MiltenGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OC_KDF_Milten, MiltenGlobalID))
            return false;

        
        if (HasNPCDailyRoutine(RodriguezGlobalID, UDailyRoutine_OC_KDF_Rodriguez_400_Door))
             return false;

        if (!HasNPCDailyRoutine(MiltenGlobalID, UDailyRoutine_OC_KDF_Milten_LightHouse))
             return false;

        if (HasNPCDailyRoutine(RodriguezGlobalID, UDailyRoutine_OC_KDF_Rodriguez_400_Kdfritual))
             return false;

        SetNPCDailyRoutine(RodriguezGlobalID, UDailyRoutine_OC_KDF_Rodriguez_400_Door);
        return true;
    }
}

class USavegameMigrationScript_G1R_MiltenHasRodriguezDailyRoutine : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {

        FName MiltenGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OC_KDF_Milten, MiltenGlobalID))
            return false;

        if (HasNPCDailyRoutine(MiltenGlobalID, UDailyRoutine_OC_KDF_Rodriguez_400_Door))
        {
            SetNPCDailyRoutine(MiltenGlobalID, UDailyRoutine_OC_KDF_Milten_LightHouse);
            return true;
        }

        return false;
    }
}

class USavegameMigrationScript_G1R_OCBanditsCampRunningAfterFireMagesCinematic : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if (!IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP, EQuestState::Running))
            return false;

        if(GetStoryValueInt32(G1R::UStoryG1R, n"FireMagesDead") == 0)
           return false;
        
        SetQuestState(G1R::Quest::UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP, EQuestState::Failed);
        return true;
    }
}



class USavegameMigrationScript_G1R_SharkyHasAssignedWrongDailyRoutine : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if (!IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER, EQuestState::Succeeded))
            return false;

        FName SharkyGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_NC_ORG_Sharky_843, SharkyGlobalID))
            return false;

        if (HasNPCDailyRoutine(SharkyGlobalID, UDailyRoutine_NC_ORG_Sharky_843_NewDealer) && GetStoryValueInt32(G1R::UStoryG1R, n"FireMagesDead") == 0)
            return false;

        if (HasNPCDailyRoutine(SharkyGlobalID, UDailyRoutine_NC_ORG_Sharky_843_Start) && GetStoryValueInt32(G1R::UStoryG1R, n"FireMagesDead") == 1)
            return false;

        if(GetStoryValueInt32(G1R::UStoryG1R, n"FireMagesDead") == 0)
        {
            SetNPCDailyRoutine(SharkyGlobalID, UDailyRoutine_NC_ORG_Sharky_843_NewDealer);
        }
        else
        {
            SetNPCDailyRoutine(SharkyGlobalID, UDailyRoutine_NC_ORG_Sharky_843_Start);
        }

        return true;
    }
}

class USavegameMigrationScript_G1R_LeeBadKnowledgeEntryForRankupMercenaryQuest: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if (IsQuestInState(G1R::Quest::UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY, EQuestState::Succeeded))
            return false;

        if (!HasCharacterKnowledgeOfTopic(n"Hero", G1R::Conversation::UChoiceLee114045))
            return false;

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceLee114045);
        RemoveKnowledgeOfTopicFromCharacter(n"NC_SLD_LEE_700", G1R::Conversation::UChoiceLee114045);
        
        return true;
    }
}

class USavegameMigrationScript_G1R_StoneWrongGuildInPrison: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(GetStoryValueInt32(G1R::UStoryG1R, n"ExploreSunkenTower") == 0)
            return false;

        FName StoneGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OCR_GRD_Stone_219, StoneGlobalID))
            return false;

        if (GetGuildEffectOfCharacter(StoneGlobalID) != UGE_Guild_Human_OldCamp_Guard_OC)
            return false;

        SetGuildEffectOfCharacter(StoneGlobalID, UGE_Guild_None);
        return true;
    }
}

class USavegameMigrationScript_G1R_StoneWrongRoutineAfterFree: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if (GetStoryValueInt32(G1R::UStoryG1R, n"ExploreSunkenTower") == 0)
            return false;

        FName StoneGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OCR_GRD_Stone_219, StoneGlobalID))
            return false;

        if (!HasNPCDailyRoutine(StoneGlobalID, UDailyRoutine_OCR_GRD_Stone_219_Ot))
            return false;

        if (HasNPCDailyRoutine(StoneGlobalID, UDailyRoutine_OCR_GRD_Stone_219_ScNew) ||
            HasNPCDailyRoutine(StoneGlobalID, UDailyRoutine_OCR_GRD_Stone_219_NcNew))
            return false;

        if (!IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_FREESTONE, EQuestState::Succeeded))
            return false;

        if (!HasQuestBeenStarted(G1R::Quest::UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE))
            return false;

        if (GetStoryValueInt32(G1R::UStoryG1R, n"ForgedRivalries3_StoneKnowsDarrionAccept") != 0)
        {
            SetNPCDailyRoutine(StoneGlobalID, UDailyRoutine_OCR_GRD_Stone_219_ScNew);
            SetGuildEffectOfCharacter(StoneGlobalID, UGE_Guild_Human_SwampCamp_Novice);
        }
        else
        {
            SetNPCDailyRoutine(StoneGlobalID, UDailyRoutine_OCR_GRD_Stone_219_NcNew);
            SetGuildEffectOfCharacter(StoneGlobalID, UGE_Guild_Human_NewCamp_Scraper);
        }

        return true;
    }
}

class USavegameMigrationScript_G1R_FingersCanTeachInChapter2: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(GetStoryValueInt32(G1R::UStoryG1R, n"Chapter") <= 1 || GetStoryValueInt32(G1R::UStoryG1R, n"Chapter") >= 4)
            return false;

        if(GetStoryValueInt32(G1R::UStoryG1R, n"Fingers_CanTeach") == 1)
            return false;
        
        SetStoryValueInt32 (G1R::UStoryG1R, n"Fingers_CanTeach",1);
        return true;
    }
}

class USavegameMigrationScript_G1R_UmakhalFollowingHeroAfterCompletingGetRidOfHumakhalQuest : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
         FName UmakhalGlobalID;
         if (!FindGlobalIDForCharacter(UCharacterDefinition_Orc_OW_OPS_Umakhal_2402, UmakhalGlobalID))
             return false;

        
        if (!HasNPCDailyRoutine(UmakhalGlobalID, UDailyRoutine_OW_OPS_Umakhal_2402_Follow))
             return false;

        if (!IsQuestInState(G1R::Quest::UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL, EQuestState::Succeeded))
            return false;

        SetNPCDailyRoutine(UmakhalGlobalID, UDailyRoutine_OW_OPS_Umakhal_2402_Start);
        return true;
    }
}

class USavegameMigrationScript_G1R_TorrezBadKnowledgeEntryForMagicTransactionQuest: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if (IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN, EQuestState::Succeeded))
            return false;

        if (!HasCharacterKnowledgeOfTopic(n"Hero", G1R::Conversation::UChoiceTorrez107752))
            return false;

        FName TorrezGlobalID;
        if (!FindGlobalIDForCharacter(UCharacterDefinition_Human_OC_KDF_Torrez_405, TorrezGlobalID))
            return false;

        RemoveKnowledgeOfTopicFromCharacter(n"Hero", G1R::Conversation::UChoiceTorrez107752);
        RemoveKnowledgeOfTopicFromCharacter(TorrezGlobalID, G1R::Conversation::UChoiceTorrez107752);
        
        return true;
    }
}

class USavegameMigrationScript_G1R_FingersQuestStillRunningInChapter2: UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        if(GetStoryValueInt32(G1R::UStoryG1R, n"Chapter") < 2)
            return false;

        if (IsQuestInState(G1R::Quest::UQuest_OldCamp_OCCHAPTER1_FINGERS_RING, EQuestState::Running))
        {
            SetQuestState(G1R::Quest::UQuest_OldCamp_OCCHAPTER1_FINGERS_RING, EQuestState::Failed);
            return true;
        }
        else
        {
            return false;
        }
    }
}

class USavegameMigrationScript_G1R_SwitchDefeatedTagsForEffects : UGothicSavegameMigrationScript
{
    UFUNCTION(BlueprintOverride)
    bool Migrate()
    {
        SwitchDefeatedTagsForEffects(UGE_State_Defeated::StaticClass());
        return true;
    }
}
#endif