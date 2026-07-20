#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_INFORMSYRA : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_INFORMSYRA-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA.HasSucceeded() && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_INFORMSYRA GetOldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_INFORMSYRA() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_INFORMSYRA>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_INFORMSYRA::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */