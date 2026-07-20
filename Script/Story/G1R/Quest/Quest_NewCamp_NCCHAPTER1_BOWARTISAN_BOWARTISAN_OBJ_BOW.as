#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_BOWARTISAN;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW GetNewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */