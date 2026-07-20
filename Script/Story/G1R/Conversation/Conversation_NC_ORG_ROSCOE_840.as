#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROSCOE_840 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROSCOE_840";
        }
        
        
        class UTopic_Hero__NC_ORG_ROSCOE_840 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROSCOE_840";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRoscoe() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceRoscoe109303 : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x8e70368ac0328adc);
            default Caption = LocText("TEXT_WIP_BGXCIAC_20240905_153517");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRoscoe109303);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8e70368ac0328b7c), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasSucceeded());
                    DB(int64(0x5db6374fc44e0d26), G1R.Lares_Permission == 0);
                }
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasSucceeded())
                    return false;
                
                if (G1R.Lares_Permission != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e70368ac0328ada), EConversationDebugInfo::Executing);
                // I want to talk to Lares. The Rice Lord sends me.
                Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_153517"));
                DC(int64(0x8e70368ac0328ada), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328adb), EConversationDebugInfo::Executing);
                
                // You that freshie then who made himself useful to him? ...
                Roscoe.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_153517_41"));
                DC(int64(0x8e70368ac0328adb), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328b7e), EConversationDebugInfo::Executing);
                
                // We'll see. 
                Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_190316"));
                DC(int64(0x8e70368ac0328b7e), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328b7d), EConversationDebugInfo::Executing);
                
                // (snorts) All right then. Go on in. But don't you try ...
                Roscoe.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_190238"));
                DC(int64(0x8e70368ac0328b7d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_ROSCOE, Document::UDocumentSegment_Glossary_NC_ORG_ROSCOE_Permission);
                DC(int64(0x5db6374fc44e09fa), EConversationDebugInfo::Executing);
                G1R.Lares_Permission = 1;
                DC(int64(0x5db6374fc44e09fa), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a132), EConversationDebugInfo::Executing);
                Roscoe.RemoveImmortality();
                DC(int64(0x7858bf075764a132), EConversationDebugInfo::Done);
                DC(int64(0x5db6374fc44e09fb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5db6374fc44e09fb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRoscoe76241 : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x6b35ea111913420);
            default Caption = LocText("TEXT_DDIAZ_20221124_120218");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRoscoeWannajoin);
            default Rules.HideIfKnows(UChoiceRoscoe76241);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6b35ea11191341d), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                    DB(int64(0x6b35ea111913422), Hero != nullptr && !Hero.HasItem(UItWr_Scroll_List, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && !Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b35ea11191341e), EConversationDebugInfo::Executing);
                // I might have something you could use. From the Old Camp.
                Hero.AI.Say(LocText("TEXT_DDIAZ_20221124_120218"));
                DC(int64(0x6b35ea11191341e), EConversationDebugInfo::Done);
                DC(int64(0x6b35ea11191341f), EConversationDebugInfo::Executing);
                
                // That so?
                Roscoe.AI.Say(LocText("TEXT_DDIAZ_20221124_120218_2238"));
                DC(int64(0x6b35ea11191341f), EConversationDebugInfo::Done);
                DC(int64(0x6b35ea111913423), EConversationDebugInfo::Executing);
                
                // Yes. The provision list from Old Mine. Diego sent me to ...
                Hero.AI.Say(LocText("TEXT_DDIAZ_20221124_121148"));
                DC(int64(0x6b35ea111913423), EConversationDebugInfo::Done);
                DC(int64(0x6b35ea111913424), EConversationDebugInfo::Executing);
                
                // And now here you are, telling me about it. I like you. ...
                Roscoe.AI.Say(LocText("TEXT_DDIAZ_20221124_121327"));
                DC(int64(0x6b35ea111913424), EConversationDebugInfo::Done);
                DC(int64(0x6b35ea111913425), EConversationDebugInfo::Executing);
                
                // I'm on it.
                Hero.AI.Say(LocText("TEXT_DDIAZ_20221124_121624"));
                DC(int64(0x6b35ea111913425), EConversationDebugInfo::Done);
                DC(int64(0x6b35ea111913426), EConversationDebugInfo::Executing);
                
                // Then come back when you do. 
                Roscoe.AI.Say(LocText("TEXT_DDIAZ_20221124_123040"));
                DC(int64(0x6b35ea111913426), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRoscoeAttack : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec891b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_LaresPassage2", 50.0f, int64(0x72a66123e3ec891b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72a66123e3ec891c), G1R.GuardPassageWarning_NC == 2);
                    DB(int64(0x72a66123e3ec891d), Roscoe != nullptr && !Roscoe.IsFriendlyTowards(Hero));
                    DB(int64(0x72a66123e3ec891e), G1R.Lares_Permission == 0);
                    DB(int64(0x72a66123e3ec8920), Roscoe != nullptr && Roscoe.IsAtPreferredLocation(500.0f));
                }
                
                if (G1R.GuardPassageWarning_NC != 2)
                    return false;
                
                if (Roscoe != nullptr && Roscoe.IsFriendlyTowards(Hero))
                    return false;
                
                if (G1R.Lares_Permission != 0)
                    return false;
                
                if (Roscoe != nullptr && !Roscoe.IsAtPreferredLocation(500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped Roscoe.AI.FullStop()");
                Print("Skipped Roscoe.AI.SignalIntruderAlert(Hero)");
                DC(int64(0x16b33daa7e9e9b9c), EConversationDebugInfo::Executing);
                Roscoe.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x16b33daa7e9e9b9c), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec8926), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x72a66123e3ec8926), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRoscoeBringlist : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec88ef);
            default Caption = LocText("DIA_ROSCOE_BRINGLIST_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceRoscoeBringlist);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72a66123e3ec88f0), Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0));
                    DB(int64(0x5db6374fc44e0d27), G1R.Lares_Permission == 0);
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_List, 1, 0))
                    return false;
                
                if (G1R.Lares_Permission != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72a66123e3ec88f1), EConversationDebugInfo::Executing);
                // I have the supply list from the Old Mine.
                Hero.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_15_00"));
                DC(int64(0x72a66123e3ec88f1), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88f2), EConversationDebugInfo::Executing);
                
                // You ... what? Is that a joke? 
                Roscoe.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_10_01"));
                DC(int64(0x72a66123e3ec88f2), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88f3), EConversationDebugInfo::Executing);
                
                // No. Ian gave it to me. 
                Hero.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_15_02"));
                DC(int64(0x72a66123e3ec88f3), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88f4), EConversationDebugInfo::Executing);
                
                // You, my man, got stones. Let me guess, Thorus sent you ...
                Roscoe.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_10_03"));
                DC(int64(0x72a66123e3ec88f4), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88f5), EConversationDebugInfo::Executing);
                
                // Actually, it was Diego. 
                Hero.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_15_04"));
                DC(int64(0x72a66123e3ec88f5), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88f6), EConversationDebugInfo::Executing);
                
                // Ah. Well, HE would be laughing his ass off. 
                Roscoe.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_10_05"));
                DC(int64(0x72a66123e3ec88f6), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88f7), EConversationDebugInfo::Executing);
                
                // So, can I see Lares or not?
                Hero.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_15_06"));
                DC(int64(0x72a66123e3ec88f7), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88f8), EConversationDebugInfo::Executing);
                
                // Sure. He'll be over the moon. 
                Roscoe.AI.Say(LocText("DIA_ROSCOE_BRINGLIST_10_07"));
                DC(int64(0x72a66123e3ec88f8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_ROSCOE, Document::UDocumentSegment_Glossary_NC_ORG_ROSCOE_Permission);
                DC(int64(0x16b33daa7e9eda24), EConversationDebugInfo::Executing);
                G1R.Lares_Permission = 1;
                DC(int64(0x16b33daa7e9eda24), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a130), EConversationDebugInfo::Executing);
                Roscoe.RemoveImmortality();
                DC(int64(0x7858bf075764a130), EConversationDebugInfo::Done);
                DC(int64(0x16b33daa7e9eda25), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x16b33daa7e9eda25), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRoscoeComeagain : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec8908);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRoscoe76241);
            default Rules.HideIfKnows(UChoiceRoscoeComeagain);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72a66123e3ec8909), Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72a66123e3ec890a), EConversationDebugInfo::Executing);
                // You again.
                Roscoe.AI.Say(LocText("DIA_ROSCOE_COMEAGAIN_10_00"));
                DC(int64(0x72a66123e3ec890a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRoscoeExit : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec88ed);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72a66123e3ec88ee), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x72a66123e3ec88ee), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRoscoeFirstwarn : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec890b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72a66123e3ec890c), G1R.GuardPassageWarning_NC == 0);
                    DB(int64(0x72a66123e3ec890d), G1R.Lares_Permission == 0);
                    DB(int64(0x72a66123e3ec890e), Roscoe != nullptr && !Roscoe.IsFriendlyTowards(Hero));
                    DB(int64(0x72a66123e3ec890f), Roscoe != nullptr && Roscoe.IsAtPreferredLocation(0.0f));
                }
                
                if (G1R.GuardPassageWarning_NC != 0)
                    return false;
                
                if (G1R.Lares_Permission != 0)
                    return false;
                
                if (Roscoe != nullptr && Roscoe.IsFriendlyTowards(Hero))
                    return false;
                
                if (Roscoe != nullptr && !Roscoe.IsAtPreferredLocation(0.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72a66123e3ec8910), EConversationDebugInfo::Executing);
                // Where do you think you're going? 
                Roscoe.AI.Say(LocText("INFO_ROSCOE_FIRSTWARN_INFO_10_00"));
                DC(int64(0x72a66123e3ec8910), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec8911), EConversationDebugInfo::Executing);
                
                // I want to see Lares.
                Hero.AI.Say(LocText("INFO_ROSCOE_FIRSTWARN_INFO_15_01"));
                DC(int64(0x72a66123e3ec8911), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec8912), EConversationDebugInfo::Executing);
                
                // You don't say. Unless you have a very good reason, you ...
                Roscoe.AI.Say(LocText("INFO_ROSCOE_FIRSTWARN_INFO_10_02"));
                DC(int64(0x72a66123e3ec8912), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_ROSCOE, Document::UDocumentSegment_Glossary_NC_ORG_ROSCOE_Introduction);
                DC(int64(0x16b33daa7e9eda1f), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_NC = 1;
                DC(int64(0x16b33daa7e9eda1f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRoscoeLastwarn : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec8913);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_LaresPassage2", 200.0f, int64(0x72a66123e3ec8913));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72a66123e3ec8914), G1R.GuardPassageWarning_NC == 1);
                    DB(int64(0x72a66123e3ec8915), Roscoe != nullptr && !Roscoe.IsFriendlyTowards(Hero));
                    DB(int64(0x72a66123e3ec8916), G1R.Lares_Permission == 0);
                    DB(int64(0x72a66123e3ec8918), Roscoe != nullptr && Roscoe.IsAtPreferredLocation(0.0f));
                }
                
                if (G1R.GuardPassageWarning_NC != 1)
                    return false;
                
                if (Roscoe != nullptr && Roscoe.IsFriendlyTowards(Hero))
                    return false;
                
                if (G1R.Lares_Permission != 0)
                    return false;
                
                if (Roscoe != nullptr && !Roscoe.IsAtPreferredLocation(0.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72a66123e3ec8919), EConversationDebugInfo::Executing);
                // You deaf, or what?
                Roscoe.AI.Say(LocText("INFO_ROSCOE_LASTWARN_10_00"));
                DC(int64(0x72a66123e3ec8919), EConversationDebugInfo::Done);
                DC(int64(0x16b33daa7e9eda1c), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_NC = 2;
                DC(int64(0x16b33daa7e9eda1c), EConversationDebugInfo::Done);
                DC(int64(0x16b33daa7e9eda1d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x16b33daa7e9eda1d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRoscoeMordrag : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec88f9);
            default Caption = LocText("DIA_ROSCOE_MORDRAG_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceRoscoeMordrag);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72a66123e3ec88fa), Hero != nullptr && Hero.HasItem(UItAt_Ring_Mordrag, 1, 0));
                    DB(int64(0x5db6374fc44e0d25), G1R.Lares_Permission == 0);
                    DB(int64(0xe1fad33effc6f936), G1R.MordragKO_StayAtNC != 0);
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Ring_Mordrag, 1, 0))
                    return false;
                
                if (G1R.Lares_Permission != 0)
                    return false;
                
                if (G1R.MordragKO_StayAtNC == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72a66123e3ec88fb), EConversationDebugInfo::Executing);
                // Mordrag sent me.
                Hero.AI.Say(LocText("DIA_ROSCOE_MORDRAG_15_00"));
                DC(int64(0x72a66123e3ec88fb), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88fc), EConversationDebugInfo::Executing);
                
                // Mordrag? Ain't seen that man in ages ... so he didn't ...
                Roscoe.AI.Say(LocText("DIA_ROSCOE_MORDRAG_10_01"));
                DC(int64(0x72a66123e3ec88fc), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88fd), EConversationDebugInfo::Executing);
                
                // No. He helped me get here. 
                Hero.AI.Say(LocText("DIA_ROSCOE_MORDRAG_15_02"));
                DC(int64(0x72a66123e3ec88fd), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88fe), EConversationDebugInfo::Executing);
                
                // Uh-huh ... well, if you run into him again, go tell him ...
                Roscoe.AI.Say(LocText("DIA_ROSCOE_MORDRAG_10_03"));
                DC(int64(0x72a66123e3ec88fe), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec88ff), EConversationDebugInfo::Executing);
                
                // He actually gave me something for Lares. 
                Hero.AI.Say(LocText("DIA_ROSCOE_MORDRAG_15_04"));
                DC(int64(0x72a66123e3ec88ff), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec8900), EConversationDebugInfo::Executing);
                
                // What?
                Roscoe.AI.Say(LocText("DIA_ROSCOE_MORDRAG_10_05"));
                DC(int64(0x72a66123e3ec8900), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec8901), EConversationDebugInfo::Executing);
                
                // A ring. 
                Hero.AI.Say(LocText("DIA_ROSCOE_MORDRAG_15_06"));
                DC(int64(0x72a66123e3ec8901), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec8902), EConversationDebugInfo::Executing);
                
                // Hmm ... all right, then. Go on in.
                Roscoe.AI.Say(LocText("DIA_ROSCOE_MORDRAG_10_07"));
                DC(int64(0x72a66123e3ec8902), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_ROSCOE, Document::UDocumentSegment_Glossary_NC_ORG_ROSCOE_Permission);
                DC(int64(0x16b33daa7e9eda21), EConversationDebugInfo::Executing);
                G1R.Lares_Permission = 1;
                DC(int64(0x16b33daa7e9eda21), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a134), EConversationDebugInfo::Executing);
                Roscoe.RemoveImmortality();
                DC(int64(0x7858bf075764a134), EConversationDebugInfo::Done);
                DC(int64(0x16b33daa7e9eda22), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x16b33daa7e9eda22), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRoscoeWannajoin : UTopic_Hero__NC_ORG_ROSCOE_840
        {
            default DebugId = int64(0x72a66123e3ec8903);
            default Caption = LocText("DIA_ROSCOE_WANNAJOIN_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceRoscoe109303, UChoiceRoscoeBringlist, UChoiceRoscoeMordrag);
            default Rules.HideIfKnows(UChoiceRoscoeWannajoin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72a66123e3ec8904), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DC(int64(0x72a66123e3ec8905), EConversationDebugInfo::Unimplemented);
                    DB(int64(0x3e1b00bf83d3ddf4), G1R.Lares_Permission == 0);
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (/* Skip: is_equal_to */ false)
                    return false;
                
                if (G1R.Lares_Permission != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72a66123e3ec8906), EConversationDebugInfo::Executing);
                // I want to join your gang.
                Hero.AI.Say(LocText("DIA_ROSCOE_WANNAJOIN_15_00"));
                DC(int64(0x72a66123e3ec8906), EConversationDebugInfo::Done);
                DC(int64(0x72a66123e3ec8907), EConversationDebugInfo::Executing);
                
                // You and a hundred others, mate. If you want in here, ...
                Roscoe.AI.Say(LocText("DIA_ROSCOE_WANNAJOIN_10_01"));
                DC(int64(0x72a66123e3ec8907), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */