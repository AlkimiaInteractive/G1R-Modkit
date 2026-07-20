#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_RETURNRING : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_FINGERS_RING;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_RETURNRING-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_RETURNRING GetOldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_RETURNRING() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_RETURNRING>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_RETURNRING::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */