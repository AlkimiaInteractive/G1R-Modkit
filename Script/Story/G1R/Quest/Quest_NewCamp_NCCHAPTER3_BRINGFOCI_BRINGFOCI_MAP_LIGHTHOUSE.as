#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000009b), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_BRINGFOCI_MEETING);
                DC(int64(0x0000009b), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE GetNewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */