#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_KILL_SHRIKE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"NC_ORG_SHRIKE_842");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT;
            
            AGothicCharacterState GetShrike() const property { return GetCharacter(n"NC_ORG_SHRIKE_842"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Shrike != nullptr && Shrike.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000006e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SHRIKESHUT.FailQuest();
                DC(int64(0x0000006e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SHRIKESHUT, Document::UDocumentSegment_CH1_SHRIKESHUT_Fail);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_KILL_SHRIKE GetNewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_KILL_SHRIKE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_KILL_SHRIKE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_KILL_SHRIKE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */