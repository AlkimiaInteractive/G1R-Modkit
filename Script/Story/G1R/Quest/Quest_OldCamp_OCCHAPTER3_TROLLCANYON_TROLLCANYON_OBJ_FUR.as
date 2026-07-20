#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_TROLLCANYON;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR GetOldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */