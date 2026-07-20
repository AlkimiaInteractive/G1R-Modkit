#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW.HasSucceeded() && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MAGICTRANSACTION, Document::UDocumentSegment_CH1_MAGICTRANSACTION_Materials);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN GetOldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */