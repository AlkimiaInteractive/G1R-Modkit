#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FINGERS_RING : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_FINGERS_RING-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FINGERS_RING-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_FINGERS_RING;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_STT_FINGERS_331";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000046), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FINGERSRING_COMPLETE);
                DC(int64(0x00000046), EConversationDebugInfo::Done);
                DC(int64(0x00000047), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x00000047), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FINGERS_RING GetOldCamp_OCCHAPTER1_FINGERS_RING() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FINGERS_RING>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FINGERS_RING::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */