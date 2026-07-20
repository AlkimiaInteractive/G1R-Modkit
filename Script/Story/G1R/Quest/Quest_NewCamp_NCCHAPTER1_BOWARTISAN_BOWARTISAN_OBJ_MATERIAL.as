#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_BOWARTISAN;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL GetNewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */