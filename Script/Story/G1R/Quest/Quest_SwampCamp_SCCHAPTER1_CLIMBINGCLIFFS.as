#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SC_NOV_THERON_1372N");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER1_CLIMBINGCLIFFS-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_CLIMBINGCLIFFS-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_CLIMBINGCLIFFS;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"SC_NOV_THERON_1372N";
            
            AGothicCharacterState GetTheron() const property { return GetCharacter(n"SC_NOV_THERON_1372N"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Theron != nullptr && Theron.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000003), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_CLIMBINGCLIFFS_COMPLETE);
                DC(int64(0x00000003), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS GetSwampCamp_SCCHAPTER1_CLIMBINGCLIFFS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */