#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_BOOK : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER2_BOOK-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_BOOK-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_BOOK;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"SC_GUR_YBERION_1200";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000082), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_BOOK_COMPLETE);
                DC(int64(0x00000082), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_BOOK GetSwampCamp_SCCHAPTER2_BOOK() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_BOOK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_BOOK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */