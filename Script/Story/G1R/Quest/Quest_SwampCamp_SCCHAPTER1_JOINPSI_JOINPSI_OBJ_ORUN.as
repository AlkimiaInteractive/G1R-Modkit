#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_JOINPSI;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000045), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_JOINPSI_ORUNIMPRESSED);
                DC(int64(0x00000045), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN GetSwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */