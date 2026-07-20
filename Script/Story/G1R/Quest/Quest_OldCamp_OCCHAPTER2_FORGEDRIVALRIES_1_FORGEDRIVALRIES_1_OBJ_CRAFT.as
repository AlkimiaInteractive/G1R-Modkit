#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_Craft);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000d6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FORGEDRIVALRIES1_CRAFT);
                DC(int64(0x000000d6), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT GetOldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */