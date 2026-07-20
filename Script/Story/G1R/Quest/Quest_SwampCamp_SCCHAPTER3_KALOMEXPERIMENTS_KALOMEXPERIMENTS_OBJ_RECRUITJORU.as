#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000d1), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_KALOMEXPERIMENTS_RECRUITJORU);
                DC(int64(0x000000d1), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU GetSwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */