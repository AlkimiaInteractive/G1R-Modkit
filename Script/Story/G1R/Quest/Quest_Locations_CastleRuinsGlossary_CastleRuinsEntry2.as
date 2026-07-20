#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_CastleRuinsGlossary_CastleRuinsEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_CastleRuinsGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_CastleRuins_GolemRoom);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_CastleRuins, Document::UDocumentSegment_Glossary_CastleRuins_Entry2);
            }
        }
        
        
        UQuest_Locations_CastleRuinsGlossary_CastleRuinsEntry2 GetLocations_CastleRuinsGlossary_CastleRuinsEntry2() property
        {
            return Cast<UQuest_Locations_CastleRuinsGlossary_CastleRuinsEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_CastleRuinsGlossary_CastleRuinsEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */