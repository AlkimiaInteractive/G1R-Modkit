#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_FOCUS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_STONEHENGE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_FOCUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Focus_05, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000db), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS.StartQuest();
                DC(int64(0x000000db), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_FOCUS GetOldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_FOCUS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_FOCUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_FOCUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */