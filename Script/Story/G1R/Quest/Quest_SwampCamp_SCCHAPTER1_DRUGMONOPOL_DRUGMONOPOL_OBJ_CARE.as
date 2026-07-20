#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"UL_ORG_JACKO_862");
            default InvolvedCharacters.Add(n"UL_ORG_RENYU_860");
            default InvolvedCharacters.Add(n"UL_ORG_KILLIAN_861");
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetJacko() const property { return GetCharacter(n"UL_ORG_JACKO_862"); }
            AGothicCharacterState GetRenyu() const property { return GetCharacter(n"UL_ORG_RENYU_860"); }
            AGothicCharacterState GetKillian() const property { return GetCharacter(n"UL_ORG_KILLIAN_861"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return ((Jacko != nullptr && Jacko.IsEveryoneOfThisKindDead() && Renyu != nullptr && Renyu.IsEveryoneOfThisKindDead() && Killian != nullptr && Killian.IsEveryoneOfThisKindDead())) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000022), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT.StartQuest();
                DC(int64(0x00000022), EConversationDebugInfo::Done);
                DC(int64(0x00000023), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_DRUGMONOPOL_JACKO);
                DC(int64(0x00000023), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE GetSwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */