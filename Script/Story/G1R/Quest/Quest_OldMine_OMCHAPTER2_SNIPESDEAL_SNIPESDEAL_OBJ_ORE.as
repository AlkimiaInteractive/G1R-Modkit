#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_SNIPESDEAL;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000a), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OM_SNIPESDEAL_LURE);
                DC(int64(0x0000000a), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE GetOldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */