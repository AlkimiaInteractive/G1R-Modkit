#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldMineGlossary_OldMineUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OldMineGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OldMine_Interior);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000032), EConversationDebugInfo::Executing);
                Quest::Locations_OldMineGlossary_OldMineEntry2.StartQuest();
                DC(int64(0x00000032), EConversationDebugInfo::Done);
                DC(int64(0x00000033), EConversationDebugInfo::Executing);
                Quest::Locations_OldMineGlossary_OldMineEntry3.StartQuest();
                DC(int64(0x00000033), EConversationDebugInfo::Done);
                DC(int64(0x00000034), EConversationDebugInfo::Executing);
                Quest::Locations_OldMineGlossary_OldMineEntry4.StartQuest();
                DC(int64(0x00000034), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldMine, Document::UDocumentSegment_Glossary_OldMine_Unlock);
            }
        }
        
        
        UQuest_Locations_OldMineGlossary_OldMineUnlock GetLocations_OldMineGlossary_OldMineUnlock() property
        {
            return Cast<UQuest_Locations_OldMineGlossary_OldMineUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldMineGlossary_OldMineUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */