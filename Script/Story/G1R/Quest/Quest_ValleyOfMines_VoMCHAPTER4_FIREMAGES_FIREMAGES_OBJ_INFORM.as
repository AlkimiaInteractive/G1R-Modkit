#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM GetValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */