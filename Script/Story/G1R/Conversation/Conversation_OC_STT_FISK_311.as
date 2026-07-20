#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_STT_FISK_311 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_STT_FISK_311";
        }
        
        
        class UTopic_Hero__OC_STT_FISK_311 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_FISK_311";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetFisk() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetSharky() const property
            {
                return GetCharacter(n"NC_ORG_SHARKY_843");
            }
        }
        
        
        class UChoiceFisk108715 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x9c33826e14936760);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_172408");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x270fa1196f3ea3bd), Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK != nullptr && Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK != nullptr && Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c33826e1493675e), EConversationDebugInfo::Executing);
                // Here, some sickles for you. Huno sends his regards.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_172408"));
                DC(int64(0x9c33826e1493675e), EConversationDebugInfo::Done);
                DB(int64(0x9c33826e14936763), Hero != nullptr && Hero.HasItem(UItMw_1H_Axe_Sickle_01, 5, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMw_1H_Axe_Sickle_01, 5, 0))
                {
                    DC(int64(0x9c33826e14936778), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Fisk, UItMw_1H_Axe_Sickle_01, 5);
                    DC(int64(0x9c33826e14936778), EConversationDebugInfo::Done);
                    DC(int64(0x9c33826e1493677c), EConversationDebugInfo::Executing);
                    // Ah, right on time.
                    Fisk.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_173631_3436"));
                    DC(int64(0x9c33826e1493677c), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Fisk_108937,
                        UTopic_Fisk_108957,
                        UTopic_Fisk_109019
                    );
                }
                else
                {
                    DC(int64(0x9c33826e14936764), EConversationDebugInfo::Executing);
                    // Really? Then you can send them right back, because ...
                    Fisk.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_173409"));
                    DC(int64(0x9c33826e14936764), EConversationDebugInfo::Done);
                    DC(int64(0x9c33826e14936766), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x9c33826e14936766), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Fisk_108937 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x9c33826e14936782);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_173829_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fisk_108937);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c33826e14936783), EConversationDebugInfo::Executing);
                // You work with Huno often?
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_173829_3286"));
                DC(int64(0x9c33826e14936783), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e1493678a), EConversationDebugInfo::Executing);
                
                // Oh, yeah, from time to time. Stone's the better ...
                Fisk.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_173848"));
                DC(int64(0x9c33826e1493678a), EConversationDebugInfo::Done);
                DC(int64(0xcc4cc986febcd7e5), EConversationDebugInfo::Executing);
                // Rigid. 
                Fisk.AI.Say(LocText("TEXT_WIP_LIYYDND_20241122_152644"));
                DC(int64(0xcc4cc986febcd7e5), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e14936785), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9c33826e14936785), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Fisk_108957 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x9c33826e14936786);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_173829_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fisk_108957);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c33826e14936787), EConversationDebugInfo::Executing);
                // So, who are these for? 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_173829_2386"));
                DC(int64(0x9c33826e14936787), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e1493678c), EConversationDebugInfo::Executing);
                
                // Your mother. 
                Fisk.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_173928"));
                DC(int64(0x9c33826e1493678c), EConversationDebugInfo::Done);
                DC(int64(0xcc4cc986febcd7e8), EConversationDebugInfo::Executing);
                // Do you always ask so many questions? 
                Fisk.AI.Say(LocText("TEXT_WIP_LIYYDND_20241122_152913"));
                DC(int64(0xcc4cc986febcd7e8), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e14936789), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9c33826e14936789), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Fisk_109019 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x9c33826e1493679b);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_174326_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fisk_109019);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c33826e1493679c), EConversationDebugInfo::Executing);
                // I'll head back to Huno then. 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_174326_1609"));
                DC(int64(0x9c33826e1493679c), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367a2), EConversationDebugInfo::Executing);
                
                // I'm not stopping you. Oh, and tell him he'll get his ...
                Fisk.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_174454"));
                DC(int64(0x9c33826e149367a2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LURKERBITE, Document::UDocumentSegment_CH1_LURKERBITE_Entry3);
                DC(int64(0x9693d45864e5fb9c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK.SucceedQuest();
                DC(int64(0x9693d45864e5fb9c), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367a3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c33826e149367a3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFisk133943 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0xb9a65ed3c93b3a6b);
            default Caption = LocText("TEXT_WIP_EMCTYHF_20241219_100644");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb9a65ed3c93b3a71), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb9a65ed3c93b3a69), EConversationDebugInfo::Executing);
                // Could you improve my armor?
                Hero.AI.Say(LocText("TEXT_WIP_EMCTYHF_20241219_100644"));
                DC(int64(0xb9a65ed3c93b3a69), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_FISK, Document::UDocumentSegment_Glossary_OC_STT_FISK_Armor);
                DB(int64(0x3e9d2f5631dc461a), Fisk != nullptr && !Fisk.IsAngryTowards(Hero));
                
                if (Fisk != nullptr && !Fisk.IsAngryTowards(Hero))
                {
                    DB(int64(0x3e9d2f5631dc461e), Hero != nullptr && Hero.Inventory.HasEquippedItem(UStt_Armor));
                    
                    if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UStt_Armor))
                    {
                        DC(int64(0xb9a65ed3c93b3a6a), EConversationDebugInfo::Executing);
                        // For the right price, sure!
                        Fisk.AI.Say(LocText("TEXT_WIP_EMCTYHF_20241219_100644_41"));
                        DC(int64(0xb9a65ed3c93b3a6a), EConversationDebugInfo::Done);
                        DC(int64(0xb9a65ed3c93b3a74), EConversationDebugInfo::Executing);
                        Fisk.AI.StartCustomizingArmorWith(Hero);
                        DC(int64(0xb9a65ed3c93b3a74), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_fisk_133943_exit_1");
                    }
                    else
                    {
                        DC(int64(0x3e9d2f5631dc462a), EConversationDebugInfo::Executing);
                        // I don't have anything for that armor.
                        Fisk.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_123635_2386"));
                        DC(int64(0x3e9d2f5631dc462a), EConversationDebugInfo::Done);
                        DC(int64(0x3e9d2f5631dc4630), EConversationDebugInfo::Executing);
                        //  Equip the Shadow's one  and let me know.
                        Fisk.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_123714"));
                        DC(int64(0x3e9d2f5631dc4630), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_fisk_133943_exit_2");
                        DC(int64(0x3e9d2f5631dc4631), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x3e9d2f5631dc4631), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0x3e9d2f5631dc4623), EConversationDebugInfo::Executing);
                    // I won't help an idiot like you. Come back later and see ...
                    Fisk.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_123435"));
                    DC(int64(0x3e9d2f5631dc4623), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fisk_133943_exit_3");
                    DC(int64(0x3e9d2f5631dc464a), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3e9d2f5631dc464a), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceFisk142036 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x3ccf879ff8762b39);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_121807");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt311FiskFirst);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MTDQKAE_20250116_123112"), int64(0x3ccf879ff8762b39));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ccf879ff8762b59), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ccf879ff8762b37), EConversationDebugInfo::Executing);
                // I need blank scroll paper.
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_121807"));
                DC(int64(0x3ccf879ff8762b37), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b38), EConversationDebugInfo::Executing);
                
                // I don't have that kind of stuff.
                Fisk.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_121807_2238"));
                DC(int64(0x3ccf879ff8762b38), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b47), EConversationDebugInfo::Executing);
                
                // Do you know where I can get it?
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_122528"));
                DC(int64(0x3ccf879ff8762b47), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b48), EConversationDebugInfo::Executing);
                
                // Hm ... I'm not sure. But a handful of nuggs might jog my ...
                Fisk.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_122554"));
                DC(int64(0x3ccf879ff8762b48), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Fisk_142228,
                    UTopic_Fisk_142248
                );
            }
        }
        
        
        class UTopic_Fisk_142228 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x3ccf879ff8762b4a);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_123045_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fisk_142228);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ccf879ff8762b56), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 3, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 3, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ccf879ff8762b4b), EConversationDebugInfo::Executing);
                // Here you are.
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_123045_2785"));
                DC(int64(0x3ccf879ff8762b4b), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b63), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Fisk, UItMi_Orenugget, 3);
                DC(int64(0x3ccf879ff8762b63), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b52), EConversationDebugInfo::Executing);
                // Always a pleasure doing business with you.
                Fisk.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_123112"));
                DC(int64(0x3ccf879ff8762b52), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b53), EConversationDebugInfo::Executing);
                // You could ask Graham, the map maker.
                Fisk.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_123147"));
                DC(int64(0x3ccf879ff8762b53), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Fisk_142248 : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x3ccf879ff8762b4e);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_123045_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ccf879ff8762b4f), EConversationDebugInfo::Executing);
                
                // Forget it.
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_123045_3286"));
                DC(int64(0x3ccf879ff8762b4f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt311FiskExit : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x2bb5a8236fd84244);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84245), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2bb5a8236fd84245), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt311FiskFirst : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x2bb5a8236fd84246);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceStt311FiskFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1151535fc1ad72fe), G1R.MordragKO_Exiled == 0);
                    DB(int64(0xa3d887c68803117e), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (G1R.MordragKO_Exiled != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84248), EConversationDebugInfo::Executing);
                // Hey, you're new here, ain't you? I'm Fisk, peddler of ...
                Fisk.AI.Say(LocText("STT_311_FISK_FIRST_12_00"));
                DC(int64(0x2bb5a8236fd84248), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_FISK, Document::UDocumentSegment_Glossary_OC_STT_FISK_Introduction_Trader);
            }
        }
        
        
        class UChoiceStt311FiskForgetsword : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x2bb5a8236fd84268);
            default Caption = LocText("STT_311_FISK_FORGETSWORD_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2bb5a8236fd84269), G1R.Fisk_ForgetSword != 0);
                }
                
                return G1R.Fisk_ForgetSword != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd8426a), EConversationDebugInfo::Executing);
                // About Whistler's sword ...
                Hero.AI.Say(LocText("STT_311_FISK_FORGETSWORD_15_00"));
                DC(int64(0x2bb5a8236fd8426a), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd8426b), EConversationDebugInfo::Executing);
                
                // Tell him he's never getting it back. 
                Fisk.AI.Say(LocText("STT_311_FISK_FORGETSWORD_12_01"));
                DC(int64(0x2bb5a8236fd8426b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt311FiskHehlersuccess : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x2bb5a8236fd84282);
            default Caption = LocText("STT_311_FISK_HEHLERSUCCESS_15_00");
            default PriorityRank = 4;
            
            default Rules.HideIfKnows(UChoiceStt311FiskHehlersuccess);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("ORG_843_SHARKY_FISK_INFO_10_03"), int64(0x2bb5a8236fd84282));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2bb5a8236fd84283), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84284), EConversationDebugInfo::Executing);
                
                // I found a new fence for you. A New Camper.
                Hero.AI.Say(LocText("STT_311_FISK_HEHLERSUCCESS_15_00"));
                DC(int64(0x2bb5a8236fd84284), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84285), EConversationDebugInfo::Executing);
                
                // Really? Well, I'll be damned. You're really puttin' in ...
                Fisk.AI.Say(LocText("STT_311_FISK_HEHLERSUCCESS_12_01"));
                DC(int64(0x2bb5a8236fd84285), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84286), EConversationDebugInfo::Executing);
                // Works with me. Who is it?
                Fisk.AI.Say(LocText("STT_311_FISK_HEHLERSUCCESS_12_02"));
                DC(int64(0x2bb5a8236fd84286), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84287), EConversationDebugInfo::Executing);
                
                // His name's Sharky.
                Hero.AI.Say(LocText("STT_311_FISK_HEHLERSUCCESS_15_03"));
                DC(int64(0x2bb5a8236fd84287), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84288), EConversationDebugInfo::Executing);
                
                // Sharky? Bloody hell, that guy is worse than Mordrag. 
                Fisk.AI.Say(LocText("STT_311_FISK_HEHLERSUCCESS_12_04"));
                DC(int64(0x2bb5a8236fd84288), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84289), EConversationDebugInfo::Executing);
                // Anyway, appreciate it. Don't worry about Diego - I'm not ...
                Fisk.AI.Say(LocText("STT_311_FISK_HEHLERSUCCESS_12_05"));
                DC(int64(0x2bb5a8236fd84289), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_FISK, Document::UDocumentSegment_Glossary_OC_STT_FISK_FiskNewDealerCompleted);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FISKNEWDEALER, Document::UDocumentSegment_CH1_FISKNEWDEALER_Completed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_FiskCompleted);
                DC(int64(0x400307bf1391769f), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_REPORT.SucceedQuest();
                DC(int64(0x400307bf1391769f), EConversationDebugInfo::Done);
                DC(int64(0x40c65dd13595f931), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Sharky))) { Sharky.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Sharky_843_NewDealer); }
                DC(int64(0x40c65dd13595f931), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt311FiskMordragko : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x2bb5a8236fd8426c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::LetOtherWalk;
            
            default Rules.HideIfKnows(UChoiceStt311FiskMordragko);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2bb5a8236fd8426d), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasSucceeded());
                    DB(int64(0x2bb5a8236fd8426e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2bb5a8236fd8426f), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && !Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasBeenStarted());
                    DB(int64(0x2bb5a8236fd8426d), G1R.MordragKO_Exiled != 0);
                    DB(int64(0x2bb5a8236fd8426e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2bb5a8236fd8426f), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && !Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasBeenStarted());
                    DB(int64(0x2bb5a8236fd8426d), G1R.MordragKO_StayAtNC != 0);
                    DB(int64(0x2bb5a8236fd8426e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2bb5a8236fd8426f), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && !Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasBeenStarted());
                }
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasSucceeded() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None) && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && !Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasBeenStarted())
                    return true;
                
                if (G1R.MordragKO_Exiled != 0 && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None) && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && !Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasBeenStarted())
                    return true;
                
                if (G1R.MordragKO_StayAtNC != 0 && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None) && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && !Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasBeenStarted())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84270), EConversationDebugInfo::Executing);
                // Hey you!
                Fisk.AI.Say(LocText("STT_311_FISK_MORDRAGKO_12_00"));
                DC(int64(0x2bb5a8236fd84270), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84271), EConversationDebugInfo::Executing);
                // You're the idiot who forced out Mordrag, aren't you? He ...
                Fisk.AI.Say(LocText("STT_311_FISK_MORDRAGKO_12_01"));
                DC(int64(0x2bb5a8236fd84271), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84272), EConversationDebugInfo::Executing);
                // I hope you're not planning to join our camp, because ...
                Fisk.AI.Say(LocText("STT_311_FISK_MORDRAGKO_12_02"));
                DC(int64(0x2bb5a8236fd84272), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_FISK, Document::UDocumentSegment_Glossary_OC_STT_FISK_FiskNewDealer);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_FiskStart);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FISKNEWDEALER, Document::UDocumentSegment_CH1_FISKNEWDEALER_Start);
                Subdialog(
                    UChoiceStt311FiskMordragkoPetze,
                    UChoiceStt311FiskMordragkoRelax,
                    UChoiceStt311FiskMordragkoFuckoff
                );
            }
        }
        
        
        class UChoiceStt311FiskMordragkoPetze : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0xe8603e87342be1f3);
            default Caption = LocText("STT_311_FISK_MORDRAGKO_PETZE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceStt311FiskMordragkoPetze);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84275), EConversationDebugInfo::Executing);
                // Thorus said Mordrag steals from the ore barons. I wonder ...
                Hero.AI.Say(LocText("STT_311_FISK_MORDRAGKO_PETZE_15_00"));
                DC(int64(0x2bb5a8236fd84275), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84276), EConversationDebugInfo::Executing);
                
                // You're threatening me? Bad idea, freshie. Bad idea. 
                Fisk.AI.Say(LocText("STT_311_FISK_MORDRAGKO_PETZE_12_01"));
                DC(int64(0x2bb5a8236fd84276), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84277), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2bb5a8236fd84277), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt311FiskMordragkoRelax : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0xe8603e87342be1f8);
            default Caption = LocText("STT_311_FISK_MORDRAGKO_RELAX_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceStt311FiskMordragkoRelax);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84279), EConversationDebugInfo::Executing);
                // Relax. I'm sure we can fix this.
                Hero.AI.Say(LocText("STT_311_FISK_MORDRAGKO_RELAX_15_00"));
                DC(int64(0x2bb5a8236fd84279), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd8427a), EConversationDebugInfo::Executing);
                
                // Wouldn't know how. Unless you can find me another fence ...
                Fisk.AI.Say(LocText("STT_311_FISK_MORDRAGKO_RELAX_12_01"));
                DC(int64(0x2bb5a8236fd8427a), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd8427b), EConversationDebugInfo::Executing);
                
                // Where can I find one?
                Hero.AI.Say(LocText("STT_311_FISK_MORDRAGKO_RELAX_15_02"));
                DC(int64(0x2bb5a8236fd8427b), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd8427c), EConversationDebugInfo::Executing);
                
                // Tsk, If I knew, I'd find him myself. I told you, if you ...
                Fisk.AI.Say(LocText("STT_311_FISK_MORDRAGKO_RELAX_12_03"));
                DC(int64(0x2bb5a8236fd8427c), EConversationDebugInfo::Done);
                DC(int64(0x400307bf139176b1), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.StartQuest();
                DC(int64(0x400307bf139176b1), EConversationDebugInfo::Done);
                DC(int64(0x29188e21dc4d9692), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x29188e21dc4d9692), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt311FiskMordragkoFuckoff : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0xe8603e87342be200);
            default Caption = LocText("STT_311_FISK_MORDRAGKO_FUCKOFF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceStt311FiskMordragkoFuckoff);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84280), EConversationDebugInfo::Executing);
                // I don't give a shit. 
                Hero.AI.Say(LocText("STT_311_FISK_MORDRAGKO_FUCKOFF_15_00"));
                DC(int64(0x2bb5a8236fd84280), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84281), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2bb5a8236fd84281), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt311FiskTrade : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x2bb5a8236fd84249);
            default Caption = LocText("STT_311_FISK_TRADE_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd8424a), EConversationDebugInfo::Executing);
                // Show me your goods.
                Hero.AI.Say(LocText("STT_311_FISK_TRADE_15_00"));
                DC(int64(0x2bb5a8236fd8424a), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168b1e), Fisk != nullptr && Fisk.IsAngryTowards(Hero));
                
                if (Fisk != nullptr && Fisk.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168b1f), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Fisk.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_111910"));
                    DC(int64(0x7ec56dc721168b1f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_311_fisk_trade_exit_1");
                    DC(int64(0x7ec56dc721168b21), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168b21), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x400307bf139176c1), EConversationDebugInfo::Executing);
                    Fisk.AI.StartTradingWith(Hero);
                    DC(int64(0x400307bf139176c1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_311_fisk_trade_exit_2");
                }
            }
        }
        
        
        class UChoiceStt311FiskWhistlerssword : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0x2bb5a8236fd8424c);
            default Caption = LocText("STT_311_FISK_WHISTLERSSWORD_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2bb5a8236fd8424d), G1R.Fisk_ForgetSword == 0);
                    DB(int64(0x2bb5a8236fd8424e), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                    DB(int64(0x2bb5a8236fd8424f), G1R.Fisk_SwordSold == 0);
                }
                
                if (G1R.Fisk_ForgetSword != 0)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && !Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning())
                    return false;
                
                if (G1R.Fisk_SwordSold != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84250), EConversationDebugInfo::Executing);
                // I'm looking for a sword. Not just a regular one - ...
                Hero.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_15_00"));
                DC(int64(0x2bb5a8236fd84250), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84251), EConversationDebugInfo::Executing);
                
                // Huh, well, then you're one lucky bastard, because I have ...
                Fisk.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_12_01"));
                DC(int64(0x2bb5a8236fd84251), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84252), EConversationDebugInfo::Executing);
                // Just a hundred and ten nuggets and it's yours. What do ...
                Fisk.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_12_02"));
                DC(int64(0x2bb5a8236fd84252), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_WHISTLER_BUYMYSWORD, Document::UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_ExtraNuggets);
                DC(int64(0x400307bf139176e5), EConversationDebugInfo::Executing);
                G1R.Fisk_SellSword110 = 1;
                DC(int64(0x400307bf139176e5), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceStt311FiskWhistlersswordBack,
                    UChoiceStt311FiskWhistlersswordFault,
                    UChoiceStt311FiskWhistlersswordTakeit
                );
            }
        }
        
        
        class UChoiceStt311FiskWhistlersswordBack : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0xe8603e87342be1d0);
            default Caption = LocText("ORG_826_MORDRAG_WHISTLERSSWORD_BACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84256), EConversationDebugInfo::Executing);
                // Maybe later.
                Hero.AI.Say(LocText("ORG_826_MORDRAG_WHISTLERSSWORD_BACK_15_00"));
                DC(int64(0x2bb5a8236fd84256), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt311FiskWhistlersswordFault : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0xe8603e87342be1d3);
            default Caption = LocText("STT_311_FISK_WHISTLERSSWORD_FAULT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd84258), EConversationDebugInfo::Executing);
                // Weren't you going to sell it for a hundred? 
                Hero.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_FAULT_15_00"));
                DC(int64(0x2bb5a8236fd84258), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd84259), EConversationDebugInfo::Executing);
                
                // Ah, wait ... right, it wasn't a hundred and ten, it was ...
                Fisk.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_FAULT_12_01"));
                DC(int64(0x2bb5a8236fd84259), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd8425a), EConversationDebugInfo::Executing);
                
                // Five hundred? 
                Hero.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_FAULT_15_02"));
                DC(int64(0x2bb5a8236fd8425a), EConversationDebugInfo::Done);
                DC(int64(0x2bb5a8236fd8425b), EConversationDebugInfo::Executing);
                
                // Not enough? How about a thousand, then? Works for me. ...
                Fisk.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_FAULT_12_03"));
                DC(int64(0x2bb5a8236fd8425b), EConversationDebugInfo::Done);
                DC(int64(0x400307bf139176cb), EConversationDebugInfo::Executing);
                G1R.Fisk_ForgetSword = 1;
                DC(int64(0x400307bf139176cb), EConversationDebugInfo::Done);
                DC(int64(0x2102b91e10df6a7d), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY.FailQuest();
                DC(int64(0x2102b91e10df6a7d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt311FiskWhistlersswordTakeit : UTopic_Hero__OC_STT_FISK_311
        {
            default DebugId = int64(0xe8603e87342be1da);
            default Caption = LocText("STT_311_FISK_WHISTLERSSWORD_TAKEIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2bb5a8236fd8425e), EConversationDebugInfo::Executing);
                // All right, I'll take it.
                Hero.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_TAKEIT_15_00"));
                DC(int64(0x2bb5a8236fd8425e), EConversationDebugInfo::Done);
                DB(int64(0x2bb5a8236fd84260), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 110, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 110, 0))
                {
                    DC(int64(0x2bb5a8236fd84261), EConversationDebugInfo::Executing);
                    // Made a good bargain there.
                    Fisk.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_TAKEIT_12_01"));
                    DC(int64(0x2bb5a8236fd84261), EConversationDebugInfo::Done);
                    DC(int64(0x400307bf139176d6), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Fisk, UItMi_Orenugget, 110);
                    DC(int64(0x400307bf139176d6), EConversationDebugInfo::Done);
                    DC(int64(0x400307bf139176da), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMw_1H_Sword_Whistler, 1);
                    DC(int64(0x400307bf139176da), EConversationDebugInfo::Done);
                    DC(int64(0x400307bf139176dc), EConversationDebugInfo::Executing);
                    G1R.Fisk_SwordSold = 1;
                    DC(int64(0x400307bf139176dc), EConversationDebugInfo::Done);
                    DC(int64(0x2102b91e10df6a75), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY.SucceedQuest();
                    DC(int64(0x2102b91e10df6a75), EConversationDebugInfo::Done);
                    DC(int64(0x7917decfead25137), EConversationDebugInfo::Executing);
                    Fisk.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Fisk_311_CountOre);
                    DC(int64(0x7917decfead25137), EConversationDebugInfo::Done);
                    DC(int64(0x3d5b0ef090212a22), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3d5b0ef090212a22), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x2bb5a8236fd84266), EConversationDebugInfo::Executing);
                    // How about you get the nuggs first? I'll reserve the ...
                    Fisk.AI.Say(LocText("STT_311_FISK_WHISTLERSSWORD_TAKEIT_12_02"));
                    DC(int64(0x2bb5a8236fd84266), EConversationDebugInfo::Done);
                    DC(int64(0x3d5b0ef090212a23), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x3d5b0ef090212a23), EConversationDebugInfo::Done);
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */