#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MinecrawlerGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Secretion_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Minecrawler, Document::UDocumentSegment_Glossary_Minecrawler_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry2 GetCreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */