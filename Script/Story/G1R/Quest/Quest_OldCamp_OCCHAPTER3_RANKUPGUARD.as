#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER3_RANKUPGUARD-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_RANKUPGUARD-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_RANKUPGUARD;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_GRD_THORUS_200";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ff), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_RANKUPGUARD_COMPLETE);
                DC(int64(0x000000ff), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD GetOldCamp_OCCHAPTER3_RANKUPGUARD() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */