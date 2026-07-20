#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_BanditsCampGlossary_BanditsCampUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_BanditsCampGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_BanditsCamp_Plateau);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000001c), EConversationDebugInfo::Executing);
                Quest::Locations_BanditsCampGlossary_BanditsCampEntry2.StartQuest();
                DC(int64(0x0000001c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BanditsCamp, Document::UDocumentSegment_Glossary_BanditsCamp_Unlock);
            }
        }
        
        
        UQuest_Locations_BanditsCampGlossary_BanditsCampUnlock GetLocations_BanditsCampGlossary_BanditsCampUnlock() property
        {
            return Cast<UQuest_Locations_BanditsCampGlossary_BanditsCampUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_BanditsCampGlossary_BanditsCampUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */