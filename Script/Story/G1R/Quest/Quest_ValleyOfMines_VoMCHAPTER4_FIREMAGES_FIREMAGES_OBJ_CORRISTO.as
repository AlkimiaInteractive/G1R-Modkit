#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_CORRISTO : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_CORRISTO-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000004d), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN.StartQuest();
                DC(int64(0x0000004d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_CORRISTO GetValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_CORRISTO() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_CORRISTO>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_CORRISTO::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */