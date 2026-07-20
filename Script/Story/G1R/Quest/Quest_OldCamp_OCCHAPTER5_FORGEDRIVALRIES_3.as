#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OCR_GRD_STONE_219");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER5;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER5_FORGEDRIVALRIES_3-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER5_FORGEDRIVALRIES_3-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH5_FORGEDRIVALRIES_3;
            default QuestKind = EQuestKind::Side;
            
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
                DC(int64(0x0000012e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FORGEDRIVALRIES3_COMPLETE);
                DC(int64(0x0000012e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 GetOldCamp_OCCHAPTER5_FORGEDRIVALRIES_3() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */