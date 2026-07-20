#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_LurkerGlossary_LurkerEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_LurkerGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Lurker, Document::UDocumentSegment_Glossary_Lurker_Entry3);
            }
        }
        
        
        UQuest_CreaturesGlossary_LurkerGlossary_LurkerEntry3 GetCreaturesGlossary_LurkerGlossary_LurkerEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_LurkerGlossary_LurkerEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_LurkerGlossary_LurkerEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */