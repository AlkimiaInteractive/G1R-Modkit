#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItKe_Dungeonkey, 1, 0) && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000133), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE.StartQuest();
                DC(int64(0x00000133), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_GomezKey);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY GetOldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */