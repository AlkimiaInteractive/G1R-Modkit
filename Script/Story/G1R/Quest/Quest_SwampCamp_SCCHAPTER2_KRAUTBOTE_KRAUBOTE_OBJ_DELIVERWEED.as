#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_DELIVERWEED : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_DELIVERWEED-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000005b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_RETURN.StartQuest();
                DC(int64(0x0000005b), EConversationDebugInfo::Done);
                DC(int64(0x0000005c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_KRAUTBOTE_DELIVER);
                DC(int64(0x0000005c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_DELIVERWEED GetSwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_DELIVERWEED() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_DELIVERWEED>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_DELIVERWEED::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */