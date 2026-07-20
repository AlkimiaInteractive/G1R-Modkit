#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_MUKINCURSION_MUKINCURSION_OBJ_FOOD : UG1RQuest
        {
            default ParentQuestClass = UQuest_ORCENCLAVE_MUKINCURSION;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-ORCENCLAVE_MUKINCURSION_MUKINCURSION_OBJ_FOOD-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ORCENCLAVE_MUKINCURSION_MUKINCURSION_OBJ_FOOD GetORCENCLAVE_MUKINCURSION_MUKINCURSION_OBJ_FOOD() property
        {
            return Cast<UQuest_ORCENCLAVE_MUKINCURSION_MUKINCURSION_OBJ_FOOD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_MUKINCURSION_MUKINCURSION_OBJ_FOOD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */