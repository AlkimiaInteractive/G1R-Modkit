#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_OrcdogGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OrcDog, Document::UDocumentSegment_Glossary_OrcDog_Entry3);
            }
        }
        
        
        UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogEntry3 GetCreaturesGlossary_OrcdogGlossary_OrcdogEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */