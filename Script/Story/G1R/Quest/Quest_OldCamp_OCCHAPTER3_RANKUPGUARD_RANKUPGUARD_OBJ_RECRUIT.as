#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_RECRUIT : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_RECRUIT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.RecruitedDiggers == 3;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO.StartQuest();
                DC(int64(0x000000f9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPGUARD, Document::UDocumentSegment_CH3_RANKUPGUARD_Recruit);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_RECRUIT GetOldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_RECRUIT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_RECRUIT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_RECRUIT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */