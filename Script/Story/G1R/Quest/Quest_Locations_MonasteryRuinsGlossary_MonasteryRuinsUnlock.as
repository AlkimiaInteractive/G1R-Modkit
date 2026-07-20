#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_MonasteryRuinsGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_MonasteryRuins_Cloister);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000075), EConversationDebugInfo::Executing);
                Quest::Locations_MonasteryRuinsGlossary_MonasteryRuinsEntry2.StartQuest();
                DC(int64(0x00000075), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_MonasteryRuins, Document::UDocumentSegment_Glossary_MonasteryRuins_Unlock);
            }
        }
        
        
        UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsUnlock GetLocations_MonasteryRuinsGlossary_MonasteryRuinsUnlock() property
        {
            return Cast<UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */