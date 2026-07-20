#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_FINGERS_RING;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Ring_Scatty, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FINGERS_RING, Document::UDocumentSegment_CH1_FINGERS_RING_Ring);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING GetOldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_GETRING::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */