#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000055), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM.StartQuest();
                DC(int64(0x00000055), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE GetValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */