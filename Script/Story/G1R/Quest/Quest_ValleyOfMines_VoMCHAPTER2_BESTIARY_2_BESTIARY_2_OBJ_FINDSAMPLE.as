#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDSAMPLE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDSAMPLE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Minecrawlerqueen_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000038), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE.StartQuest();
                DC(int64(0x00000038), EConversationDebugInfo::Done);
                DC(int64(0x00000039), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_BESTIARY2_FINDSAMPLE);
                DC(int64(0x00000039), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDSAMPLE GetValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDSAMPLE() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDSAMPLE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDSAMPLE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */