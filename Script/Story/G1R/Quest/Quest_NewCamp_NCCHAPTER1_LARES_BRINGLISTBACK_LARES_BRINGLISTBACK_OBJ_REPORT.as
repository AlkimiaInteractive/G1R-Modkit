#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000028), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_BRINGLISTBACK_COMPLETE);
                DC(int64(0x00000028), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT GetNewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */