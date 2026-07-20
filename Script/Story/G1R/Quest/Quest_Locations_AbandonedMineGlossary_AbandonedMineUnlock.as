#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_AbandonedMineGlossary_AbandonedMineUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_AbandonedMineGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_AbandonedMine);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000d), EConversationDebugInfo::Executing);
                Quest::Locations_AbandonedMineGlossary_AbandonedMineEntry2.StartQuest();
                DC(int64(0x0000000d), EConversationDebugInfo::Done);
                DC(int64(0x0000000e), EConversationDebugInfo::Executing);
                Quest::Locations_AbandonedMineGlossary_AbandonedMineEntry3.StartQuest();
                DC(int64(0x0000000e), EConversationDebugInfo::Done);
                DC(int64(0x0000000f), EConversationDebugInfo::Executing);
                Quest::Locations_AbandonedMineGlossary_AbandonedMineEntry4.StartQuest();
                DC(int64(0x0000000f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_AbandonedMine, Document::UDocumentSegment_Glossary_AbandonedMine_Unlock);
            }
        }
        
        
        UQuest_Locations_AbandonedMineGlossary_AbandonedMineUnlock GetLocations_AbandonedMineGlossary_AbandonedMineUnlock() property
        {
            return Cast<UQuest_Locations_AbandonedMineGlossary_AbandonedMineUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_AbandonedMineGlossary_AbandonedMineUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */