#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_FINDWHEEL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_FINDWHEEL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMi_Stuff_Gearwheel_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000001), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN.StartQuest();
                DC(int64(0x00000001), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_FINDWHEEL GetOldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_FINDWHEEL() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_FINDWHEEL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_FINDWHEEL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */