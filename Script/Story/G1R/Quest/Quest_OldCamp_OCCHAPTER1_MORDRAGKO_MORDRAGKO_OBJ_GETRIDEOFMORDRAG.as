#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_ORG_MORDRAG_826");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_MORDRAGKO;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetMordrag() const property { return GetCharacter(n"OC_ORG_MORDRAG_826"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_REPORT.StartQuest();
                DC(int64(0x0000000c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG GetOldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */