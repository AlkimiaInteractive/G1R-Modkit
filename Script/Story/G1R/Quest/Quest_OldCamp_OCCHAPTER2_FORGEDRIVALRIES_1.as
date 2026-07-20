#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OCR_GRD_STONE_219");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER2_FORGEDRIVALRIES_1-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_FORGEDRIVALRIES_1-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_FORGEDRIVALRIES_1;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OCR_GRD_STONE_219";
            
            AGothicCharacterState GetStone() const property { return GetCharacter(n"OCR_GRD_STONE_219"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Stone != nullptr && Stone.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000cd), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FORGEDRIVALRIES1_COMPLETE);
                DC(int64(0x000000cd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_Completed);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 GetOldCamp_OCCHAPTER2_FORGEDRIVALRIES_1() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */