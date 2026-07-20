#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_HOMER_935 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_HOMER_935";
        }
        
        
        class UTopic_Hero__NC_BAU_HOMER_935 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_HOMER_935";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetHomer() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetLURKER_HOMER() const property
            {
                return GetCharacter(n"LURKER_HOMER");
            }
        }
        
        
        class UChoiceHomer112734 : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0xa7deef969d1cb3f9);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134359_1401");
            default PriorityRank = 4;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Diving_Trained);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHomerHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x133e7e0e87165d72), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Diving));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Diving);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb3f7), EConversationDebugInfo::Executing);
                // You seem to know a lot about dams. Can you teach me how ...
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_134606"));
                DC(int64(0xa7deef969d1cb3f7), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb403), EConversationDebugInfo::Executing);
                
                // Ha! You're the first to ever ask me that. Sure, I can do ...
                Homer.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_134738"));
                DC(int64(0xa7deef969d1cb403), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HOMER, Document::UDocumentSegment_Glossary_NC_BAU_HOMER_Teacher);
                DB(int64(0xa7deef969d1cb3fc), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Diving));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Diving))
                {
                    DB(int64(0xcb6efa8d26493e9), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Diving));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Diving))
                    {
                        DC(int64(0xa7deef969d1cb406), EConversationDebugInfo::Executing);
                        // All right. Well, here's the most important thing: relax. ...
                        Homer.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_134949_2386"));
                        DC(int64(0xa7deef969d1cb406), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb40a), EConversationDebugInfo::Executing);
                        // Once you've done that, you'll also be way more aware of ...
                        Homer.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135029"));
                        DC(int64(0xa7deef969d1cb40a), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb40b), EConversationDebugInfo::Executing);
                        // And, huh, it can be beautiful down there ...
                        Homer.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135047"));
                        DC(int64(0xa7deef969d1cb40b), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d26493f0), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Diving);
                        DC(int64(0xcb6efa8d26493f0), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_homer_112734_exit_1");
                        DC(int64(0xcb6efa8d26493fc), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xcb6efa8d26493fc), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1cb3fd), EConversationDebugInfo::Executing);
                        // Bring me the nuggets, then we'll talk.
                        Homer.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_134659"));
                        DC(int64(0xa7deef969d1cb3fd), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_homer_112734_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb3ff), EConversationDebugInfo::Executing);
                    // But not yet, I'm afraid. Go out there and lose some of ...
                    Homer.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_134702"));
                    DC(int64(0xa7deef969d1cb3ff), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_homer_112734_exit_3");
                }
            }
        }
        
        
        class UChoiceHomer82123 : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x392fc612211285e0);
            default Caption = LocText("TEXT_WIP_ZGVSCUJ_20240228_151257");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHomerHello);
            default Rules.HideIfKnows(UChoiceHomer82123);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x392fc612211285de), EConversationDebugInfo::Executing);
                // Why don't the mercenaries take care of it?
                Hero.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_151257"));
                DC(int64(0x392fc612211285de), EConversationDebugInfo::Done);
                DC(int64(0x392fc612211285df), EConversationDebugInfo::Executing);
                
                // I asked them the same thing. They told me it's not their ...
                Homer.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_151257_41"));
                DC(int64(0x392fc612211285df), EConversationDebugInfo::Done);
                DC(int64(0x392fc612211285e2), EConversationDebugInfo::Executing);
                // Guess what they said? 
                Homer.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_151351"));
                DC(int64(0x392fc612211285e2), EConversationDebugInfo::Done);
                DC(int64(0x392fc612211285e3), EConversationDebugInfo::Executing);
                
                // "Not our job?"
                Hero.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_151406"));
                DC(int64(0x392fc612211285e3), EConversationDebugInfo::Done);
                DC(int64(0x392fc612211285e4), EConversationDebugInfo::Executing);
                
                // Smart man. I'm telling you, no one in here ever gets off ...
                Homer.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_151413"));
                DC(int64(0x392fc612211285e4), EConversationDebugInfo::Done);
                DC(int64(0x392fc612211285e5), EConversationDebugInfo::Executing);
                
                // Why not just pay them?
                Hero.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_151809"));
                DC(int64(0x392fc612211285e5), EConversationDebugInfo::Done);
                DC(int64(0x392fc612211285e6), EConversationDebugInfo::Executing);
                
                // Cause I'm not King Rhobar and have no nuggets to spare. ...
                Homer.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_151831"));
                DC(int64(0x392fc612211285e6), EConversationDebugInfo::Done);
                DC(int64(0x1f5fd3f5fa7573aa), EConversationDebugInfo::Executing);
                // If the rice fields have to be flooded for these idiots ...
                Homer.AI.Say(LocText("TEXT_WIP_FSVMXID_20241010_145215"));
                DC(int64(0x1f5fd3f5fa7573aa), EConversationDebugInfo::Done);
                DC(int64(0x392fc612211285e7), EConversationDebugInfo::Executing);
                
                // I see. 
                Hero.AI.Say(LocText("TEXT_WIP_ZGVSCUJ_20240228_152018"));
                DC(int64(0x392fc612211285e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHomerBuiltdam : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x22b1a5cf6d1dd00a);
            default Caption = LocText("DIA_HOMER_BUILTDAM_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHomerHello);
            default Rules.HideIfKnows(UChoiceHomerBuiltdam);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x22b1a5cf6d1dd00b), EConversationDebugInfo::Executing);
                // Did YOU build that dam?
                Hero.AI.Say(LocText("DIA_HOMER_BUILTDAM_15_00"));
                DC(int64(0x22b1a5cf6d1dd00b), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd00c), EConversationDebugInfo::Executing);
                
                // Yes. Way back when we started this camp. Everyone ...
                Homer.AI.Say(LocText("DIA_HOMER_BUILTDAM_02_01"));
                DC(int64(0x22b1a5cf6d1dd00c), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd00d), EConversationDebugInfo::Executing);
                // Used to be an engineer back in Khorinis, before ... ah, ...
                Homer.AI.Say(LocText("DIA_HOMER_BUILTDAM_02_02"));
                DC(int64(0x22b1a5cf6d1dd00d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HOMER, Document::UDocumentSegment_Glossary_NC_BAU_HOMER_DAM);
            }
        }
        
        
        class UChoiceHomerExit : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x22b1a5cf6d1dd003);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x22b1a5cf6d1dd004), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x22b1a5cf6d1dd004), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHomerHello : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x22b1a5cf6d1dd005);
            default Caption = LocText("DIA_HOMER_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceHomerHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x22b1a5cf6d1dd006), EConversationDebugInfo::Executing);
                // You looking for something?
                Hero.AI.Say(LocText("DIA_HOMER_HELLO_15_00"));
                DC(int64(0x22b1a5cf6d1dd006), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd007), EConversationDebugInfo::Executing);
                
                // Yeah - leaks. I have a hunch that a lurker's been ...
                Homer.AI.Say(LocText("DIA_HOMER_HELLO_02_01"));
                DC(int64(0x22b1a5cf6d1dd007), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd008), EConversationDebugInfo::Executing);
                // Those beasts love to sharpen their teeth and claws on ...
                Homer.AI.Say(LocText("DIA_HOMER_HELLO_02_02"));
                DC(int64(0x22b1a5cf6d1dd008), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd009), EConversationDebugInfo::Executing);
                // I wouldn't be surprised if the dam caved in if it goes ...
                Homer.AI.Say(LocText("DIA_HOMER_HELLO_02_03"));
                DC(int64(0x22b1a5cf6d1dd009), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HOMER, Document::UDocumentSegment_Glossary_NC_BAU_HOMER_Introduction);
            }
        }
        
        
        class UChoiceHomerPerm : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x22b1a5cf6d1dd023);
            default Caption = LocText("DIA_HOMER_PERM_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x22b1a5cf6d1dd024), Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && Quest::NewCamp_NCCHAPTER1_DAMLURKER.HasSucceeded());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && Quest::NewCamp_NCCHAPTER1_DAMLURKER.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x22b1a5cf6d1dd025), EConversationDebugInfo::Executing);
                // How is the dam?
                Hero.AI.Say(LocText("DIA_HOMER_PERM_15_00"));
                DC(int64(0x22b1a5cf6d1dd025), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd026), EConversationDebugInfo::Executing);
                
                // Strong as a fortress. 
                Homer.AI.Say(LocText("DIA_HOMER_PERM_02_01"));
                DC(int64(0x22b1a5cf6d1dd026), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHomerRunning : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x22b1a5cf6d1dd014);
            default Caption = LocText("DIA_HOMER_RUNNING_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHomerWannahelp);
            default Rules.HideIfKnows(UChoiceHomerRunning);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x22b1a5cf6d1dd015), Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && Quest::NewCamp_NCCHAPTER1_DAMLURKER.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && Quest::NewCamp_NCCHAPTER1_DAMLURKER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x22b1a5cf6d1dd016), EConversationDebugInfo::Executing);
                
                // Where can I find that thing?
                Hero.AI.Say(LocText("DIA_HOMER_RUNNING_15_00"));
                DC(int64(0x22b1a5cf6d1dd016), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd017), EConversationDebugInfo::Executing);
                
                // Try the other side of the lake. People rarely go there, ...
                Homer.AI.Say(LocText("DIA_HOMER_RUNNING_02_01"));
                DC(int64(0x22b1a5cf6d1dd017), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DAMLURKER, Document::UDocumentSegment_CH1_DAMLURKER_Info1);
                DC(int64(0x5f3a6e2ac375ac8e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_DAMLURKER.StartQuest();
                DC(int64(0x5f3a6e2ac375ac8e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHomerSuccess : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x22b1a5cf6d1dd019);
            default Caption = LocText("DIA_HOMER_SUCCESS_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHomerRunning);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHomerWannahelp);
            default Rules.HideIfKnows(UChoiceHomerSuccess);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x22b1a5cf6d1dd01a), Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && Quest::NewCamp_NCCHAPTER1_DAMLURKER.IsRunning());
                    DB(int64(0x5f3a6e2ac375f62b), LURKER_HOMER != nullptr && LURKER_HOMER.IsEveryoneOfThisKindDead());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && !Quest::NewCamp_NCCHAPTER1_DAMLURKER.IsRunning())
                    return false;
                
                if (LURKER_HOMER != nullptr && !LURKER_HOMER.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x22b1a5cf6d1dd01c), EConversationDebugInfo::Executing);
                // That lurker is food for the crows. 
                Hero.AI.Say(LocText("DIA_HOMER_SUCCESS_15_00"));
                DC(int64(0x22b1a5cf6d1dd01c), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd01d), EConversationDebugInfo::Executing);
                
                // Good work. I'll ask the Rice Lord to lend me some of his ...
                Homer.AI.Say(LocText("DIA_HOMER_SUCCESS_02_01"));
                DC(int64(0x22b1a5cf6d1dd01d), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd01e), EConversationDebugInfo::Executing);
                // I'll sleep a lot easier tonight. 
                Homer.AI.Say(LocText("DIA_HOMER_SUCCESS_02_02"));
                DC(int64(0x22b1a5cf6d1dd01e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DAMLURKER, Document::UDocumentSegment_CH1_DAMLURKER_Completed);
                DC(int64(0x5f3a6e2ac375ac95), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN.SucceedQuest();
                DC(int64(0x5f3a6e2ac375ac95), EConversationDebugInfo::Done);
                DC(int64(0x5f3a6e2ac375ac99), EConversationDebugInfo::Executing);
                Homer.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Homer_935_AfterLurker);
                DC(int64(0x5f3a6e2ac375ac99), EConversationDebugInfo::Done);
                DC(int64(0xa2f911ca66fa902d), EConversationDebugInfo::Executing);
                G1R.Points_NC += 5;
                DC(int64(0xa2f911ca66fa902d), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd022), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x22b1a5cf6d1dd022), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHomerWannahelp : UTopic_Hero__NC_BAU_HOMER_935
        {
            default DebugId = int64(0x22b1a5cf6d1dd00e);
            default Caption = LocText("DIA_HOMER_WANNAHELP_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHomerHello);
            default Rules.HideIfKnows(UChoiceHomerWannahelp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x22b1a5cf6d1dd00f), Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && !Quest::NewCamp_NCCHAPTER1_DAMLURKER.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && !Quest::NewCamp_NCCHAPTER1_DAMLURKER.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x22b1a5cf6d1dd010), EConversationDebugInfo::Executing);
                // Can I help?
                Hero.AI.Say(LocText("DIA_HOMER_WANNAHELP_15_00"));
                DC(int64(0x22b1a5cf6d1dd010), EConversationDebugInfo::Done);
                DC(int64(0x22b1a5cf6d1dd011), EConversationDebugInfo::Executing);
                
                // Sure you could - stop that beast from gnawing at the ...
                Homer.AI.Say(LocText("DIA_HOMER_WANNAHELP_02_01"));
                DC(int64(0x22b1a5cf6d1dd011), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DAMLURKER, Document::UDocumentSegment_CH1_DAMLURKER_Start);
                DC(int64(0x5f3a6e2ac375aca0), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_DAMLURKER.StartQuest();
                DC(int64(0x5f3a6e2ac375aca0), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */