#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_EBR_RAVEN_105 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_EBR_RAVEN_105";
        }
        
        
        class UTopic_OC_EBR_BARTHOLO_106__OC_EBR_RAVEN_105 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_EBR_RAVEN_105";
            default WithCharacter = n"OC_EBR_BARTHOLO_106";
            
            AGothicCharacterState GetRaven() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMINECRAWLER_QUEEN() const property
            {
                return GetCharacter(n"MINECRAWLER_QUEEN");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD04_218() const property
            {
                return GetCharacter(n"OC_GRD_GUARD04_218");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD25_245() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD29_279() const property
            {
                return GetCharacter(n"OC_GRD_GUARD29_279");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UTopic_Hero__OC_EBR_RAVEN_105 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_EBR_RAVEN_105";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRaven() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMINECRAWLER_QUEEN() const property
            {
                return GetCharacter(n"MINECRAWLER_QUEEN");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD04_218() const property
            {
                return GetCharacter(n"OC_GRD_GUARD04_218");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD25_245() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD29_279() const property
            {
                return GetCharacter(n"OC_GRD_GUARD29_279");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UChoiceRaven105978_0 : UTopic_OC_EBR_BARTHOLO_106__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x139618153f07757c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceRaven105978);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.HideIfKnows(UChoiceRaven105978_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x139618153f07756e), Hero != nullptr && Hero.IsCloseToCharacter(Raven, 1200.0f));
                    DB(int64(0x5b76997c88e39d5c), Bartholo != nullptr && Bartholo.HasAssignedDailyRoutine(UDailyRoutine_OC_EBR_Bartholo_106_OMFlood));
                    DB(int64(0x5b76997c88e39deb), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Raven, 1200.0f))
                    return false;
                
                if (Bartholo != nullptr && !Bartholo.HasAssignedDailyRoutine(UDailyRoutine_OC_EBR_Bartholo_106_OMFlood))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139618153f077579), EConversationDebugInfo::Executing);
                // ... not a word. Is that clear? 
                Raven.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_151641_3286"));
                DC(int64(0x139618153f077579), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven105978_1 : UTopic_OC_EBR_BARTHOLO_106__OC_EBR_RAVEN_105
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRaven105978_0);
            default Rules.HideIfKnows(UChoiceRaven105978_1);
            default DebugId = int64(0x139618153f07757c);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139618153f077583), EConversationDebugInfo::Executing);
                
                // But they'll notice we're out of ore sooner or later! Why ...
                Bartholo.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_151657"));
                DC(int64(0x139618153f077583), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven105978_2 : UTopic_OC_EBR_BARTHOLO_106__OC_EBR_RAVEN_105
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRaven105978_1);
            default Rules.HideIfKnows(UChoiceRaven105978_2);
            default DebugId = int64(0x139618153f07757c);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139618153f077584), EConversationDebugInfo::Executing);
                
                // Gomez made his choice. Do you want to discuss this with ...
                Raven.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_151700"));
                DC(int64(0x139618153f077584), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven105978 : UTopic_OC_EBR_BARTHOLO_106__OC_EBR_RAVEN_105
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRaven105978_2);
            default Rules.HideIfKnows(UChoiceRaven105978);
            default DebugId = int64(0x139618153f07757c);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139618153f077585), EConversationDebugInfo::Executing);
                
                //  ... no. Of course not. 
                Bartholo.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_151701"));
                DC(int64(0x139618153f077585), EConversationDebugInfo::Done);
                DC(int64(0x139618153f077587), EConversationDebugInfo::Executing);
                Raven.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Raven_105_Start);
                DC(int64(0x139618153f077587), EConversationDebugInfo::Done);
                DC(int64(0x139618153f07758b), EConversationDebugInfo::Executing);
                Bartholo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Bartholo_106_Start);
                DC(int64(0x139618153f07758b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven214972 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x39af4de912cc698a);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_172238");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRaven85519);
            default Rules.HideIfKnows(UChoiceRaven214972);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5a2abaecd04c5658), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x5a2abaecd04c565c), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39af4de912cc6985), EConversationDebugInfo::Executing);
                // Can I improve this shadow armor?
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_172238"));
                DC(int64(0x39af4de912cc6985), EConversationDebugInfo::Done);
                DC(int64(0x39af4de912cc6986), EConversationDebugInfo::Executing);
                
                // Ask Fisk.
                Raven.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_172238_41"));
                DC(int64(0x39af4de912cc6986), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven82504 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xaa9b1385eda1a711);
            default Caption = LocText("TEXT_WIP_SREDFEF_20240306_121535");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRaven85519);
            default Rules.HideIfKnows(UChoiceRaven82504);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaa9b1385eda1a70f), EConversationDebugInfo::Executing);
                
                // You have a spy in the Brotherhood?
                Hero.AI.Say(LocText("TEXT_WIP_SREDFEF_20240306_121535"));
                DC(int64(0xaa9b1385eda1a70f), EConversationDebugInfo::Done);
                DC(int64(0xaa9b1385eda1a710), EConversationDebugInfo::Executing);
                
                // Everyone has spies everywhere, Shadow. But, yes, Caine ...
                Raven.AI.Say(LocText("TEXT_WIP_SREDFEF_20240306_121535_41"));
                DC(int64(0xaa9b1385eda1a710), EConversationDebugInfo::Done);
                DC(int64(0xb61f21a4ae3af64f), EConversationDebugInfo::Executing);
                // He's a novice who made some bad decisions that we took ...
                Raven.AI.Say(LocText("TEXT_WIP_UVSGWPJ_20240313_174009"));
                DC(int64(0xb61f21a4ae3af64f), EConversationDebugInfo::Done);
                DC(int64(0xb61f21a4ae3af650), EConversationDebugInfo::Executing);
                
                // What decisions?
                Hero.AI.Say(LocText("TEXT_WIP_UVSGWPJ_20240313_174035"));
                DC(int64(0xb61f21a4ae3af650), EConversationDebugInfo::Done);
                DC(int64(0xb61f21a4ae3af651), EConversationDebugInfo::Executing);
                
                // None of your business. 
                Raven.AI.Say(LocText("TEXT_WIP_UVSGWPJ_20240313_174041"));
                DC(int64(0xb61f21a4ae3af651), EConversationDebugInfo::Done);
                DC(int64(0xb61f21a4ae3af652), EConversationDebugInfo::Executing);
                // Move your arse to the swamp, and do what I asked of you. ...
                Raven.AI.Say(LocText("TEXT_WIP_UVSGWPJ_20240313_174405"));
                DC(int64(0xb61f21a4ae3af652), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven84750 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xfc1eb38ef1f18060);
            default Caption = LocText("TEXT_WIP_RWAGUXL_20240314_134226");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRaven84750);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdc24fe363c0a9c1d), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                    DB(int64(0xdc24fe363c0a9c1e), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasSucceeded());
                    DB(int64(0xfc1eb38ef1f18063), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                    DB(int64(0xfc1eb38ef1f18064), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasSucceeded())
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning() && Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfc1eb38ef1f1805e), EConversationDebugInfo::Executing);
                
                // Caine is dead. 
                Hero.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_134226"));
                DC(int64(0xfc1eb38ef1f1805e), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18067), EConversationDebugInfo::Executing);
                
                // Beliar's- Didn't I say, be discreet? 
                Raven.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_135929"));
                DC(int64(0xfc1eb38ef1f18067), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18066), EConversationDebugInfo::Executing);
                
                // Not my fault. He had visions that led him to a tomb in ...
                Hero.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_135225"));
                DC(int64(0xfc1eb38ef1f18066), EConversationDebugInfo::Done);
                DC(int64(0xfc1eb38ef1f18069), EConversationDebugInfo::Executing);
                
                // Are you sure YOU didn't smoke too much of their weeds? 
                Raven.AI.Say(LocText("TEXT_WIP_RWAGUXL_20240314_140218"));
                DC(int64(0xfc1eb38ef1f18069), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf65f), EConversationDebugInfo::Executing);
                
                // I wish. No, Caine is dead, and he had this with him - ...
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_180213"));
                DC(int64(0x927b2472124bf65f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GOTOPSI, Document::UDocumentSegment_CH2_GOTOPSI_AfterReport);
                DC(int64(0x7ead4f64976bd42b), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowAmulet);
                DC(int64(0x7ead4f64976bd42b), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf660), EConversationDebugInfo::Executing);
                // Strange. Maybe the mages- Hm, you know what, nevermind. ...
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_180231"));
                DC(int64(0x927b2472124bf660), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf661), EConversationDebugInfo::Executing);
                // I know the Loons, they're superstitious and desperate ...
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_180356"));
                DC(int64(0x927b2472124bf661), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b045a52), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_REPORT.SucceedQuest();
                DC(int64(0x45363f081b045a52), EConversationDebugInfo::Done);
                DC(int64(0xfaea3afa984676ef), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_CONFIDENCE.StartQuest();
                DC(int64(0xfaea3afa984676ef), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Raven_89120,
                    UTopic_Raven_89140,
                    UTopic_Raven_89914
                );
            }
        }
        
        
        class UTopic_Raven_89120 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x927b2472124bf68e);
            default Caption = LocText("TEXT_WIP_BTMTGUC_20240402_180858_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_89120);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf68f), EConversationDebugInfo::Executing);
                // Why are the Loons so important to you?
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_180858_2785"));
                DC(int64(0x927b2472124bf68f), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf69a), EConversationDebugInfo::Executing);
                
                // I told you already - disillusioned cultists are ...
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_180940"));
                DC(int64(0x927b2472124bf69a), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf69b), EConversationDebugInfo::Executing);
                // We've been trying to get moles close to Y'Berion, but ...
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_180953"));
                DC(int64(0x927b2472124bf69b), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf69c), EConversationDebugInfo::Executing);
                // You might just be the in we've been waiting for. 
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_181105"));
                DC(int64(0x927b2472124bf69c), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf691), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x927b2472124bf691), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Raven_89140 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x927b2472124bf692);
            default Caption = LocText("TEXT_WIP_BTMTGUC_20240402_180858_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_89140);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x57f930851c54cdf3), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf693), EConversationDebugInfo::Executing);
                // I'll see what I can do. 
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_180858_3286"));
                DC(int64(0x927b2472124bf693), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf6a3), EConversationDebugInfo::Executing);
                
                // I'm counting on it. Here - for a job well done.
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_181201"));
                DC(int64(0x927b2472124bf6a3), EConversationDebugInfo::Done);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Raven.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0xf25b89036f3b1d2), EConversationDebugInfo::Executing);
                Raven.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0xf25b89036f3b1d2), EConversationDebugInfo::Done);
                DC(int64(0xf25b89036f3b1d6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf25b89036f3b1d6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Raven_89914 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x927b2472124bf6ac);
            default Caption = LocText("TEXT_WIP_BTMTGUC_20240402_181257_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_89914);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x927b2472124bf6b5), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasSucceeded());
                    DB(int64(0x14d3940dc24336ea), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.HasBeenStarted());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf6ad), EConversationDebugInfo::Executing);
                // I already did that. Cor Kalom wants me to show that ...
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_181257_686"));
                DC(int64(0x927b2472124bf6ad), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf6ce), EConversationDebugInfo::Executing);
                
                // Does he, now? I'm almost tempted to take it myself. 
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_181409"));
                DC(int64(0x927b2472124bf6ce), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf6cf), EConversationDebugInfo::Executing);
                // Good thinking, though. Then go talk to him. And stay in ...
                Raven.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_181429"));
                DC(int64(0x927b2472124bf6cf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven85519 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x59245830ef758fde);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceRaven85519);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_GOMEZ_DABEI_11_01"), int64(0x59245830ef758fde));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf61731fae4c1ef0e), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9abbd37ababe159e), EConversationDebugInfo::Executing);
                // I take it you're in?
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_190008"));
                DC(int64(0x9abbd37ababe159e), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851f2), EConversationDebugInfo::Executing);
                
                // Yes. Gomez said you have armor for me?
                Hero.AI.Say(LocText("DIA_RAVEN_BINDABEI_15_00"));
                DC(int64(0xd024b889f23851f2), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851f4), EConversationDebugInfo::Executing);
                
                // I do. And I also have your first job. 
                Raven.AI.Say(LocText("DIA_RAVEN_BINDABEI_10_02"));
                DC(int64(0xd024b889f23851f4), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe159f), EConversationDebugInfo::Executing);
                // If you're as good at making connections as you say, it ...
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191512"));
                DC(int64(0x9abbd37ababe159f), EConversationDebugInfo::Done);
                DC(int64(0xb5111c5d008ec19a), EConversationDebugInfo::Executing);
                // Have you been to the Swamp Camp? 
                Raven.AI.Say(LocText("TEXT_WIP_UVSGWPJ_20240313_172024"));
                DC(int64(0xb5111c5d008ec19a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_RAVEN, Document::UDocumentSegment_Glossary_OC_EBR_RAVEN_SwampCamp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GOTOPSI, Document::UDocumentSegment_CH2_GOTOPSI_Start);
                DC(int64(0x48bed3b8afff84d1), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UStt_Armor, 1);
                DC(int64(0x48bed3b8afff84d1), EConversationDebugInfo::Done);
                DC(int64(0x59245830ef758fe2), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipArmorOfClass(UStt_Armor);
                DC(int64(0x59245830ef758fe2), EConversationDebugInfo::Done);
                DC(int64(0x2d6d51135e5e6a39), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Caine))) { Caine.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Caine_1301_Dead); }
                DC(int64(0x2d6d51135e5e6a39), EConversationDebugInfo::Done);
                DC(int64(0x608d6fba46cd81bf), EConversationDebugInfo::Executing);
                G1R.ActivateStoryDataLayer("FindingCaine");
                DC(int64(0x608d6fba46cd81bf), EConversationDebugInfo::Done);
                DC(int64(0x608d6fba46cd81e6), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnFindingCaine");
                DC(int64(0x608d6fba46cd81e6), EConversationDebugInfo::Done);
                DC(int64(0x8fd0f17b65ab4335), EConversationDebugInfo::Executing);
                G1R.CaineVanished = 1;
                DC(int64(0x8fd0f17b65ab4335), EConversationDebugInfo::Done);
                DC(int64(0x28003880c3e01fab), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Caine))) { Caine.NPCState.RemoveFromWorld(); }
                DC(int64(0x28003880c3e01fab), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Raven_93313,
                    UTopic_Raven_93333
                );
                DC(int64(0x9abbd37ababe15ac), EConversationDebugInfo::Executing);
                // You know we trade with the Brotherhood. However, that ...
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191739_3984"));
                DC(int64(0x9abbd37ababe15ac), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe15ad), EConversationDebugInfo::Executing);
                // Especially not with all that talk about big rituals ...
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191814"));
                DC(int64(0x9abbd37ababe15ad), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe15ae), EConversationDebugInfo::Executing);
                // We have a mole there, a novice called Caine.
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191824"));
                DC(int64(0x9abbd37ababe15ae), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe15af), EConversationDebugInfo::Executing);
                // You'll head to their camp and get his latest report from ...
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191829"));
                DC(int64(0x9abbd37ababe15af), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe15b0), EConversationDebugInfo::Executing);
                // Obviously, you'll have to be discreet. Don't just talk ...
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191834"));
                DC(int64(0x9abbd37ababe15b0), EConversationDebugInfo::Done);
                DC(int64(0xa5fa5951749c67e4), EConversationDebugInfo::Executing);
                
                // Yeah.
                Hero.AI.Say(LocText("TEXT_WIP_HGLOWIC_20240323_183620"));
                DC(int64(0xa5fa5951749c67e4), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe15b1), EConversationDebugInfo::Executing);
                
                // Good. I'll be waiting for your report. 
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191840"));
                DC(int64(0x9abbd37ababe15b1), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8517), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_GOTOPSI.StartQuest();
                DC(int64(0x48bed3b8afff8517), EConversationDebugInfo::Done);
                DC(int64(0xcd79baef75cee1f6), EConversationDebugInfo::Executing);
                G1R.ChangeChapter(2);
                DC(int64(0xcd79baef75cee1f6), EConversationDebugInfo::Done);
                DC(int64(0xcb6f5dcc2f119242), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Ch2); }
                DC(int64(0xcb6f5dcc2f119242), EConversationDebugInfo::Done);
                DC(int64(0x253651f482b4e5f9), EConversationDebugInfo::Executing);
                G1R.Fingers_CanTeach = 1;
                DC(int64(0x253651f482b4e5f9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Raven_93313 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x9abbd37ababe15a1);
            default Caption = LocText("TEXT_WIP_GGLOWIC_20240322_191536_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_93313);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9abbd37ababe15a2), EConversationDebugInfo::Executing);
                // Not yet. 
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191536_3286"));
                DC(int64(0x9abbd37ababe15a2), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe15a9), EConversationDebugInfo::Executing);
                
                // I see. You can go talk to Baal Parvez, he can show you ...
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191627"));
                DC(int64(0x9abbd37ababe15a9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Raven_93333 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x9abbd37ababe15a5);
            default Caption = LocText("TEXT_WIP_GGLOWIC_20240322_191536_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_93333);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9abbd37ababe15a6), EConversationDebugInfo::Executing);
                
                // I have. 
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191536_2386"));
                DC(int64(0x9abbd37ababe15a6), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe15aa), EConversationDebugInfo::Executing);
                
                // Good. 
                Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191654"));
                DC(int64(0x9abbd37ababe15aa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven89520 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xa5fa5951749c67e7);
            default Caption = LocText("TEXT_WIP_HGLOWIC_20240323_184812");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRaven85519);
            default Rules.HideIfKnows(UChoiceRaven89520);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5fa5951749c67e5), EConversationDebugInfo::Executing);
                
                // Do you believe in the Sleeper?
                Hero.AI.Say(LocText("TEXT_WIP_HGLOWIC_20240323_184812"));
                DC(int64(0xa5fa5951749c67e5), EConversationDebugInfo::Done);
                DC(int64(0xa5fa5951749c67e6), EConversationDebugInfo::Executing);
                
                // Me? No. But they do, and if that god of theirs doesn't ...
                Raven.AI.Say(LocText("TEXT_WIP_HGLOWIC_20240323_184812_41"));
                DC(int64(0xa5fa5951749c67e6), EConversationDebugInfo::Done);
                DC(int64(0x227f4d3778d4eba5), EConversationDebugInfo::Executing);
                
                // Why? 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_174453"));
                DC(int64(0x227f4d3778d4eba5), EConversationDebugInfo::Done);
                DC(int64(0x227f4d3778d4eba6), EConversationDebugInfo::Executing);
                
                // Because disillusioned men question their leaders, and a ...
                Raven.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_174502"));
                DC(int64(0x227f4d3778d4eba6), EConversationDebugInfo::Done);
                DC(int64(0x227f4d3778d4eba7), EConversationDebugInfo::Executing);
                // As ridiculous as this crew of drugged idiots is, ...
                Raven.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_174548"));
                DC(int64(0x227f4d3778d4eba7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven89985 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xa5fa5951749c67ed);
            default Caption = LocText("TEXT_WIP_HGLOWIC_20240323_185247");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRaven85519);
            default Rules.HideIfKnows(UChoiceRaven89985);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5fa5951749c67eb), EConversationDebugInfo::Executing);
                
                // Will they let me snoop around their camp as a Shadow?
                Hero.AI.Say(LocText("TEXT_WIP_HGLOWIC_20240323_185247"));
                DC(int64(0xa5fa5951749c67eb), EConversationDebugInfo::Done);
                DC(int64(0xa5fa5951749c67ec), EConversationDebugInfo::Executing);
                
                // They'll probably offer you some dubious herbs and try to ...
                Raven.AI.Say(LocText("TEXT_WIP_HGLOWIC_20240323_185247_2238"));
                DC(int64(0xa5fa5951749c67ec), EConversationDebugInfo::Done);
                DC(int64(0xa5fa5951749c67ef), EConversationDebugInfo::Executing);
                // We're on good terms. Just don't do anything stupid. 
                Raven.AI.Say(LocText("TEXT_WIP_HGLOWIC_20240323_185333"));
                DC(int64(0xa5fa5951749c67ef), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRaven91022 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x177894285efd1676);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceRaven91022);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_POQECXC_20240424_160626_41"), int64(0x177894285efd1676));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x177894285efd167d), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0x18da1901c69a2b5), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x485a05db1e2e00f7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x177894285efd1671), EConversationDebugInfo::Executing);
                // I had a feeling you'd show up sometime soon. 
                Raven.AI.Say(LocText("TEXT_WIP_TLUUHUE_20240417_101136_2238"));
                DC(int64(0x177894285efd1671), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe81), EConversationDebugInfo::Executing);
                // I'm hoping you have some good news. We could use it. 
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140005"));
                DC(int64(0xd58c60a1de7fe81), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe90), EConversationDebugInfo::Executing);
                
                // Because of the mine flooding? 
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140052"));
                DC(int64(0xd58c60a1de7fe90), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe91), EConversationDebugInfo::Executing);
                
                // So you heard. Good - saves me the explanations. 
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140052_2386"));
                DC(int64(0xd58c60a1de7fe91), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe9f), EConversationDebugInfo::Executing);
                // It's a complete mess. We lost dozens of men and a whole ...
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140155_1609"));
                DC(int64(0xd58c60a1de7fe9f), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7feaa), EConversationDebugInfo::Executing);
                // Not to mention our source of it. 
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140345"));
                DC(int64(0xd58c60a1de7feaa), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Raven_98172,
                    UTopic_Raven_98192,
                    UTopic_Raven_98725,
                    UTopic_Raven_98842
                );
            }
        }
        
        
        class UTopic_Raven_98172 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd58c60a1de7feac);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_140356_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_98172);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7fead), EConversationDebugInfo::Executing);
                // How exactly did it happen, anyway?
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140356_3569"));
                DC(int64(0xd58c60a1de7fead), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7feb8), EConversationDebugInfo::Executing);
                
                // We're not sure, but apparently, there was some kind of ...
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140404"));
                DC(int64(0xd58c60a1de7feb8), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7feb9), EConversationDebugInfo::Executing);
                // A wall came crashing down, and it was connected to an ...
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140613"));
                DC(int64(0xd58c60a1de7feb9), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7feaf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd58c60a1de7feaf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Raven_98192 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd58c60a1de7feb0);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_140356_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_98192);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7feb1), EConversationDebugInfo::Executing);
                // How did Gomez take it? 
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140356_443"));
                DC(int64(0xd58c60a1de7feb1), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7feba), EConversationDebugInfo::Executing);
                
                // What do you think?
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140634"));
                DC(int64(0xd58c60a1de7feba), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7febb), EConversationDebugInfo::Executing);
                // I'd stay away from him, if I were you. 
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140648"));
                DC(int64(0xd58c60a1de7febb), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7feb3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd58c60a1de7feb3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Raven_98725 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd58c60a1de7febc);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_140828_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_98725);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7febd), EConversationDebugInfo::Executing);
                // What are you going to do about it?
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140828_1769"));
                DC(int64(0xd58c60a1de7febd), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fec4), EConversationDebugInfo::Executing);
                
                // That, Shadow, is above your paygrade. But we'll handle ...
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140835"));
                DC(int64(0xd58c60a1de7fec4), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7febf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd58c60a1de7febf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Raven_98842 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd58c60a1de7fec5);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_140856_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Raven_98842);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7fec6), EConversationDebugInfo::Executing);
                // Y'Berion is dead. 
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140856_491"));
                DC(int64(0xd58c60a1de7fec6), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fed1), EConversationDebugInfo::Executing);
                
                // I heard about it. We had some novices run over since ...
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140904"));
                DC(int64(0xd58c60a1de7fed1), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fed2), EConversationDebugInfo::Executing);
                
                // The ritual killed him. Turns out the Sleeper is actually ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_140952"));
                DC(int64(0xd58c60a1de7fed2), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fed4), EConversationDebugInfo::Executing);
                // Kalom and a few others refuse to believe it, but it's ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141050"));
                DC(int64(0xd58c60a1de7fed4), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fed5), EConversationDebugInfo::Executing);
                
                // So the Sleeper is real. 
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141108"));
                DC(int64(0xd58c60a1de7fed5), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fed7), EConversationDebugInfo::Executing);
                
                // Seems like it. 
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141144"));
                DC(int64(0xd58c60a1de7fed7), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fed8), EConversationDebugInfo::Executing);
                
                // By Beliar. We never get a break here, do we?
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141153"));
                DC(int64(0xd58c60a1de7fed8), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fed9), EConversationDebugInfo::Executing);
                // Who's leading the camp now? Cor Angar? Does he still ...
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141226"));
                DC(int64(0xd58c60a1de7fed9), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7feda), EConversationDebugInfo::Executing);
                
                // Yes, Angar leads them now. And he doesn't know what to ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141239"));
                DC(int64(0xd58c60a1de7feda), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fedc), EConversationDebugInfo::Executing);
                
                // Hm. I'll be honest, this wasn't at all what I expected ...
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141353"));
                DC(int64(0xd58c60a1de7fedc), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fedd), EConversationDebugInfo::Executing);
                // But you did well. Here, take this - you've earned it. 
                Raven.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_141450"));
                DC(int64(0xd58c60a1de7fedd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GOTOPSI, Document::UDocumentSegment_CH2_GOTOPSI_Completed);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Raven.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a2bb), EConversationDebugInfo::Executing);
                Raven.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x18da1901c69a2bb), EConversationDebugInfo::Done);
                DC(int64(0xfaea3afa9846780d), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT.SucceedQuest();
                DC(int64(0xfaea3afa9846780d), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a2c0), EConversationDebugInfo::Executing);
                // What's my next job?
                Hero.AI.Say(LocText("TEXT_WIP_YPUISQL_20240425_110156"));
                DC(int64(0x18da1901c69a2c0), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33bea), EConversationDebugInfo::Executing);
                
                // Nothing for now. Though Diego wanted to see you - best ...
                Raven.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_150943"));
                DC(int64(0xf4d1c69f6fb33bea), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33beb), EConversationDebugInfo::Executing);
                
                // Where is he?
                Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_150949"));
                DC(int64(0xf4d1c69f6fb33beb), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33bec), EConversationDebugInfo::Executing);
                
                // Am I his chaperone? I don't know. Though he had some ...
                Raven.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_150953"));
                DC(int64(0xf4d1c69f6fb33bec), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a2c6), EConversationDebugInfo::Executing);
                // I got things to take care of now. 
                Raven.AI.Say(LocText("TEXT_WIP_YPUISQL_20240425_110218"));
                DC(int64(0x18da1901c69a2c6), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a2cb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x18da1901c69a2cb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRaven97436 : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0x45363f081b045a9a);
            default Caption = LocText("TEXT_WIP_JSOSVZF_20240509_151538");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14d3940dc2433714), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EJJNSVE_20240403_111312")));
                    DB(int64(0x14d3940dc2433717), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MPVLITD_20240511_170519")));
                    DB(int64(0x14d3940dc243372a), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0x485a05db1e2e00f5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0x3fb8734ec2352b5d), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EJJNSVE_20240403_111312")));
                    DB(int64(0x14d3940dc2433712), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MPVLITD_20240511_170519")));
                    DB(int64(0x14d3940dc2433729), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0x485a05db1e2e00f6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EJJNSVE_20240403_111312")) && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MPVLITD_20240511_170519")) && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return true;
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EJJNSVE_20240403_111312")) && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MPVLITD_20240511_170519")) && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x45363f081b045a96), EConversationDebugInfo::Executing);
                // Kalom sent me to the Old Mine. 
                Hero.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_151538"));
                DC(int64(0x45363f081b045a96), EConversationDebugInfo::Done);
                DB(int64(0x45363f081b045a9d), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                DB(int64(0x14d3940dc2433725), MINECRAWLER_QUEEN != nullptr && MINECRAWLER_QUEEN.IsEveryoneOfThisKindDead());
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                {
                    DC(int64(0x45363f081b045aa5), EConversationDebugInfo::Executing);
                    // And you killed the queen of the minecrawlers and stole ...
                    Raven.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_151548_2995"));
                    DC(int64(0x45363f081b045aa5), EConversationDebugInfo::Done);
                    DB(int64(0x6a83f8b961ad7265), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MPVLITD_20240511_170544")));
                    
                    if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MPVLITD_20240511_170544")))
                    {
                        
                        Other.Remember(n"choice_raven_97436_exit_1");
                    }
                }
                else if (MINECRAWLER_QUEEN != nullptr && MINECRAWLER_QUEEN.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0x9a68731e06041057), EConversationDebugInfo::Executing);
                    // I found the lair of the minecrawlers, stole their eggs, ...
                    Hero.AI.Say(LocText("TEXT_WIP_MPVLITD_20240511_170544"));
                    DC(int64(0x9a68731e06041057), EConversationDebugInfo::Done);
                    DC(int64(0x45363f081b045acc), EConversationDebugInfo::Executing);
                    
                    // Did you, now? That's ... surprising. I hope you didn't ...
                    Raven.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_151622"));
                    DC(int64(0x45363f081b045acc), EConversationDebugInfo::Done);
                    DC(int64(0xc84a932956a1d464), EConversationDebugInfo::Executing);
                    
                    // It's all good. 
                    Hero.AI.Say(LocText("TEXT_WIP_JPVLITD_20240514_155021"));
                    DC(int64(0xc84a932956a1d464), EConversationDebugInfo::Done);
                    DC(int64(0x9a68731e06041058), EConversationDebugInfo::Executing);
                    
                    // I'll take your word for it. We need every digger and ...
                    Raven.AI.Say(LocText("TEXT_WIP_MPVLITD_20240511_170657"));
                    DC(int64(0x9a68731e06041058), EConversationDebugInfo::Done);
                    DC(int64(0x9a68731e06041059), EConversationDebugInfo::Executing);
                    // Still, good job dealing with those crawlers. 
                    Raven.AI.Say(LocText("TEXT_WIP_MPVLITD_20240511_170715"));
                    DC(int64(0x9a68731e06041059), EConversationDebugInfo::Done);
                    DC(int64(0x9a68731e06041062), EConversationDebugInfo::Executing);
                    // Bring those eggs back to the Loons, and keep playing ...
                    Raven.AI.Say(LocText("TEXT_WIP_MPVLITD_20240511_170912"));
                    DC(int64(0x9a68731e06041062), EConversationDebugInfo::Done);
                    DC(int64(0x9a68731e06041063), EConversationDebugInfo::Executing);
                    
                    // You got it. 
                    Hero.AI.Say(LocText("TEXT_WIP_MPVLITD_20240511_170945"));
                    DC(int64(0x9a68731e06041063), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_raven_97436_exit_2");
                }
                else
                {
                    DC(int64(0x532641ee89354dfe), EConversationDebugInfo::Executing);
                    // Good. I'll be waiting for your report. 
                    Raven.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_191840"));
                    DC(int64(0x532641ee89354dfe), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_raven_97436_exit_3");
                }
            }
        }
        
        
        class UChoiceRavenAufnahme : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd024b889f23851de);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bSayHeyYou = true;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceRavenAufnahme);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_THORUS_READYFORGOMEZ_09_01"), int64(0xd024b889f23851de));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd024b889f23851df), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd024b889f23851e0), EConversationDebugInfo::Executing);
                // I'm here to see Gomez. Diego says I'm worthy of becoming ...
                Hero.AI.Say(LocText("DIA_RAVEN_AUFNAHME_15_00"));
                DC(int64(0xd024b889f23851e0), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851e1), EConversationDebugInfo::Executing);
                
                // Hmm. Well, if you got all the way here, you can't be all ...
                Raven.AI.Say(LocText("DIA_RAVEN_AUFNAHME_10_01"));
                DC(int64(0xd024b889f23851e1), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851e2), EConversationDebugInfo::Executing);
                // Come, I'll show you to Gomez. And don't touch anything. 
                Raven.AI.Say(LocText("DIA_RAVEN_AUFNAHME_10_02"));
                DC(int64(0xd024b889f23851e2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_RAVEN, Document::UDocumentSegment_Glossary_OC_EBR_RAVEN_Introduction);
                DC(int64(0x48bed3b8afff84c5), EConversationDebugInfo::Executing);
                Raven.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Raven_105_Guide);
                DC(int64(0x48bed3b8afff84c5), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851e4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd024b889f23851e4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRavenExit : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd024b889f23851d0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd024b889f23851d1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd024b889f23851d1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRavenFirstin : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd024b889f23851d2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceRavenFirstin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd024b889f23851d3), G1R.Thorus_Permission_Interior == 0);
                }
                
                return G1R.Thorus_Permission_Interior == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd024b889f23851d4), EConversationDebugInfo::Executing);
                // Who are you?
                Raven.AI.Say(LocText("DIA_RAVEN_FIRSTIN_10_00"));
                DC(int64(0xd024b889f23851d4), EConversationDebugInfo::Done);
                DC(int64(0x1b672654c15595d3), EConversationDebugInfo::Executing);
                // GUARDS!
                Raven.AI.Say(LocText("TEXT_WIP_HDYGJGI_20250110_150209"));
                DC(int64(0x1b672654c15595d3), EConversationDebugInfo::Done);
                DC(int64(0x1b672654c15595d5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD04_218)) && ensure(IsValid(OC_GRD_GUARD04_218.AI))) { OC_GRD_GUARD04_218.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x1b672654c15595d5), EConversationDebugInfo::Done);
                DC(int64(0x1b672654c15595d9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD25_245)) && ensure(IsValid(OC_GRD_GUARD25_245.AI))) { OC_GRD_GUARD25_245.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x1b672654c15595d9), EConversationDebugInfo::Done);
                DC(int64(0x1b672654c15595db), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD29_279)) && ensure(IsValid(OC_GRD_GUARD29_279.AI))) { OC_GRD_GUARD29_279.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x1b672654c15595db), EConversationDebugInfo::Done);
                DC(int64(0x1b672654c15595dc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b672654c15595dc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRavenKrautbote : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd024b889f23851d8);
            default Caption = LocText("DIA_RAVEN_KRAUTBOTE_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceRavenKrautbote);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd024b889f23851d9), Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd024b889f23851da), EConversationDebugInfo::Executing);
                // I have a delivery for Gomez. Fresh swampweed, from Cor ...
                Hero.AI.Say(LocText("DIA_RAVEN_KRAUTBOTE_15_00"));
                DC(int64(0xd024b889f23851da), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851db), EConversationDebugInfo::Executing);
                
                // Bring it to Bartholo - he's our provisioner. Gomez ...
                Raven.AI.Say(LocText("DIA_RAVEN_KRAUTBOTE_10_01"));
                DC(int64(0xd024b889f23851db), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851dc), EConversationDebugInfo::Executing);
                // You can find him either in the first room right by the ...
                Raven.AI.Say(LocText("DIA_RAVEN_KRAUTBOTE_10_02"));
                DC(int64(0xd024b889f23851dc), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851dd), EConversationDebugInfo::Executing);
                // Not at night, of course. Don't bother him while he's ...
                Raven.AI.Say(LocText("DIA_RAVEN_KRAUTBOTE_10_03"));
                DC(int64(0xd024b889f23851dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRavenPerm : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd024b889f23851ea);
            default Caption = LocText("DIA_RAVEN_PERM_15_00");
            default PriorityRank = 4;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_THORUS_READYFORGOMEZ_09_01"), int64(0xd024b889f23851ea));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc78cb54603053794), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd024b889f23851eb), EConversationDebugInfo::Executing);
                
                // How's the ore business?
                Hero.AI.Say(LocText("DIA_RAVEN_PERM_15_00"));
                DC(int64(0xd024b889f23851eb), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851ec), EConversationDebugInfo::Executing);
                
                // Good - and as long as the Old Mine keeps running, that ...
                Raven.AI.Say(LocText("DIA_RAVEN_PERM_10_01"));
                DC(int64(0xd024b889f23851ec), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRavenThere : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd024b889f23851e5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRavenAufnahme);
            default Rules.HideIfKnows(UChoiceRavenThere);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"Guide_Path_RavenTo_Gomez_end", 200.0f, int64(0xd024b889f23851e5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd024b889f23851e7), EConversationDebugInfo::Executing);
                // There - that's him. Do yourself a favor and show some ...
                Raven.AI.Say(LocText("DIA_RAVEN_THERE_10_01"));
                DC(int64(0xd024b889f23851e7), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8525), EConversationDebugInfo::Executing);
                Raven.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Raven_105_Start);
                DC(int64(0x48bed3b8afff8525), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851e9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd024b889f23851e9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRavenWho : UTopic_Hero__OC_EBR_RAVEN_105
        {
            default DebugId = int64(0xd024b889f23851d5);
            default Caption = LocText("DIA_RAVEN_WHO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceRavenWho);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc12c60aa26237fd6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd024b889f23851d6), EConversationDebugInfo::Executing);
                // Who are you?
                Hero.AI.Say(LocText("DIA_RAVEN_WHO_15_00"));
                DC(int64(0xd024b889f23851d6), EConversationDebugInfo::Done);
                DC(int64(0xd024b889f23851d7), EConversationDebugInfo::Executing);
                
                // (amused snort) Well, someone is a freshie ... I'm Raven, ...
                Raven.AI.Say(LocText("DIA_RAVEN_WHO_10_01"));
                DC(int64(0xd024b889f23851d7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_RAVEN, Document::UDocumentSegment_Glossary_OC_EBR_RAVEN_Boss);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */