#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_FIGHTER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"NC_BAU_JAN_942");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_FIGHTER-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_FIGHTER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_FIGHTER;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_BAU_JAN_942";
            
            AGothicCharacterState GetJan() const property { return GetCharacter(n"NC_BAU_JAN_942"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Jan != nullptr && Jan.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000018), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_FIGHTER_COMPLETE);
                DC(int64(0x00000018), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_FIGHTER GetValleyOfMines_FIGHTER() property
        {
            return Cast<UQuest_ValleyOfMines_FIGHTER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_FIGHTER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */