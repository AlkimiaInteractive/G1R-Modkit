#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_Locations_XardasSunkenTowerGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UDmb_Armor_M, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000bf), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_ST_XARDASSUNKENTOWER_COMPLETE);
                DC(int64(0x000000bf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XardasSunkenTower, Document::UDocumentSegment_Glossary_XardasSunkenTower_Entry4);
            }
        }
        
        
        UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry4 GetLocations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry4() property
        {
            return Cast<UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */