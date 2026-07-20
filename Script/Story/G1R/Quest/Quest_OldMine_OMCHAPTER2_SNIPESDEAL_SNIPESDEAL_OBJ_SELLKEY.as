#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_SELLKEY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_SNIPESDEAL;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_SELLKEY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Hero != nullptr && Hero.HasItem(UItKe_Om_02, 1, 0);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_SELLKEY GetOldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_SELLKEY() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_SELLKEY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_SELLKEY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */