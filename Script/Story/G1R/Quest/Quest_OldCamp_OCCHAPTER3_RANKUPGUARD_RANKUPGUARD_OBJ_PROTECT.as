#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000103), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT.StartQuest();
                DC(int64(0x00000103), EConversationDebugInfo::Done);
                DC(int64(0x00000104), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_RANKUPGUARD_PROTECT);
                DC(int64(0x00000104), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT GetOldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */