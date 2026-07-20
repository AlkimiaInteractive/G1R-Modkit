#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000033), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT.StartQuest();
                DC(int64(0x00000033), EConversationDebugInfo::Done);
                DC(int64(0x00000034), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_RECRUITDUSTY_JOINED);
                DC(int64(0x00000034), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY GetSwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */