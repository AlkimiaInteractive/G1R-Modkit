#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_SC_TPL_TEMPLAR03_1436 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_SC_TPL_TEMPLAR03_1436";
        }
        
        
        class UTopic_Hero__OM_SC_TPL_TEMPLAR03_1436 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_SC_TPL_TEMPLAR03_1436";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTemplar87757 : UTopic_Hero__OM_SC_TPL_TEMPLAR03_1436
        {
            default DebugId = int64(0x63b0673d24caf7a2);
            default Caption = LocText("TEXT_WIP_KPQXWNL_20240405_111233");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1436TemplerCrawler);
            default Rules.HideIfKnows(UChoiceTemplar87757);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63b0673d24caf7a5), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63b0673d24caf7a0), EConversationDebugInfo::Executing);
                // I need your help. 
                Hero.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_111233"));
                DC(int64(0x63b0673d24caf7a0), EConversationDebugInfo::Done);
                DC(int64(0x2e98bf9a62fc9277), EConversationDebugInfo::Executing);
                // Kalom sent me to find the minecrawler lair. 
                Hero.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_120157"));
                DC(int64(0x2e98bf9a62fc9277), EConversationDebugInfo::Done);
                DC(int64(0x63b0673d24caf7a1), EConversationDebugInfo::Executing);
                
                // He asked YOU? Interesting. But I'm afraid I can't help ...
                Templar.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_111233_41"));
                DC(int64(0x63b0673d24caf7a1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1436TemplerCrawler : UTopic_Hero__OM_SC_TPL_TEMPLAR03_1436
        {
            default DebugId = int64(0xa17464a9a190dbca);
            default Caption = LocText("TPL_1436_TEMPLER_CRAWLER_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa17464a9a190dbcb), EConversationDebugInfo::Executing);
                
                // What's a templar doing down here? 
                Hero.AI.Say(LocText("TPL_1436_TEMPLER_CRAWLER_INFO_15_01"));
                DC(int64(0xa17464a9a190dbcb), EConversationDebugInfo::Done);
                DC(int64(0xa17464a9a190dbcc), EConversationDebugInfo::Executing);
                
                // Killing crawlers, that's what. We hunt them, for their ...
                Templar.AI.Say(LocText("TPL_1436_TEMPLER_CRAWLER_INFO_13_02"));
                DC(int64(0xa17464a9a190dbcc), EConversationDebugInfo::Done);
                DC(int64(0xa17464a9a190dbcd), EConversationDebugInfo::Executing);
                // The warders don't mind a few more blades taking care of ...
                Templar.AI.Say(LocText("TPL_1436_TEMPLER_CRAWLER_INFO_13_03"));
                DC(int64(0xa17464a9a190dbcd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1436TemplerExit : UTopic_Hero__OM_SC_TPL_TEMPLAR03_1436
        {
            default DebugId = int64(0xa17464a9a190dbc8);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa17464a9a190dbc9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa17464a9a190dbc9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */