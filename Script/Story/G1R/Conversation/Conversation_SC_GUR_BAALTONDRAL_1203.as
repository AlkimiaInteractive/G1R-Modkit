#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_GUR_BAALTONDRAL_1203 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_GUR_BAALTONDRAL_1203";
        }
        
        
        class UTopic_Hero__SC_GUR_BAALTONDRAL_1203 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_BAALTONDRAL_1203";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalTondral() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetDusty() const property
            {
                return GetCharacter(n"OC_VLK_DUSTY_524");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UChoiceBaaltondral157207 : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xed4abbb5972f5044);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaaltondral157207);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(BaalTondral, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalTondral, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f5043), EConversationDebugInfo::Executing);
                // But the Sleeper did hear us. He told us what to do - Cor ...
                BaalTondral.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_094005_41"));
                DC(int64(0xed4abbb5972f5043), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltondral157223 : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xed4abbb5972f5048);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaaltondral157223);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(BaalTondral, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalTondral, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f5047), EConversationDebugInfo::Executing);
                // Don't talk to me. You're not a true believer.
                BaalTondral.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_094008_2238"));
                DC(int64(0xed4abbb5972f5047), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltondralDustysuccess : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d3ab);
            default Caption = LocText("DIA_BAALTONDRAL_DUSTYSUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltondralLoyality);
            default Rules.HideIfKnows(UChoiceBaaltondralDustysuccess);
            
            default ExtraCharactersToInvite.Add(n"OC_VLK_DUSTY_524");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc3f4bd762008d3ac), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                    DB(int64(0xc3f4bd762008d3ad), BaalTondral != nullptr && BaalTondral.IsCloseToCharacter(Dusty, 1000.0f));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning())
                    return false;
                
                if (BaalTondral != nullptr && !BaalTondral.IsCloseToCharacter(Dusty, 1000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d3ae), EConversationDebugInfo::Executing);
                
                // Master, I found someone who wishes to speak to you.
                Hero.AI.Say(LocText("DIA_BAALTONDRAL_DUSTYSUCCESS_15_00"));
                DC(int64(0xc3f4bd762008d3ae), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3af), EConversationDebugInfo::Executing);
                
                // Who is it? This bag of bones?
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_DUSTYSUCCESS_13_01"));
                DC(int64(0xc3f4bd762008d3af), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3b0), EConversationDebugInfo::Executing);
                
                // His name is Dusty.
                Hero.AI.Say(LocText("DIA_BAALTONDRAL_DUSTYSUCCESS_15_02"));
                DC(int64(0xc3f4bd762008d3b0), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3b1), EConversationDebugInfo::Executing);
                
                // Hmm ... I don't see much zeal in his eyes. 
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_DUSTYSUCCESS_13_03"));
                DC(int64(0xc3f4bd762008d3b1), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f53e), EConversationDebugInfo::Executing);
                // You're not just another wretch coming to lull your mind ...
                BaalTondral.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_135026"));
                DC(int64(0x5dcd7126285f53e), EConversationDebugInfo::Done);
                DC(int64(0x8733d52371400750), EConversationDebugInfo::Executing);
                
                // Wh-what? No, o' course not, I, um ... I love the ...
                Dusty.AI.Say(LocText("TEXT_WIP_BXXVESJ_20241015_171625"));
                DC(int64(0x8733d52371400750), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f53f), EConversationDebugInfo::Executing);
                
                // hmm...
                BaalTondral.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_135148"));
                DC(int64(0x5dcd7126285f53f), EConversationDebugInfo::Done);
                DC(int64(0x8733d52371400751), EConversationDebugInfo::Executing);
                
                // Master Tondral, Dusty risked a lot in coming here. He'll ...
                Hero.AI.Say(LocText("TEXT_WIP_BXXVESJ_20241015_171627"), TargetCharacter = BaalTondral.Character);
                DC(int64(0x8733d52371400751), EConversationDebugInfo::Done);
                DC(int64(0x8733d52371400752), EConversationDebugInfo::Executing);
                
                // Hm. Fine, maybe your soul is not beyond salvation, ...
                BaalTondral.AI.Say(LocText("TEXT_WIP_BXXVESJ_20241015_171628"));
                DC(int64(0x8733d52371400752), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f544), EConversationDebugInfo::Executing);
                // Speaking of worthy, you did well. I will give Cor Kalom ...
                BaalTondral.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_135543"));
                DC(int64(0x5dcd7126285f544), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_TondralImpressed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RECRUITDUSTY, Document::UDocumentSegment_CH1_RECRUITDUSTY_Completed);
                DC(int64(0x4e1dd85e807f5b9e), EConversationDebugInfo::Executing);
                Dusty.SetTrueGuild(UGE_Guild_Human_SwampCamp_Novice);
                DC(int64(0x4e1dd85e807f5b9e), EConversationDebugInfo::Done);
                DC(int64(0x4e1dd85e807f5ba0), EConversationDebugInfo::Executing);
                Dusty.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Dusty_524_Prepareritual);
                DC(int64(0x4e1dd85e807f5ba0), EConversationDebugInfo::Done);
                DC(int64(0x4e1dd85e807f5ba2), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT.SucceedQuest();
                DC(int64(0x4e1dd85e807f5ba2), EConversationDebugInfo::Done);
                DC(int64(0x8733d5237140073b), EConversationDebugInfo::Executing);
                Dusty.LeavePartyOf(Hero);
                DC(int64(0x8733d5237140073b), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a18e), EConversationDebugInfo::Executing);
                Dusty.RemoveImmortality();
                DC(int64(0x7858bf075764a18e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltondralExit : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d388);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltondralMuteexit);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltondralYoutalked);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d389), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc3f4bd762008d389), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaaltondralFanaticteacher : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d38a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBaaltondralFanaticteacher);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56a4a1bf16980eca), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d38b), EConversationDebugInfo::Executing);
                // You. You look like a man who has not yet surrendered his ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_00"));
                DC(int64(0xc3f4bd762008d38b), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d38c), EConversationDebugInfo::Executing);
                // No ... you look like a seeker. Someone on a quest to ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_01"));
                DC(int64(0xc3f4bd762008d38c), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d38d), EConversationDebugInfo::Executing);
                // But it is a welcome fire, for without it, you would have ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_02"));
                DC(int64(0xc3f4bd762008d38d), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d38e), EConversationDebugInfo::Executing);
                // Lies, meant to dominate the spirits of the weak-willed! ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_03"));
                DC(int64(0xc3f4bd762008d38e), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d38f), EConversationDebugInfo::Executing);
                // So, I say, surrender! Surrender to your relentless ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_04"));
                DC(int64(0xc3f4bd762008d38f), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d390), EConversationDebugInfo::Executing);
                // And yes, I can feel your fear. But there is no other ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_05"));
                DC(int64(0xc3f4bd762008d390), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d391), EConversationDebugInfo::Executing);
                // The Sleeper WILL awaken, and he will grant you the ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_06"));
                DC(int64(0xc3f4bd762008d391), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d392), EConversationDebugInfo::Executing);
                // Like filth washed away by the wrath of a deluge, he will ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_07"));
                DC(int64(0xc3f4bd762008d392), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d393), EConversationDebugInfo::Executing);
                // They will pay the price for their ignorance. And they ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_FANATICTEACHER_13_08"));
                DC(int64(0xc3f4bd762008d393), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTONDRAL, Document::UDocumentSegment_Glossary_SC_GUR_BAALTONDRAL_Introduction);
            }
        }
        
        
        class UChoiceBaaltondralLoyality : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d399);
            default Caption = LocText("DIA_BAALTONDRAL_LOYALITY_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltondralYoutalked);
            default Rules.HideIfKnows(UChoiceBaaltondralLoyality);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56a4a1bf16980eca), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d39b), EConversationDebugInfo::Executing);
                // How can I prove myself to you?
                Hero.AI.Say(LocText("DIA_BAALTONDRAL_LOYALITY_15_00"));
                DC(int64(0xc3f4bd762008d39b), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d39c), EConversationDebugInfo::Executing);
                
                // By providing what the Brotherhood needs the most: new ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_LOYALITY_13_01"));
                DC(int64(0xc3f4bd762008d39c), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d39d), EConversationDebugInfo::Executing);
                // If you manage to persuade a worthy man to join our camp, ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_LOYALITY_13_02"));
                DC(int64(0xc3f4bd762008d39d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_TondralTrick);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RECRUITDUSTY, Document::UDocumentSegment_CH1_RECRUITDUSTY_TondralStart);
                DC(int64(0x4e1dd85e807f5bbf), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.StartQuest();
                DC(int64(0x4e1dd85e807f5bbf), EConversationDebugInfo::Done);
                DC(int64(0x1c2195c1a25579e5), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE.StartQuest();
                DC(int64(0x1c2195c1a25579e5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltondralMuteexit : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d386);
            default Caption = LocText("TEXT_CHOICE_BAALTONDRAL_MUTEEXIT");
            default PriorityRank = 5;
            
            default Rules.HideIfKnows(UChoiceBaaltondralMuteexit);
            default Rules.HideIfKnows(UChoiceBaaltondralYoutalked);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d387), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc3f4bd762008d387), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaaltondralNewmember : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d39f);
            default Caption = LocText("DIA_BAALTONDRAL_NEWMEMBER_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltondralLoyality);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc3f4bd762008d3a0), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d3a1), EConversationDebugInfo::Executing);
                // Any idea where I can find potential recruits?
                Hero.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER_15_00"));
                DC(int64(0xc3f4bd762008d3a1), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3a2), EConversationDebugInfo::Executing);
                
                // The Old Camp is a good starting point. There's plenty of ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER_13_01"));
                DC(int64(0xc3f4bd762008d3a2), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3a3), EConversationDebugInfo::Executing);
                // As for the New Camp, I wouldn't waste my time. The men ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER_13_02"));
                DC(int64(0xc3f4bd762008d3a3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltondralNewmember2 : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d3a4);
            default Caption = LocText("DIA_BAALTONDRAL_NEWMEMBER2_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltondralLoyality);
            default Rules.HideIfKnows(UChoiceBaaltondralNewmember2);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc3f4bd762008d3a5), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d3a6), EConversationDebugInfo::Executing);
                
                // Why do you need new recruits so badly?
                Hero.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER2_15_00"));
                DC(int64(0xc3f4bd762008d3a6), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3a7), EConversationDebugInfo::Executing);
                
                // Because the Sleeper revealed to our master that he has ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER2_13_01"));
                DC(int64(0xc3f4bd762008d3a7), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3a8), EConversationDebugInfo::Executing);
                // The problem is, he is not yet at his full strength, so ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER2_13_02"));
                DC(int64(0xc3f4bd762008d3a8), EConversationDebugInfo::Done);
                DC(int64(0xeca0acc4624aeec1), EConversationDebugInfo::Executing);
                
                // That would be this ritual you're preparing? 
                Hero.AI.Say(LocText("TEXT_WIP_KTCTNOC_20240207_181815"));
                DC(int64(0xeca0acc4624aeec1), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3a9), EConversationDebugInfo::Executing);
                
                // So you've heard about it. Yes: the Great Awakening. It's ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER2_13_03"));
                DC(int64(0xc3f4bd762008d3a9), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3aa), EConversationDebugInfo::Executing);
                // If you want to know more, go to the Temple Square. 
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_NEWMEMBER2_13_04"));
                DC(int64(0xc3f4bd762008d3aa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltondralSendtokalom : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d3bb);
            default Caption = LocText("DIA_BAALTONDRAL_SENDTOKALOM_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBaaltondralSendtokalom);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc3f4bd762008d3bc), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.HasSucceeded());
                    DB(int64(0x646f6c8d1ce4963c), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d3bd), EConversationDebugInfo::Executing);
                
                // Master, I seek admission into your ranks. And I need ...
                Hero.AI.Say(LocText("DIA_BAALTONDRAL_SENDTOKALOM_15_00"));
                DC(int64(0xc3f4bd762008d3bd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTONDRAL, Document::UDocumentSegment_Glossary_SC_GUR_BAALTONDRAL_Blessing);
                DC(int64(0x4e1dd85e807f5bd7), EConversationDebugInfo::Executing);
                BaalTondral.AI.TurnToCharacter(Hero);
                DC(int64(0x4e1dd85e807f5bd7), EConversationDebugInfo::Done);
                DC(int64(0x28003880c3e01f97), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_TONDRAL.SucceedQuest();
                DC(int64(0x28003880c3e01f97), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d3bf), EConversationDebugInfo::Executing);
                // Then you shall have it, for you proved yourself worthy. ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_SENDTOKALOM_13_01"));
                DC(int64(0xc3f4bd762008d3bf), EConversationDebugInfo::Done);
                DC(int64(0x1a34e2931ab9dbda), EConversationDebugInfo::Executing);
                G1R.Kalom_Counter += 1;
                DC(int64(0x1a34e2931ab9dbda), EConversationDebugInfo::Done);
                DB(int64(0x1a34e2931ab9dbd6), G1R.Kalom_Counter >= 2);
                DB(int64(0x1547dbe6d32bec83), G1R.CaineVanished == 0);
                
                if (G1R.Kalom_Counter >= 2 && G1R.CaineVanished == 0)
                {
                    DC(int64(0x1a34e2931ab9dbd8), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Caine_1301_Dead); }
                    DC(int64(0x1a34e2931ab9dbd8), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82f0), EConversationDebugInfo::Executing);
                    G1R.ActivateStoryDataLayer("FindingCaine");
                    DC(int64(0x608d6fba46cd82f0), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82f2), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnFindingCaine");
                    DC(int64(0x608d6fba46cd82f2), EConversationDebugInfo::Done);
                    DC(int64(0x1547dbe6d32bec81), EConversationDebugInfo::Executing);
                    G1R.CaineVanished = 1;
                    DC(int64(0x1547dbe6d32bec81), EConversationDebugInfo::Done);
                    DC(int64(0x28003880c3e01f99), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.NPCState.RemoveFromWorld(); }
                    DC(int64(0x28003880c3e01f99), EConversationDebugInfo::Done);
                }
                DC(int64(0x9f6d0e024eb7075c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9f6d0e024eb7075c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaaltondralYoutalked : UTopic_Hero__SC_GUR_BAALTONDRAL_1203
        {
            default DebugId = int64(0xc3f4bd762008d394);
            default Caption = LocText("DIA_BAALTONDRAL_YOUTALKED_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBaaltondralYoutalked);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x646f6c8d1ce4963e), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc3f4bd762008d395), EConversationDebugInfo::Executing);
                // Hey, you spoke to me! Does that I mean I can talk to you ...
                Hero.AI.Say(LocText("DIA_BAALTONDRAL_YOUTALKED_15_00"));
                DC(int64(0xc3f4bd762008d395), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d396), EConversationDebugInfo::Executing);
                
                // Ah, so you've familiarized yourself with our rules. ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_YOUTALKED_13_01"));
                DC(int64(0xc3f4bd762008d396), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d397), EConversationDebugInfo::Executing);
                // I sense great spiritual potential within you. Yes ... ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_YOUTALKED_13_02"));
                DC(int64(0xc3f4bd762008d397), EConversationDebugInfo::Done);
                DC(int64(0xc3f4bd762008d398), EConversationDebugInfo::Executing);
                // That is why I spoke to you. To give you a chance to ...
                BaalTondral.AI.Say(LocText("DIA_BAALTONDRAL_YOUTALKED_13_03"));
                DC(int64(0xc3f4bd762008d398), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTONDRAL, Document::UDocumentSegment_Glossary_SC_GUR_BAALTONDRAL_Talkative);
                DC(int64(0x138d345a7dba4d1a), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_TONDRAL.StartQuest();
                DC(int64(0x138d345a7dba4d1a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */