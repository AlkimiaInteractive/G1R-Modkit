#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000050), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE.StartQuest();
                DC(int64(0x00000050), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN GetValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */