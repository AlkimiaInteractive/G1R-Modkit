#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_REPORTSLY : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LOSTNEK;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_REPORTSLY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_REPORTSLY GetOldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_REPORTSLY() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_REPORTSLY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_REPORTSLY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */