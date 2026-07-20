#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_GUR_CORKALOM_1201 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_GUR_CORKALOM_1201";
        }
        
        
        class UTopic_Hero__SC_GUR_CORKALOM_1201 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_CORKALOM_1201";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCorKalom() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetRayk() const property
            {
                return GetCharacter(n"NC_BAU_RAYK_941");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD40_292N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD40_292N");
            }
            
            AGothicCharacterState GetOrry() const property
            {
                return GetCharacter(n"OC_GRD_ORRY_254");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_MORDRAG_826");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
            
            AGothicCharacterState GetNyras() const property
            {
                return GetCharacter(n"SC_NOV_NYRAS_1303");
            }
            
            AGothicCharacterState GetTemplar03() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR03_1406");
            }
            
            AGothicCharacterState GetJacko() const property
            {
                return GetCharacter(n"UL_ORG_JACKO_862");
            }
            
            AGothicCharacterState GetKillian() const property
            {
                return GetCharacter(n"UL_ORG_KILLIAN_861");
            }
            
            AGothicCharacterState GetRenyu() const property
            {
                return GetCharacter(n"UL_ORG_RENYU_860");
            }
        }
        
        
        class UTopic_SC_NOV_NYRAS_1303__SC_GUR_CORKALOM_1201 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_CORKALOM_1201";
            default WithCharacter = n"SC_NOV_NYRAS_1303";
            
            AGothicCharacterState GetCorKalom() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetRayk() const property
            {
                return GetCharacter(n"NC_BAU_RAYK_941");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD40_292N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD40_292N");
            }
            
            AGothicCharacterState GetOrry() const property
            {
                return GetCharacter(n"OC_GRD_ORRY_254");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_MORDRAG_826");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
            
            AGothicCharacterState GetNyras() const property
            {
                return GetCharacter(n"SC_NOV_NYRAS_1303");
            }
            
            AGothicCharacterState GetTemplar03() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR03_1406");
            }
            
            AGothicCharacterState GetJacko() const property
            {
                return GetCharacter(n"UL_ORG_JACKO_862");
            }
            
            AGothicCharacterState GetKillian() const property
            {
                return GetCharacter(n"UL_ORG_KILLIAN_861");
            }
            
            AGothicCharacterState GetRenyu() const property
            {
                return GetCharacter(n"UL_ORG_RENYU_860");
            }
        }
        
        
        class UTopic_SC_TPL_TEMPLAR03_1406__SC_GUR_CORKALOM_1201 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_CORKALOM_1201";
            default WithCharacter = n"SC_TPL_TEMPLAR03_1406";
            
            AGothicCharacterState GetCorKalom() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetRayk() const property
            {
                return GetCharacter(n"NC_BAU_RAYK_941");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD40_292N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD40_292N");
            }
            
            AGothicCharacterState GetOrry() const property
            {
                return GetCharacter(n"OC_GRD_ORRY_254");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_MORDRAG_826");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
            
            AGothicCharacterState GetNyras() const property
            {
                return GetCharacter(n"SC_NOV_NYRAS_1303");
            }
            
            AGothicCharacterState GetTemplar03() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR03_1406");
            }
            
            AGothicCharacterState GetJacko() const property
            {
                return GetCharacter(n"UL_ORG_JACKO_862");
            }
            
            AGothicCharacterState GetKillian() const property
            {
                return GetCharacter(n"UL_ORG_KILLIAN_861");
            }
            
            AGothicCharacterState GetRenyu() const property
            {
                return GetCharacter(n"UL_ORG_RENYU_860");
            }
        }
        
        
        class UCorKalom_137609 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x45ab80595ed53604);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UCorKalom_137694);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom137571);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x45ab80595ed535c2), EConversationDebugInfo::Executing);
                // Take these potions. Consider it the Sleeper's reward for ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121229"));
                DC(int64(0x45ab80595ed535c2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_SoldToKalom);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                CorKalom.AddItemToInventory(UItFo_Potion_Mana_03, 2);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815278), EConversationDebugInfo::Executing);
                CorKalom.AI.GiveItemTo(Hero, UItFo_Potion_Mana_03, 2);
                DC(int64(0x8921c2ef02815278), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815289), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.SucceedQuest();
                DC(int64(0x8921c2ef02815289), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1cdf2), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.SucceedQuest();
                DC(int64(0xeec39d0ff5f1cdf2), EConversationDebugInfo::Done);
                DC(int64(0x1b448840217065ec), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Potion_Health_03, 2);
                DC(int64(0x1b448840217065ec), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef0281528d), EConversationDebugInfo::Executing);
                // Now leave me to my work.
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121339_2801"));
                DC(int64(0x8921c2ef0281528d), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef0281529b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8921c2ef0281529b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorKalom82950 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x73bd91e3a5fb18a8);
            default Caption = LocText("TEXT_WIP_MTCTNOC_20240209_175454");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCorKalom82950);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GUR_1201_CORKALOM_JOINPSI_10_08"), int64(0x73bd91e3a5fb18a8));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc909484e69156bbe), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73bd91e3a5fb18a6), EConversationDebugInfo::Executing);
                // What did you want to ask me?
                Hero.AI.Say(LocText("TEXT_WIP_MTCTNOC_20240209_175454"));
                DC(int64(0x73bd91e3a5fb18a6), EConversationDebugInfo::Done);
                DC(int64(0x73bd91e3a5fb18a7), EConversationDebugInfo::Executing);
                
                // Are you ready? Think deeply. 
                CorKalom.AI.Say(LocText("TEXT_WIP_MTCTNOC_20240209_175454_2785"));
                DC(int64(0x73bd91e3a5fb18a7), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf085), EConversationDebugInfo::Executing);
                // WHY do you want to join the Brotherhood of the Sleeper? 
                CorKalom.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_150910"));
                DC(int64(0xebd1924233aaf085), EConversationDebugInfo::Done);
                Subdialog(
                    UCorKalom_81824,
                    UCorKalom_80494,
                    UCorKalom_81365,
                    UCorKalom_80514
                );
                DB(int64(0x56788585a6b9077), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_SCFail);
                }
                DB(int64(0x56788585a6b9750), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINOC, Document::UDocumentSegment_CH1_JOINOC_FailSC);
                }
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                CorKalom.AddItemToInventory(UNov_Armor, 1);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a0e), EConversationDebugInfo::Executing);
                CorKalom.AI.GiveItemTo(Hero, UNov_Armor, 1);
                DC(int64(0x988a6494be414a0e), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a10), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipArmorOfClass(UNov_Armor);
                DC(int64(0x988a6494be414a10), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a12), EConversationDebugInfo::Executing);
                Hero.SetTrueGuild(UGE_Guild_Human_SwampCamp_Novice);
                DC(int64(0x988a6494be414a12), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a14), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI.SucceedQuest();
                DC(int64(0x988a6494be414a14), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a18), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC.FailQuest();
                DC(int64(0x988a6494be414a18), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a1a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC.FailQuest();
                DC(int64(0x988a6494be414a1a), EConversationDebugInfo::Done);
                DC(int64(0x1f3d20e544aef511), EConversationDebugInfo::Executing);
                G1R.ChangeChapter(2);
                DC(int64(0x1f3d20e544aef511), EConversationDebugInfo::Done);
                DC(int64(0xcb6f5dcc2f119251), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Ch2); }
                DC(int64(0xcb6f5dcc2f119251), EConversationDebugInfo::Done);
                DC(int64(0x68a7182b4ab6a561), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS.FailQuest();
                DC(int64(0x68a7182b4ab6a561), EConversationDebugInfo::Done);
                DC(int64(0x4c3b353c1aae11cd), EConversationDebugInfo::Executing);
                G1R.Thorus_Permission_Interior = 0;
                DC(int64(0x4c3b353c1aae11cd), EConversationDebugInfo::Done);
                DC(int64(0xf82777388df4cf7e), EConversationDebugInfo::Executing);
                G1R.ForceConvoyCleanup();
                DC(int64(0xf82777388df4cf7e), EConversationDebugInfo::Done);
                DC(int64(0x253651f482b4e5f4), EConversationDebugInfo::Executing);
                G1R.Fingers_CanTeach = 1;
                DC(int64(0x253651f482b4e5f4), EConversationDebugInfo::Done);
                DC(int64(0xa9a741ef3bb53cbb), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rayk))) { Rayk.RemoveImmortality(); }
                DC(int64(0xa9a741ef3bb53cbb), EConversationDebugInfo::Done);
                DB(int64(0x3eed5775e7b3ec97), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3eca6), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BRINGLIST.FailQuest();
                    DC(int64(0x3eed5775e7b3eca6), EConversationDebugInfo::Done);
                }
                DB(int64(0x3eed5775e7b3eccd), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3ecdc), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_MORDRAGKO.FailQuest();
                    DC(int64(0x3eed5775e7b3ecdc), EConversationDebugInfo::Done);
                }
                DB(int64(0x3eed5775e7b3eceb), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3ecfa), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.FailQuest();
                    DC(int64(0x3eed5775e7b3ecfa), EConversationDebugInfo::Done);
                }
                DB(int64(0x3eed5775e7b3edd4), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3ee0b), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.FailQuest();
                    DC(int64(0x3eed5775e7b3ee0b), EConversationDebugInfo::Done);
                }
                DB(int64(0x9852e53caa8f796b), Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning())
                {
                    DC(int64(0x9852e53caa8f7994), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_FINGERS_RING.FailQuest();
                    DC(int64(0x9852e53caa8f7994), EConversationDebugInfo::Done);
                }
                DB(int64(0xffb2308570a1da40), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                {
                    DC(int64(0xffb2308570a1da76), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_CONVOY.FailQuest();
                    DC(int64(0xffb2308570a1da76), EConversationDebugInfo::Done);
                }
                DB(int64(0x9a4c498930550b08), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait));
                
                if (Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait))
                {
                    DC(int64(0x9a4c498930550b49), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Mordrag))) { Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated); }
                    DC(int64(0x9a4c498930550b49), EConversationDebugInfo::Done);
                }
                DC(int64(0x3eed5775e7b3edef), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3eed5775e7b3edef), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UCorKalom_81824 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x5193176a4885a017);
            default Caption = LocText("TEXT_WIP_ORNADNC_20240214_191400_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_81824);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0xebd1924233aaf094), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip:  */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5193176a4885a018), EConversationDebugInfo::Executing);
                // Actually, I had a vision. 
                Hero.AI.Say(LocText("TEXT_WIP_ORNADNC_20240214_191400_41"));
                DC(int64(0x5193176a4885a018), EConversationDebugInfo::Done);
                DC(int64(0x5193176a4885a022), EConversationDebugInfo::Executing);
                
                // Really? You?
                CorKalom.AI.Say(LocText("TEXT_WIP_ORNADNC_20240214_192536"));
                DC(int64(0x5193176a4885a022), EConversationDebugInfo::Done);
                DC(int64(0x5193176a4885a024), EConversationDebugInfo::Executing);
                
                // Yes. I smoked a roll laced with dreamjuice, and I saw ...
                Hero.AI.Say(LocText("TEXT_WIP_ORNADNC_20240214_192548"));
                DC(int64(0x5193176a4885a024), EConversationDebugInfo::Done);
                DC(int64(0x5193176a4885a025), EConversationDebugInfo::Executing);
                
                // Hmm ... you sound like you actually mean it.
                CorKalom.AI.Say(LocText("TEXT_WIP_ORNADNC_20240214_192619"));
                DC(int64(0x5193176a4885a025), EConversationDebugInfo::Done);
                DC(int64(0x7d51a96972296460), EConversationDebugInfo::Executing);
                // All right, I'll give you the benefit of the doubt. This ...
                CorKalom.AI.Say(LocText("TEXT_WIP_ORNADNC_20240214_193325_41"));
                DC(int64(0x7d51a96972296460), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf853), EConversationDebugInfo::Executing);
                // No one admits it, but we've become a dumping ground for ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191120_2995"));
                DC(int64(0x927b2472124bf853), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf86e), EConversationDebugInfo::Executing);
                // Y'Berion keeps telling us they'll see the Sleeper's ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191159"));
                DC(int64(0x927b2472124bf86e), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf86f), EConversationDebugInfo::Executing);
                // Maybe, you belong to the former. Here, put that on - ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191209"));
                DC(int64(0x927b2472124bf86f), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf88e), EConversationDebugInfo::Executing);
                
                // That's it? No "Welcome to the Brotherhood," no ceremony?
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191343"));
                DC(int64(0x927b2472124bf88e), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf88f), EConversationDebugInfo::Executing);
                
                // "Welcome to the Brotherhood." Now, get settled in, then ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191356"));
                DC(int64(0x927b2472124bf88f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_80494 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x8c3dc025a369842a);
            default Caption = LocText("TEXT_WIP_QRNADNC_20240212_190934_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_80494);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8c3dc025a369842b), EConversationDebugInfo::Executing);
                
                // Because I have felt the Sleeper's power, and I know ...
                Hero.AI.Say(LocText("TEXT_WIP_QRNADNC_20240212_190934_41"));
                DC(int64(0x8c3dc025a369842b), EConversationDebugInfo::Done);
                DC(int64(0x8c3dc025a3698433), EConversationDebugInfo::Executing);
                
                // Powerful words. Are they yours? Or just something you've ...
                CorKalom.AI.Say(LocText("TEXT_WIP_QRNADNC_20240212_191143"));
                DC(int64(0x8c3dc025a3698433), EConversationDebugInfo::Done);
                DC(int64(0x5193176a4885a026), EConversationDebugInfo::Executing);
                
                // They're mine.
                Hero.AI.Say(LocText("TEXT_WIP_ORNADNC_20240214_192702"));
                DC(int64(0x5193176a4885a026), EConversationDebugInfo::Done);
                DC(int64(0x5193176a4885a027), EConversationDebugInfo::Executing);
                
                // Hmm. All right, I'll give you the benefit of the doubt. ...
                CorKalom.AI.Say(LocText("TEXT_WIP_ORNADNC_20240214_192705"));
                DC(int64(0x5193176a4885a027), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf853), EConversationDebugInfo::Executing);
                // No one admits it, but we've become a dumping ground for ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191120_2995"));
                DC(int64(0x927b2472124bf853), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf86e), EConversationDebugInfo::Executing);
                // Y'Berion keeps telling us they'll see the Sleeper's ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191159"));
                DC(int64(0x927b2472124bf86e), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf86f), EConversationDebugInfo::Executing);
                // Maybe, you belong to the former. Here, put that on - ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191209"));
                DC(int64(0x927b2472124bf86f), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf88e), EConversationDebugInfo::Executing);
                
                // That's it? No "Welcome to the Brotherhood," no ceremony?
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191343"));
                DC(int64(0x927b2472124bf88e), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf88f), EConversationDebugInfo::Executing);
                
                // "Welcome to the Brotherhood." Now, get settled in, then ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_191356"));
                DC(int64(0x927b2472124bf88f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_Novice);
            }
        }
        
        
        class UCorKalom_81365 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x8c3dc025a3698435);
            default Caption = LocText("TEXT_WIP_QRNADNC_20240212_191420_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_81365);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8c3dc025a3698436), EConversationDebugInfo::Executing);
                // Frankly - I just came here for the free swampweed. 
                Hero.AI.Say(LocText("TEXT_WIP_QRNADNC_20240212_191420_1924"));
                DC(int64(0x8c3dc025a3698436), EConversationDebugInfo::Done);
                DC(int64(0x8c3dc025a3698439), EConversationDebugInfo::Executing);
                
                // Did you, now. 
                CorKalom.AI.Say(LocText("TEXT_WIP_QRNADNC_20240212_191530"));
                DC(int64(0x8c3dc025a3698439), EConversationDebugInfo::Done);
                Subdialog(
                    UCorKalom_122628,
                    UCorKalom_122648
                );
            }
        }
        
        
        class UCorKalom_80514 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x8c3dc025a369842e);
            default Caption = LocText("TEXT_WIP_QRNADNC_20240212_190934_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_80514);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8c3dc025a369842f), EConversationDebugInfo::Executing);
                // I'm still trying to figure that out.
                Hero.AI.Say(LocText("TEXT_WIP_QRNADNC_20240212_190934_2238"));
                DC(int64(0x8c3dc025a369842f), EConversationDebugInfo::Done);
                DC(int64(0x8c3dc025a3698434), EConversationDebugInfo::Executing);
                
                // A seeker. How original.
                CorKalom.AI.Say(LocText("TEXT_WIP_QRNADNC_20240212_191348"));
                DC(int64(0x8c3dc025a3698434), EConversationDebugInfo::Done);
                DC(int64(0x3c53dead4411121d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3c53dead4411121d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_122628 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xebd1924233aaf11e);
            default Caption = LocText("TEXT_WIP_RGTRMXB_20240923_151641_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_122628);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xebd1924233aaf11f), EConversationDebugInfo::Executing);
                // Relax. I was just joking. 
                Hero.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_151641_2083"));
                DC(int64(0xebd1924233aaf11f), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf133), EConversationDebugInfo::Executing);
                
                // Don't. 
                CorKalom.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_151648"));
                DC(int64(0xebd1924233aaf133), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf121), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0xebd1924233aaf121), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_122648 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xebd1924233aaf122);
            default Caption = LocText("TEXT_WIP_RGTRMXB_20240923_151641_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_122648);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xebd1924233aaf123), EConversationDebugInfo::Executing);
                // Smoke rolls or pickaxe? Not that hard of a choice.
                Hero.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_151641_1924"));
                DC(int64(0xebd1924233aaf123), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf134), EConversationDebugInfo::Executing);
                
                // Why ...? You- What a ... waste of precious time. 
                CorKalom.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_151711"));
                DC(int64(0xebd1924233aaf134), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf135), EConversationDebugInfo::Executing);
                // Get out of here, infidel. Before I'll have my guard cut ...
                CorKalom.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_151723"));
                DC(int64(0xebd1924233aaf135), EConversationDebugInfo::Done);
                DC(int64(0x9bf422ec628f87be), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI.FailQuest();
                DC(int64(0x9bf422ec628f87be), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf143), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xebd1924233aaf143), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorkalom100648 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xd58c60a1de7ff48);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceCorkalom100648);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OG_PRAY_01", 1500.0f, int64(0xd58c60a1de7ff48));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x177894285efd165e), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7ff3a), EConversationDebugInfo::Executing);
                // Look who's come. 
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_185116_3750"));
                DC(int64(0xd58c60a1de7ff3a), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7ffb4), EConversationDebugInfo::Executing);
                // You have some nerve showing up here. 
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_185403"));
                DC(int64(0xd58c60a1de7ffb4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_KalomCamp);
                Subdialog(
                    UCorKalom_100830,
                    UCorKalom_107798,
                    UCorKalom_100850
                );
            }
        }
        
        
        class UCorKalom_100830 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xd58c60a1de7ffb6);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_185413_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_100830);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x626b7fdd392daaed), Nyras != nullptr && !Nyras.IsEveryoneOfThisKindDead());
                }
                
                return Nyras != nullptr && !Nyras.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7ffb7), EConversationDebugInfo::Executing);
                // I heard you talk to that Nyras. You already know about ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_185413_1340"));
                DC(int64(0xd58c60a1de7ffb7), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7ffcb), EConversationDebugInfo::Executing);
                
                // Of course I heard about it. Serves them right. 
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_185538"));
                DC(int64(0xd58c60a1de7ffcb), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7ffcc), EConversationDebugInfo::Executing);
                // Let the infidels tear each other's throats out over ...
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_185620"));
                DC(int64(0xd58c60a1de7ffcc), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7ffb9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd58c60a1de7ffb9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_107798 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x626b7fdd392daafb);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_141757_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_107798);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x626b7fdd392dab0f), Nyras != nullptr && Nyras.IsEveryoneOfThisKindDead());
                }
                
                return Nyras != nullptr && Nyras.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392daafc), EConversationDebugInfo::Executing);
                // I heard you talk to that templar. You already know about ...
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_141757_41"));
                DC(int64(0x626b7fdd392daafc), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392dab0c), EConversationDebugInfo::Executing);
                
                // Of course I heard about it. Serves them right. 
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_185538"));
                DC(int64(0x626b7fdd392dab0c), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392dab0d), EConversationDebugInfo::Executing);
                // Let the infidels tear each other's throats out over ...
                CorKalom.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_141918"));
                DC(int64(0x626b7fdd392dab0d), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392daafe), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x626b7fdd392daafe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_100850 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xd58c60a1de7ffba);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_185413_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_100850);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7ffbb), EConversationDebugInfo::Executing);
                // You're wrong about the Sleeper. I saw the murals - he ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_185413_2316"));
                DC(int64(0xd58c60a1de7ffbb), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fffb), EConversationDebugInfo::Executing);
                
                // Ha! You know little and talk much.
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_190442"));
                DC(int64(0xd58c60a1de7fffb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_SleeperFollower);
                DB(int64(0xd58c60a1de8000d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0xd58c60a1de80037), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xd58c60a1de80029), EConversationDebugInfo::Executing);
                    // Let me tell you something, novice. You are an imposter.
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_190844_153"));
                    DC(int64(0xd58c60a1de80029), EConversationDebugInfo::Done);
                    DC(int64(0xd58c60a1de80056), EConversationDebugInfo::Executing);
                    // You never believed in the Sleeper and His vision, and ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_190922"));
                    DC(int64(0xd58c60a1de80056), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0xd58c60a1de80039), EConversationDebugInfo::Executing);
                    // Let me tell you something, bandit. You're an imposter. 
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_190849_292"));
                    DC(int64(0xd58c60a1de80039), EConversationDebugInfo::Done);
                    DC(int64(0xd58c60a1de80058), EConversationDebugInfo::Executing);
                    // You don't care the first thing about our Brotherhood or ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_190935_1037"));
                    DC(int64(0xd58c60a1de80058), EConversationDebugInfo::Done);
                    DC(int64(0xd58c60a1de80076), EConversationDebugInfo::Executing);
                    // I saw through you long ago: this was all just a game to ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_191134"));
                    DC(int64(0xd58c60a1de80076), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xd58c60a1de80048), EConversationDebugInfo::Executing);
                    // Let me tell you something, Shadow. You're an imposter. 
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_190853_94"));
                    DC(int64(0xd58c60a1de80048), EConversationDebugInfo::Done);
                    DC(int64(0xd58c60a1de80058), EConversationDebugInfo::Executing);
                    // You don't care the first thing about our Brotherhood or ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_190935_1037"));
                    DC(int64(0xd58c60a1de80058), EConversationDebugInfo::Done);
                    DC(int64(0xd58c60a1de80076), EConversationDebugInfo::Executing);
                    // I saw through you long ago: this was all just a game to ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_191134"));
                    DC(int64(0xd58c60a1de80076), EConversationDebugInfo::Done);
                }
                DC(int64(0xd58c60a1de80078), EConversationDebugInfo::Executing);
                // Y'Berion was simply too desperate to see the obvious. 
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_191252_2332"));
                DC(int64(0xd58c60a1de80078), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de80093), EConversationDebugInfo::Executing);
                // Well, now he's dead. And unlike him, or Angar, I won't ...
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_191317"));
                DC(int64(0xd58c60a1de80093), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de80094), EConversationDebugInfo::Executing);
                // I'm warning you just this once: stay away from us. Or ...
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_191549"));
                DC(int64(0xd58c60a1de80094), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de80095), EConversationDebugInfo::Executing);
                // We WILL free our master from the orcs and lay the world ...
                CorKalom.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_191630"));
                DC(int64(0xd58c60a1de80095), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom105823 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x5e485a4765a2b3e9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceCorkalom105823);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GUR_1202_CORANGAR_SENDS_KNOW_INFO_08_02"), int64(0x5e485a4765a2b3e9));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x111dbb95646dd8d9), Hero != nullptr && !Hero.IsInConversation());
                }
                
                return Hero != nullptr && !Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5e485a4765a2b3db), EConversationDebugInfo::Executing);
                // You heard Angar. Go and find Lukor.
                CorKalom.AI.Say(LocText("TEXT_WIP_FCIFMIG_20241025_140212_41"));
                DC(int64(0x5e485a4765a2b3db), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom137571 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x8921c2ef028151f7);
            default Caption = LocText("TEXT_WIP_UFNFOFG_20250320_085121_815");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCorkalom137571);
            
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
                DC(int64(0x8921c2ef028151e8), EConversationDebugInfo::Executing);
                
                // Found something that might interest you.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_113655"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x8921c2ef028151e8), EConversationDebugInfo::Done);
                DC(int64(0x80a569332c4ed0cb), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowGland);
                DC(int64(0x80a569332c4ed0cb), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815216), EConversationDebugInfo::Executing);
                // A minecrawler pheromone gland... and of extraordinary ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121016"), ForceCameraPreset = n"TWO SHOT COWBOY");
                DC(int64(0x8921c2ef02815216), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815217), EConversationDebugInfo::Executing);
                
                // From a minecrawler queen in the Old Mine.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121016_2386"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                DC(int64(0x8921c2ef02815217), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815225), EConversationDebugInfo::Executing);
                
                // A queen? You expect me to believe YOU killed such a ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121029"));
                DC(int64(0x8921c2ef02815225), EConversationDebugInfo::Done);
                Subdialog(
                    UCorKalom_137609_2,
                    UCorKalom_137629
                );
            }
        }
        
        
        class UCorKalom_137609_2 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x8921c2ef02815243);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_121058_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_137609_2);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8921c2ef0281525a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8921c2ef02815244), EConversationDebugInfo::Executing);
                // The Sleeper guided me to it. It will aid in your ...
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121058_3984"));
                DC(int64(0x8921c2ef02815244), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815268), EConversationDebugInfo::Executing);
                
                // Did he now? Perhaps... yes, this could be useful for the ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121212"));
                DC(int64(0x8921c2ef02815268), EConversationDebugInfo::Done);
                DC(int64(0x80a569332c4ed107), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(CorKalom, UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0x80a569332c4ed107), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_137629 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x8921c2ef02815247);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_121058_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_137629);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8921c2ef02815248), EConversationDebugInfo::Executing);
                // What's it worth to you?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121058_3569"));
                DC(int64(0x8921c2ef02815248), EConversationDebugInfo::Done);
                DB(int64(0x8921c2ef028152b7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x8921c2ef028152c5), EConversationDebugInfo::Executing);
                    // Worth? You dare talk of price? This belongs to the ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121445"));
                    DC(int64(0x8921c2ef028152c5), EConversationDebugInfo::Done);
                    DC(int64(0x8921c2ef028152d4), EConversationDebugInfo::Executing);
                    // A shameful display from a member of our Sleeper's herd.
                    CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121500"));
                    DC(int64(0x8921c2ef028152d4), EConversationDebugInfo::Done);
                    DC(int64(0x80a569332c4ed107), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(CorKalom, UItAt_Minecrawlerqueen_01, 1);
                    DC(int64(0x80a569332c4ed107), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x278b5506532ac3dc), EConversationDebugInfo::Executing);
                    // Worth? You dare haggle with the Brotherhood?
                    CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121839"));
                    DC(int64(0x278b5506532ac3dc), EConversationDebugInfo::Done);
                    DC(int64(0x278b5506532ac3eb), EConversationDebugInfo::Executing);
                    // I can offer a couple mana regeneration potions and a ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121852"));
                    DC(int64(0x278b5506532ac3eb), EConversationDebugInfo::Done);
                    DC(int64(0x38b6cb107d0bcd48), EConversationDebugInfo::Executing);
                    // Take them or leave with your rotting prize.
                    CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_154842"));
                    DC(int64(0x38b6cb107d0bcd48), EConversationDebugInfo::Done);
                    Subdialog(
                        UCorKalom_137694,
                        UCorKalom_137714
                    );
                }
            }
        }
        
        
        class UCorKalom_137694 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x278b5506532ac3ed);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_121934_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_137694);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac3ee), EConversationDebugInfo::Executing);
                // It's a deal.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121934_2083"));
                DC(int64(0x278b5506532ac3ee), EConversationDebugInfo::Done);
                DC(int64(0x80a569332c4ed107), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(CorKalom, UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0x80a569332c4ed107), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_137714 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x278b5506532ac3f1);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_121934_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_137714);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac3f2), EConversationDebugInfo::Executing);
                // I'll keep it then.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_121934_1924"));
                DC(int64(0x278b5506532ac3f2), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac41c), EConversationDebugInfo::Executing);
                
                // Fool! That gland will rot away in days without proper ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_122017"));
                DC(int64(0x278b5506532ac41c), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac41d), EConversationDebugInfo::Executing);
                
                // Whatever you say, just give it back.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_122021"));
                DC(int64(0x278b5506532ac41d), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac41e), EConversationDebugInfo::Executing);
                
                // You dimwit...
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_122029"));
                DC(int64(0x278b5506532ac41e), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac465), EConversationDebugInfo::Executing);
                // Now get out of here and stop wasting my time.
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_122104_2785"));
                DC(int64(0x278b5506532ac465), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac473), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x278b5506532ac473), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorkalom138524 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x38b6cb107d0bcd65);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_155055");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_corkalom_194403");
            default Rules.HideIfKnows(UChoiceCorkalom138524);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x38b6cb107d0bcd68), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x38b6cb107d0bcd56), EConversationDebugInfo::Executing);
                // About the minecrawler pheromone gland...
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_155055"));
                DC(int64(0x38b6cb107d0bcd56), EConversationDebugInfo::Done);
                DC(int64(0x38b6cb107d0bcd57), EConversationDebugInfo::Executing);
                
                // Waste someone else's time with your petty trading games. ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_155055_2238"));
                DC(int64(0x38b6cb107d0bcd57), EConversationDebugInfo::Done);
                DC(int64(0x38b6cb107d0bcd91), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x38b6cb107d0bcd91), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorkalom144135_0 : UTopic_SC_NOV_NYRAS_1303__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xcf6cde32246c7b5f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceCorkalom144135);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OG_PRAY_01", 600.0f, int64(0xcf6cde32246c7b5f));
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_NYRAS_1303", n"FP_OG_STAND_01", 300.0f, int64(0xcf6cde32246c7b5f));
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_OG_STAND_01", 500.0f, int64(0xcf6cde32246c7b5f));
            default Rules.HideIfKnows(UChoiceCorkalom144135_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x177894285efd165e), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b51), EConversationDebugInfo::Executing);
                // The whole mine? Are you sure of it?
                CorKalom.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_121705_1769"));
                DC(int64(0xcf6cde32246c7b51), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144135_1 : UTopic_SC_NOV_NYRAS_1303__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144135_0);
            default Rules.HideIfKnows(UChoiceCorkalom144135_1);
            default DebugId = int64(0xcf6cde32246c7b5f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b61), EConversationDebugInfo::Executing);
                
                // Yes, Master Kalom.
                Nyras.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_121816"));
                DC(int64(0xcf6cde32246c7b61), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144135_2 : UTopic_SC_NOV_NYRAS_1303__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144135_1);
            default Rules.HideIfKnows(UChoiceCorkalom144135_2);
            default DebugId = int64(0xcf6cde32246c7b5f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b62), EConversationDebugInfo::Executing);
                
                // I see. I wouldn't be surprised if it was the Sleeper's ...
                CorKalom.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_121828"));
                DC(int64(0xcf6cde32246c7b62), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144135_3 : UTopic_SC_NOV_NYRAS_1303__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144135_2);
            default Rules.HideIfKnows(UChoiceCorkalom144135_3);
            default DebugId = int64(0xcf6cde32246c7b5f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b63), EConversationDebugInfo::Executing);
                // These infidels got what they deserved. Just be on the ...
                CorKalom.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_121852"));
                DC(int64(0xcf6cde32246c7b63), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144135 : UTopic_SC_NOV_NYRAS_1303__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144135_3);
            default Rules.HideIfKnows(UChoiceCorkalom144135);
            default DebugId = int64(0xcf6cde32246c7b5f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b64), EConversationDebugInfo::Executing);
                
                // Of course, Master. 
                Nyras.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_121902"));
                DC(int64(0xcf6cde32246c7b64), EConversationDebugInfo::Done);
                DC(int64(0xd138248744c2c1fa), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Templar03))) { Templar03.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar03_1406_CampDivided); }
                DC(int64(0xd138248744c2c1fa), EConversationDebugInfo::Done);
                DC(int64(0xd138248744c2c218), EConversationDebugInfo::Executing);
                Nyras.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Nyras_1303_CampDivided);
                DC(int64(0xd138248744c2c218), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144650_0 : UTopic_SC_TPL_TEMPLAR03_1406__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x226b5dbfc9f37f36);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceCorkalom144650);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OG_PRAY_01", 600.0f, int64(0x226b5dbfc9f37f36));
            default Rules.RequireCharacterCloseToWaypoint(n"SC_TPL_TEMPLAR03_1406", n"FP_OG_STAND_01", 300.0f, int64(0x226b5dbfc9f37f36));
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_OG_STAND_01", 500.0f, int64(0x226b5dbfc9f37f36));
            default Rules.HideIfKnows(UChoiceCorkalom144650_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x177894285efd165e), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0x92603ee4bae36c91), Nyras != nullptr && Nyras.IsEveryoneOfThisKindDead());
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                if (Nyras != nullptr && !Nyras.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x226b5dbfc9f37f28), EConversationDebugInfo::Executing);
                // The whole mine? Are you sure of it?
                CorKalom.AI.Say(LocText("TEXT_WIP_MVXGRO_20250122_120137_41"));
                DC(int64(0x226b5dbfc9f37f28), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144650_1 : UTopic_SC_TPL_TEMPLAR03_1406__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144650_0);
            default Rules.HideIfKnows(UChoiceCorkalom144650_1);
            default DebugId = int64(0x226b5dbfc9f37f36);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd138248744c2c1e8), EConversationDebugInfo::Executing);
                
                // Yes, Master Kalom.
                Templar03.AI.Say(LocText("TEXT_WIP_MVXGRO_20250122_120240"));
                DC(int64(0xd138248744c2c1e8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144650_2 : UTopic_SC_TPL_TEMPLAR03_1406__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144650_1);
            default Rules.HideIfKnows(UChoiceCorkalom144650_2);
            default DebugId = int64(0x226b5dbfc9f37f36);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd138248744c2c1e9), EConversationDebugInfo::Executing);
                
                // I see. I wouldn't be surprised if it was the Sleeper's ...
                CorKalom.AI.Say(LocText("TEXT_WIP_MVXGRO_20250122_120255"));
                DC(int64(0xd138248744c2c1e9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144650_3 : UTopic_SC_TPL_TEMPLAR03_1406__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144650_2);
            default Rules.HideIfKnows(UChoiceCorkalom144650_3);
            default DebugId = int64(0x226b5dbfc9f37f36);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd138248744c2c1ea), EConversationDebugInfo::Executing);
                // These infidels got what they deserved. Just be on the ...
                CorKalom.AI.Say(LocText("TEXT_WIP_MVXGRO_20250122_120306"));
                DC(int64(0xd138248744c2c1ea), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144650 : UTopic_SC_TPL_TEMPLAR03_1406__SC_GUR_CORKALOM_1201
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalom144650_3);
            default Rules.HideIfKnows(UChoiceCorkalom144650);
            default DebugId = int64(0x226b5dbfc9f37f36);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd138248744c2c1eb), EConversationDebugInfo::Executing);
                
                // Of course, Master. 
                Templar03.AI.Say(LocText("TEXT_WIP_MVXGRO_20250122_120309"));
                DC(int64(0xd138248744c2c1eb), EConversationDebugInfo::Done);
                DC(int64(0xd138248744c2c1fa), EConversationDebugInfo::Executing);
                Templar03.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar03_1406_CampDivided);
                DC(int64(0xd138248744c2c1fa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom144653 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xcf6cde32246c7f16);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceCorkalom144653);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_CAINE_JOB_13_01"), int64(0xcf6cde32246c7f16));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a004), Caine != nullptr && Caine.IsCloseToCharacter(CorKalom, 500.0f));
                }
                
                return Caine != nullptr && Caine.IsCloseToCharacter(CorKalom, 500.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7f08), EConversationDebugInfo::Executing);
                // Less chatter, more work!
                CorKalom.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_143212_3068"));
                DC(int64(0xcf6cde32246c7f08), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom215071 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x39af4de912cc69c8);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_173155");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCorkalom215071);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39af4de912cc69d8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0x39af4de912cc69e6), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39af4de912cc69b9), EConversationDebugInfo::Executing);
                
                // This armor can surely be improved.
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_173155"));
                DC(int64(0x39af4de912cc69b9), EConversationDebugInfo::Done);
                DC(int64(0x39af4de912cc69ba), EConversationDebugInfo::Executing);
                
                // Take it to Baal Namib. Preferably right now.
                CorKalom.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_173155_2238"));
                DC(int64(0x39af4de912cc69ba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom85172 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x2d6d51135e5e6a41);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceCorkalom85172);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2d6d51135e5e6a44), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                    DB(int64(0xa0700e0deda91d5), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x608d6fba46cd818f), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0xdc24fe363c0a9c4a), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning());
                    DB(int64(0xa0700e0deda91d4), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x608d6fba46cd8190), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning() && Hero != nullptr && Hero.IsInConversation() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning() && Hero != nullptr && Hero.IsInConversation() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf8f9), EConversationDebugInfo::Executing);
                // Hm? Can't you see I'm-
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_194320"));
                DC(int64(0x927b2472124bf8f9), EConversationDebugInfo::Done);
                DB(int64(0xa0700e0deda9228), Hero != nullptr && Hero.HasSaid(LocText("GUR_1201_CORKALOM_EXPERIMENTE_15_00")));
                DB(int64(0xa0700e0deda9219), Hero != nullptr && Hero.HasSaid(LocText("GUR_1201_CORKALOM_WANNAJOIN_15_00")));
                DB(int64(0x927b2472124bf915), Hero != nullptr && Hero.HasSaid(LocText("GUR_1201_CORKALOM_WANNAJOIN_15_00")));
                
                if ((Hero != nullptr && Hero.HasSaid(LocText("GUR_1201_CORKALOM_EXPERIMENTE_15_00"))) || (Hero != nullptr && Hero.HasSaid(LocText("GUR_1201_CORKALOM_WANNAJOIN_15_00"))) || (Hero != nullptr && Hero.HasSaid(LocText("GUR_1201_CORKALOM_WANNAJOIN_15_00"))))
                {
                    DC(int64(0x927b2472124bf924), EConversationDebugInfo::Executing);
                    // Wait. Aren't you that green-blood who was milling about ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_194635_731"));
                    DC(int64(0x927b2472124bf924), EConversationDebugInfo::Done);
                    DC(int64(0x927b2472124bf93f), EConversationDebugInfo::Executing);
                    // Seems you found your people elsewhere. Good. We have no ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_194811"));
                    DC(int64(0x927b2472124bf93f), EConversationDebugInfo::Done);
                    DC(int64(0x927b2472124bf971), EConversationDebugInfo::Executing);
                    
                    // Actually, I was looking for your apprentice. Caine.
                    Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_195129"));
                    DC(int64(0x927b2472124bf971), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x927b2472124bf941), EConversationDebugInfo::Executing);
                    
                    // Wait, who are you? What do you want?
                    CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_194917_1340"));
                    DC(int64(0x927b2472124bf941), EConversationDebugInfo::Done);
                    DC(int64(0x927b2472124bf952), EConversationDebugInfo::Executing);
                    
                    // Actually, I was looking for your apprentice. Caine.
                    Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_195037"));
                    DC(int64(0x927b2472124bf952), EConversationDebugInfo::Done);
                }
                DC(int64(0x927b2472124bf953), EConversationDebugInfo::Executing);
                // About the smoke roll business, I presume. Well, you're ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_195059"));
                DC(int64(0x927b2472124bf953), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f2e), EConversationDebugInfo::Executing);
                
                // Where could he be?
                Hero.AI.Say(LocText("TEXT_WIP_LXHZGRJ_20240321_223808"));
                DC(int64(0xac160bfd93ad0f2e), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f2f), EConversationDebugInfo::Executing);
                
                // How should I know? Probably sleeping off his last smoke ...
                CorKalom.AI.Say(LocText("TEXT_WIP_LXHZGRJ_20240321_223836"));
                DC(int64(0xac160bfd93ad0f2f), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bfa03), EConversationDebugInfo::Executing);
                // Let me know when you find him. Now off with you, I got ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_200427"));
                DC(int64(0x927b2472124bfa03), EConversationDebugInfo::Done);
                DC(int64(0x10207616d2190cdd), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.StartQuest();
                DC(int64(0x10207616d2190cdd), EConversationDebugInfo::Done);
                DC(int64(0x8603ca974799eea1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Orry))) { Orry.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Orry_254_AbandonedMine); }
                DC(int64(0x8603ca974799eea1), EConversationDebugInfo::Done);
                DC(int64(0xf8e46ff6fc4040bb), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Orry))) { Orry.RemoveImmortality(); }
                DC(int64(0xf8e46ff6fc4040bb), EConversationDebugInfo::Done);
                DC(int64(0x9963c8355b43b6d8), EConversationDebugInfo::Executing);
                G1R.DeactivateStoryDataLayer("Storytelling_Womans_Revenge_02");
                DC(int64(0x9963c8355b43b6d8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorkalom85302 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xfc1eb38ef1f1806e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceCorkalom85302);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfc1eb38ef1f18071), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0));
                    DB(int64(0x608d6fba46cd816e), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa3421f1016cb3add), EConversationDebugInfo::Executing);
                // Look who it is. Tell me you found my useless apprentice. 
                CorKalom.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_193449"));
                DC(int64(0xa3421f1016cb3add), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f1806c), EConversationDebugInfo::Executing);
                
                // He's dead. 
                Hero.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_145744"));
                DC(int64(0xfc1eb38ef1f1806c), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f1806d), EConversationDebugInfo::Executing);
                
                // ... What?
                CorKalom.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_145744_2785"));
                DC(int64(0xfc1eb38ef1f1806d), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18072), EConversationDebugInfo::Executing);
                
                // Caine is dead. Seems like he had some vision that led ...
                Hero.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_145844"));
                DC(int64(0xfc1eb38ef1f18072), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18073), EConversationDebugInfo::Executing);
                
                // Well. How, uh, unexpected- unpleasant. But did you say ...
                CorKalom.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_145939"));
                DC(int64(0xfc1eb38ef1f18073), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f32), EConversationDebugInfo::Executing);
                // Tell me about this place. What was it like? And did you ...
                CorKalom.AI.Say(LocText("TEXT_WIP_LXHZGRJ_20240321_225440"));
                DC(int64(0xac160bfd93ad0f32), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18074), EConversationDebugInfo::Executing);
                
                // It looked like a really old grave. And yes, I found this ...
                Hero.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_150034"));
                DC(int64(0xfc1eb38ef1f18074), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_Amulet);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FINDINGCAINE, Document::UDocumentSegment_CH2_FINDINGCAINE_Completed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MEETYBERION, Document::UDocumentSegment_CH2_MEETYBERION_Start);
                DC(int64(0x80a569332c4ed0c9), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowAmulet);
                DC(int64(0x80a569332c4ed0c9), EConversationDebugInfo::Done);
                DC(int64(0xe3597da01d66389c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Orry))) { Orry.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Orry_254_Start); }
                DC(int64(0xe3597da01d66389c), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f1807d), EConversationDebugInfo::Executing);
                // That's ... that's incredible.
                CorKalom.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_152725"), ForceCameraPreset = n"TWO SHOT FLAT");
                DC(int64(0xfc1eb38ef1f1807d), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3af2), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_200829"));
                DC(int64(0xa3421f1016cb3af2), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f1807f), EConversationDebugInfo::Executing);
                
                // This amulet, it's pulsing with magic - that of the ...
                CorKalom.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_153447"), ForceCameraPreset = n"TWO SHOT COWBOY");
                DC(int64(0xfc1eb38ef1f1807f), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3af3), EConversationDebugInfo::Executing);
                
                // I-
                Hero.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_201218"));
                DC(int64(0xa3421f1016cb3af3), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3af4), EConversationDebugInfo::Executing);
                
                // Of course you don't. The Sleeper WANTED us to find this ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_201220"));
                DC(int64(0xa3421f1016cb3af4), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3af5), EConversationDebugInfo::Executing);
                // Now what ... ah, yes. Yes. You will show this amulet to ...
                CorKalom.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_201256"));
                DC(int64(0xa3421f1016cb3af5), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18080), EConversationDebugInfo::Executing);
                // The temple guards will let you through, tell them I said ...
                CorKalom.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_153530"));
                DC(int64(0xfc1eb38ef1f18080), EConversationDebugInfo::Done);
                Subdialog(
                    UCorKalom_88728,
                    UCorKalom_89379,
                    UCorKalom_91730
                );
            }
        }
        
        
        class UCorKalom_88728 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x9c7ad88e45e2dafc);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_153330_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_88728);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2dafd), EConversationDebugInfo::Executing);
                // How do you know this amulet belongs to the Sleeper? The ...
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_153330_41"));
                DC(int64(0x9c7ad88e45e2dafd), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db0d), EConversationDebugInfo::Executing);
                
                // Because I have a share of the Sleeper's might. I'd ...
                CorKalom.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_153448"));
                DC(int64(0x9c7ad88e45e2db0d), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db0e), EConversationDebugInfo::Executing);
                // The orc - a grave robber, maybe. Inconsequential ... It ...
                CorKalom.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_153503"));
                DC(int64(0x9c7ad88e45e2db0e), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2daff), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9c7ad88e45e2daff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_89379 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x20cea06813c703d3);
            default Caption = LocText("TEXT_WIP_JVXAWSC_20240411_195142_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_89379);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x20cea06813c703d4), EConversationDebugInfo::Executing);
                // How about a reward?
                Hero.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_195142_41"));
                DC(int64(0x20cea06813c703d4), EConversationDebugInfo::Done);
                DB(int64(0x20cea06813c7041c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x20cea06813c70437), EConversationDebugInfo::Executing);
                    // A reward?! Don't make me laugh, novice - meeting ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_195232"));
                    DC(int64(0x20cea06813c70437), EConversationDebugInfo::Done);
                    DC(int64(0x20cea06813c70446), EConversationDebugInfo::Executing);
                    // Now move!
                    CorKalom.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_195310"));
                    DC(int64(0x20cea06813c70446), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x20cea06813c70447), EConversationDebugInfo::Executing);
                    // You know, if the circumstances were any different, I'd ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_195319"));
                    DC(int64(0x20cea06813c70447), EConversationDebugInfo::Done);
                    DC(int64(0x20cea06813c70497), EConversationDebugInfo::Executing);
                    // But fine. If it's ore you're after, you'll get it - now ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_195507"));
                    DC(int64(0x20cea06813c70497), EConversationDebugInfo::Done);
                    DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                    CorKalom.AddItemToInventory(UItMi_Orenugget, 50);
                    DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                    DC(int64(0x34cd6856310692cd), EConversationDebugInfo::Executing);
                    CorKalom.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                    DC(int64(0x34cd6856310692cd), EConversationDebugInfo::Done);
                }
                DC(int64(0xfc1eb38ef1f18083), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_RETURN.SucceedQuest();
                DC(int64(0xfc1eb38ef1f18083), EConversationDebugInfo::Done);
                DC(int64(0x8dac6e9f52279528), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_SC = 0;
                DC(int64(0x8dac6e9f52279528), EConversationDebugInfo::Done);
                DC(int64(0xde08ee3482ca40f8), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_MEETYBERION.StartQuest();
                DC(int64(0xde08ee3482ca40f8), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18084), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfc1eb38ef1f18084), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UCorKalom_91730 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0xa3421f1016cb3b04);
            default Caption = LocText("TEXT_WIP_YSMTGUC_20240405_201436_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_91730);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa3421f1016cb3b05), EConversationDebugInfo::Executing);
                // I'll handle it.
                Hero.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_201436_3436"));
                DC(int64(0xa3421f1016cb3b05), EConversationDebugInfo::Done);
                DC(int64(0xbda6fb2f7f227289), EConversationDebugInfo::Executing);
                
                // Off with you.
                CorKalom.AI.Say(LocText("TEXT_WIP_KTMTGUC_20240409_183112"));
                DC(int64(0xbda6fb2f7f227289), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18083), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_RETURN.SucceedQuest();
                DC(int64(0xfc1eb38ef1f18083), EConversationDebugInfo::Done);
                DC(int64(0x8dac6e9f52279544), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_SC = 0;
                DC(int64(0x8dac6e9f52279544), EConversationDebugInfo::Done);
                DC(int64(0xde08ee3482ca40f6), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_MEETYBERION.StartQuest();
                DC(int64(0xde08ee3482ca40f6), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18084), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfc1eb38ef1f18084), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorkalomBringbook : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f0c9);
            default Caption = LocText("INFO_CORKALOM_BRINGBOOK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceCorkalomBringbook);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23f0ca), CorKalom != nullptr && CorKalom.HasAssignedDailyRoutine(UDailyRoutine_SC_GUR_CorKalom_1201_Callsleeper));
                }
                
                return CorKalom != nullptr && CorKalom.HasAssignedDailyRoutine(UDailyRoutine_SC_GUR_CorKalom_1201_Callsleeper);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f0cb), EConversationDebugInfo::Executing);
                // Can the Great Awakening begin?
                Hero.AI.Say(LocText("INFO_CORKALOM_BRINGBOOK_INFO_15_01"));
                DC(int64(0x4dfbe64a4f23f0cb), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f0cc), EConversationDebugInfo::Executing);
                
                // We have everything we need
                CorKalom.AI.Say(LocText("INFO_CORKALOM_BRINGBOOK_INFO_10_02"));
                DC(int64(0x4dfbe64a4f23f0cc), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f0cd), EConversationDebugInfo::Executing);
                // Yes. I'll prepare the invocation now.
                CorKalom.AI.Say(LocText("INFO_CORKALOM_BRINGBOOK_INFO_10_03"));
                DC(int64(0x4dfbe64a4f23f0cd), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f0ce), EConversationDebugInfo::Executing);
                
                // Where will it take place?
                Hero.AI.Say(LocText("INFO_CORKALOM_BRINGBOOK_INFO_15_04"));
                DC(int64(0x4dfbe64a4f23f0ce), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f0cf), EConversationDebugInfo::Executing);
                
                // Temple Square, at nighttime. That's where we will ...
                CorKalom.AI.Say(LocText("INFO_CORKALOM_BRINGBOOK_INFO_10_05"));
                DC(int64(0x4dfbe64a4f23f0cf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_PreparingInvocation);
                DC(int64(0x46d28e9d6b0ffe26), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x46d28e9d6b0ffe26), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorkalomBringfocus : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f054);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceCorkalomBringfocus);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KYPYEZL_20240326_121928_2238"), int64(0x4dfbe64a4f23f054));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23f055), Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_KALOM != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_KALOM.IsRunning());
                    DB(int64(0x4b3ffc5f01cbcaea), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xb054acec3aa7387a), G1R != nullptr && G1R.IsInChapter(2));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_KALOM != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_KALOM.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27adb4), EConversationDebugInfo::Executing);
                // Look, look, it's the man of the hour. So, Y'Berion has ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_152955"));
                DC(int64(0x2d52bbd05b27adb4), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27adb5), EConversationDebugInfo::Executing);
                // He's always been eccentric, but that's unexpected, even ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153226"));
                DC(int64(0x2d52bbd05b27adb5), EConversationDebugInfo::Done);
                DC(int64(0x4470dcbb2e2cb17d), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_KALOM.SucceedQuest();
                DC(int64(0x4470dcbb2e2cb17d), EConversationDebugInfo::Done);
                DC(int64(0x18a9217ecf66cb78), EConversationDebugInfo::Executing);
                G1R.InExtremoChapterEnd();
                DC(int64(0x18a9217ecf66cb78), EConversationDebugInfo::Done);
                Subdialog(
                    UCorKalom_99211,
                    UCorKalom_99191,
                    UCorKalom_99771
                );
            }
        }
        
        
        class UCorKalom_99211 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x2d52bbd05b27add5);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_153427_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_99211);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27add6), EConversationDebugInfo::Executing);
                // You know what happened? 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153427_153"));
                DC(int64(0x2d52bbd05b27add6), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ae4b), EConversationDebugInfo::Executing);
                
                // (scoffs) What do you think, that I'm just the stupid ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153933"));
                DC(int64(0x2d52bbd05b27ae4b), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ae4c), EConversationDebugInfo::Executing);
                // Frankly, I still have my doubts about Novice Nyras ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153939"));
                DC(int64(0x2d52bbd05b27ae4c), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27aec6), EConversationDebugInfo::Executing);
                // Who I am to question his will ... 
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_154711"));
                DC(int64(0x2d52bbd05b27aec6), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27add4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2d52bbd05b27add4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_99191 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x2d52bbd05b27add1);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_153427_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_99191);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27add2), EConversationDebugInfo::Executing);
                // Are you angry? YOU wanted me to see Y'Berion, didn't ...
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153427_2316"));
                DC(int64(0x2d52bbd05b27add2), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ae00), EConversationDebugInfo::Executing);
                
                // Believe me, if I were angry, you would know. 
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153518"));
                DC(int64(0x2d52bbd05b27ae00), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf192), EConversationDebugInfo::Executing);
                // And, yes, I did sent you to Master Y'Berion because I ...
                CorKalom.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_153810"));
                DC(int64(0xebd1924233aaf192), EConversationDebugInfo::Done);
                DB(int64(0x2d52bbd05b27ae0f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0x2d52bbd05b27ae39), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x2d52bbd05b27ae2b), EConversationDebugInfo::Executing);
                    // What I DIDN'T expect him to do is put one of the most ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153858_292"));
                    DC(int64(0x2d52bbd05b27ae2b), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x2d52bbd05b27aec8), EConversationDebugInfo::Executing);
                    // What I DIDN'T expect him to do is put one of the most ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_154845_2332"));
                    DC(int64(0x2d52bbd05b27aec8), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x2d52bbd05b27b07a), EConversationDebugInfo::Executing);
                    // What I DIDN'T expect him to do is put one of the most ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_155105_3334"));
                    DC(int64(0x2d52bbd05b27b07a), EConversationDebugInfo::Done);
                }
                DC(int64(0x2d52bbd05b27b088), EConversationDebugInfo::Executing);
                // Then you won't like what I'm about to tell you ... 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_155142"));
                DC(int64(0x2d52bbd05b27b088), EConversationDebugInfo::Done);
                DC(int64(0x4b3ffc5f01cbcb05), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4b3ffc5f01cbcb05), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_99771 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x2d52bbd05b27ae3a);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_153912_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_99771);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27ae3b), EConversationDebugInfo::Executing);
                // Y'Berion wants me to help you. Something about a ...
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_153912_94"));
                DC(int64(0x2d52bbd05b27ae3b), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b11c), EConversationDebugInfo::Executing);
                
                // ... Is this a joke? 
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_155509"));
                DC(int64(0x2d52bbd05b27b11c), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b11e), EConversationDebugInfo::Executing);
                
                // No.
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_155544"));
                DC(int64(0x2d52bbd05b27b11e), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b121), EConversationDebugInfo::Executing);
                
                // Sleeper curse it. Well, alright, if he wants to send you ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_155625"));
                DC(int64(0x2d52bbd05b27b121), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b120), EConversationDebugInfo::Executing);
                // Do you know what a "minecrawler" is?
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_155615"));
                DC(int64(0x2d52bbd05b27b120), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGur1201CorkalomSacheNein,
                    UChoiceGur1201CorkalomSacheJa
                );
                DC(int64(0x2d52bbd05b27b166), EConversationDebugInfo::Executing);
                // We've been hunting the crawlers for years, but, frankly, ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_160242"));
                DC(int64(0x2d52bbd05b27b166), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f073), EConversationDebugInfo::Executing);
                // Thankfully, the Sleeper recently sent me a vision, and ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_VISION_INFO_10_02"));
                DC(int64(0x4dfbe64a4f23f073), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f076), EConversationDebugInfo::Executing);
                
                // Sounds convenient ... 
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_VISION_INFO_15_05"));
                DC(int64(0x4dfbe64a4f23f076), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f077), EConversationDebugInfo::Executing);
                
                // Quiet, you fool! We think there's a nest in the Old Mine ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_VISION_INFO_10_06"));
                DC(int64(0x4dfbe64a4f23f077), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b167), EConversationDebugInfo::Executing);
                
                // You're looking for that nest, then. 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_162155"));
                DC(int64(0x2d52bbd05b27b167), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b168), EConversationDebugInfo::Executing);
                
                // Yes - but our templars couldn't find it yet. 
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_162206"));
                DC(int64(0x2d52bbd05b27b168), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGur1201CorkalomSacheNein : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f069);
            default Caption = LocText("GUR_1201_CORKALOM_SACHE_NEIN_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f06a), EConversationDebugInfo::Executing);
                
                // Can't say I do. 
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_SACHE_NEIN_15_01"));
                DC(int64(0x4dfbe64a4f23f06a), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f06b), EConversationDebugInfo::Executing);
                
                // They're dangerous monsters, lurking in caves and ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_SACHE_NEIN_10_02"));
                DC(int64(0x4dfbe64a4f23f06b), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f06c), EConversationDebugInfo::Executing);
                // Their mandibles contain a special kind of ichor from ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_SACHE_NEIN_10_03"));
                DC(int64(0x4dfbe64a4f23f06c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGur1201CorkalomSacheJa : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f06e);
            default Caption = LocText("GUR_1201_CORKALOM_SACHE_JA_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f06f), EConversationDebugInfo::Executing);
                
                // I do. 
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_SACHE_JA_15_01"));
                DC(int64(0x4dfbe64a4f23f06f), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f070), EConversationDebugInfo::Executing);
                
                // Good. Then you might already know that we use the ichor ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_SACHE_JA_10_02"));
                DC(int64(0x4dfbe64a4f23f070), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b122), EConversationDebugInfo::Executing);
                // The elixir we need to open our minds for communion with ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_160016"));
                DC(int64(0x2d52bbd05b27b122), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGur1201CorkalomBringweed : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23efd3);
            default Caption = LocText("GUR_1201_CORKALOM_BRINGWEED_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23efd4), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23efd5), EConversationDebugInfo::Executing);
                
                // I'm bringing you the daily swampweed harvest. 
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_BRINGWEED_15_00"));
                DC(int64(0x4dfbe64a4f23efd5), EConversationDebugInfo::Done);
                DC(int64(0x4e86cbd6c686cb25), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM.SucceedQuest();
                DC(int64(0x4e86cbd6c686cb25), EConversationDebugInfo::Done);
                DB(int64(0x4dfbe64a4f23efd7), Hero != nullptr && !Hero.HasItem(UItMi_Plants_Swampherb_01, 100, 0));
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Plants_Swampherb_01, 100, 0))
                {
                    DC(int64(0x4dfbe64a4f23efd8), EConversationDebugInfo::Executing);
                    // Are you, now? And what happened to the rest of the ...
                    CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_BRINGWEED_10_01"));
                    DC(int64(0x4dfbe64a4f23efd8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1201_corkalom_bringweed_exit_1");
                    DC(int64(0x4dfbe64a4f23efd9), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x4dfbe64a4f23efd9), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x4dfbe64a4f23efda), EConversationDebugInfo::Executing);
                    // Good. Now go. 
                    CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_BRINGWEED_10_02"));
                    DC(int64(0x4dfbe64a4f23efda), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_Completed);
                    DC(int64(0x988a6494be4149c6), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(CorKalom, UItMi_Plants_Swampherb_01, 100);
                    DC(int64(0x988a6494be4149c6), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be4149c8), EConversationDebugInfo::Executing);
                    CorKalom.RemoveItemFromInventory(UItMi_Plants_Swampherb_01, 100, 0);
                    DC(int64(0x988a6494be4149c8), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be4149ca), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN.SucceedQuest();
                    DC(int64(0x988a6494be4149ca), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1201_corkalom_bringweed_exit_2");
                    DC(int64(0x4dfbe64a4f23efe0), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x4dfbe64a4f23efe0), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGur1201CorkalomCrawlerzangen : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23efe1);
            default Caption = LocText("GUR_1201_CORKALOM_CRAWLERZANGEN_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23efe2), Hero != nullptr && Hero.HasItem(UItAt_Crawler_01, 1, 0));
                    DB(int64(0xa18ab10939953132), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    DB(int64(0x2425a25d0c6d2f01), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawler_01, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23efe3), EConversationDebugInfo::Executing);
                // I have some more minecrawler mandibles for you. Can you ...
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_CRAWLERZANGEN_15_00"));
                DC(int64(0x4dfbe64a4f23efe3), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eaca), EConversationDebugInfo::Executing);
                
                // Let's see ... 
                CorKalom.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_124811"));
                DC(int64(0xfd99951305c0eaca), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_Mandibles);
                DB(int64(0x4dfbe64a4f23efe5), Hero != nullptr && Hero.HasItem(UItAt_Crawler_01, 10, 0));
                DB(int64(0x4dfbe64a4f23efe9), Hero != nullptr && Hero.HasItem(UItAt_Crawler_01, 3, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Crawler_01, 10, 0))
                {
                    DC(int64(0x4dfbe64a4f23efe6), EConversationDebugInfo::Executing);
                    // Well, well, that's a lot of them. Yes, I'll take them. 
                    CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_CRAWLERZANGEN_10_01"));
                    DC(int64(0x4dfbe64a4f23efe6), EConversationDebugInfo::Done);
                    DC(int64(0xfd99951305c0eacb), EConversationDebugInfo::Executing);
                    // Here, take these: some of my best potions - you have ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_124835"));
                    DC(int64(0xfd99951305c0eacb), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be4149dc), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItFo_Potion_Mana_03, 3);
                    DC(int64(0x988a6494be4149dc), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be4149de), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(CorKalom, UItAt_Crawler_01, 10);
                    DC(int64(0x988a6494be4149de), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1201_corkalom_crawlerzangen_exit_1");
                }
                else if (Hero != nullptr && Hero.HasItem(UItAt_Crawler_01, 3, 0))
                {
                    DC(int64(0x4dfbe64a4f23efea), EConversationDebugInfo::Executing);
                    // Yes, I can use those. Here, this should do for a reward. 
                    CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_CRAWLERZANGEN_10_02"));
                    DC(int64(0x4dfbe64a4f23efea), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be4149e4), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItFo_Potion_Mana_02, 2);
                    DC(int64(0x988a6494be4149e4), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be4149e6), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(CorKalom, UItAt_Crawler_01, 3);
                    DC(int64(0x988a6494be4149e6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1201_corkalom_crawlerzangen_exit_2");
                }
                else
                {
                    DC(int64(0x4dfbe64a4f23efed), EConversationDebugInfo::Executing);
                    // What, that's all? Alright, I'll take them. Here, for ...
                    CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_CRAWLERZANGEN_10_03"));
                    DC(int64(0x4dfbe64a4f23efed), EConversationDebugInfo::Done);
                    DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                    CorKalom.AddItemToInventory(UItFo_Potion_Mana_01, 1);
                    DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be4149ec), EConversationDebugInfo::Executing);
                    CorKalom.AI.GiveItemTo(Hero, UItFo_Potion_Mana_01, 1);
                    DC(int64(0x988a6494be4149ec), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1201_corkalom_crawlerzangen_exit_3");
                }
            }
        }
        
        
        class UChoiceGur1201CorkalomExit : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f127);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f128), EConversationDebugInfo::Executing);
                // I'll be seeing you.
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_EXIT_15_01"));
                DC(int64(0x4dfbe64a4f23f128), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f129), EConversationDebugInfo::Executing);
                
                // No rush. 
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_EXIT_10_02"));
                DC(int64(0x4dfbe64a4f23f129), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f12a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4dfbe64a4f23f12a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGur1201CorkalomExperimente : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23efcf);
            default Caption = LocText("GUR_1201_CORKALOM_EXPERIMENTE_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceGur1201CorkalomExperimente);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23efd0), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23efd1), EConversationDebugInfo::Executing);
                // So, these experiments you do - what are they about?
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_EXPERIMENTE_15_00"));
                DC(int64(0x4dfbe64a4f23efd1), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23efd2), EConversationDebugInfo::Executing);
                
                // About things your limited intellect wouldn't understand ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_EXPERIMENTE_10_01"));
                DC(int64(0x4dfbe64a4f23efd2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_Introduction);
            }
        }
        
        
        class UChoiceGur1201CorkalomFirst : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23efbe);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23efbf), CorKalom != nullptr && CorKalom.IsInConversation());
                    DB(int64(0xd2670d8510013712), G1R.Kalom_TalkedTo == 0);
                    DB(int64(0xa0700e0deda9236), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && !Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                    DB(int64(0xa0700e0deda9237), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && !Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning());
                    DB(int64(0xbef6342035dec481), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (CorKalom != nullptr && !CorKalom.IsInConversation())
                    return false;
                
                if (G1R.Kalom_TalkedTo != 0)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23efc0), EConversationDebugInfo::Executing);
                // What do you want?
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_FIRST_10_00"));
                DC(int64(0x4dfbe64a4f23efc0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_Introduction);
                DC(int64(0x988a6494be414a03), EConversationDebugInfo::Executing);
                G1R.Kalom_TalkedTo = 1;
                DC(int64(0x988a6494be414a03), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGur1201CorkalomJoinpsi : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23eff2);
            default Caption = LocText("GUR_1201_CORKALOM_JOINPSI_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGur1201CorkalomWannajoin);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GUR_1201_CORKALOM_JOINPSI_10_08"), int64(0x4dfbe64a4f23eff2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23eff3), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x4dfbe64a4f23eff4), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x988a6494be414a4b), EConversationDebugInfo::Executing);
                G1R.Counter = 0;
                DC(int64(0x988a6494be414a4b), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23eff6), EConversationDebugInfo::Executing);
                // I think I've convinced the baals.
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_15_00"));
                DC(int64(0x4dfbe64a4f23eff6), EConversationDebugInfo::Done);
                DB(int64(0x4dfbe64a4f23eff8), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALORUN_GOTWEED_12_02")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALORUN_GOTWEED_12_02")))
                {
                    DC(int64(0x4dfbe64a4f23eff9), EConversationDebugInfo::Executing);
                    // Baal Orun said I'm a worthy servant of the Sleeper.
                    Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_15_01"));
                    DC(int64(0x4dfbe64a4f23eff9), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be414a45), EConversationDebugInfo::Executing);
                    G1R.Counter += 1;
                    DC(int64(0x988a6494be414a45), EConversationDebugInfo::Done);
                }
                DB(int64(0x4dfbe64a4f23effc), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALCADAR_SLEEPSPELL_02_03")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALCADAR_SLEEPSPELL_02_03")))
                {
                    DC(int64(0x4dfbe64a4f23effd), EConversationDebugInfo::Executing);
                    // Go on ...
                    CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_10_02"));
                    DC(int64(0x4dfbe64a4f23effd), EConversationDebugInfo::Done);
                    DC(int64(0x4dfbe64a4f23effe), EConversationDebugInfo::Executing);
                    
                    // Baal Cadar says I have a "natural affinity" for magic.
                    Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_15_03"));
                    DC(int64(0x4dfbe64a4f23effe), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be414a3d), EConversationDebugInfo::Executing);
                    G1R.Counter += 1;
                    DC(int64(0x988a6494be414a3d), EConversationDebugInfo::Done);
                }
                DB(int64(0x4dfbe64a4f23f001), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALNAMIB_FIRSTTALK_SLEEPER_02_01")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALNAMIB_FIRSTTALK_SLEEPER_02_01")))
                {
                    DC(int64(0x4dfbe64a4f23f002), EConversationDebugInfo::Executing);
                    // According to Baal Namib, I'm a true believer.
                    Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_15_04"));
                    DC(int64(0x4dfbe64a4f23f002), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be414a36), EConversationDebugInfo::Executing);
                    G1R.Counter += 1;
                    DC(int64(0x988a6494be414a36), EConversationDebugInfo::Done);
                }
                DB(int64(0x4dfbe64a4f23f005), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALTYON_VISION_11_05")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALTYON_VISION_11_05")))
                {
                    DC(int64(0x4dfbe64a4f23f006), EConversationDebugInfo::Executing);
                    // And I helped Baal Tyon have a vision.
                    Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_15_05"));
                    DC(int64(0x4dfbe64a4f23f006), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be414a2f), EConversationDebugInfo::Executing);
                    G1R.Counter += 1;
                    DC(int64(0x988a6494be414a2f), EConversationDebugInfo::Done);
                }
                DB(int64(0x4dfbe64a4f23f009), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALTONDRAL_SENDTOKALOM_13_01")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALTONDRAL_SENDTOKALOM_13_01")))
                {
                    DC(int64(0x4dfbe64a4f23f00a), EConversationDebugInfo::Executing);
                    // What else?
                    CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_10_06"));
                    DC(int64(0x4dfbe64a4f23f00a), EConversationDebugInfo::Done);
                    DC(int64(0x4dfbe64a4f23f00b), EConversationDebugInfo::Executing);
                    
                    // Baal Tondral also thinks I'm worthy. I found him a new ...
                    Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_15_07"));
                    DC(int64(0x4dfbe64a4f23f00b), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be414a27), EConversationDebugInfo::Executing);
                    G1R.Counter += 1;
                    DC(int64(0x988a6494be414a27), EConversationDebugInfo::Done);
                }
                DB(int64(0x4dfbe64a4f23f00e), Hero.GetLevelAttribute() >= 5);
                
                if (Hero.GetLevelAttribute() >= 5)
                {
                    DB(int64(0x4dfbe64a4f23f010), G1R.Counter >= 4);
                    
                    if (G1R.Counter >= 4)
                    {
                        DC(int64(0x4dfbe64a4f23f011), EConversationDebugInfo::Executing);
                        // All right, all right, that's enough. If you got that ...
                        CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_10_08"));
                        DC(int64(0x4dfbe64a4f23f011), EConversationDebugInfo::Done);
                        DC(int64(0x4dfbe64a4f23f012), EConversationDebugInfo::Executing);
                        // That said, before I accept you into our brotherhood and ...
                        CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_10_09"));
                        DC(int64(0x4dfbe64a4f23f012), EConversationDebugInfo::Done);
                        DC(int64(0xebd1924233aaf084), EConversationDebugInfo::Executing);
                        // An important one. 
                        CorKalom.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_150753"));
                        DC(int64(0xebd1924233aaf084), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gur_1201_corkalom_joinpsi_exit_1");
                    }
                    else
                    {
                        DC(int64(0x4dfbe64a4f23f01b), EConversationDebugInfo::Executing);
                        // And?
                        CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_NOT_10_00"));
                        DC(int64(0x4dfbe64a4f23f01b), EConversationDebugInfo::Done);
                        DC(int64(0x4dfbe64a4f23f01c), EConversationDebugInfo::Executing);
                        
                        // That was it. 
                        Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_NOT_15_01"));
                        DC(int64(0x4dfbe64a4f23f01c), EConversationDebugInfo::Done);
                        DC(int64(0x4dfbe64a4f23f01d), EConversationDebugInfo::Executing);
                        
                        // Then why are you wasting my time? Come back when you've ...
                        CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_NOT_10_02"));
                        DC(int64(0x4dfbe64a4f23f01d), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gur_1201_corkalom_joinpsi_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x62f63503a2eb8e56), EConversationDebugInfo::Executing);
                    // You're still too green to become part of our community. ...
                    CorKalom.AI.Say(LocText("TEXT_WIP_AYAISVL_20250613_175733"));
                    DC(int64(0x62f63503a2eb8e56), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1201_corkalom_joinpsi_exit_3");
                }
            }
        }
        
        
        class UChoiceGur1201CorkalomJoinpsi2 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f01e);
            default Caption = LocText("GUR_1201_CORKALOM_JOINPSI_15_10");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGur1201CorkalomJoinpsi2);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23f01f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0x4dfbe64a4f23f020), Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && !Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f021), EConversationDebugInfo::Executing);
                // I'm ready for your tasks, master. 
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_15_10"));
                DC(int64(0x4dfbe64a4f23f021), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f022), EConversationDebugInfo::Executing);
                
                // Good. One, I want you to take these swamp herbs and ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_10_11"));
                DC(int64(0x4dfbe64a4f23f022), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f025), EConversationDebugInfo::Executing);
                // Two, I want you to find my apprentice, Caine. That lazy ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_JOINPSI_10_14"));
                DC(int64(0x4dfbe64a4f23f025), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_KRAUTBOTE, Document::UDocumentSegment_CH2_KRAUTBOTE_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FINDINGCAINE, Document::UDocumentSegment_CH2_FINDINGCAINE_Start);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                CorKalom.AddItemToInventory(UItMi_Joint_03, 30);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a53), EConversationDebugInfo::Executing);
                CorKalom.AI.GiveItemTo(Hero, UItMi_Joint_03, 30);
                DC(int64(0x988a6494be414a53), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a55), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.StartQuest();
                DC(int64(0x988a6494be414a55), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f2e), EConversationDebugInfo::Executing);
                // Where could he be?
                Hero.AI.Say(LocText("TEXT_WIP_LXHZGRJ_20240321_223808"));
                DC(int64(0xac160bfd93ad0f2e), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f2f), EConversationDebugInfo::Executing);
                
                // How should I know? Probably sleeping off his last smoke ...
                CorKalom.AI.Say(LocText("TEXT_WIP_LXHZGRJ_20240321_223836"));
                DC(int64(0xac160bfd93ad0f2f), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bfa03), EConversationDebugInfo::Executing);
                // Let me know when you find him. Now off with you, I got ...
                CorKalom.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_200427"));
                DC(int64(0x927b2472124bfa03), EConversationDebugInfo::Done);
                DC(int64(0x10207616d2190cdd), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.StartQuest();
                DC(int64(0x10207616d2190cdd), EConversationDebugInfo::Done);
                DC(int64(0xcb6f5dcc2f119253), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Ch2); }
                DC(int64(0xcb6f5dcc2f119253), EConversationDebugInfo::Done);
                DC(int64(0xe3597da01d66389a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Orry))) { Orry.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Orry_254_AbandonedMine); }
                DC(int64(0xe3597da01d66389a), EConversationDebugInfo::Done);
                DC(int64(0xf8e46ff6fc4040b9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Orry))) { Orry.RemoveImmortality(); }
                DC(int64(0xf8e46ff6fc4040b9), EConversationDebugInfo::Done);
                DC(int64(0x9963c8355b43b6da), EConversationDebugInfo::Executing);
                G1R.DeactivateStoryDataLayer("Storytelling_Womans_Revenge_02");
                DC(int64(0x9963c8355b43b6da), EConversationDebugInfo::Done);
                DC(int64(0x9963c8355b43b6dc), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD40_292N))) { OC_GRD_GUARD40_292N.AddItemToInventory(UItMw_2H_Axe_Pickaxe, 1); }
                DC(int64(0x9963c8355b43b6dc), EConversationDebugInfo::Done);
                DC(int64(0x9963c8355b43b6de), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD40_292N))) { OC_GRD_GUARD40_292N.Inventory.EquipMeleeWeaponOfClass(UItMw_2H_Axe_Pickaxe); }
                DC(int64(0x9963c8355b43b6de), EConversationDebugInfo::Done);
                DC(int64(0x9963c8355b43b6e0), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD40_292N))) { OC_GRD_GUARD40_292N.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard40_292N_Mining); }
                DC(int64(0x9963c8355b43b6e0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGur1201CorkalomNest : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f07b);
            default Caption = LocText("TEXT_CHOICE_GUR_1201_CORKALOM_NEST");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorkalomBringfocus);
            default Rules.HideIfKnows(UChoiceGur1201CorkalomNest);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23f07c), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f07d), EConversationDebugInfo::Executing);
                // What do you want me to do?
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_NEST_INFO_15_01"));
                DC(int64(0x4dfbe64a4f23f07d), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f07e), EConversationDebugInfo::Executing);
                
                // I don't WANT you to do anything - Y'Berion does. And I ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_NEST_INFO_10_02"));
                DC(int64(0x4dfbe64a4f23f07e), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f07f), EConversationDebugInfo::Executing);
                // Still, if you're so eager to die, you can go find our ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_NEST_INFO_10_03"));
                DC(int64(0x4dfbe64a4f23f07f), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356de5), EConversationDebugInfo::Executing);
                // Before you head out, inform Cor Angar about this. He'll ...
                CorKalom.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_111312"));
                DC(int64(0x1170e0da2e356de5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_Start);
                DC(int64(0x988a6494be414a5e), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.StartQuest();
                DC(int64(0x988a6494be414a5e), EConversationDebugInfo::Done);
                Subdialog(
                    UCorKalom_87891,
                    UCorKalom_87947,
                    UCorKalom_88012,
                    UCorKalom_87911,
                    UCorKalom_91046,
                    UCorKalom_88049
                );
            }
        }
        
        
        class UCorKalom_87891 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x1170e0da2e356eb3);
            default Caption = LocText("TEXT_WIP_EJJNSVE_20240403_114257_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_87891);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e356eb4), EConversationDebugInfo::Executing);
                // Do you have anything that'll help me see down there?
                Hero.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_114257_2083"));
                DC(int64(0x1170e0da2e356eb4), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356ec8), EConversationDebugInfo::Executing);
                
                // Well - I suppose I can spare some light. Here, take ...
                CorKalom.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_114313"));
                DC(int64(0x1170e0da2e356ec8), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356ec9), EConversationDebugInfo::Executing);
                // Make sure to talk to the templars when you're there. ...
                CorKalom.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_114314"));
                DC(int64(0x1170e0da2e356ec9), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                CorKalom.AddItemToInventory(UItAr_Scroll_Light, 5);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414aab), EConversationDebugInfo::Executing);
                CorKalom.AI.GiveItemTo(Hero, UItAr_Scroll_Light, 5);
                DC(int64(0x988a6494be414aab), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356eb6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1170e0da2e356eb6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_87947 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x1170e0da2e356f0c);
            default Caption = LocText("TEXT_WIP_EJJNSVE_20240403_114359_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_87947);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e356f0d), EConversationDebugInfo::Executing);
                // That sounds like it's gonna be a bloody job. 
                Hero.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_114359_2785"));
                DC(int64(0x1170e0da2e356f0d), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356f1d), EConversationDebugInfo::Executing);
                
                // Just say you need healing poitions.
                CorKalom.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_114406"));
                DC(int64(0x1170e0da2e356f1d), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b17a), EConversationDebugInfo::Executing);
                
                // Thanks. 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_164134"));
                DC(int64(0x2d52bbd05b27b17a), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356f1e), EConversationDebugInfo::Executing);
                
                // I just need you to find the source. That's all that ...
                CorKalom.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_114413"));
                DC(int64(0x1170e0da2e356f1e), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                CorKalom.AddItemToInventory(UItFo_Potion_Health_02, 5);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a67), EConversationDebugInfo::Executing);
                CorKalom.AI.GiveItemTo(Hero, UItFo_Potion_Health_02, 5);
                DC(int64(0x988a6494be414a67), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356f0f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1170e0da2e356f0f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_88012 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x1170e0da2e357066);
            default Caption = LocText("TEXT_WIP_EJJNSVE_20240403_120143_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_88012);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e357067), EConversationDebugInfo::Executing);
                // If the templars didn't find that lair, how should I find ...
                Hero.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_120143_3436"));
                DC(int64(0x1170e0da2e357067), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e357091), EConversationDebugInfo::Executing);
                
                // That is an excellent question for the road. I'm sure ...
                CorKalom.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_120221"));
                DC(int64(0x1170e0da2e357091), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e357442), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1170e0da2e357442), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_87911 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x1170e0da2e356eb7);
            default Caption = LocText("TEXT_WIP_EJJNSVE_20240403_114257_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_87911);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("STT_301_IAN_HI_INFO_15_01"), int64(0x1170e0da2e356eb7));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GRD_260_DRAKE_MINE_INFO_15_01"), int64(0x1170e0da2e356eb7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x972d825c21d5d099), Hero != nullptr && !Hero.HasItem(UItWr_Map_OldMineSC, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItWr_Map_OldMineSC, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e356eb8), EConversationDebugInfo::Executing);
                // Where is the Old Mine? 
                Hero.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_114257_1924"));
                DC(int64(0x1170e0da2e356eb8), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e356f60), EConversationDebugInfo::Executing);
                
                // Northwest of here. But take this map - might spare you ...
                CorKalom.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_115051"));
                DC(int64(0x1170e0da2e356f60), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                CorKalom.AddItemToInventory(UItWr_Map_OldMineSC, 1);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x988a6494be414a77), EConversationDebugInfo::Executing);
                CorKalom.AI.GiveItemTo(Hero, UItWr_Map_OldMineSC, 1);
                DC(int64(0x988a6494be414a77), EConversationDebugInfo::Done);
                DC(int64(0xba8443f1d174eef8), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_MAP.StartQuest();
                DC(int64(0xba8443f1d174eef8), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e357434), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1170e0da2e357434), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_91046 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4b3ffc5f01cbcb2d);
            default Caption = LocText("TEXT_WIP_SRBFMML_20240416_105955_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_91046);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4b3ffc5f01cbcb2e), EConversationDebugInfo::Executing);
                // Where can I find Cor Angar?
                Hero.AI.Say(LocText("TEXT_WIP_SRBFMML_20240416_105955_41"));
                DC(int64(0x4b3ffc5f01cbcb2e), EConversationDebugInfo::Done);
                DC(int64(0x4b3ffc5f01cbcb3e), EConversationDebugInfo::Executing);
                
                // He is in the training area in the south of the camp.
                CorKalom.AI.Say(LocText("TEXT_WIP_SRBFMML_20240416_110022"));
                DC(int64(0x4b3ffc5f01cbcb3e), EConversationDebugInfo::Done);
                DC(int64(0x4b3ffc5f01cbcb30), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4b3ffc5f01cbcb30), EConversationDebugInfo::Done);
            }
        }
        
        
        class UCorKalom_88049 : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x1170e0da2e35711f);
            default Caption = LocText("TEXT_WIP_EJJNSVE_20240403_120724_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UCorKalom_88049);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e357120), EConversationDebugInfo::Executing);
                // Alright. I'll talk to Angar. 
                Hero.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_120724_3286"));
                DC(int64(0x1170e0da2e357120), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27b17b), EConversationDebugInfo::Executing);
                
                // Good. Don't die - at least not until after you've found ...
                CorKalom.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_164314"));
                DC(int64(0x2d52bbd05b27b17b), EConversationDebugInfo::Done);
                DC(int64(0x5c0f9dccebee74d9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5c0f9dccebee74d9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGur1201CorkalomRecipe : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23efcb);
            default Caption = LocText("TEXT_CHOICE_GUR_1201_CORKALOM_RECIPE");
            default PriorityRank = 4;
            
            default Rules.HideIfKnows(UChoiceGur1201CorkalomRecipe);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DEXTER_JOINOC_10_09"), int64(0x4dfbe64a4f23efcb));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23efcc), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23efcd), EConversationDebugInfo::Executing);
                // A peddler from the Old Camp wants the recipe for that ...
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_RECIPE_15_00"));
                DC(int64(0x4dfbe64a4f23efcd), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23efce), EConversationDebugInfo::Executing);
                
                // Are you joking? The dreamjuice is a sacred elixir, not ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_RECIPE_10_01"));
                DC(int64(0x4dfbe64a4f23efce), EConversationDebugInfo::Done);
                DC(int64(0x3e5a70141c9d6f96), EConversationDebugInfo::Executing);
                // I'll pretend you didn't ask that, just this once.
                CorKalom.AI.Say(LocText("TEXT_NISEA_20231228_144518"));
                DC(int64(0x3e5a70141c9d6f96), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_KALOMSRECIPE, Document::UDocumentSegment_CH1_KALOMSRECIPE_Chest);
            }
        }
        
        
        class UChoiceGur1201CorkalomWannajoin : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23efc2);
            default Caption = LocText("GUR_1201_CORKALOM_WANNAJOIN_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGur1201CorkalomWannajoin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23efc3), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23efc5), EConversationDebugInfo::Executing);
                // I heard you decide who becomes a novice and who doesn't. 
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_WANNAJOIN_15_00"));
                DC(int64(0x4dfbe64a4f23efc5), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23efc6), EConversationDebugInfo::Executing);
                // I want to join the Brotherhood. 
                Hero.AI.Say(LocText("GUR_1201_CORKALOM_WANNAJOIN_15_01"));
                DC(int64(0x4dfbe64a4f23efc6), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23efc7), EConversationDebugInfo::Executing);
                
                // Good for you. Then you hopefully already know I'm far ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_WANNAJOIN_10_02"));
                DC(int64(0x4dfbe64a4f23efc7), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23efc8), EConversationDebugInfo::Executing);
                // I trust the judgment of the other baals. If they think ...
                CorKalom.AI.Say(LocText("GUR_1201_CORKALOM_WANNAJOIN_10_03"));
                DC(int64(0x4dfbe64a4f23efc8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_CORKALOM, Document::UDocumentSegment_Glossary_SC_GUR_CORKALOM_JoinSC);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_KalomAdvice);
                DB(int64(0xe5a53d8516d2c853), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted())
                {
                    DC(int64(0x988a6494be414a9f), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI.StartQuest();
                    DC(int64(0x988a6494be414a9f), EConversationDebugInfo::Done);
                }
                DC(int64(0x4e86cbd6c686cb74), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM.SucceedQuest();
                DC(int64(0x4e86cbd6c686cb74), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba4df5), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CONVINCEBAAL.StartQuest();
                DC(int64(0x138d345a7dba4df5), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23efca), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4dfbe64a4f23efca), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKalomDrugmonopol : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f02c);
            default Caption = LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceKalomDrugmonopol);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23f02d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0x4dfbe64a4f23f02e), Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && !Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.HasBeenStarted());
                    DB(int64(0x5c0f9dccebee746c), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.HasBeenStarted())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f02f), EConversationDebugInfo::Executing);
                // Is there anything else I could do for you, master?
                Hero.AI.Say(LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_15_00"));
                DC(int64(0x4dfbe64a4f23f02f), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f030), EConversationDebugInfo::Executing);
                
                // Hm ... actually, there might be. There's a bunch of New ...
                CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_10_01"));
                DC(int64(0x4dfbe64a4f23f030), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f031), EConversationDebugInfo::Executing);
                // Take care of it.
                CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_10_03"));
                DC(int64(0x4dfbe64a4f23f031), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f032), EConversationDebugInfo::Executing);
                
                // How?
                Hero.AI.Say(LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_15_04"));
                DC(int64(0x4dfbe64a4f23f032), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f033), EConversationDebugInfo::Executing);
                
                // I don't care! You figure it out!
                CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_10_05"));
                DC(int64(0x4dfbe64a4f23f033), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f034), EConversationDebugInfo::Executing);
                // Apparently those "herbalists" have their laboratory ...
                CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_10_06"));
                DC(int64(0x4dfbe64a4f23f034), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DRUGMONOPOL, Document::UDocumentSegment_CH1_DRUGMONOPOL_Start);
                DC(int64(0x988a6494be414ab3), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.StartQuest();
                DC(int64(0x988a6494be414ab3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKalomKrautboteback : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f047);
            default Caption = LocText("MIS_1_PSI_KALOM_KRAUTBOTEBACK_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23f048), G1R.Kalom_DeliveredWeed != 0);
                    DB(int64(0x4dfbe64a4f23f049), Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning());
                }
                
                if (G1R.Kalom_DeliveredWeed == 0)
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && !Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f04a), EConversationDebugInfo::Executing);
                // I brought Gomez his herbs.
                Hero.AI.Say(LocText("MIS_1_PSI_KALOM_KRAUTBOTEBACK_15_00"));
                DC(int64(0x4dfbe64a4f23f04a), EConversationDebugInfo::Done);
                DB(int64(0x4dfbe64a4f23f04c), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0))
                {
                    DC(int64(0x4dfbe64a4f23f04d), EConversationDebugInfo::Executing);
                    // Good. Now go make yourself useful some other way.
                    CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_KRAUTBOTEBACK_10_01"));
                    DC(int64(0x4dfbe64a4f23f04d), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_KRAUTBOTE, Document::UDocumentSegment_CH2_KRAUTBOTE_Completed);
                    DC(int64(0x988a6494be414ac3), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_RETURN.SucceedQuest();
                    DC(int64(0x988a6494be414ac3), EConversationDebugInfo::Done);
                    DC(int64(0x988a6494be414ac5), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(CorKalom, UItMi_Orenugget, 500);
                    DC(int64(0x988a6494be414ac5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kalom_krautboteback_exit_1");
                }
                else
                {
                    DC(int64(0x4dfbe64a4f23f053), EConversationDebugInfo::Executing);
                    // Then where are the five-hundred nuggets? Don't you even ...
                    CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_KRAUTBOTEBACK_10_02"));
                    DC(int64(0x4dfbe64a4f23f053), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kalom_krautboteback_exit_2");
                }
            }
        }
        
        
        class UChoiceKalomSuccess : UTopic_Hero__SC_GUR_CORKALOM_1201
        {
            default DebugId = int64(0x4dfbe64a4f23f037);
            default Caption = LocText("MIS_1_PSI_KALOM_SUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKalomDrugmonopol);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4dfbe64a4f23f038), Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dfbe64a4f23f039), EConversationDebugInfo::Executing);
                // About those herbalists from the New Camp ... 
                Hero.AI.Say(LocText("MIS_1_PSI_KALOM_SUCCESS_15_00"));
                DC(int64(0x4dfbe64a4f23f039), EConversationDebugInfo::Done);
                DC(int64(0x4dfbe64a4f23f03a), EConversationDebugInfo::Executing);
                
                // Yes?
                CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_SUCCESS_10_01"));
                DC(int64(0x4dfbe64a4f23f03a), EConversationDebugInfo::Done);
                DB(int64(0x4dfbe64a4f23f03f), G1R.Jacko_Fled == 1);
                DB(int64(0x4dfbe64a4f23f040), Jacko != nullptr && Jacko.IsEveryoneOfThisKindDead());
                DB(int64(0x4dfbe64a4f23f041), Killian != nullptr && Killian.IsEveryoneOfThisKindDead());
                DB(int64(0x4dfbe64a4f23f042), Renyu != nullptr && Renyu.IsEveryoneOfThisKindDead());
                DB(int64(0x4dfbe64a4f23f03c), G1R.Jacko_Fled == 0);
                
                if ((G1R.Jacko_Fled == 1) || ((Jacko != nullptr && Jacko.IsEveryoneOfThisKindDead() && Killian != nullptr && Killian.IsEveryoneOfThisKindDead() && Renyu != nullptr && Renyu.IsEveryoneOfThisKindDead())))
                {
                    DC(int64(0x4dfbe64a4f23f043), EConversationDebugInfo::Executing);
                    // They're out of business.
                    Hero.AI.Say(LocText("MIS_1_PSI_KALOM_SUCCESS_15_04"));
                    DC(int64(0x4dfbe64a4f23f043), EConversationDebugInfo::Done);
                    DC(int64(0x4dfbe64a4f23f044), EConversationDebugInfo::Executing);
                    
                    // Are they, now. Huh ... maybe you could be of use to us ...
                    CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_SUCCESS_10_05"));
                    DC(int64(0x4dfbe64a4f23f044), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DRUGMONOPOL, Document::UDocumentSegment_CH1_DRUGMONOPOL_Completed);
                    DC(int64(0x988a6494be414ada), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT.SucceedQuest();
                    DC(int64(0x988a6494be414ada), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kalom_success_exit_1");
                }
                else if (G1R.Jacko_Fled == 0)
                {
                    DC(int64(0x4dfbe64a4f23f03d), EConversationDebugInfo::Executing);
                    // I can't find them.
                    Hero.AI.Say(LocText("MIS_1_PSI_KALOM_SUCCESS_15_02"));
                    DC(int64(0x4dfbe64a4f23f03d), EConversationDebugInfo::Done);
                    DC(int64(0x4dfbe64a4f23f03e), EConversationDebugInfo::Executing);
                    
                    // Just what I expected. Then try harder!
                    CorKalom.AI.Say(LocText("MIS_1_PSI_KALOM_SUCCESS_10_03"));
                    DC(int64(0x4dfbe64a4f23f03e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kalom_success_exit_2");
                }
                else
                {
                    
                    Other.Remember(n"choice_kalom_success_exit_3");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */