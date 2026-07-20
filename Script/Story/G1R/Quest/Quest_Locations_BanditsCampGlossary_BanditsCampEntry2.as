#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_BanditsCampGlossary_BanditsCampEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_BanditsCampGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_QKQHPDM_20241213_133428"));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BanditsCamp, Document::UDocumentSegment_Glossary_BanditsCamp_Entry2);
            }
        }
        
        
        UQuest_Locations_BanditsCampGlossary_BanditsCampEntry2 GetLocations_BanditsCampGlossary_BanditsCampEntry2() property
        {
            return Cast<UQuest_Locations_BanditsCampGlossary_BanditsCampEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_BanditsCampGlossary_BanditsCampEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */