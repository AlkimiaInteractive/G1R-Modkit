#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_AbandonedMineGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_AbandonedMine_Gallery_03);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_AbandonedMine, Document::UDocumentSegment_Glossary_AbandonedMine_Entry2);
            }
        }
        
        
        UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry2 GetLocations_AbandonedMineGlossary_AbandonedMineEntry2() property
        {
            return Cast<UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */