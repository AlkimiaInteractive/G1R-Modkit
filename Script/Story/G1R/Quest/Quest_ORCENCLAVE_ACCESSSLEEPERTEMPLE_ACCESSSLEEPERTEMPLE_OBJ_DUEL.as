#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_DUEL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OW_OWR_GRAZKRAK_2400");
            default ParentQuestClass = UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_DUEL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetGrazkrak() const property { return GetCharacter(n"OW_OWR_GRAZKRAK_2400"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Grazkrak != nullptr && Grazkrak.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_DuelFinished);
            }
        }
        
        
        UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_DUEL GetORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_DUEL() property
        {
            return Cast<UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_DUEL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_DUEL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */