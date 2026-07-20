#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a7), EConversationDebugInfo::Executing);
                Hero.GiveExperience(50);
                DC(int64(0x000000a7), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_CreaturesGlossary GetCreaturesGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */