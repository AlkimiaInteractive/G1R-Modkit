#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_CIPHER_873 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_CIPHER_873";
        }
        
        
        class UTopic_Hero__NC_ORG_CIPHER_873 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_CIPHER_873";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCipher() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceOrg873CipherExit : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xc58ee150ee47d9db);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc58ee150ee47d9dc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc58ee150ee47d9dc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg873CipherFisk : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xc58ee150ee47d9e4);
            default Caption = LocText("DIA_CIPHER_FISK_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc58ee150ee47d9e5), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc58ee150ee47d9e6), EConversationDebugInfo::Executing);
                // Hey, are you interested in a new business partner? Fisk, ...
                Hero.AI.Say(LocText("DIA_CIPHER_FISK_15_00"));
                DC(int64(0xc58ee150ee47d9e6), EConversationDebugInfo::Done);
                DC(int64(0xc58ee150ee47d9e7), EConversationDebugInfo::Executing);
                
                // Not interested.
                Cipher.AI.Say(LocText("DIA_CIPHER_FISK_12_01"));
                DC(int64(0xc58ee150ee47d9e7), EConversationDebugInfo::Done);
                DC(int64(0xc58ee150ee47d9e8), EConversationDebugInfo::Executing);
                // But try your luck with Sharky. That man's morals are as ...
                Cipher.AI.Say(LocText("DIA_CIPHER_FISK_12_02"));
                DC(int64(0xc58ee150ee47d9e8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FISKNEWDEALER, Document::UDocumentSegment_CH1_FISKNEWDEALER_Cipher);
            }
        }
        
        
        class UChoiceOrg873CipherFrombalor : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xc58ee150ee47d9e9);
            default Caption = LocText("DIA_CIPHER_FROMBALOR_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x647ff65fa8a75516), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsAvailable());
                    DB(int64(0x647ff65fa8a7551e), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning());
                    DB(int64(0x859f0b9ed084e9a9), G1R.Balor_TellsNCDealer != 0);
                    DB(int64(0x859f0b9ed084ea3c), Hero != nullptr && !Hero.HasSaid(LocText("DIA_CIPHER_FROMBALOR_15_02")));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsAvailable())
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning())
                    return true;
                
                if (G1R.Balor_TellsNCDealer != 0 && Hero != nullptr && !Hero.HasSaid(LocText("DIA_CIPHER_FROMBALOR_15_02")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc58ee150ee47d9ea), EConversationDebugInfo::Executing);
                // What do you have on offer?
                Hero.AI.Say(LocText("DIA_CIPHER_FROMBALOR_15_00"));
                DC(int64(0xc58ee150ee47d9ea), EConversationDebugInfo::Done);
                DC(int64(0xc58ee150ee47d9eb), EConversationDebugInfo::Executing);
                
                // Now the question is: what do YOU have on offer? I'm only ...
                Cipher.AI.Say(LocText("DIA_CIPHER_FROMBALOR_12_01"));
                DC(int64(0xc58ee150ee47d9eb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_CIPHER, Document::UDocumentSegment_Glossary_NC_ORG_CIPHER_Introduction);
                Subdialog(
                    UTopic_Cipher_694727,
                    UTopic_Cipher_694747,
                    UTopic_Cipher_694778
                );
            }
        }
        
        
        class UTopic_Cipher_694727 : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xa7c80a9d3df24500);
            default Caption = LocText("Info_Sld_11_Krautprobe_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x647ff65fa8a754ed), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning());
                    DB(int64(0x647ff65fa8a75500), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 10, 0));
                    DB(int64(0x647ff65fa8a75501), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 20, 0));
                    DB(int64(0x647ff65fa8a75502), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 20, 0));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Joint_01, 10, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Joint_02, 20, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Joint_03, 20, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x859f0b9ed084e99b), EConversationDebugInfo::Executing);
                // Interested in some herb rolls?
                Hero.AI.Say(LocText("Info_Sld_11_Krautprobe_15_00"));
                DC(int64(0x859f0b9ed084e99b), EConversationDebugInfo::Done);
                DC(int64(0xc58ee150ee47d9ef), EConversationDebugInfo::Executing);
                
                // Ahh. That's more like it. All right. Let's trade. 
                Cipher.AI.Say(LocText("DIA_CIPHER_FROMBALOR_12_03"));
                DC(int64(0xc58ee150ee47d9ef), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_CIPHER, Document::UDocumentSegment_Glossary_NC_ORG_CIPHER_Dealer);
                DC(int64(0x647ff65fa8a75427), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Cipher, UItMi_Joint_01, 10);
                DC(int64(0x647ff65fa8a75427), EConversationDebugInfo::Done);
                DC(int64(0x647ff65fa8a75451), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMi_Joint_02, 20, 0);
                DC(int64(0x647ff65fa8a75451), EConversationDebugInfo::Done);
                DC(int64(0x647ff65fa8a75453), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMi_Joint_03, 20, 0);
                DC(int64(0x647ff65fa8a75453), EConversationDebugInfo::Done);
                DC(int64(0x647ff65fa8a75455), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMi_Orenugget, 400);
                DC(int64(0x647ff65fa8a75455), EConversationDebugInfo::Done);
                DC(int64(0x647ff65fa8a75370), EConversationDebugInfo::Executing);
                // Let's see ... yeah, that'll do ...
                Cipher.AI.Say(LocText("GVL_G1R_VOICE33_CONVERSATIONDAILYROUTINEMIXING_0"));
                DC(int64(0x647ff65fa8a75370), EConversationDebugInfo::Done);
                DC(int64(0x647ff65fa8a75526), EConversationDebugInfo::Executing);
                G1R.Cipher_Trade = 1;
                DC(int64(0x647ff65fa8a75526), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cipher_694747 : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xa7c80a9d3df24504);
            default Caption = LocText("DIA_CIPHER_FROMBALOR_15_02");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa7c80a9d3df244bc), Hero != nullptr && Hero.HasItem(UItMi_Plants_Swampherb_01, 50, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Plants_Swampherb_01, 50, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x859f0b9ed084e99a), EConversationDebugInfo::Executing);
                // How about this? Fresh herbs, right from the swamp.
                Hero.AI.Say(LocText("DIA_CIPHER_FROMBALOR_15_02"));
                DC(int64(0x859f0b9ed084e99a), EConversationDebugInfo::Done);
                DC(int64(0x859f0b9ed084e955), EConversationDebugInfo::Executing);
                
                // Ahh. That's more like it. All right. Let's trade. 
                Cipher.AI.Say(LocText("DIA_CIPHER_FROMBALOR_12_03"));
                DC(int64(0x859f0b9ed084e955), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_CIPHER, Document::UDocumentSegment_Glossary_NC_ORG_CIPHER_Dealer);
                DB(int64(0x859f0b9ed084e9e2), Hero != nullptr && Hero.HasItem(UItMi_Plants_Swampherb_01, 100, 0));
                DB(int64(0x859f0b9ed084e9e9), Hero != nullptr && Hero.HasItem(UItMi_Plants_Swampherb_01, 50, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Plants_Swampherb_01, 100, 0))
                {
                    DC(int64(0x647ff65fa8a75427), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cipher, UItMi_Plants_Swampherb_01, 100);
                    DC(int64(0x647ff65fa8a75427), EConversationDebugInfo::Done);
                    DC(int64(0x647ff65fa8a75455), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Orenugget, 600);
                    DC(int64(0x647ff65fa8a75455), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Plants_Swampherb_01, 50, 0))
                {
                    DC(int64(0x647ff65fa8a75427), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cipher, UItMi_Plants_Swampherb_01, 50);
                    DC(int64(0x647ff65fa8a75427), EConversationDebugInfo::Done);
                    DC(int64(0x647ff65fa8a75455), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Orenugget, 300);
                    DC(int64(0x647ff65fa8a75455), EConversationDebugInfo::Done);
                }
                DC(int64(0x859f0b9ed084ea3b), EConversationDebugInfo::Executing);
                // Let's see ... yeah, that'll do ...
                Cipher.AI.Say(LocText("GVL_G1R_VOICE33_CONVERSATIONDAILYROUTINEMIXING_0"));
                DC(int64(0x859f0b9ed084ea3b), EConversationDebugInfo::Done);
                DC(int64(0x647ff65fa8a75526), EConversationDebugInfo::Executing);
                G1R.Cipher_Trade = 1;
                DC(int64(0x647ff65fa8a75526), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cipher_694778 : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xa7c80a9d3df24531);
            default Caption = LocText("DIA_CIPHER_FROMBALOR_15_04");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc58ee150ee47d9f1), EConversationDebugInfo::Executing);
                // I don't have anything. 
                Hero.AI.Say(LocText("DIA_CIPHER_FROMBALOR_15_04"));
                DC(int64(0xc58ee150ee47d9f1), EConversationDebugInfo::Done);
                DC(int64(0xc58ee150ee47d9f2), EConversationDebugInfo::Executing);
                
                // Hmmm Tough luck. Come back if you do.
                Cipher.AI.Say(LocText("DIA_CIPHER_FROMBALOR_12_05"));
                DC(int64(0xc58ee150ee47d9f2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg873CipherHello : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xc58ee150ee47d9dd);
            default Caption = LocText("DIA_CIPHER_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg873CipherHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x78d49fc8aa92c987), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0x97d57dcd3d06bc44), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc58ee150ee47d9df), EConversationDebugInfo::Executing);
                
                // What's the latest?
                Hero.AI.Say(LocText("DIA_CIPHER_HELLO_15_00"));
                DC(int64(0xc58ee150ee47d9df), EConversationDebugInfo::Done);
                DB(int64(0xbb685756bed5b27), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.HasSucceeded());
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.HasSucceeded())
                {
                    DC(int64(0xa1fbb8ad329a702), EConversationDebugInfo::Executing);
                    // YOU'RE asking me? You're the one who raided that convoy ...
                    Cipher.AI.Say(LocText("TEXT_WIP_ZUKFIKD_20241021_162054_41"));
                    DC(int64(0xa1fbb8ad329a702), EConversationDebugInfo::Done);
                    DC(int64(0x6ccca6f0111f8166), EConversationDebugInfo::Executing);
                    // Lares is all about keeping the peace, but if you ask me, ...
                    Cipher.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_142657"));
                    DC(int64(0x6ccca6f0111f8166), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_873_cipher_hello_exit_1");
                }
                else
                {
                    DC(int64(0xc58ee150ee47d9e3), EConversationDebugInfo::Executing);
                    // I look like some gossip queen to you? You ain't even one ...
                    Cipher.AI.Say(LocText("DIA_CIPHER_HELLO_12_04"));
                    DC(int64(0xc58ee150ee47d9e3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_873_cipher_hello_exit_2");
                }
            }
        }
        
        
        class UChoiceOrg873CipherTrade : UTopic_Hero__NC_ORG_CIPHER_873
        {
            default DebugId = int64(0xc58ee150ee47d9f3);
            default Caption = LocText("DIA_CIPHER_TRADE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc58ee150ee47d9f4), G1R.Cipher_Trade != 0);
                }
                
                return G1R.Cipher_Trade != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc58ee150ee47d9f5), EConversationDebugInfo::Executing);
                // Let's trade.
                Hero.AI.Say(LocText("DIA_CIPHER_TRADE_15_00"));
                DC(int64(0xc58ee150ee47d9f5), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168a17), Cipher != nullptr && Cipher.IsAngryTowards(Hero));
                
                if (Cipher != nullptr && Cipher.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168a2f), EConversationDebugInfo::Executing);
                    // I only sell to people who respect us. And you're not one ...
                    Cipher.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_105319_1609"));
                    DC(int64(0x7ec56dc721168a2f), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f23162950b), EConversationDebugInfo::Executing);
                    // Not at the moment, at least. Wait till it's water under ...
                    Cipher.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_141945"));
                    DC(int64(0x81b634f23162950b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_873_cipher_trade_exit_1");
                    DC(int64(0x7ec56dc721168a3e), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168a3e), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168a25), EConversationDebugInfo::Executing);
                    // What do you want?
                    Cipher.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_105308_3984"));
                    DC(int64(0x7ec56dc721168a25), EConversationDebugInfo::Done);
                    DC(int64(0x43b55d6bf2cc6e93), EConversationDebugInfo::Executing);
                    Cipher.AI.StartTradingWith(Hero);
                    DC(int64(0x43b55d6bf2cc6e93), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_873_cipher_trade_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */