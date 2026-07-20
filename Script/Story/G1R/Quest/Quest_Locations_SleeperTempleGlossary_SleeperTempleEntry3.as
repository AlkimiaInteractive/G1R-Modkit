#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_SleeperTempleGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SleeperTemple, Document::UDocumentSegment_Glossary_SleeperTemple_Entry3);
            }
        }
        
        
        UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry3 GetLocations_SleeperTempleGlossary_SleeperTempleEntry3() property
        {
            return Cast<UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */