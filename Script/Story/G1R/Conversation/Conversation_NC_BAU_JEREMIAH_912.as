#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_JEREMIAH_912 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_JEREMIAH_912";
        }
        
        
        class UTopic_Hero__NC_BAU_JEREMIAH_912 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_JEREMIAH_912";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJeremiah() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceJeremiah81449 : UTopic_Hero__NC_BAU_JEREMIAH_912
        {
            default DebugId = int64(0xc7da5a4b7839c91f);
            default Caption = LocText("TEXT_WIP_BKSKLDM_20240219_142418");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceJeremiah81449);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc7da5a4b7839c925), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc7da5a4b7839c91d), EConversationDebugInfo::Executing);
                // I'm looking for Bran. You seen him?
                Hero.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_142418"));
                DC(int64(0xc7da5a4b7839c91d), EConversationDebugInfo::Done);
                DC(int64(0xc7da5a4b7839c91e), EConversationDebugInfo::Executing);
                
                // Sure, he's a regular. Ain't seen him in a bit ... though ...
                Jeremiah.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_142418_2238"));
                DC(int64(0xc7da5a4b7839c91e), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111ee5), EConversationDebugInfo::Executing);
                // Maybe try your luck with him. Oh, and ask Rayk, too. ...
                Jeremiah.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_134951"));
                DC(int64(0xacc1b8ac36111ee5), EConversationDebugInfo::Done);
                DC(int64(0xc7da5a4b7839c923), EConversationDebugInfo::Executing);
                
                // Got it. 
                Hero.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_144340"));
                DC(int64(0xc7da5a4b7839c923), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_BranFriends);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_MALON, Document::UDocumentSegment_Glossary_NC_BAU_MALON_RicelordForeman);
            }
        }
        
        
        class UChoiceJeremiah900812 : UTopic_Hero__NC_BAU_JEREMIAH_912
        {
            default DebugId = int64(0x56a4a1bf169a003c);
            default Caption = LocText("DIA_JEREMIAH_PERM_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56a4a1bf169a0036), G1R.SilasRemoved != 0);
                }
                
                return G1R.SilasRemoved != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x56a4a1bf169a003a), EConversationDebugInfo::Executing);
                // How's business? 
                Hero.AI.Say(LocText("DIA_JEREMIAH_PERM_15_00"));
                DC(int64(0x56a4a1bf169a003a), EConversationDebugInfo::Done);
                DC(int64(0x56a4a1bf169a003b), EConversationDebugInfo::Executing);
                
                // Ah, don't ask. I can barely keep up with how much the ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_PERM_04_01"));
                DC(int64(0x56a4a1bf169a003b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_JEREMIAH, Document::UDocumentSegment_Glossary_NC_BAU_JEREMIAH_Trader);
                DC(int64(0x56a4a1bf169a0040), EConversationDebugInfo::Executing);
                Jeremiah.AI.StartTradingWith(Hero);
                DC(int64(0x56a4a1bf169a0040), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJeremiahExit : UTopic_Hero__NC_BAU_JEREMIAH_912
        {
            default DebugId = int64(0x7b81e3a3ba10a35b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7b81e3a3ba10a35c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7b81e3a3ba10a35c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJeremiahHallo : UTopic_Hero__NC_BAU_JEREMIAH_912
        {
            default DebugId = int64(0x7b81e3a3ba10a35d);
            default Caption = LocText("DIA_JEREMIAH_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceJeremiahHallo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56a4a1bf169a0036), G1R.SilasRemoved == 0);
                }
                
                return G1R.SilasRemoved == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7b81e3a3ba10a35e), EConversationDebugInfo::Executing);
                // What are you doing here?
                Hero.AI.Say(LocText("DIA_JEREMIAH_HALLO_15_00"));
                DC(int64(0x7b81e3a3ba10a35e), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a35f), EConversationDebugInfo::Executing);
                
                // I make rice schnapps, lad. 
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_HALLO_04_01"));
                DC(int64(0x7b81e3a3ba10a35f), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a360), EConversationDebugInfo::Executing);
                // Here, this one's on the house. But not a word to Silas, ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_HALLO_04_02"));
                DC(int64(0x7b81e3a3ba10a360), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_JEREMIAH, Document::UDocumentSegment_Glossary_NC_BAU_JEREMIAH_Introduction);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Jeremiah.AddItemToInventory(UItFo_Potion_Booze, 1);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a362), EConversationDebugInfo::Executing);
                Jeremiah.AI.GiveItemTo(Hero, UItFo_Potion_Booze, 1);
                DC(int64(0x7b81e3a3ba10a362), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJeremiahHoratio : UTopic_Hero__NC_BAU_JEREMIAH_912
        {
            default DebugId = int64(0x7b81e3a3ba10a368);
            default Caption = LocText("DIA_JEREMIAH_HORATIO_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceJeremiahHoratio);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7b81e3a3ba10a369), G1R.Jeremiah_Brewer != 0);
                }
                
                return G1R.Jeremiah_Brewer != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7b81e3a3ba10a36a), EConversationDebugInfo::Executing);
                // What can you tell me about the Rice Lord?
                Hero.AI.Say(LocText("DIA_JEREMIAH_HORATIO_15_00"));
                DC(int64(0x7b81e3a3ba10a36a), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a36b), EConversationDebugInfo::Executing);
                
                // He's a bastard, that's what. He acts all chummy, but in ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_HORATIO_04_01"));
                DC(int64(0x7b81e3a3ba10a36b), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a36c), EConversationDebugInfo::Executing);
                // The only one who could stand up to them is Horatio, but ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_HORATIO_04_02"));
                DC(int64(0x7b81e3a3ba10a36c), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a36d), EConversationDebugInfo::Executing);
                // One day, he even told me that sometimes, he's THIS close ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_HORATIO_04_03"));
                DC(int64(0x7b81e3a3ba10a36d), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a36e), EConversationDebugInfo::Executing);
                // I think it has to do with an "oath he swore to himself" ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_HORATIO_04_04"));
                DC(int64(0x7b81e3a3ba10a36e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HORATIO, Document::UDocumentSegment_Glossary_NC_BAU_HORATIO_HateRiceLord);
            }
        }
        
        
        class UChoiceJeremiahPerm : UTopic_Hero__NC_BAU_JEREMIAH_912
        {
            default DebugId = int64(0x7b81e3a3ba10a363);
            default Caption = LocText("DIA_JEREMIAH_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56a4a1bf169a0036), G1R.SilasRemoved == 0);
                }
                
                return G1R.SilasRemoved == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7b81e3a3ba10a364), EConversationDebugInfo::Executing);
                // How's business? 
                Hero.AI.Say(LocText("DIA_JEREMIAH_PERM_15_00"));
                DC(int64(0x7b81e3a3ba10a364), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a365), EConversationDebugInfo::Executing);
                
                // Ah, don't ask. I can barely keep up with how much the ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_PERM_04_01"));
                DC(int64(0x7b81e3a3ba10a365), EConversationDebugInfo::Done);
                DC(int64(0x7b81e3a3ba10a366), EConversationDebugInfo::Executing);
                // But it's fine. At least this way, the Rice Lord's goons ...
                Jeremiah.AI.Say(LocText("DIA_JEREMIAH_PERM_04_02"));
                DC(int64(0x7b81e3a3ba10a366), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_JEREMIAH, Document::UDocumentSegment_Glossary_NC_BAU_JEREMIAH_Introduction);
                DC(int64(0x7b81e3a3ba10a367), EConversationDebugInfo::Executing);
                G1R.Jeremiah_Brewer = 1;
                DC(int64(0x7b81e3a3ba10a367), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */