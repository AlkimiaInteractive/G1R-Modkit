#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CAINE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CAINE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000086), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES.StartQuest();
                DC(int64(0x00000086), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CAINE GetNewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CAINE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CAINE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CAINE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */