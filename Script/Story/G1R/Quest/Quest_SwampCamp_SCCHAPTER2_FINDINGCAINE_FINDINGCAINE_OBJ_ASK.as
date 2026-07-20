#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000063), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING.StartQuest();
                DC(int64(0x00000063), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK GetSwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */