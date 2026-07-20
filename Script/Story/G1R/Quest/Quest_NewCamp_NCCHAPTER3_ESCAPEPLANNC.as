#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER3_ESCAPEPLANNC-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_ESCAPEPLANNC-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_ESCAPEPLANNC;
            default QuestKind = EQuestKind::Main;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000095), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_ESCAPEPLANNC_COMPLETE);
                DC(int64(0x00000095), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC GetNewCamp_NCCHAPTER3_ESCAPEPLANNC() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */