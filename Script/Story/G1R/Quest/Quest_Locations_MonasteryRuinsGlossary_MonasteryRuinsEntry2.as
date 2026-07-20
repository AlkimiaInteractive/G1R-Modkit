#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_MonasteryRuinsGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_MonasteryRuins_AlchemyRoom_Entrance);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_MonasteryRuins, Document::UDocumentSegment_Glossary_MonasteryRuins_Entry1);
            }
        }
        
        
        UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsEntry2 GetLocations_MonasteryRuinsGlossary_MonasteryRuinsEntry2() property
        {
            return Cast<UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_MonasteryRuinsGlossary_MonasteryRuinsEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */