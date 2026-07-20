#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return ((Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0) && G1R.JackoNoteRead != 0 && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning() && Hero != nullptr && Hero.HasKnowledgeOf(G1R::Conversation::UTopic_Hero_BranCorpse::StaticClass()))) || ((Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_VHHDWEM_20240208_151904_2386")) && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning() && Hero != nullptr && Hero.HasKnowledgeOf(G1R::Conversation::UTopic_Hero_BranCorpse::StaticClass()))) || ((Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning() && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Bran_01, 1, 0) && G1R.BranNoteRead != 0));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000004c), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT.StartQuest();
                DC(int64(0x0000004c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_BrandFound);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN GetNewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */