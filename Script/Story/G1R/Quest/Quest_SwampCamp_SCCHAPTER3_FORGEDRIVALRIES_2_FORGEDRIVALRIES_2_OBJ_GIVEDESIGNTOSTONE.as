#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f3), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_FORGEDRIVALRIES2_GIVEDESIGNTOSTONE);
                DC(int64(0x000000f3), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE GetSwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */