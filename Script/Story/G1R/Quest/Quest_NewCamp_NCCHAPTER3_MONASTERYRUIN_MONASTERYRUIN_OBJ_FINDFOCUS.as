#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_FINDFOCUS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_FINDFOCUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ab), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT.StartQuest();
                DC(int64(0x000000ab), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_FINDFOCUS GetNewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_FINDFOCUS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_FINDFOCUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_FINDFOCUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */