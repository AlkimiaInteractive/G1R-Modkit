#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_FIREMAGESLETTER-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FIREMAGESLETTER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_FIREMAGESLETTER;
            default QuestKind = EQuestKind::Main;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return G1R.FireMagesDead != 0;
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER GetOldCamp_OCCHAPTER1_FIREMAGESLETTER() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */