#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_MUKINCURSION : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OW_OPS_MUK_2404");
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_ORCENCLAVE;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-ORCENCLAVE_MUKINCURSION-DESCRIPTION";
            default NameText = "QUEST-ORCENCLAVE_MUKINCURSION-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH5_MUKINCURSION;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OW_OPS_MUK_2404";
            
            AGothicCharacterState GetMuk() const property { return GetCharacter(n"OW_OPS_MUK_2404"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Muk != nullptr && Muk.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                DC(int64(0x0000001a), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK.StartQuest();
                DC(int64(0x0000001a), EConversationDebugInfo::Done);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000001b), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK.SucceedQuest();
                DC(int64(0x0000001b), EConversationDebugInfo::Done);
                DC(int64(0x0000001c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OE_MUKINCURSION_COMPLETE);
                DC(int64(0x0000001c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ORCENCLAVE_MUKINCURSION GetORCENCLAVE_MUKINCURSION() property
        {
            return Cast<UQuest_ORCENCLAVE_MUKINCURSION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_MUKINCURSION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */