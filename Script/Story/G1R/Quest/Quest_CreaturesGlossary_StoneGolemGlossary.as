#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_StoneGolemGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_StoneGolemGlossary GetCreaturesGlossary_StoneGolemGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_StoneGolemGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_StoneGolemGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */