#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_TORLOF_737 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_TORLOF_737";
        }
        
        
        class UTopic_Hero__NC_SLD_TORLOF_737 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_TORLOF_737";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTorlof() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY03_705() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY03_705");
            }
        }
        
        
        class UTopic_NC_SLD_MERCENARY03_705__NC_SLD_TORLOF_737 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_TORLOF_737";
            default WithCharacter = n"NC_SLD_MERCENARY03_705";
            
            AGothicCharacterState GetTorlof() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY03_705() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY03_705");
            }
        }
        
        
        class UChoiceTorlof115175 : UTopic_Hero__NC_SLD_TORLOF_737
        {
            default DebugId = int64(0xc99858765b70a909);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceTorlof115175);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa912e6e2c2607df2), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning());
                    DB(int64(0xa912e6e2c2607e10), G1R.Lee_SldPossible == 0);
                    DB(int64(0xf5c217f1eb96414c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0xa912e6e2c2607dad), Hero.GetLevelAttribute() > 10);
                    DB(int64(0xa912e6e2c2607dc8), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0xa912e6e2c2607de3), G1R.Lee_SldPossible == 0);
                }
                
                if (Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning() && G1R.Lee_SldPossible == 0)
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Hero.GetLevelAttribute() > 10 && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded() && G1R.Lee_SldPossible == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc99858765b70a908), EConversationDebugInfo::Executing);
                // Hey, you. Lee wants to see you.
                Torlof.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_173707_1769"));
                DC(int64(0xc99858765b70a908), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a90b), EConversationDebugInfo::Executing);
                
                // Me? Why?
                Hero.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_173759"));
                DC(int64(0xc99858765b70a90b), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a90c), EConversationDebugInfo::Executing);
                
                // Do I have a crystal ball sticking out of my ass? I don't ...
                Torlof.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_173806"));
                DC(int64(0xc99858765b70a90c), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a90e), EConversationDebugInfo::Executing);
                Torlof.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Torlof_737_Start);
                DC(int64(0xc99858765b70a90e), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a90f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc99858765b70a90f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTorlof133834 : UTopic_Hero__NC_SLD_TORLOF_737
        {
            default DebugId = int64(0xdfbbfadf2ce93915);
            default Caption = LocText("TEXT_WIP_OTVMVIB_20241218_161636");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorlof134473);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb9a65ed3c93b3a67), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                    DB(int64(0xb9a65ed3c93b3a68), Hero != nullptr && Hero.Inventory.HasEquippedItem(USld_Armor));
                    DB(int64(0xb9a65ed3c93b3a67), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0xb9a65ed3c93b3a68), Hero != nullptr && Hero.Inventory.HasEquippedItem(USld_Armor));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Hero != nullptr && Hero.Inventory.HasEquippedItem(USld_Armor))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Hero != nullptr && Hero.Inventory.HasEquippedItem(USld_Armor))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdfbbfadf2ce93913), EConversationDebugInfo::Executing);
                // Could you improve my armor?
                Hero.AI.Say(LocText("TEXT_WIP_OTVMVIB_20241218_161636"));
                DC(int64(0xdfbbfadf2ce93913), EConversationDebugInfo::Done);
                DB(int64(0x3e9d2f5631dc45e7), Torlof != nullptr && Torlof.IsAngryTowards(Hero));
                
                if (Torlof != nullptr && Torlof.IsAngryTowards(Hero))
                {
                    DC(int64(0x3e9d2f5631dc45eb), EConversationDebugInfo::Executing);
                    // I can't help you if you don't follow the rules. Get ...
                    Torlof.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_123025_3286"));
                    DC(int64(0x3e9d2f5631dc45eb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_torlof_133834_exit_1");
                    DC(int64(0x3e9d2f5631dc45ef), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3e9d2f5631dc45ef), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DB(int64(0x3e9d2f5631dc45bf), Hero != nullptr && Hero.Inventory.HasEquippedItem(USld_Armor));
                    
                    if (Hero != nullptr && Hero.Inventory.HasEquippedItem(USld_Armor))
                    {
                        DC(int64(0xdfbbfadf2ce93914), EConversationDebugInfo::Executing);
                        // Sure!
                        Torlof.AI.Say(LocText("TEXT_WIP_OTVMVIB_20241218_161636_41"));
                        DC(int64(0xdfbbfadf2ce93914), EConversationDebugInfo::Done);
                        DC(int64(0xdfbbfadf2ce93918), EConversationDebugInfo::Executing);
                        Torlof.AI.StartCustomizingArmorWith(Hero);
                        DC(int64(0xdfbbfadf2ce93918), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_torlof_133834_exit_2");
                    }
                    else
                    {
                        DC(int64(0x3e9d2f5631dc45c1), EConversationDebugInfo::Executing);
                        // I don't touch that armor. Put on one of ours and then ...
                        Torlof.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_122449_3436"));
                        DC(int64(0x3e9d2f5631dc45c1), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_torlof_133834_exit_3");
                        DC(int64(0x3e9d2f5631dc45c4), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x3e9d2f5631dc45c4), EConversationDebugInfo::Done);
                        return;
                    }
                }
            }
        }
        
        
        class UChoiceTorlof134473 : UTopic_Hero__NC_SLD_TORLOF_737
        {
            default DebugId = int64(0x33df4d52be5cc76c);
            default Caption = LocText("TEXT_WIP_CRSIVBE_20250107_102710");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTorlof134473);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QUKFIKD_20241028_154848"), int64(0x33df4d52be5cc76c));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33df4d52be5cc76a), EConversationDebugInfo::Executing);
                // What is your job here?
                Hero.AI.Say(LocText("TEXT_WIP_CRSIVBE_20250107_102710"));
                DC(int64(0x33df4d52be5cc76a), EConversationDebugInfo::Done);
                DC(int64(0x33df4d52be5cc76b), EConversationDebugInfo::Executing);
                
                // Among other things, I manage the scarce material we ...
                Torlof.AI.Say(LocText("TEXT_WIP_CRSIVBE_20250107_102710_41"));
                DC(int64(0x33df4d52be5cc76b), EConversationDebugInfo::Done);
                DC(int64(0x33df4d52be5cc76e), EConversationDebugInfo::Executing);
                // If a mercenary needs it, I can upgrade his amor for a ...
                Torlof.AI.Say(LocText("TEXT_WIP_CRSIVBE_20250107_102928"));
                DC(int64(0x33df4d52be5cc76e), EConversationDebugInfo::Done);
                DC(int64(0x33df4d52be5cc76f), EConversationDebugInfo::Executing);
                
                // Good to know.
                Hero.AI.Say(LocText("TEXT_WIP_CRSIVBE_20250107_103312"));
                DC(int64(0x33df4d52be5cc76f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_TORLOF, Document::UDocumentSegment_Glossary_NC_SLD_TORLOF_Armor);
            }
        }
        
        
        class UChoiceTorlof144472_0 : UTopic_NC_SLD_MERCENARY03_705__NC_SLD_TORLOF_737
        {
            default DebugId = int64(0xcf6cde32246c7dd5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTorlof144472);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0xcf6cde32246c7dd5));
            default Rules.HideIfKnows(UChoiceTorlof144472_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), Torlof != nullptr && Torlof.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Torlof_737_FMReport));
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Torlof, 700.0f));
                }
                
                if (Torlof != nullptr && !Torlof.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Torlof_737_FMReport))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Torlof, 700.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7dd4), EConversationDebugInfo::Executing);
                // What's the situation? 
                Torlof.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_134230_1702"));
                DC(int64(0xcf6cde32246c7dd4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorlof144472_1 : UTopic_NC_SLD_MERCENARY03_705__NC_SLD_TORLOF_737
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorlof144472_0);
            default Rules.HideIfKnows(UChoiceTorlof144472_1);
            default DebugId = int64(0xcf6cde32246c7dd5);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4d34737b412a044), EConversationDebugInfo::Executing);
                
                // They took the whole place. Cord and Gorn retreated into ...
                NC_SLD_MERCENARY03_705.AI.Say(LocText("TEXT_WIP_GVXGRO_20250128_120431"));
                DC(int64(0xb4d34737b412a044), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorlof144472 : UTopic_NC_SLD_MERCENARY03_705__NC_SLD_TORLOF_737
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorlof144472_1);
            default Rules.HideIfKnows(UChoiceTorlof144472);
            default DebugId = int64(0xcf6cde32246c7dd5);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7dd8), EConversationDebugInfo::Executing);
                
                // Shit. Well. Lee is talking to the mages right now. We'll ...
                Torlof.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_134314"));
                DC(int64(0xcf6cde32246c7dd8), EConversationDebugInfo::Done);
                DC(int64(0xb4d34737b412a04f), EConversationDebugInfo::Executing);
                NC_SLD_MERCENARY03_705.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary03_705_Start);
                DC(int64(0xb4d34737b412a04f), EConversationDebugInfo::Done);
                DC(int64(0xb4d34737b412a066), EConversationDebugInfo::Executing);
                Torlof.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Torlof_737_Wait);
                DC(int64(0xb4d34737b412a066), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorlofExit : UTopic_Hero__NC_SLD_TORLOF_737
        {
            default DebugId = int64(0x3eb7c1d54fe60de0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3eb7c1d54fe60de1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3eb7c1d54fe60de1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTorlofHallo : UTopic_Hero__NC_SLD_TORLOF_737
        {
            default DebugId = int64(0x3eb7c1d54fe60de2);
            default Caption = LocText("DIA_TORLOF_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTorlofHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3eb7c1d54fe60de3), EConversationDebugInfo::Executing);
                // What's your story? 
                Hero.AI.Say(LocText("DIA_TORLOF_HALLO_15_00"));
                DC(int64(0x3eb7c1d54fe60de3), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee011d), EConversationDebugInfo::Executing);
                
                // My "story?" I look like some storyteller to you?
                Torlof.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_154801"));
                DC(int64(0x45f83621a0ee011d), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee011e), EConversationDebugInfo::Executing);
                
                // Just trying to get to know people around here.
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_154848"));
                DC(int64(0x45f83621a0ee011e), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60de4), EConversationDebugInfo::Executing);
                
                // Hmm. Makes sense, I guess. With all the bastards under ...
                Torlof.AI.Say(LocText("DIA_TORLOF_HALLO_04_01"));
                DC(int64(0x3eb7c1d54fe60de4), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60de5), EConversationDebugInfo::Executing);
                // My name's Torlof - used to be a First Mate in the Royal ...
                Torlof.AI.Say(LocText("DIA_TORLOF_HALLO_04_02"));
                DC(int64(0x3eb7c1d54fe60de5), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee011f), EConversationDebugInfo::Executing);
                
                // What happened? 
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_155015"));
                DC(int64(0x45f83621a0ee011f), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60de6), EConversationDebugInfo::Executing);
                
                // Let's just say, mutiny was involved, and it wasn't as ...
                Torlof.AI.Say(LocText("DIA_TORLOF_HALLO_04_03"));
                DC(int64(0x3eb7c1d54fe60de6), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60de7), EConversationDebugInfo::Executing);
                // Now I'm here. 
                Torlof.AI.Say(LocText("DIA_TORLOF_HALLO_04_04"));
                DC(int64(0x3eb7c1d54fe60de7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_TORLOF, Document::UDocumentSegment_Glossary_NC_SLD_TORLOF_Introduction);
            }
        }
        
        
        class UChoiceTorlofMitmachen : UTopic_Hero__NC_SLD_TORLOF_737
        {
            default DebugId = int64(0x3eb7c1d54fe60de8);
            default Caption = LocText("DIA_TORLOF_MITMACHEN_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3eb7c1d54fe60de9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x3eb7c1d54fe60dea), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3eb7c1d54fe60deb), EConversationDebugInfo::Executing);
                // I want to become a merc.
                Hero.AI.Say(LocText("DIA_TORLOF_MITMACHEN_15_00"));
                DC(int64(0x3eb7c1d54fe60deb), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60dec), EConversationDebugInfo::Executing);
                
                // Good for you. Lee only takes the best of the best, ...
                Torlof.AI.Say(LocText("DIA_TORLOF_MITMACHEN_04_01"));
                DC(int64(0x3eb7c1d54fe60dec), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60ded), EConversationDebugInfo::Executing);
                // 'Til that applies to you, you should go shake hands with ...
                Torlof.AI.Say(LocText("DIA_TORLOF_MITMACHEN_04_02"));
                DC(int64(0x3eb7c1d54fe60ded), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60dee), EConversationDebugInfo::Executing);
                // If you want some advice: try and steal something ...
                Torlof.AI.Say(LocText("DIA_TORLOF_MITMACHEN_04_03"));
                DC(int64(0x3eb7c1d54fe60dee), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60def), EConversationDebugInfo::Executing);
                // That proves you're against Gomez, and that's half the ...
                Torlof.AI.Say(LocText("DIA_TORLOF_MITMACHEN_04_04"));
                DC(int64(0x3eb7c1d54fe60def), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60df0), EConversationDebugInfo::Executing);
                
                // And how should I get my hands on something so important?
                Hero.AI.Say(LocText("DIA_TORLOF_MITMACHEN_15_05"));
                DC(int64(0x3eb7c1d54fe60df0), EConversationDebugInfo::Done);
                DC(int64(0x3eb7c1d54fe60df1), EConversationDebugInfo::Executing);
                
                // That's your job to figure out. If I was you, I'd try to ...
                Torlof.AI.Say(LocText("DIA_TORLOF_MITMACHEN_04_06"));
                DC(int64(0x3eb7c1d54fe60df1), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */