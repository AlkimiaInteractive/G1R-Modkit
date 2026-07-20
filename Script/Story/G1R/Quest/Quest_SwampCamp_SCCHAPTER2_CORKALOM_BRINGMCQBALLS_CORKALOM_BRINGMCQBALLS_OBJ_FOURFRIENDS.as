#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN.HasFailed() && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_InformLester);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a0), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_DIEGO.StartQuest();
                DC(int64(0x000000a0), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS GetSwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */