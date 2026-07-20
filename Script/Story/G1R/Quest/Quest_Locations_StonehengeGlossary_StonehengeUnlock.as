#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_StonehengeGlossary_StonehengeUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_StonehengeGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_Stonehenge_MainArea);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000059), EConversationDebugInfo::Executing);
                Quest::Locations_StonehengeGlossary_StonehengeEntry2.StartQuest();
                DC(int64(0x00000059), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Stonehenge, Document::UDocumentSegment_Glossary_Stonehenge_Unlock);
            }
        }
        
        
        UQuest_Locations_StonehengeGlossary_StonehengeUnlock GetLocations_StonehengeGlossary_StonehengeUnlock() property
        {
            return Cast<UQuest_Locations_StonehengeGlossary_StonehengeUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_StonehengeGlossary_StonehengeUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */