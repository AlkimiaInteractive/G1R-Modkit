#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SC_NOV_HARLOK_1358");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER1_GHORIMSRELIEF-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_GHORIMSRELIEF-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_GHORIMSRELIEF;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"SC_NOV_GHORIM_1310";
            
            AGothicCharacterState GetHarlok() const property { return GetCharacter(n"SC_NOV_HARLOK_1358"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Harlok != nullptr && Harlok.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000029), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_GHORIMSRELIEF_COMPLETE);
                DC(int64(0x00000029), EConversationDebugInfo::Done);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestFailed() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_GHORIMSRELIEF, Document::UDocumentSegment_CH1_GHORIMSRELIEF_Fail);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF GetSwampCamp_SCCHAPTER1_GHORIMSRELIEF() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */