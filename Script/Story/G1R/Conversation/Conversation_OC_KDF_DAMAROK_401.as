#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_KDF_DAMAROK_401 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_KDF_DAMAROK_401";
        }
        
        
        class UTopic_Hero__OC_KDF_DAMAROK_401 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_DAMAROK_401";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDamarok() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetDrago() const property
            {
                return GetCharacter(n"OC_KDF_DRAGO_403");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
        }
        
        
        class UChoiceDamarok114795 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x14197298145f71f5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDamarok114795);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f71f8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x14197298145f71fc), Hero != nullptr && Hero.IsCloseToCharacter(Damarok, 500.0f));
                    DB(int64(0xce11cc9452ea4c2d), Damarok != nullptr && !Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Damarok, 500.0f))
                    return false;
                
                if (Damarok != nullptr && Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f71f1), EConversationDebugInfo::Executing);
                // I see you made it. Well done - brother.
                Damarok.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_104324_41"));
                DC(int64(0x14197298145f71f1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDamarok115841 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0xa7deef969d1cb487);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_121503_3207");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Alchemy);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf11f5810a95022b3), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb485), EConversationDebugInfo::Executing);
                
                // I want to become a better alchemist. 
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140547"));
                DC(int64(0xa7deef969d1cb485), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb48b), EConversationDebugInfo::Executing);
                
                // Ahh, alchemy. The most beautiful of the arcane arts. ...
                Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140613"));
                DC(int64(0xa7deef969d1cb48b), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb48c), EConversationDebugInfo::Executing);
                // For a small donation ... 
                Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140631"));
                DC(int64(0xa7deef969d1cb48c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_DAMAROK, Document::UDocumentSegment_Glossary_OC_KDF_DAMAROK_Teacher);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_DAMAROK, Document::UDocumentSegment_Glossary_OC_KDF_DAMAROK_Introduction);
                DB(int64(0xa7deef969d1cb48a), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Alchemy));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Alchemy))
                {
                    DB(int64(0xf11f5810a950220d), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Alchemy));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Alchemy))
                    {
                        DC(int64(0xa7deef969d1cb496), EConversationDebugInfo::Executing);
                        // Very well. Listen close. 
                        Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140842_292"));
                        DC(int64(0xa7deef969d1cb496), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb49a), EConversationDebugInfo::Executing);
                        // The power of a potion lies in its herbs - everyone knows ...
                        Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140917"));
                        DC(int64(0xa7deef969d1cb49a), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb49b), EConversationDebugInfo::Executing);
                        // What many do not know is the importance of dosage. Too ...
                        Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140934"));
                        DC(int64(0xa7deef969d1cb49b), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb49c), EConversationDebugInfo::Executing);
                        // Too much, and the cure becomes the poison. 
                        Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140958"));
                        DC(int64(0xa7deef969d1cb49c), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb49d), EConversationDebugInfo::Executing);
                        // What I'm telling you is, ALWAYS respect the recipe, and ...
                        Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_141007"));
                        DC(int64(0xa7deef969d1cb49d), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb49e), EConversationDebugInfo::Executing);
                        // With enough patience and experience, every plant has the ...
                        Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_141031"));
                        DC(int64(0xa7deef969d1cb49e), EConversationDebugInfo::Done);
                        DC(int64(0xf11f5810a950221f), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Alchemy);
                        DC(int64(0xf11f5810a950221f), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584105), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReFo_Potion_Health_01);
                        DC(int64(0x9733703e83584105), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584107), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReFo_Potion_Mana_01);
                        DC(int64(0x9733703e83584107), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_damarok_115841_exit_1");
                        DC(int64(0xf11f5810a9502223), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf11f5810a9502223), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1cb491), EConversationDebugInfo::Executing);
                        // Forgive me, but I cannot teach you for free. A small ...
                        Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140731_153"));
                        DC(int64(0xa7deef969d1cb491), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_damarok_115841_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb48f), EConversationDebugInfo::Executing);
                    // I'm afraid you'd have difficulties understanding these ...
                    Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140722_3902"));
                    DC(int64(0xa7deef969d1cb48f), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb494), EConversationDebugInfo::Executing);
                    // At least for now, I suppose.
                    Damarok.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140815"));
                    DC(int64(0xa7deef969d1cb494), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_damarok_115841_exit_3");
                }
            }
        }
        
        
        class UChoiceDamarok138034 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0xb34d531f120bd0ce);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_143249");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDamarok138034);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x278b5506532ac4ae), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34d531f120bd0c9), EConversationDebugInfo::Executing);
                // I found something in the old mine that might interest ...
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_143249"));
                DC(int64(0xb34d531f120bd0c9), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bd1), EConversationDebugInfo::Executing);
                
                // Let me see. 
                Damarok.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151730"));
                DC(int64(0x4aade750f7257bd1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_DAMAROK, Document::UDocumentSegment_Glossary_OC_KDF_DAMAROK_Introduction);
                DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Damarok, UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Done);
                DC(int64(0xb34d531f120bd106), EConversationDebugInfo::Executing);
                // ... Interesting. This is a minecrawler pheromone gland, ...
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_143955"));
                DC(int64(0xb34d531f120bd106), EConversationDebugInfo::Done);
                DC(int64(0xb34d531f120bd113), EConversationDebugInfo::Executing);
                // You were right to bring this here. This could be of ...
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144026"));
                DC(int64(0xb34d531f120bd113), EConversationDebugInfo::Done);
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Executing);
                G1R.Damarok_GlandNegotiation = 1;
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDamarok138068 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x64406eb9075a2baa);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDamarok138034);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb34d531f120bd0a1), G1R.Damarok_GlandNegotiation != 0);
                    DB(int64(0xb34d531f120bd0a7), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                    DB(int64(0xce11cc9452ea4c2c), Damarok != nullptr && !Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard));
                }
                
                if (G1R.Damarok_GlandNegotiation == 0)
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && !Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning())
                    return false;
                
                if (Damarok != nullptr && Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64406eb9075a2ba5), EConversationDebugInfo::Executing);
                // How much would you pay for this gland?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144332"));
                DC(int64(0x64406eb9075a2ba5), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2ba6), EConversationDebugInfo::Executing);
                
                // Hmm ... how about three hundred nuggets? 
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144332_41"));
                DC(int64(0x64406eb9075a2ba6), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2bb4), EConversationDebugInfo::Executing);
                // Though I could also offer you something more valuable. ...
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144437"));
                DC(int64(0x64406eb9075a2bb4), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2bb5), EConversationDebugInfo::Executing);
                // It improves your innate mana, permanently. 
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144505"));
                DC(int64(0x64406eb9075a2bb5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Damarok_138407,
                    UTopic_Damarok_138427,
                    UTopic_Damarok_138499
                );
            }
        }
        
        
        class UTopic_Damarok_138407 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x64406eb9075a2bb7);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_144630_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Damarok_138407);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64406eb9075a2bb8), EConversationDebugInfo::Executing);
                // The ore is fine. 
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144630_2238"));
                DC(int64(0x64406eb9075a2bb8), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c2f), EConversationDebugInfo::Executing);
                
                // I see. Here you go. Pleasure doing business with you. 
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_145133"));
                DC(int64(0x64406eb9075a2c2f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_SoldToDamarok);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Damarok.AddItemToInventory(UItMi_Orenugget, 300);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c54), EConversationDebugInfo::Executing);
                Damarok.AI.GiveItemTo(Hero, UItMi_Orenugget, 300);
                DC(int64(0x64406eb9075a2c54), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c56), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.SucceedQuest();
                DC(int64(0x64406eb9075a2c56), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c58), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.SucceedQuest();
                DC(int64(0x64406eb9075a2c58), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Damarok_138427 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x64406eb9075a2bbb);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_144630_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Damarok_138427);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64406eb9075a2bbc), EConversationDebugInfo::Executing);
                // The elixir sounds useful.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144630_2785"));
                DC(int64(0x64406eb9075a2bbc), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c30), EConversationDebugInfo::Executing);
                
                // It is indeed. Well chosen, my friend. 
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_145141"));
                DC(int64(0x64406eb9075a2c30), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bd2), EConversationDebugInfo::Executing);
                // Here you have it. 
                Damarok.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152046"));
                DC(int64(0x4aade750f7257bd2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_SoldToDamarok);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Damarok.AddItemToInventory(UItFo_Potion_Mana_Perma_01, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c62), EConversationDebugInfo::Executing);
                Damarok.AI.GiveItemTo(Hero, UItFo_Potion_Mana_Perma_01, 1);
                DC(int64(0x64406eb9075a2c62), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c64), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.SucceedQuest();
                DC(int64(0x64406eb9075a2c64), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c66), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.SucceedQuest();
                DC(int64(0x64406eb9075a2c66), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Damarok_138499 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x64406eb9075a2bdd);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_144746_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Damarok_138499);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64406eb9075a2bde), EConversationDebugInfo::Executing);
                // Let me think about it.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144746_3436"));
                DC(int64(0x64406eb9075a2bde), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2c31), EConversationDebugInfo::Executing);
                
                // Alright then. Just don't take too long - the gland might ...
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_145148"));
                DC(int64(0x64406eb9075a2c31), EConversationDebugInfo::Done);
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Executing);
                G1R.Damarok_GlandNegotiation = 0;
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Done);
                DB(int64(0x64406eb9075a2ca0), Damarok != nullptr && Damarok.HasItem(UItAt_Minecrawlerqueen_01, 1, 0));
                
                if (Damarok != nullptr && Damarok.HasItem(UItAt_Minecrawlerqueen_01, 1, 0))
                {
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                    Damarok.AddItemToInventory(UItAt_Minecrawlerqueen_01, 1);
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Executing);
                    Damarok.AI.GiveItemTo(Hero, UItAt_Minecrawlerqueen_01, 1);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Done);
                    DC(int64(0x64406eb9075a2cdb), EConversationDebugInfo::Executing);
                    // And please, preserve it properly.
                    Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_150055_686"));
                    DC(int64(0x64406eb9075a2cdb), EConversationDebugInfo::Done);
                }
                DC(int64(0x64406eb9075a2cd6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x64406eb9075a2cd6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDamarok138284 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x38b6cb107d0bcd05);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_152222");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Damarok_138499);
            default Rules.HideIfKnows(UChoiceDamarok138284);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x38b6cb107d0bcd10), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x38b6cb107d0bcd00), EConversationDebugInfo::Executing);
                // About that minecrawler gland ... 
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_152222"));
                DC(int64(0x38b6cb107d0bcd00), EConversationDebugInfo::Done);
                DC(int64(0x38b6cb107d0bcd01), EConversationDebugInfo::Executing);
                
                // Do you still have it? 
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_152222_41"));
                DC(int64(0x38b6cb107d0bcd01), EConversationDebugInfo::Done);
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Executing);
                G1R.Damarok_GlandNegotiation = 1;
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDamarok139211 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x64406eb9075a2d60);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Damarok_138407);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Damarok_138427);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x64406eb9075a2d71), Hero != nullptr && Hero.HasItem(UItAt_Minecrawlerqueen_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Minecrawlerqueen_01, 1, 0))
                {
                    DC(int64(0x64406eb9075a2d7d), EConversationDebugInfo::Executing);
                    // Here's the gland. 
                    Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_151903"));
                    DC(int64(0x64406eb9075a2d7d), EConversationDebugInfo::Done);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Damarok, UItAt_Minecrawlerqueen_01, 1);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Done);
                }
                DC(int64(0x64406eb9075a2d93), EConversationDebugInfo::Executing);
                // Thank you. Oh, this will be interesting ... 
                Damarok.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_151942_3984"));
                DC(int64(0x64406eb9075a2d93), EConversationDebugInfo::Done);
                DC(int64(0x64406eb9075a2dac), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x64406eb9075a2dac), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDamarok78286 : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0x3bdcc9b1d0fe9c21);
            default Caption = LocText("KDF_401_DAMAROK_WELCOME_INFO_14_01");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdf401DamarokWelcome);
            default Rules.HideIfKnows(UChoiceDamarok78286);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe90556ee0ea791ca), EConversationDebugInfo::Executing);
                // May Innos's fire protect you!
                Damarok.AI.Say(LocText("KDF_401_DAMAROK_WELCOME_INFO_14_01"));
                DC(int64(0xe90556ee0ea791ca), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150aafa), EConversationDebugInfo::Executing);
                G1R.Corristo_FireMagesTest = 6;
                DC(int64(0xa6700c26f150aafa), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150aae6), EConversationDebugInfo::Executing);
                Damarok.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Damarok_401_Start);
                DC(int64(0xa6700c26f150aae6), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150aae8), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_Start); }
                DC(int64(0xa6700c26f150aae8), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150aaee), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Drago))) { Drago.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Drago_403_Start); }
                DC(int64(0xa6700c26f150aaee), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150aaf2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Start); }
                DC(int64(0xa6700c26f150aaf2), EConversationDebugInfo::Done);
                DC(int64(0xe90556ee0ea791e5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe90556ee0ea791e5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdf401DamarokExit : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0xe90556ee0ea791e6);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe90556ee0ea791e7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe90556ee0ea791e7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdf401DamarokHeal : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0xe90556ee0ea791e8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceKdf401DamarokHeal);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe90556ee0ea791e9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xa6700c26f150daed), Damarok != nullptr && Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_Start));
                    DB(int64(0xb7d0dc2c6e09623d), Damarok != nullptr && Damarok.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0xce11cc9452ea4c2e), Damarok != nullptr && !Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Damarok != nullptr && !Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_Start))
                    return false;
                
                if (Damarok != nullptr && !Damarok.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Damarok != nullptr && Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe90556ee0ea791eb), EConversationDebugInfo::Executing);
                // Welcome to our ranks, brother - should you ever find ...
                Damarok.AI.Say(LocText("KDF_401_DAMAROK_HEAL_INFO_14_01"));
                DC(int64(0xe90556ee0ea791eb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_DAMAROK, Document::UDocumentSegment_Glossary_OC_KDF_DAMAROK_Healing);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_DAMAROK, Document::UDocumentSegment_Glossary_OC_KDF_DAMAROK_Introduction);
                DC(int64(0xe90556ee0ea791ec), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe90556ee0ea791ec), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdf401DamarokHealinfo : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0xe90556ee0ea791ed);
            default Caption = LocText("KDF_401_DAMAROK_HEALINFO_INFO_15_01");
            default PriorityRank = 5;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe90556ee0ea791ee), Hero != nullptr && Hero.IsInjured(99));
                    DB(int64(0xe90556ee0ea791ef), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                }
                
                if (Hero != nullptr && !Hero.IsInjured(99))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe90556ee0ea791f0), EConversationDebugInfo::Executing);
                // I'm wounded. Can you heal me?
                Hero.AI.Say(LocText("KDF_401_DAMAROK_HEALINFO_INFO_15_01"));
                DC(int64(0xe90556ee0ea791f0), EConversationDebugInfo::Done);
                DC(int64(0xe90556ee0ea791f1), EConversationDebugInfo::Executing);
                
                // The body mends, the mind becomes clear.
                Damarok.AI.Say(LocText("KDF_401_DAMAROK_HEALINFO_INFO_14_02"));
                DC(int64(0xe90556ee0ea791f1), EConversationDebugInfo::Done);
                Print("Skipped sound.PlaySound()");
                DC(int64(0xa6700c26f150aac1), EConversationDebugInfo::Executing);
                Hero.Character.Heal();
                DC(int64(0xa6700c26f150aac1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf401DamarokWelcome : UTopic_Hero__OC_KDF_DAMAROK_401
        {
            default DebugId = int64(0xe90556ee0ea791c7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceKdf401DamarokWelcome);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("KDF_403_DRAGO_RUNE_INFO_13_01"), int64(0xe90556ee0ea791c7));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("KDF_405_TORREZ_BOOK_INFO_04_01"), int64(0xe90556ee0ea791c7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe90556ee0ea791c8), Hero != nullptr && Hero.IsCloseToCharacter(Damarok, 200.0f));
                    DB(int64(0x910f181a68326c73), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xce11cc9452ea4c2b), Damarok != nullptr && !Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Damarok, 200.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Damarok != nullptr && Damarok.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Damarok_401_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_DAMAROK, Document::UDocumentSegment_Glossary_OC_KDF_DAMAROK_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */