#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_CastleRuinsGlossary_CastleRuinsUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_CastleRuinsGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_CastleRuins_Keep);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000063), EConversationDebugInfo::Executing);
                Quest::Locations_CastleRuinsGlossary_CastleRuinsEntry2.StartQuest();
                DC(int64(0x00000063), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_CastleRuins, Document::UDocumentSegment_Glossary_CastleRuins_Unlock);
            }
        }
        
        
        UQuest_Locations_CastleRuinsGlossary_CastleRuinsUnlock GetLocations_CastleRuinsGlossary_CastleRuinsUnlock() property
        {
            return Cast<UQuest_Locations_CastleRuinsGlossary_CastleRuinsUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_CastleRuinsGlossary_CastleRuinsUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */