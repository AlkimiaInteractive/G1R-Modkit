#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTNEK : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTNEK-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTNEK-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_LOSTNEK;
            default QuestGiverCharacterUniqueName = n"OC_STT_SLY_315";
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000052), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_LOSTNEK_COMPLETE);
                DC(int64(0x00000052), EConversationDebugInfo::Done);
                DC(int64(0x00000053), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x00000053), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTNEK GetOldCamp_OCCHAPTER1_LOSTNEK() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTNEK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTNEK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */