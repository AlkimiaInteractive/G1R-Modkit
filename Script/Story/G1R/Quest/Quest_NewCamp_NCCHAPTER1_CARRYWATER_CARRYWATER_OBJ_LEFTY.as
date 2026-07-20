#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CARRYWATER;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.HasSucceeded();
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY GetNewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */