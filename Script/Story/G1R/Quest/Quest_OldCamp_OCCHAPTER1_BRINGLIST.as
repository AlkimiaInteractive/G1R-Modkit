#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BRINGLIST : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_BRINGLIST-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BRINGLIST-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_BRINGLIST;
            default QuestGiverCharacterUniqueName = n"OC_STT_DIEGO";
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000028), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_BRINGLIST_COMPLETE);
                DC(int64(0x00000028), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BRINGLIST GetOldCamp_OCCHAPTER1_BRINGLIST() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BRINGLIST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BRINGLIST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */