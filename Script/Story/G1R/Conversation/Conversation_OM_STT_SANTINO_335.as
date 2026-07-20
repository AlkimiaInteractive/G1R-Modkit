#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_STT_SANTINO_335 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_STT_SANTINO_335";
        }
        
        
        class UTopic_Hero__OM_STT_SANTINO_335 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_STT_SANTINO_335";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSantino() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSantino109495 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x4853d643cd31a4e5);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_111858");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSantino112364);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ARYAMKL_20241120_112211_686"), int64(0x4853d643cd31a4e5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4853d643cd31a4e3), EConversationDebugInfo::Executing);
                // I might have something you're interested in.
                Hero.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_111858"));
                DC(int64(0x4853d643cd31a4e3), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792ed), EConversationDebugInfo::Executing);
                
                // Ehhh, let's see ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_134734"));
                DC(int64(0x41fa5ac5d02792ed), EConversationDebugInfo::Done);
                DB(int64(0x4853d643cd31a4ef), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Certificate, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Certificate, 1, 0))
                {
                    DC(int64(0x4853d643cd31a4f3), EConversationDebugInfo::Executing);
                    // No, I think- Wait. What is this? A ... land deed?
                    Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_112211_686"));
                    DC(int64(0x4853d643cd31a4f3), EConversationDebugInfo::Done);
                    DC(int64(0x41fa5ac5d02792ee), EConversationDebugInfo::Executing);
                    
                    // Right. It's from the old mountain fortress.
                    Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135218"));
                    DC(int64(0x41fa5ac5d02792ee), EConversationDebugInfo::Done);
                    DC(int64(0x4853d643cd31a50a), EConversationDebugInfo::Executing);
                    
                    // ...
                    Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_112944"));
                    DC(int64(0x4853d643cd31a50a), EConversationDebugInfo::Done);
                    DC(int64(0x4853d643cd31a51a), EConversationDebugInfo::Executing);
                    // How much? 
                    Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113317"));
                    DC(int64(0x4853d643cd31a51a), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Santino_110037,
                        UTopic_Santino_110057,
                        UTopic_Santino_110096
                    );
                }
                else
                {
                    DC(int64(0x4853d643cd31a4f1), EConversationDebugInfo::Executing);
                    // Hmm. No. That's just junk. Come again when you have ...
                    Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_112208_3286"));
                    DC(int64(0x4853d643cd31a4f1), EConversationDebugInfo::Done);
                    DC(int64(0x4853d643cd31a53c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x4853d643cd31a53c), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Santino_110037 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x4853d643cd31a51c);
            default Caption = LocText("TEXT_WIP_BKGBIDI_20250131_132717_3855");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_110037);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4853d643cd31a51d), EConversationDebugInfo::Executing);
                // One thousand five hundred nuggets should do the trick.
                Hero.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113330_2801"));
                DC(int64(0x4853d643cd31a51d), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a528), EConversationDebugInfo::Executing);
                
                // What?! This is ridiculous. I could buy a warder's armor ...
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113413"));
                DC(int64(0x4853d643cd31a528), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792ef), EConversationDebugInfo::Executing);
                
                // Do you want the deed or not? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135824"));
                DC(int64(0x41fa5ac5d02792ef), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f2), EConversationDebugInfo::Executing);
                
                // ... Five hundred. Five hundred AND something no amount ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135925"));
                DC(int64(0x41fa5ac5d02792f2), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f3), EConversationDebugInfo::Executing);
                
                // Like what? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135958"));
                DC(int64(0x41fa5ac5d02792f3), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792fa), EConversationDebugInfo::Executing);
                
                // I'll tell you. Once you accept. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140109"));
                DC(int64(0x41fa5ac5d02792fa), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Santino_116562,
                    UTopic_Santino_116582
                );
            }
        }
        
        
        class UTopic_Santino_110057 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x4853d643cd31a520);
            default Caption = LocText("TEXT_WIP_BKGBIDI_20250131_132717_2384");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_110057);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4853d643cd31a521), EConversationDebugInfo::Executing);
                // Two thousand nuggets sounds fair. 
                Hero.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113330_1769"));
                DC(int64(0x4853d643cd31a521), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a529), EConversationDebugInfo::Executing);
                
                // Two thousand?! Don't be ridiculous. That's way too much. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113512"));
                DC(int64(0x4853d643cd31a529), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f0), EConversationDebugInfo::Executing);
                
                // Do you want the deed or not? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135824"));
                DC(int64(0x41fa5ac5d02792f0), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f4), EConversationDebugInfo::Executing);
                
                // Thousand. A thousand AND something no amount of ore can ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140005"));
                DC(int64(0x41fa5ac5d02792f4), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f5), EConversationDebugInfo::Executing);
                
                // Like what? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135958"));
                DC(int64(0x41fa5ac5d02792f5), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f8), EConversationDebugInfo::Executing);
                
                // I'll tell you. Once you accept. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140109"));
                DC(int64(0x41fa5ac5d02792f8), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Santino_116774,
                    UTopic_Santino_116794
                );
            }
        }
        
        
        class UTopic_Santino_110096 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x4853d643cd31a524);
            default Caption = LocText("TEXT_WIP_BKGBIDI_20250131_132717_2979");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_110096);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4853d643cd31a525), EConversationDebugInfo::Executing);
                // This thing is worth a lot. Three thousand. 
                Hero.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113347_491"));
                DC(int64(0x4853d643cd31a525), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a52a), EConversationDebugInfo::Executing);
                
                // What?! Did Beliar piss into your brains or were you born ...
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113528"));
                DC(int64(0x4853d643cd31a52a), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f1), EConversationDebugInfo::Executing);
                
                // Do you want the deed or not? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135824"));
                DC(int64(0x41fa5ac5d02792f1), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f6), EConversationDebugInfo::Executing);
                
                // Thousand. A thousand AND something no amount of ore can ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140005"));
                DC(int64(0x41fa5ac5d02792f6), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f7), EConversationDebugInfo::Executing);
                
                // Like what? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135958"));
                DC(int64(0x41fa5ac5d02792f7), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792f9), EConversationDebugInfo::Executing);
                
                // I'll tell you. Once you accept. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140109"));
                DC(int64(0x41fa5ac5d02792f9), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Santino_110364,
                    UTopic_Santino_110384
                );
            }
        }
        
        
        class UTopic_Santino_116562 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x41fa5ac5d02792fe);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_116562);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x41fa5ac5d02792ff), EConversationDebugInfo::Executing);
                // All right. Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_3286"));
                DC(int64(0x41fa5ac5d02792ff), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d027930d), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140404"));
                DC(int64(0x41fa5ac5d027930d), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Santino.AddItemToInventory(UItMi_Orenugget, 500);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Executing);
                Santino.AI.GiveItemTo(Hero, UItMi_Orenugget, 500);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279321), EConversationDebugInfo::Executing);
                // Now, about that other thing ...
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140647"));
                DC(int64(0x41fa5ac5d0279321), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a57d), EConversationDebugInfo::Executing);
                
                // I didn't forget. Come. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_120446_2316"));
                DC(int64(0x4853d643cd31a57d), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Santino, UItWr_Scroll_Certificate, 1);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Executing);
                Santino.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_GuidePassage);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Done);
                DC(int64(0x6ae8a6d2cdf3722f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ae8a6d2cdf3722f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_116582 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x41fa5ac5d0279302);
            default Caption = LocText("TEXT_WIP_PIYYDND_20241126_140229_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_116582);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x41fa5ac5d0279303), EConversationDebugInfo::Executing);
                // Forget it. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_2386"));
                DC(int64(0x41fa5ac5d0279303), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279306), EConversationDebugInfo::Executing);
                
                // Your loss. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140239"));
                DC(int64(0x41fa5ac5d0279306), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE.FailQuest();
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d027930b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x41fa5ac5d027930b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_116774 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x41fa5ac5d0279312);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_116774);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x41fa5ac5d0279313), EConversationDebugInfo::Executing);
                // All right. Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_3286"));
                DC(int64(0x41fa5ac5d0279313), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d027931a), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140410"));
                DC(int64(0x41fa5ac5d027931a), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Santino.AddItemToInventory(UItMi_Orenugget, 1000);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Executing);
                Santino.AI.GiveItemTo(Hero, UItMi_Orenugget, 1000);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279321), EConversationDebugInfo::Executing);
                // Now, about that other thing ...
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140647"));
                DC(int64(0x41fa5ac5d0279321), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a57d), EConversationDebugInfo::Executing);
                
                // I didn't forget. Come. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_120446_2316"));
                DC(int64(0x4853d643cd31a57d), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Santino, UItWr_Scroll_Certificate, 1);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Executing);
                Santino.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_GuidePassage);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Done);
                DC(int64(0x6ae8a6d2cdf3722f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ae8a6d2cdf3722f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_116794 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x41fa5ac5d0279316);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_116794);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x41fa5ac5d0279317), EConversationDebugInfo::Executing);
                // Forget it. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_2386"));
                DC(int64(0x41fa5ac5d0279317), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3f1), EConversationDebugInfo::Executing);
                // One thousand five hundred nuggets should do the trick.
                Hero.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113330_2801"));
                DC(int64(0xb4a225815539a3f1), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3f2), EConversationDebugInfo::Executing);
                
                // What?! This is ridiculous. I could buy a warder's armor ...
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113413"));
                DC(int64(0xb4a225815539a3f2), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3f3), EConversationDebugInfo::Executing);
                // ... Five hundred. Five hundred AND something no amount ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135925"));
                DC(int64(0xb4a225815539a3f3), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Santino_233314,
                    UTopic_Santino_233334
                );
            }
        }
        
        
        class UTopic_Santino_110364 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x4853d643cd31a52c);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_110364);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4853d643cd31a52d), EConversationDebugInfo::Executing);
                // All right. Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_3286"));
                DC(int64(0x4853d643cd31a52d), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d027930e), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140410"));
                DC(int64(0x41fa5ac5d027930e), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Santino.AddItemToInventory(UItMi_Orenugget, 1000);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Executing);
                Santino.AI.GiveItemTo(Hero, UItMi_Orenugget, 1000);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279321), EConversationDebugInfo::Executing);
                // Now, about that other thing ...
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140647"));
                DC(int64(0x41fa5ac5d0279321), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a57d), EConversationDebugInfo::Executing);
                
                // I didn't forget. Come. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_120446_2316"));
                DC(int64(0x4853d643cd31a57d), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Santino, UItWr_Scroll_Certificate, 1);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Executing);
                Santino.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_GuidePassage);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Done);
                DC(int64(0x6ae8a6d2cdf3722f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ae8a6d2cdf3722f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_110384 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x4853d643cd31a530);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_110384);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4853d643cd31a531), EConversationDebugInfo::Executing);
                // Forget it. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_2386"));
                DC(int64(0x4853d643cd31a531), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Santino_232904,
                    UTopic_Santino_232924
                );
            }
        }
        
        
        class UTopic_Santino_233314 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a3f5);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_233314);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a3f6), EConversationDebugInfo::Executing);
                // All right. Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_3286"));
                DC(int64(0xb4a225815539a3f6), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3fd), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140410"));
                DC(int64(0xb4a225815539a3fd), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Santino.AddItemToInventory(UItMi_Orenugget, 500);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Executing);
                Santino.AI.GiveItemTo(Hero, UItMi_Orenugget, 500);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a407), EConversationDebugInfo::Executing);
                // Now, about that other thing ...
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140647"));
                DC(int64(0xb4a225815539a407), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a408), EConversationDebugInfo::Executing);
                
                // I didn't forget. Come. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_120446_2316"));
                DC(int64(0xb4a225815539a408), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Santino, UItWr_Scroll_Certificate, 1);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Executing);
                Santino.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_GuidePassage);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a406), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4a225815539a406), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_233334 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a3f9);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_233334);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a3fa), EConversationDebugInfo::Executing);
                // Forget it. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_2386"));
                DC(int64(0xb4a225815539a3fa), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a409), EConversationDebugInfo::Executing);
                
                // Your loss. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140239"));
                DC(int64(0xb4a225815539a409), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE.FailQuest();
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a40e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4a225815539a40e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_232904 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a391);
            default Caption = LocText("TEXT_WIP_BKGBIDI_20250131_132717_3855");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_232904);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a39c), EConversationDebugInfo::Executing);
                // One thousand five hundred nuggets should do the trick.
                Hero.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113330_2801"));
                DC(int64(0xb4a225815539a39c), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a39d), EConversationDebugInfo::Executing);
                
                // What?! This is ridiculous. I could buy a warder's armor ...
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113413"));
                DC(int64(0xb4a225815539a39d), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a39e), EConversationDebugInfo::Executing);
                // ... Five hundred. Five hundred AND something no amount ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135925"));
                DC(int64(0xb4a225815539a39e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Santino_233191,
                    UTopic_Santino_233211
                );
            }
        }
        
        
        class UTopic_Santino_232924 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a395);
            default Caption = LocText("TEXT_WIP_BKGBIDI_20250131_132717_2384");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_232924);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a396), EConversationDebugInfo::Executing);
                // Two thousand nuggets sounds fair. 
                Hero.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113330_1769"));
                DC(int64(0xb4a225815539a396), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3a4), EConversationDebugInfo::Executing);
                
                // Two thousand?! Don't be ridiculous. That's way too much. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_113512"));
                DC(int64(0xb4a225815539a3a4), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3a5), EConversationDebugInfo::Executing);
                // ... Five hundred. Five hundred AND something no amount ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_135925"));
                DC(int64(0xb4a225815539a3a5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Santino_232984,
                    UTopic_Santino_233004
                );
            }
        }
        
        
        class UTopic_Santino_233191 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a3d7);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_233191);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a3d8), EConversationDebugInfo::Executing);
                // All right. Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_3286"));
                DC(int64(0xb4a225815539a3d8), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3df), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140410"));
                DC(int64(0xb4a225815539a3df), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Santino.AddItemToInventory(UItMi_Orenugget, 500);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Executing);
                Santino.AI.GiveItemTo(Hero, UItMi_Orenugget, 500);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3ec), EConversationDebugInfo::Executing);
                // Now, about that other thing ...
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140647"));
                DC(int64(0xb4a225815539a3ec), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3ed), EConversationDebugInfo::Executing);
                
                // I didn't forget. Come. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_120446_2316"));
                DC(int64(0xb4a225815539a3ed), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Santino, UItWr_Scroll_Certificate, 1);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Executing);
                Santino.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_GuidePassage);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3eb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4a225815539a3eb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_233211 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a3db);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_233211);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a3dc), EConversationDebugInfo::Executing);
                // Forget it. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_2386"));
                DC(int64(0xb4a225815539a3dc), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3e2), EConversationDebugInfo::Executing);
                
                // Your loss. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140239"));
                DC(int64(0xb4a225815539a3e2), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE.FailQuest();
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3f0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4a225815539a3f0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_232984 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a3a7);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_232984);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a3a8), EConversationDebugInfo::Executing);
                // All right. Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_3286"));
                DC(int64(0xb4a225815539a3a8), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3af), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140410"));
                DC(int64(0xb4a225815539a3af), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Santino.AddItemToInventory(UItMi_Orenugget, 500);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Executing);
                Santino.AI.GiveItemTo(Hero, UItMi_Orenugget, 500);
                DC(int64(0x4853d643cd31a567), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3c8), EConversationDebugInfo::Executing);
                // Now, about that other thing ...
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140647"));
                DC(int64(0xb4a225815539a3c8), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3d5), EConversationDebugInfo::Executing);
                
                // I didn't forget. Come. 
                Santino.AI.Say(LocText("TEXT_WIP_ARYAMKL_20241120_120446_2316"));
                DC(int64(0xb4a225815539a3d5), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Santino, UItWr_Scroll_Certificate, 1);
                DC(int64(0x3f10d397af1eae72), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Executing);
                Santino.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_GuidePassage);
                DC(int64(0x9ab60e5c8267029a), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3d2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4a225815539a3d2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Santino_233004 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0xb4a225815539a3ab);
            default Caption = LocText("TEXT_WIP_ARYAMKL_20241120_113548_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Santino_233004);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4a225815539a3bc), EConversationDebugInfo::Executing);
                // Forget it. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140229_2386"));
                DC(int64(0xb4a225815539a3bc), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3c0), EConversationDebugInfo::Executing);
                
                // Your loss. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_140239"));
                DC(int64(0xb4a225815539a3c0), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE.FailQuest();
                DC(int64(0xb4a225815539a37c), EConversationDebugInfo::Done);
                DC(int64(0xb4a225815539a3c3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4a225815539a3c3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSantino110868 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x3f10d397af1eae58);
            default Caption = LocText("TEXT_WIP_JWUSOHN_20241122_161835");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSantino110868);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3f10d397af1eae5e), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3f10d397af1eae56), EConversationDebugInfo::Executing);
                // Were you there when the mine collapsed?
                Hero.AI.Say(LocText("TEXT_WIP_JWUSOHN_20241122_161835"));
                DC(int64(0x3f10d397af1eae56), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792e4), EConversationDebugInfo::Executing);
                
                // Well, it obviously didn't collapse close enough, ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_133105"));
                DC(int64(0x41fa5ac5d02792e4), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae57), EConversationDebugInfo::Executing);
                // It was a close call, though. I was on my way topside ...
                Santino.AI.Say(LocText("TEXT_WIP_JWUSOHN_20241122_161835_41"));
                DC(int64(0x3f10d397af1eae57), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792e5), EConversationDebugInfo::Executing);
                // None of the diggers down below made it. Poor bastards. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_133217"));
                DC(int64(0x41fa5ac5d02792e5), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792e6), EConversationDebugInfo::Executing);
                
                // You lose any wares?
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_133244"));
                DC(int64(0x41fa5ac5d02792e6), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae5c), EConversationDebugInfo::Executing);
                
                // Just a couple. I was smart enough not to store ...
                Santino.AI.Say(LocText("TEXT_WIP_JWUSOHN_20241122_162014"));
                DC(int64(0x3f10d397af1eae5c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_SANTINO, Document::UDocumentSegment_Glossary_OM_STT_SANTINO_OldCamp);
            }
        }
        
        
        class UChoiceSantino110919 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x3f10d397af1eae61);
            default Caption = LocText("TEXT_WIP_JWUSOHN_20241122_162139");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSantino110919);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3f10d397af1eae67), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3f10d397af1eae5f), EConversationDebugInfo::Executing);
                // So - this is your new place?
                Hero.AI.Say(LocText("TEXT_WIP_JWUSOHN_20241122_162139"));
                DC(int64(0x3f10d397af1eae5f), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae60), EConversationDebugInfo::Executing);
                
                // Yes. Quite cozy, isn't it? Though I do miss the sounds ...
                Santino.AI.Say(LocText("TEXT_WIP_JWUSOHN_20241122_162139_2238"));
                DC(int64(0x3f10d397af1eae60), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792eb), EConversationDebugInfo::Executing);
                
                // Really?
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_134554"));
                DC(int64(0x41fa5ac5d02792eb), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792ec), EConversationDebugInfo::Executing);
                
                // No. I'm glad to be out of that hole. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_134558"));
                DC(int64(0x41fa5ac5d02792ec), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSantino110964 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x3f10d397af1eae6a);
            default Caption = LocText("TEXT_WIP_JWUSOHN_20241122_162451");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSantino110964);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("STT_335_SANTINO_BUY_INFO_07_02"), int64(0x3f10d397af1eae6a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3f10d397af1eae6d), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3f10d397af1eae68), EConversationDebugInfo::Executing);
                
                // Where do you get your goods from?
                Hero.AI.Say(LocText("TEXT_WIP_JWUSOHN_20241122_162451"));
                DC(int64(0x3f10d397af1eae68), EConversationDebugInfo::Done);
                DC(int64(0x3f10d397af1eae69), EConversationDebugInfo::Executing);
                
                // Let's just say I have my connections. 
                Santino.AI.Say(LocText("TEXT_WIP_JWUSOHN_20241122_162451_2785"));
                DC(int64(0x3f10d397af1eae69), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSantino112364 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x41fa5ac5d02792db);
            default Caption = LocText("TEXT_WIP_PIYYDND_20241126_132145");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSantino112364);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("STT_335_SANTINO_BUY_INFO_07_02"), int64(0x41fa5ac5d02792db));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x41fa5ac5d02792d9), EConversationDebugInfo::Executing);
                
                // What counts as an "unusual item" for you? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132145"));
                DC(int64(0x41fa5ac5d02792d9), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792da), EConversationDebugInfo::Executing);
                
                // I know that when I see it. Whenever you think you have ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132145_41"));
                DC(int64(0x41fa5ac5d02792da), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792dd), EConversationDebugInfo::Executing);
                // I'll take a look. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132607"));
                DC(int64(0x41fa5ac5d02792dd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MERCHANTSPRICE, Document::UDocumentSegment_CH1_MERCHANTSPRICE_Start);
                DC(int64(0x6ae8a6d2cdf3724f), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE.StartQuest();
                DC(int64(0x6ae8a6d2cdf3724f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSantino112732 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x41fa5ac5d02792e0);
            default Caption = LocText("TEXT_WIP_PIYYDND_20241126_132720");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSantino112732);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PIYYDND_20241126_132145"), int64(0x41fa5ac5d02792e0));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x41fa5ac5d02792de), EConversationDebugInfo::Executing);
                // Why don't you trade for regular goods?
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132720"));
                DC(int64(0x41fa5ac5d02792de), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792df), EConversationDebugInfo::Executing);
                
                // Like what? The stinking boots of some digger or a ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132720_2238"));
                DC(int64(0x41fa5ac5d02792df), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792e3), EConversationDebugInfo::Executing);
                // My time isn't endless, and neither is my storage.
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132904"));
                DC(int64(0x41fa5ac5d02792e3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSantino117589 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x41fa5ac5d0279327);
            default Caption = LocText("TEXT_WIP_PIYYDND_20241126_143035");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSantino220171);
            default Rules.HideIfKnows(UChoiceSantino117589);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x41fa5ac5d0279325), EConversationDebugInfo::Executing);
                
                // Aren't you worried I'll tell Gomez about this? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_143035"));
                DC(int64(0x41fa5ac5d0279325), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279326), EConversationDebugInfo::Executing);
                
                // If you did that, some very influential people close to ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_143035_2801"));
                DC(int64(0x41fa5ac5d0279326), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279329), EConversationDebugInfo::Executing);
                // Trust me, you don't want to play these kinds of games ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_143203"));
                DC(int64(0x41fa5ac5d0279329), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSantino220171 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x9ab60e5c8267029f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::DefaultRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceSantino220171);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"Santino_Wait_Passage", 300.0f, int64(0x9ab60e5c8267029f));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ARYAMKL_20241120_112211_686"), int64(0x9ab60e5c8267029f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9ab60e5c826702b1), Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE != nullptr && Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE != nullptr && Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c8267029c), EConversationDebugInfo::Executing);
                // Here. This passage will lead you straight into the ...
                Santino.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_105641_2083"));
                DC(int64(0x9ab60e5c8267029c), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279323), EConversationDebugInfo::Executing);
                
                // ... A secret tunnel. 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_142451"));
                DC(int64(0x41fa5ac5d0279323), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d0279324), EConversationDebugInfo::Executing);
                
                // Sounds a bit dramatic, but yes - it is. 
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_142459"));
                DC(int64(0x41fa5ac5d0279324), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_SANTINO, Document::UDocumentSegment_Glossary_OM_STT_SANTINO_SecretPassage);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MERCHANTSPRICE, Document::UDocumentSegment_CH1_MERCHANTSPRICE_Completed);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Santino.AddItemToInventory(UItKe_MerchantCellarDoor, 1);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x745f179b799c59bd), EConversationDebugInfo::Executing);
                Santino.AI.GiveItemTo(Hero, UItKe_MerchantCellarDoor, 1);
                DC(int64(0x745f179b799c59bd), EConversationDebugInfo::Done);
                DC(int64(0x609a0809e16f4f64), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_RETURN.SucceedQuest();
                DC(int64(0x609a0809e16f4f64), EConversationDebugInfo::Done);
                DC(int64(0x609a0809e16f4f65), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x609a0809e16f4f65), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSantino220298 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x9ab60e5c826702bb);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_111550");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSantino220171);
            default Rules.HideIfKnows(UChoiceSantino220298);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c826702b7), EConversationDebugInfo::Executing);
                // What have you been using this for? 
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_111550"));
                DC(int64(0x9ab60e5c826702b7), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826702b8), EConversationDebugInfo::Executing);
                
                // This and that. Let's just say there's advantages to ...
                Santino.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_111550_1924"));
                DC(int64(0x9ab60e5c826702b8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSantino220449 : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x9ab60e5c826702c3);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_112102");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSantino220171);
            default Rules.HideIfKnows(UChoiceSantino220449);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c826702bf), EConversationDebugInfo::Executing);
                
                // How do I get in? 
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_112102"));
                DC(int64(0x9ab60e5c826702bf), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826702c0), EConversationDebugInfo::Executing);
                
                // By pulling that torch next to the door. But remember, ...
                Santino.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_112102_3436"));
                DC(int64(0x9ab60e5c826702c0), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826702d6), EConversationDebugInfo::Executing);
                // Just don't do anything stupid, or draw attention to ...
                Santino.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_112858"));
                DC(int64(0x9ab60e5c826702d6), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826702d7), EConversationDebugInfo::Executing);
                // Now, off you go. And remember - this conversation never ...
                Santino.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_112956"));
                DC(int64(0x9ab60e5c826702d7), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826702dd), EConversationDebugInfo::Executing);
                Santino.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_Chapter3Allow);
                DC(int64(0x9ab60e5c826702dd), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826702de), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9ab60e5c826702de), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt335SantinoBuy : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x3397191f621ebbfa);
            default Caption = LocText("STT_335_SANTINO_BUY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceStt335SantinoBuy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3397191f621ebbfb), EConversationDebugInfo::Executing);
                // Do you trade? 
                Hero.AI.Say(LocText("STT_335_SANTINO_BUY_INFO_15_01"));
                DC(int64(0x3397191f621ebbfb), EConversationDebugInfo::Done);
                DC(int64(0x3397191f621ebbfc), EConversationDebugInfo::Executing);
                
                // Depends on who's asking. 
                Santino.AI.Say(LocText("STT_335_SANTINO_BUY_INFO_07_02"));
                DC(int64(0x3397191f621ebbfc), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792d6), EConversationDebugInfo::Executing);
                
                // What's that supposed to mean? 
                Hero.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132024"));
                DC(int64(0x41fa5ac5d02792d6), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792d7), EConversationDebugInfo::Executing);
                
                // It means that I don't do business with just any digger ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132055"));
                DC(int64(0x41fa5ac5d02792d7), EConversationDebugInfo::Done);
                DC(int64(0x41fa5ac5d02792d8), EConversationDebugInfo::Executing);
                // I'm looking for ... unusual items. And I offer the same ...
                Santino.AI.Say(LocText("TEXT_WIP_PIYYDND_20241126_132113"));
                DC(int64(0x41fa5ac5d02792d8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_SANTINO, Document::UDocumentSegment_Glossary_OM_STT_SANTINO_Introduction);
            }
        }
        
        
        class UChoiceStt335SantinoExit : UTopic_Hero__OM_STT_SANTINO_335
        {
            default DebugId = int64(0x3397191f621ebbf8);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3397191f621ebbf9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3397191f621ebbf9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */