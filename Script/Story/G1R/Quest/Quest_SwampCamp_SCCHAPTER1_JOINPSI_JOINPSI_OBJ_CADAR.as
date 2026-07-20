#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_JOINPSI;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000003f), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_JOINPSI_CADARIMPRESSED);
                DC(int64(0x0000003f), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR GetSwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */