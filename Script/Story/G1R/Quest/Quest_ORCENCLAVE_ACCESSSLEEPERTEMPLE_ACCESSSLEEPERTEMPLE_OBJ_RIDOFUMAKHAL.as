#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OW_OPS_UMAKHAL_2402");
            default ParentQuestClass = UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetUmakhal() const property { return GetCharacter(n"OW_OPS_UMAKHAL_2402"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Umakhal != nullptr && Umakhal.IsEveryoneOfThisKindDead()) || (Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance)) || (/* Skip: was_triggered_by_dialog */ false);
            }
        }
        
        
        UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL GetORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL() property
        {
            return Cast<UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */