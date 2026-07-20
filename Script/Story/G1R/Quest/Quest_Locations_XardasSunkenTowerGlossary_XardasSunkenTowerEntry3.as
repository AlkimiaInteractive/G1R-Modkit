#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default InvolvedCharacters.Add(n"DEMONLORD");
            default ParentQuestClass = UQuest_Locations_XardasSunkenTowerGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            AGothicCharacterState GetDEMONLORD() const property { return GetCharacter(n"DEMONLORD"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasDefeated(DEMONLORD);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XardasSunkenTower, Document::UDocumentSegment_Glossary_XardasSunkenTower_Entry3);
            }
        }
        
        
        UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry3 GetLocations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry3() property
        {
            return Cast<UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */