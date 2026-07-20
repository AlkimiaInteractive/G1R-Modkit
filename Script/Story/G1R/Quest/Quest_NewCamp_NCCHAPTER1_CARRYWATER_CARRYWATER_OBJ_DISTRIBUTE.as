#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CARRYWATER;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.HasSucceeded();
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE GetNewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */