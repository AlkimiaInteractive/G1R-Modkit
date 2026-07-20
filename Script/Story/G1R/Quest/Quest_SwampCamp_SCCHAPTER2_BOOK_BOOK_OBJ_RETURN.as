#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_BOOK;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return (Hero != nullptr && Hero.HasItem(UItWr_Book_Focus, 1, 0)) || (/* Skip: was_triggered_by_dialog */ false);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN GetSwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */