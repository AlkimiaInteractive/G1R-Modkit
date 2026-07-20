#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MinecrawlerGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Minecrawler_Queen, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Minecrawler, Document::UDocumentSegment_Glossary_Minecrawler_Entry3);
            }
        }
        
        
        UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry3 GetCreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */