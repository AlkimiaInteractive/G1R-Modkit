#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_BURIAL : UG1RQuest
        {
            default ParentQuestClass = UQuest_ORCENCLAVE_THECHAMPIONBURIAL;
            default NameText = "QUEST-ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_BURIAL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.UrNazkrog_Spores != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000022), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN.StartQuest();
                DC(int64(0x00000022), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_BURIAL GetORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_BURIAL() property
        {
            return Cast<UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_BURIAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_BURIAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */