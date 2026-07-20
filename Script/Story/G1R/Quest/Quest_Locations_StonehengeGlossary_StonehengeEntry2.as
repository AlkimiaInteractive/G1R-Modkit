#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_StonehengeGlossary_StonehengeEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_StonehengeGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_Stonehenge_Dungeon_Focus);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Stonehenge, Document::UDocumentSegment_Glossary_Stonehenge_Entry2);
            }
        }
        
        
        UQuest_Locations_StonehengeGlossary_StonehengeEntry2 GetLocations_StonehengeGlossary_StonehengeEntry2() property
        {
            return Cast<UQuest_Locations_StonehengeGlossary_StonehengeEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_StonehengeGlossary_StonehengeEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */