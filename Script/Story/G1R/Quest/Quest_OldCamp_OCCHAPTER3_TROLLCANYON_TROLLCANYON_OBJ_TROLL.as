#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_TROLLCANYON;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL GetOldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */