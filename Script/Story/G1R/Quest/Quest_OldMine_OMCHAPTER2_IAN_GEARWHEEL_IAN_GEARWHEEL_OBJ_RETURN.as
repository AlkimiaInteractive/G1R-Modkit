#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN GetOldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */