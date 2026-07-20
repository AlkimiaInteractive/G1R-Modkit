#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SFB_SCRAPER01_1001 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SFB_SCRAPER01_1001";
        }
        
        
        class UTopic_Hero__NC_SFB_SCRAPER01_1001 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SFB_SCRAPER01_1001";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetScraper() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSfb1001Exit : UTopic_Hero__NC_SFB_SCRAPER01_1001
        {
            default DebugId = int64(0x5bc5230aaddb1f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5bc5230aaddb20), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5bc5230aaddb20), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSfb1001Hello : UTopic_Hero__NC_SFB_SCRAPER01_1001
        {
            default DebugId = int64(0x5bc5230aaddb21);
            default Caption = LocText("DIA_SFB_1001_HELLO_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5bc5230aaddb22), EConversationDebugInfo::Executing);
                // How's the mining going?
                Hero.AI.Say(LocText("DIA_SFB_1001_HELLO_15_00"));
                DC(int64(0x5bc5230aaddb22), EConversationDebugInfo::Done);
                DC(int64(0x5bc5230aaddb23), EConversationDebugInfo::Executing);
                
                // Well, if you mean, how much longer we gotta dig 'til the ...
                Scraper.AI.Say(LocText("DIA_SFB_1001_HELLO_02_01"));
                DC(int64(0x5bc5230aaddb23), EConversationDebugInfo::Done);
                DC(int64(0x5bc5230aaddb24), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5bc5230aaddb24), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */