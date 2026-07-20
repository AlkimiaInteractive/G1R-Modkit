#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_KILL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"LURKER_HOMER");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_DAMLURKER;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_KILL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetLURKER_HOMER() const property { return GetCharacter(n"LURKER_HOMER"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return LURKER_HOMER != nullptr && LURKER_HOMER.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000030), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN.StartQuest();
                DC(int64(0x00000030), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_KILL GetNewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_KILL() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_KILL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_KILL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */