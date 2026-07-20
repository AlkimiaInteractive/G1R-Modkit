#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_SNIPESDEAL;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY GetOldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */