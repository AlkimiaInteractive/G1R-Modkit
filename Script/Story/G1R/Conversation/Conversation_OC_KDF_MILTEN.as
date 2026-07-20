#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_KDF_MILTEN : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_KDF_MILTEN";
        }
        
        
        class UTopic_Hero__OC_KDF_MILTEN : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_MILTEN";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMilten() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetDEMONLESSER() const property
            {
                return GetCharacter(n"DEMONLESSER");
            }
            
            AGothicCharacterState GetFM_GRD_GUARD01_283() const property
            {
                return GetCharacter(n"FM_GRD_GUARD01_283");
            }
            
            AGothicCharacterState GetFM_GRD_GUARD03_285() const property
            {
                return GetCharacter(n"FM_GRD_GUARD03_285");
            }
            
            AGothicCharacterState GetHARPY() const property
            {
                return GetCharacter(n"HARPY");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMinecrawler_Temple() const property
            {
                return GetCharacter(n"Minecrawler_Temple");
            }
            
            AGothicCharacterState GetMerdarion() const property
            {
                return GetCharacter(n"NC_KDW_MERDARION_602");
            }
            
            AGothicCharacterState GetMyxir() const property
            {
                return GetCharacter(n"NC_KDW_MYXIR_601");
            }
            
            AGothicCharacterState GetRiordian() const property
            {
                return GetCharacter(n"NC_KDW_RIORDIAN_605");
            }
            
            AGothicCharacterState GetSaturas() const property
            {
                return GetCharacter(n"NC_KDW_SATURAS_600");
            }
            
            AGothicCharacterState GetMercenary11() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY11_726");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD09_225() const property
            {
                return GetCharacter(n"OC_GRD_GUARD09_225");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD16_232() const property
            {
                return GetCharacter(n"OC_GRD_GUARD16_232");
            }
            
            AGothicCharacterState GetGuard() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetSeraphia() const property
            {
                return GetCharacter(n"OC_WOC_SERAPHIA_110");
            }
            
            AGothicCharacterState GetYBerion() const property
            {
                return GetCharacter(n"SC_GUR_YBERION_1200");
            }
            
            AGothicCharacterState GetChani() const property
            {
                return GetCharacter(n"SC_WSC_CHANI_1205");
            }
            
            AGothicCharacterState GetNatalia() const property
            {
                return GetCharacter(n"SC_WSC_NATALIA_1207");
            }
            
            AGothicCharacterState GetSKELETONMAGE() const property
            {
                return GetCharacter(n"SKELETONMAGE");
            }
            
            AGothicCharacterState GetSKELETONWARRIOR() const property
            {
                return GetCharacter(n"SKELETONWARRIOR");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard01_3016() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard01_3016");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard02_3017() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard02_3017");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard03_3018() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard03_3018");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard04_3019() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard04_3019");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard05_3020() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard05_3020");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard06_3021() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard06_3021");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard07_3022() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard07_3022");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard08_3023() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard08_3023");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard09_3024() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard09_3024");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard10_3025() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard10_3025");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard11_3026() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard11_3026");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard12_3027() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard12_3027");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard13_3028() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard13_3028");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard14_3029() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard14_3029");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard15_3030() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard15_3030");
            }
            
            AGothicCharacterState GetST_UOW_UndeadOrcHighTempleGuard16_3031() const property
            {
                return GetCharacter(n"ST_UOW_UndeadOrcHighTempleGuard16_3031");
            }
            
            AGothicCharacterState GetTC_TROLLADULT_01() const property
            {
                return GetCharacter(n"TC_TROLLADULT_01");
            }
        }
        
        
        class UChoiceMilten103720 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xd14ef02467f8dd81);
            default Caption = LocText("TEXT_WIP_WOWDQLC_20240821_103847");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMilten103720);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc192cb05b118f479), G1R != nullptr && G1R.HasReachedChapter(4));
                    DB(int64(0xc257b9274b8637b8), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted());
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(4))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd14ef02467f8dd75), EConversationDebugInfo::Executing);
                // How are you holding up? You know, with what happened to ...
                Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_103847"));
                DC(int64(0xd14ef02467f8dd75), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd76), EConversationDebugInfo::Executing);
                
                // I was hoping you wouldn't ask.
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_103847_41"));
                DC(int64(0xd14ef02467f8dd76), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd97), EConversationDebugInfo::Executing);
                
                // Is it bad?
                Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_104129"));
                DC(int64(0xd14ef02467f8dd97), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd98), EConversationDebugInfo::Executing);
                
                // I don't know. I just keep wondering if I could have done ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_104137"));
                DC(int64(0xd14ef02467f8dd98), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd99), EConversationDebugInfo::Executing);
                // Honestly, for the moment, I'm just trying to look ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_104228"));
                DC(int64(0xd14ef02467f8dd99), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd9a), EConversationDebugInfo::Executing);
                // But anyway. Let's just tear down that stupid Barrier - ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_104258"));
                DC(int64(0xd14ef02467f8dd9a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten105180 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x9d644cfefd014b7b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMilten105180);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_KDF_MILTEN", n"WP_NC_ORE_CAVE", 400.0f, int64(0x9d644cfefd014b7b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d644cfefd014b74), EConversationDebugInfo::Executing);
                // No guards in sight ... thanks, Gorn, I guess.
                Milten.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_144450_41"));
                DC(int64(0x9d644cfefd014b74), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten105286 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x2c5bc42a1ff1d569);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMilten105286);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_KDF_MILTEN", n"WP_NC_STORY_OREPILE_MILTEN", 1500.0f, int64(0x2c5bc42a1ff1d569));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c5bc42a1ff1d562), EConversationDebugInfo::Executing);
                // By Innos ... do you feel it? That power?
                Milten.AI.Say(LocText("TEXT_WIP_FCJJJUL_20241017_105819_41"));
                DC(int64(0x2c5bc42a1ff1d562), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten106630 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xd14ef02467f8de44);
            default Caption = LocText("TEXT_WIP_WOWDQLC_20240821_110929");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866177);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866177);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866197);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866197);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866219);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866219);
            default Rules.HideIfKnows(UChoiceMilten106630);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VACYRLF_20240725_173636"), int64(0xd14ef02467f8de44));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd14ef02467f8de36), EConversationDebugInfo::Executing);
                
                // I spoke to Gorn. He'll handle the guards.
                Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_110929"));
                DC(int64(0xd14ef02467f8de36), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8de37), EConversationDebugInfo::Executing);
                
                // (sighs) So we're doing this, are we? By Innos, why can't ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_110929_2785"));
                DC(int64(0xd14ef02467f8de37), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8de52), EConversationDebugInfo::Executing);
                // All right. I'll meet you at the ore pile. 
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_132904"));
                DC(int64(0xd14ef02467f8de52), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_MiltenAgreed);
                DC(int64(0xd14ef02467f8df4b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Myxir))) { Myxir.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Myxir_601_Start); }
                DC(int64(0xd14ef02467f8df4b), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8df72), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_LsGuideOre);
                DC(int64(0xd14ef02467f8df72), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dfaa), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Mercenary11))) { Mercenary11.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary11_726_Loadsword); }
                DC(int64(0xd14ef02467f8dfaa), EConversationDebugInfo::Done);
                DC(int64(0xd47f896dcbb4cdd6), EConversationDebugInfo::Executing);
                Milten.JoinPartyOf(Hero);
                DC(int64(0xd47f896dcbb4cdd6), EConversationDebugInfo::Done);
                DC(int64(0xf6453bf67b3b74b), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN.SucceedQuest();
                DC(int64(0xf6453bf67b3b74b), EConversationDebugInfo::Done);
                DC(int64(0xbf12e8b49a5cd5ee), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Riordian))) { Riordian.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Riordian_605_Start); }
                DC(int64(0xbf12e8b49a5cd5ee), EConversationDebugInfo::Done);
                DC(int64(0xbf12e8b49a5cd602), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Merdarion))) { Merdarion.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Merdarion_602_TalkMiltenAway); }
                DC(int64(0xbf12e8b49a5cd602), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8df64), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd14ef02467f8df64), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten131463 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x58f395bf0c1adff2);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_174321");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMilten131463);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x58f395bf0c1ae00d), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning());
                    DB(int64(0x58f395bf0c1ae014), G1R != nullptr && G1R.HasReachedChapter(4));
                    DB(int64(0xfd7140af8de37c50), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.IsRunning());
                }
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning())
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(4))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58f395bf0c1adfea), EConversationDebugInfo::Executing);
                // I completed the Trial of Fire, but Corristo was never ...
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_174321"));
                DC(int64(0x58f395bf0c1adfea), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fbfe81), EConversationDebugInfo::Executing);
                
                // ... And now you're asking me to do it in his stead?
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152433"));
                DC(int64(0xa53d938294fbfe81), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fbfe82), EConversationDebugInfo::Executing);
                
                // Can you?
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152443"));
                DC(int64(0xa53d938294fbfe82), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fbfe83), EConversationDebugInfo::Executing);
                
                // I ... I'm not sure. I feel Innos' blessing on you, but ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152455"));
                DC(int64(0xa53d938294fbfe83), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1adffa), EConversationDebugInfo::Executing);
                // Then again, I am all that remains of this circle, aren't ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_174414"));
                DC(int64(0x58f395bf0c1adffa), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1adffb), EConversationDebugInfo::Executing);
                // (deep sigh) Fine. I can do it. If you wish. 
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_174429"));
                DC(int64(0x58f395bf0c1adffb), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_131481,
                    UTopic_Milten_131501
                );
            }
        }
        
        
        class UTopic_Milten_131481 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x58f395bf0c1adffe);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_174501_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_131481);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58f395bf0c1adfff), EConversationDebugInfo::Executing);
                // I do. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_174501_3569"));
                DC(int64(0x58f395bf0c1adfff), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae037), EConversationDebugInfo::Executing);
                
                // Very well.
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_174950"));
                DC(int64(0x58f395bf0c1ae037), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae05a), EConversationDebugInfo::Executing);
                // We are gathered here today to allow a new soul into our ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175120"));
                DC(int64(0x58f395bf0c1ae05a), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae0d4), EConversationDebugInfo::Executing);
                // Seeker. Repeat after me the Oath of Fire.
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175231"));
                DC(int64(0x58f395bf0c1ae0d4), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae12c), EConversationDebugInfo::Executing);
                // Oh, Lord Innos, I swear by thy power ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175339_1769"));
                DC(int64(0x58f395bf0c1ae12c), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae147), EConversationDebugInfo::Executing);
                
                // Oh, Lord Innos, I swear by thy power ...
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175447"));
                DC(int64(0x58f395bf0c1ae147), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae148), EConversationDebugInfo::Executing);
                
                // By thee, oh Cleansing Flame, oh Bringer of Light, oh ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175450"));
                DC(int64(0x58f395bf0c1ae148), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae149), EConversationDebugInfo::Executing);
                
                // By thee, oh Cleansing Flame, oh Bringer of Light, oh ...
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175451"));
                DC(int64(0x58f395bf0c1ae149), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae14a), EConversationDebugInfo::Executing);
                
                // That, from this day on, my soul and my deeds shall ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175451_491"));
                DC(int64(0x58f395bf0c1ae14a), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae14b), EConversationDebugInfo::Executing);
                
                // That, from this day on, my soul and my deeds shall ...
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175452"));
                DC(int64(0x58f395bf0c1ae14b), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae175), EConversationDebugInfo::Executing);
                
                // Until my flame doth perish, and my life departs this ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175608"));
                DC(int64(0x58f395bf0c1ae175), EConversationDebugInfo::Done);
                DC(int64(0x38f5d3af7935fd), EConversationDebugInfo::Executing);
                
                // Until my flame doth perish, and my life departs this ...
                Hero.AI.Say(LocText("TEXT_WIP_CYVGBEL_20250613_125215"));
                DC(int64(0x38f5d3af7935fd), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae19f), EConversationDebugInfo::Executing);
                
                // It is done. By uttering this sacred oath, you have ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175646"));
                DC(int64(0x58f395bf0c1ae19f), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae1c9), EConversationDebugInfo::Executing);
                // Wear these robes as a sign of your bond. 
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175727"));
                DC(int64(0x58f395bf0c1ae1c9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Trial);
                DC(int64(0xfd7140af8de37c38), EConversationDebugInfo::Executing);
                Milten.AddItemToInventory(UKdf_Armor_L, 1);
                DC(int64(0xfd7140af8de37c38), EConversationDebugInfo::Done);
                DC(int64(0x97c013b354135a95), EConversationDebugInfo::Executing);
                // Where did you get that robe from?
                Hero.AI.Say(LocText("TEXT_WIP_UKCQMAI_20250112_194645"));
                DC(int64(0x97c013b354135a95), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae1e5), EConversationDebugInfo::Executing);
                
                // My spare. Sorry, but it'll have to do. 
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_175756_2995"));
                DC(int64(0x58f395bf0c1ae1e5), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fbfe86), EConversationDebugInfo::Executing);
                // How ... do you feel?
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152654"));
                DC(int64(0xa53d938294fbfe86), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae1ef), EConversationDebugInfo::Executing);
                
                // As usual. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_180427"));
                DC(int64(0x58f395bf0c1ae1ef), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae1ed), EConversationDebugInfo::Executing);
                
                // You just shrug it off, don't you? Wish I had that ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_180412"));
                DC(int64(0x58f395bf0c1ae1ed), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fbfe87), EConversationDebugInfo::Executing);
                // Very well, then. Welcome to the Circle of Fire - ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152716"));
                DC(int64(0xa53d938294fbfe87), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Milten.AddItemToInventory(UKdf_Armor_L, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xfd7140af8de37c47), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.SucceedQuest();
                DC(int64(0xfd7140af8de37c47), EConversationDebugInfo::Done);
                DC(int64(0xfd7140af8de37c4f), EConversationDebugInfo::Executing);
                Milten.AI.GiveItemTo(Hero, UKdf_Armor_L, 1);
                DC(int64(0xfd7140af8de37c4f), EConversationDebugInfo::Done);
                DC(int64(0xb410429b6e2fa236), EConversationDebugInfo::Executing);
                Hero.SetTrueGuild(UGE_Guild_Human_OldCamp_FireMage);
                DC(int64(0xb410429b6e2fa236), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847b24c8), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.SucceedQuest();
                DC(int64(0x570acab4847b24c8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_131501 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x58f395bf0c1ae002);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_174501_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_131501);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58f395bf0c1ae003), EConversationDebugInfo::Executing);
                // Now that you say it, I guess it doesn't make much sense ...
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_174501_443"));
                DC(int64(0x58f395bf0c1ae003), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fbfe84), EConversationDebugInfo::Executing);
                
                // I hate to say it, but I agree. Well. I would have loved ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152555"));
                DC(int64(0xa53d938294fbfe84), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fbfe85), EConversationDebugInfo::Executing);
                // Curse Gomez and his goons ... 
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152616"));
                DC(int64(0xa53d938294fbfe85), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1ae01c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.FailQuest();
                DC(int64(0x58f395bf0c1ae01c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten147249 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x2693cb79278fb88e);
            default Caption = LocText("TEXT_WIP_TROXZYD_20250124_150557");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_FSWYRII_20250117_135935"), int64(0x2693cb79278fb88e));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_TROXZYD_20250124_162552"), int64(0x2693cb79278fb88e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2693cb79278fb8e7), G1R != nullptr && G1R.IsInChapter(3));
                    DB(int64(0x2693cb79278fb8ee), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2693cb79278fb872), EConversationDebugInfo::Executing);
                // I think I´m ready to join the firemages.
                Hero.AI.Say(LocText("TEXT_WIP_TROXZYD_20250124_150557"));
                DC(int64(0x2693cb79278fb872), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten147256 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x497f352eb749ddea);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147249);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_768172);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x497f352eb749ddf2), EConversationDebugInfo::Executing);
                
                // Very well. I assume you already tried speaking to ...
                Milten.AI.Say(LocText("TEXT_WIP_TROXZYD_20250124_162552"));
                DC(int64(0x497f352eb749ddf2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Help);
                DB(int64(0x58f395bf0c1adf93), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ULCTYHF_20241213_125442")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ULCTYHF_20241213_125442")))
                {
                    DC(int64(0x58f395bf0c1adf9b), EConversationDebugInfo::Executing);
                    // I did. He says they won't initiate any more mages, and ...
                    Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_173454_3436"));
                    DC(int64(0x58f395bf0c1adf9b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x58f395bf0c1adfb2), EConversationDebugInfo::Executing);
                    // No. 
                    Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_173642_686"));
                    DC(int64(0x58f395bf0c1adfb2), EConversationDebugInfo::Done);
                    DC(int64(0x460eb839e69a92cd), EConversationDebugInfo::Executing);
                    
                    // Good, that saved you some breath. He's determined not to ...
                    Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_140148"));
                    DC(int64(0x460eb839e69a92cd), EConversationDebugInfo::Done);
                }
                DC(int64(0x460eb839e69a92ce), EConversationDebugInfo::Executing);
                // But there might be a way. 
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_140212"));
                DC(int64(0x460eb839e69a92ce), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1adfbf), EConversationDebugInfo::Executing);
                // Here - read this book. It will tell you all you need to ...
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_173710"));
                DC(int64(0x58f395bf0c1adfbf), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Milten.AddItemToInventory(UItWr_Book_FireMages, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1adfe1), EConversationDebugInfo::Executing);
                Milten.AI.GiveItemTo(Hero, UItWr_Book_FireMages, 1);
                DC(int64(0x58f395bf0c1adfe1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_150711,
                    UTopic_Milten_150731
                );
                DC(int64(0x460eb839e69a9331), EConversationDebugInfo::Executing);
                // Believe me, I'd tell you more, but that would mean ...
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_141116"));
                DC(int64(0x460eb839e69a9331), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a930f), EConversationDebugInfo::Executing);
                // If you have what it takes to become a Mage of Fire, ...
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_141003"));
                DC(int64(0x460eb839e69a930f), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a9316), EConversationDebugInfo::Executing);
                // I'm sure of it. Now, where were we?
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_141027"));
                DC(int64(0x460eb839e69a9316), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_150711 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x460eb839e69a92fa);
            default Caption = LocText("TEXT_WIP_FSWYRII_20250117_140930_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_150711);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x460eb839e69a92fb), EConversationDebugInfo::Executing);
                
                // Sounds mysterious.
                Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_140930_2785"));
                DC(int64(0x460eb839e69a92fb), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a930e), EConversationDebugInfo::Executing);
                
                // It does, doesn't it?
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_140941"));
                DC(int64(0x460eb839e69a930e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_150731 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x460eb839e69a92fe);
            default Caption = LocText("TEXT_WIP_FSWYRII_20250117_140930_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_150731);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x460eb839e69a92ff), EConversationDebugInfo::Executing);
                
                // What am I looking for?
                Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_140930_3286"));
                DC(int64(0x460eb839e69a92ff), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a9330), EConversationDebugInfo::Executing);
                
                // You'll figure it out. 
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_141102"));
                DC(int64(0x460eb839e69a9330), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten147721_0 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x5a3be527244fabd9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMilten147721);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_IHGWENC_20240515_141056"), int64(0x5a3be527244fabd9));
            default Rules.HideIfKnows(UChoiceMilten147721_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5a3be527244fabec), Milten != nullptr && Milten.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Milten_TcAltar));
                    DB(int64(0x5a3be527244fac03), Hero != nullptr && Hero.IsCloseToCharacter(Milten, 700.0f));
                    DB(int64(0xb4d34737b4129f56), G1R.FourFriendsFocus.IsValid() && G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20));
                }
                
                if (Milten != nullptr && !Milten.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Milten_TcAltar))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Milten, 700.0f))
                    return false;
                
                if (G1R.FourFriendsFocus.IsValid() && !G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5a3be527244fabd2), EConversationDebugInfo::Executing);
                // Oh, hey. Can't believe we shrunk an actual troll ...
                Milten.AI.Say(LocText("TEXT_WIP_GVXGRO_20250128_103818_2238"));
                DC(int64(0x5a3be527244fabd2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten147721 : UTopic_Hero__OC_KDF_MILTEN
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147721_0);
            default Rules.HideIfKnows(UChoiceMilten147721);
            default DebugId = int64(0x5a3be527244fabd9);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4d34737b4129f4f), EConversationDebugInfo::Executing);
                G1R.FourFriendsFocus = FInGameTime::Now();
                DC(int64(0xb4d34737b4129f4f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten147899 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x733f33806b696556);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147974);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_96915);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x733f33806b69654f), EConversationDebugInfo::Executing);
                // Yeah ... let's. 
                Milten.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144524"));
                DC(int64(0x733f33806b69654f), EConversationDebugInfo::Done);
                DC(int64(0x733f33806b696560), EConversationDebugInfo::Executing);
                // Before I change my mind.
                Milten.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144534"));
                DC(int64(0x733f33806b696560), EConversationDebugInfo::Done);
                DC(int64(0xdd0d8f1014f0c4c6), EConversationDebugInfo::Executing);
                Milten.JoinPartyOf(Hero);
                DC(int64(0xdd0d8f1014f0c4c6), EConversationDebugInfo::Done);
                DC(int64(0xdd0d8f1014f0c4d0), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcGuide);
                DC(int64(0xdd0d8f1014f0c4d0), EConversationDebugInfo::Done);
                DC(int64(0x5cbc058327f74a6a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TROLLCANYON.StartQuest();
                DC(int64(0x5cbc058327f74a6a), EConversationDebugInfo::Done);
                DC(int64(0xdd0d8f1014f0c4d1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdd0d8f1014f0c4d1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten147974 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x733f33806b6965d2);
            default Caption = LocText("TEXT_WIP_MCQKTDL_20240510_144410_41");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_96935);
            default Rules.HideIfKnows(UChoiceMilten147974);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MCQKTDL_20240510_144524"), int64(0x733f33806b6965d2));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x733f33806b6965ca), EConversationDebugInfo::Executing);
                // Let's go.
                Hero.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144410_41"));
                DC(int64(0x733f33806b6965ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten288981 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xa53d938294fc81d9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceMilten288981);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2693cb79278fb7e9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x2693cb79278fb7f0), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0xce11cc9452ea4c37), Milten != nullptr && !Milten.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Milten_WaitYard));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Milten != nullptr && Milten.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Milten_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa53d938294fc81d2), EConversationDebugInfo::Executing);
                
                // So, you did it. I knew you had it in you. How was it? ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_152913_41"));
                DC(int64(0xa53d938294fc81d2), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_289061,
                    UTopic_Milten_289081,
                    UTopic_Milten_289153
                );
                DC(int64(0xa53d938294fc820c), EConversationDebugInfo::Executing);
                // Drago told me stories about the trials they do on the ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153304_3286"));
                DC(int64(0xa53d938294fc820c), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fc8225), EConversationDebugInfo::Executing);
                // Believe me, we got lucky. 
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153318"));
                DC(int64(0xa53d938294fc8225), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fc8226), EConversationDebugInfo::Executing);
                // Anyway - I suppose I should call you Brother now, but ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153323"));
                DC(int64(0xa53d938294fc8226), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fc8227), EConversationDebugInfo::Executing);
                // Still. It's good to have you. 
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153344"));
                DC(int64(0xa53d938294fc8227), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_289061 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xa53d938294fc81e3);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_153018_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_289061);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa53d938294fc81e4), EConversationDebugInfo::Executing);
                
                // Simple enough. 
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153018_2238"));
                DC(int64(0xa53d938294fc81e4), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fc81fb), EConversationDebugInfo::Executing);
                
                // Why am I not surprised you'd say that. I'm glad, though. ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153125"));
                DC(int64(0xa53d938294fc81fb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_289081 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xa53d938294fc81e7);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_153018_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_289081);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa53d938294fc81e8), EConversationDebugInfo::Executing);
                
                // I'm still alive.
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153018_2785"));
                DC(int64(0xa53d938294fc81e8), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fc81fc), EConversationDebugInfo::Executing);
                
                // That's the main thing - and you made it! ...
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153200"));
                DC(int64(0xa53d938294fc81fc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_289153 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xa53d938294fc81f1);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_153034_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_289153);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa53d938294fc81f2), EConversationDebugInfo::Executing);
                
                // Could have been worse. 
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153034_3436"));
                DC(int64(0xa53d938294fc81f2), EConversationDebugInfo::Done);
                DC(int64(0xa53d938294fc81fd), EConversationDebugInfo::Executing);
                
                // It could have indeed. 
                Milten.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_153215"));
                DC(int64(0xa53d938294fc81fd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten76716 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x58f395bf0c1adf6a);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_172903");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMilten76716);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BPPCYMI_20250120_152417"), int64(0x58f395bf0c1adf6a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x58f395bf0c1adf73), G1R != nullptr && G1R.IsInChapter(3));
                    DB(int64(0x58f395bf0c1ae25f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x561a8a352f48d15f), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58f395bf0c1adf62), EConversationDebugInfo::Executing);
                
                // I want to become a Fire Mage.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_172903"));
                DC(int64(0x58f395bf0c1adf62), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a92a4), EConversationDebugInfo::Executing);
                
                // Well, that came out of nowhere. And what have I got to ...
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_134323"));
                DC(int64(0x460eb839e69a92a4), EConversationDebugInfo::Done);
                DB(int64(0x460eb839e69a928b), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YDMVSBC_20240919_191358")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YDMVSBC_20240919_191358")))
                {
                    DC(int64(0x460eb839e69a92ad), EConversationDebugInfo::Executing);
                    // Thorus said you're the one to talk to.
                    Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_134428"));
                    DC(int64(0x460eb839e69a92ad), EConversationDebugInfo::Done);
                    DC(int64(0x460eb839e69a92af), EConversationDebugInfo::Executing);
                    
                    // Did he now? Well, I suppose it makes sense. I was the ...
                    Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_134549"));
                    DC(int64(0x460eb839e69a92af), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x460eb839e69a92ae), EConversationDebugInfo::Executing);
                    
                    // Word is you didn't join the Fire Mages until they threw ...
                    Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_134509"));
                    DC(int64(0x460eb839e69a92ae), EConversationDebugInfo::Done);
                    DC(int64(0x460eb839e69a92b0), EConversationDebugInfo::Executing);
                    
                    // That's true. 
                    Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_135105"));
                    DC(int64(0x460eb839e69a92b0), EConversationDebugInfo::Done);
                }
                DC(int64(0x460eb839e69a92b2), EConversationDebugInfo::Executing);
                // I will admit, the thought crossed my mind. You have ...
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_135119_1924"));
                DC(int64(0x460eb839e69a92b2), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a92c2), EConversationDebugInfo::Executing);
                
                // Does that mean you'll help me? 
                Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_135837"));
                DC(int64(0x460eb839e69a92c2), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a92c1), EConversationDebugInfo::Executing);
                
                // Yes. But only under one condition. I need to know that ...
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_135828"));
                DC(int64(0x460eb839e69a92c1), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a92c3), EConversationDebugInfo::Executing);
                // Being a Fire Mage isn't like a weapon you pick up ...
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_135858"));
                DC(int64(0x460eb839e69a92c3), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a92c4), EConversationDebugInfo::Executing);
                // You don't have to become a monk and never drink a glass ...
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_135935"));
                DC(int64(0x460eb839e69a92c4), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a92c5), EConversationDebugInfo::Executing);
                // Are you sure this is what you want? 
                Milten.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_135951"));
                DC(int64(0x460eb839e69a92c5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_768172,
                    UTopic_Milten_130950
                );
            }
        }
        
        
        class UTopic_Milten_768172 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x58f395bf0c1adf7d);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_173244_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_768172);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58f395bf0c1adf7e), EConversationDebugInfo::Executing);
                // I am. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_173244_2238"));
                DC(int64(0x58f395bf0c1adf7e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_130950 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x58f395bf0c1adf81);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_173244_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_130950);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58f395bf0c1adf82), EConversationDebugInfo::Executing);
                // Let me think about it.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_173244_2785"));
                DC(int64(0x58f395bf0c1adf82), EConversationDebugInfo::Done);
                DC(int64(0x58f395bf0c1adf8b), EConversationDebugInfo::Executing);
                
                // Do that. 
                Milten.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_173345"));
                DC(int64(0x58f395bf0c1adf8b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten86682 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xe01c98df54d4c720);
            default Caption = LocText("TEXT_WIP_KYPYEZL_20240326_140854");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMilten86682);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe01c98df54d4c729), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe01c98df54d4c718), EConversationDebugInfo::Executing);
                
                // I'm looking for a tome, a book about focus stone magic. ...
                Hero.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_140854"));
                DC(int64(0xe01c98df54d4c718), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Unexperienced);
                DB(int64(0x4b5e48d3affa8dc2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0x4b5e48d3affa8dd7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x4b5e48d3affa8dd0), EConversationDebugInfo::Executing);
                    // ... About the focus stones? Does that have to do with ...
                    Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153227_41"));
                    DC(int64(0x4b5e48d3affa8dd0), EConversationDebugInfo::Done);
                    DC(int64(0x4b5e48d3affa8ded), EConversationDebugInfo::Executing);
                    
                    // Yes. 
                    Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153346"));
                    DC(int64(0x4b5e48d3affa8ded), EConversationDebugInfo::Done);
                    DC(int64(0x4b5e48d3affa8dee), EConversationDebugInfo::Executing);
                    
                    // I better not ask. 
                    Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153357"));
                    DC(int64(0x4b5e48d3affa8dee), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x4b5e48d3affa8dd9), EConversationDebugInfo::Executing);
                    // About the focus stones? Did Cronos send you? 
                    Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153235_2083"));
                    DC(int64(0x4b5e48d3affa8dd9), EConversationDebugInfo::Done);
                    DC(int64(0x4b5e48d3affa8def), EConversationDebugInfo::Executing);
                    
                    // No, Y'Berion. 
                    Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153429"));
                    DC(int64(0x4b5e48d3affa8def), EConversationDebugInfo::Done);
                    DC(int64(0x4b5e48d3affa8e03), EConversationDebugInfo::Executing);
                    
                    // ... Right. 
                    Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153506"));
                    DC(int64(0x4b5e48d3affa8e03), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4b5e48d3affa8de3), EConversationDebugInfo::Executing);
                    // Oh, Innos help us. Is Gomez after the focus stones ...
                    Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153244_2238"));
                    DC(int64(0x4b5e48d3affa8de3), EConversationDebugInfo::Done);
                    DC(int64(0x4b5e48d3affa8e05), EConversationDebugInfo::Executing);
                    
                    // No, I'm here for Y'Berion. 
                    Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153549"));
                    DC(int64(0x4b5e48d3affa8e05), EConversationDebugInfo::Done);
                    DC(int64(0x4b5e48d3affa8e06), EConversationDebugInfo::Executing);
                    
                    // ... Right. 
                    Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153554"));
                    DC(int64(0x4b5e48d3affa8e06), EConversationDebugInfo::Done);
                }
                DC(int64(0x4b5e48d3affa8e66), EConversationDebugInfo::Executing);
                // So, the focus tome, hm? Maybe ... but no ... 
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_160028"));
                DC(int64(0x4b5e48d3affa8e66), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8e85), EConversationDebugInfo::Executing);
                
                // You look like you want to say something. 
                Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_160137"));
                DC(int64(0x4b5e48d3affa8e85), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f713), EConversationDebugInfo::Executing);
                
                // Ah, godsdammit. All right, maybe we can help each other. 
                Milten.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004425_686"));
                DC(int64(0x2144d13931a3f713), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8e16), EConversationDebugInfo::Executing);
                // You see, normally we don't lend books to anyone but the ...
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_153908"));
                DC(int64(0x4b5e48d3affa8e16), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f712), EConversationDebugInfo::Executing);
                
                // Do the water mages have it?
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004425"));
                DC(int64(0x2144d13931a3f712), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f788), EConversationDebugInfo::Executing);
                
                // No. I - I lost it, a while ago. I was on my way to the ...
                Milten.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_005352"));
                DC(int64(0x2144d13931a3f788), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8e4f), EConversationDebugInfo::Executing);
                // It's, um, a possibility that I haven't told Corristo ...
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_155352"));
                DC(int64(0x4b5e48d3affa8e4f), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8e50), EConversationDebugInfo::Executing);
                
                // You want me to find it. 
                Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_155704"));
                DC(int64(0x4b5e48d3affa8e50), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8e51), EConversationDebugInfo::Executing);
                
                // I guess so? You bring the book to Y'Berion, and once ...
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_155731"));
                DC(int64(0x4b5e48d3affa8e51), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_89474,
                    UTopic_Milten_89494,
                    UTopic_Milten_89516,
                    UTopic_Milten_89536,
                    UTopic_Milten_89556
                );
            }
        }
        
        
        class UTopic_Milten_89474 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x2144d13931a3f737);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_004611_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_89474);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f738), EConversationDebugInfo::Executing);
                // How can a few black goblins overpower a Fire Mage?
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004611_2386"));
                DC(int64(0x2144d13931a3f738), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f769), EConversationDebugInfo::Executing);
                
                // I don't know. I was tired, I was distracted, and I'd ...
                Milten.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004740"));
                DC(int64(0x2144d13931a3f769), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f789), EConversationDebugInfo::Executing);
                // Still, you're right, I should have dealt with them, just ...
                Milten.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_005519"));
                DC(int64(0x2144d13931a3f789), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8e86), EConversationDebugInfo::Executing);
                // Guess we all have our bad moments. 
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_161445"));
                DC(int64(0x4b5e48d3affa8e86), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f73a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2144d13931a3f73a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_89494 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x2144d13931a3f73b);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_004611_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_89494);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f73c), EConversationDebugInfo::Executing);
                // How long ago was that? 
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004611_1609"));
                DC(int64(0x2144d13931a3f73c), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f76a), EConversationDebugInfo::Executing);
                
                // About a fortnight.
                Milten.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004753"));
                DC(int64(0x2144d13931a3f76a), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8ea9), EConversationDebugInfo::Executing);
                
                // That's a long time. The goblins might have already used ...
                Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_161755"));
                DC(int64(0x4b5e48d3affa8ea9), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8eaa), EConversationDebugInfo::Executing);
                
                // Don't remind me. 
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_161805"));
                DC(int64(0x4b5e48d3affa8eaa), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8ea2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4b5e48d3affa8ea2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_89516 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x2144d13931a3f74b);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_004716_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_89516);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f74c), EConversationDebugInfo::Executing);
                // So you stole the book, too?
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004716_3569"));
                DC(int64(0x2144d13931a3f74c), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f78e), EConversationDebugInfo::Executing);
                
                // Keep it down, will you? And no, I didn't steal it - I ...
                Milten.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_010128"));
                DC(int64(0x2144d13931a3f78e), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f74e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2144d13931a3f74e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_89536 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x2144d13931a3f755);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_004721_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_89536);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f756), EConversationDebugInfo::Executing);
                // How about we deal with those goblins together? 
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004721_2801"));
                DC(int64(0x2144d13931a3f756), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f78f), EConversationDebugInfo::Executing);
                
                // I would, but Master Drago has swamped me with work ...
                Milten.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_010341"));
                DC(int64(0x2144d13931a3f78f), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8ead), EConversationDebugInfo::Executing);
                // I know how it sounds, but it's true. 
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_162225"));
                DC(int64(0x4b5e48d3affa8ead), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f758), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2144d13931a3f758), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_89556 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x2144d13931a3f75f);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_004729_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_89556);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f760), EConversationDebugInfo::Executing);
                // I'll take care of it. Where can I find those goblins?
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_004729_443"));
                DC(int64(0x2144d13931a3f760), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8eae), EConversationDebugInfo::Executing);
                
                // Just head east to the Swamp Camp until you see a bridge ...
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_162258"));
                DC(int64(0x4b5e48d3affa8eae), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8eaf), EConversationDebugInfo::Executing);
                // That's where they jumped me - I guess they have a ...
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_162449"));
                DC(int64(0x4b5e48d3affa8eaf), EConversationDebugInfo::Done);
                DC(int64(0x4b5e48d3affa8eb0), EConversationDebugInfo::Executing);
                // And ... thanks. I mean it. 
                Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_162459"));
                DC(int64(0x4b5e48d3affa8eb0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_Goblin);
                DC(int64(0xe01c98df54d4c738), EConversationDebugInfo::Executing);
                if (ensure(IsValid(YBerion))) { YBerion.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_YBerion_1200_Rest); }
                DC(int64(0xe01c98df54d4c738), EConversationDebugInfo::Done);
                DC(int64(0x3c90afd4da3e36b4), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_GETBOOK.FailQuest();
                DC(int64(0x3c90afd4da3e36b4), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a59c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Natalia))) { Natalia.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Natalia_1207_Meditation); }
                DC(int64(0x258017cab699a59c), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a59e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Chani))) { Chani.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Chani_1205_Meditation); }
                DC(int64(0x258017cab699a59e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten96464 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x1ca6b233bbce9ac2);
            default Caption = LocText("TEXT_WIP_WZNXFNE_20240508_124908");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147899);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_WZNXFNE_20240508_132120_1924"), int64(0x1ca6b233bbce9ac2));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LCQKTDL_20240513_160943"), int64(0x1ca6b233bbce9ac2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1ca6b233bbce9ac5), Hero != nullptr && Hero.HasItem(UItAt_Troll_01, 1, 0));
                    DB(int64(0xaa16f763e424023f), TC_TROLLADULT_01 != nullptr && !TC_TROLLADULT_01.IsEveryoneOfThisKindDead());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Troll_01, 1, 0))
                    return false;
                
                if (TC_TROLLADULT_01 != nullptr && TC_TROLLADULT_01.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1ca6b233bbce9ab8), EConversationDebugInfo::Executing);
                // I found some troll fur. 
                Hero.AI.Say(LocText("TEXT_WIP_WZNXFNE_20240508_124908"));
                DC(int64(0x1ca6b233bbce9ab8), EConversationDebugInfo::Done);
                DB(int64(0x1ca6b233bbce9acf), Hero != nullptr && Hero.HasItem(UItAt_Troll_01, 3, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Troll_01, 3, 0))
                {
                    DC(int64(0x1ca6b233bbce9b04), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Milten, UItAt_Troll_01, 3);
                    DC(int64(0x1ca6b233bbce9b04), EConversationDebugInfo::Done);
                    DC(int64(0x1ca6b233bbce9ae3), EConversationDebugInfo::Executing);
                    // Yes, that should be enough. Now give me a few more ...
                    Milten.AI.Say(LocText("TEXT_WIP_WZNXFNE_20240508_132120_1924"));
                    DC(int64(0x1ca6b233bbce9ae3), EConversationDebugInfo::Done);
                    DC(int64(0x1ca6b233bbce9b1a), EConversationDebugInfo::Executing);
                    Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcScrollCraft);
                    DC(int64(0x1ca6b233bbce9b1a), EConversationDebugInfo::Done);
                    DC(int64(0x1ca6b233bbce9b5d), EConversationDebugInfo::Executing);
                    G1R.Milten_Time_Troll = FInGameTime::Now();
                    DC(int64(0x1ca6b233bbce9b5d), EConversationDebugInfo::Done);
                    DC(int64(0x8a72e3c510423a65), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR.SucceedQuest();
                    DC(int64(0x8a72e3c510423a65), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_milten_96464_exit_1");
                    DC(int64(0x1ca6b233bbce9b25), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1ca6b233bbce9b25), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x1ca6b233bbce9ad9), EConversationDebugInfo::Executing);
                    // Let's see ... yes, that's good. But I'm afraid we'll ...
                    Milten.AI.Say(LocText("TEXT_WIP_WZNXFNE_20240508_132114_2238"));
                    DC(int64(0x1ca6b233bbce9ad9), EConversationDebugInfo::Done);
                    DC(int64(0x240082aadb87a45d), EConversationDebugInfo::Executing);
                    
                    // Of course we do. 
                    Hero.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_140127"));
                    DC(int64(0x240082aadb87a45d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_milten_96464_exit_2");
                    DC(int64(0x1ca6b233bbce9aee), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1ca6b233bbce9aee), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceMilten96508 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xdd0d8f1014f0c504);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147899);
            default Rules.HideIfKnows(UChoiceMilten96508);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_TC_MILTEN_END", 200.0f, int64(0xdd0d8f1014f0c504));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xaa16f763e424023d), TC_TROLLADULT_01 != nullptr && !TC_TROLLADULT_01.IsEveryoneOfThisKindDead());
                }
                
                return TC_TROLLADULT_01 != nullptr && !TC_TROLLADULT_01.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd0d8f1014f0c4fb), EConversationDebugInfo::Executing);
                // By Innos. So the rumors were true.
                Milten.AI.Say(LocText("TEXT_WIP_TSOSVZF_20240507_123259_41"));
                DC(int64(0xdd0d8f1014f0c4fb), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a361), EConversationDebugInfo::Executing);
                
                // That's one big troll. 
                Hero.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_132754"));
                DC(int64(0x240082aadb87a361), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a362), EConversationDebugInfo::Executing);
                
                // No kidding. This is a mature one - gods, he must be ...
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_132828"));
                DC(int64(0x240082aadb87a362), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a364), EConversationDebugInfo::Executing);
                // And it looks like the focus is on the platform up there. 
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_133127"));
                DC(int64(0x240082aadb87a364), EConversationDebugInfo::Done);
                DC(int64(0xcb50b9c8faeff543), EConversationDebugInfo::Executing);
                
                // Any ideas? 
                Hero.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_145418"));
                DC(int64(0xcb50b9c8faeff543), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a365), EConversationDebugInfo::Executing);
                
                // Let's get to cover first - come, follow me. 
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_133148"));
                DC(int64(0x240082aadb87a365), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TROLLCANYON, Document::UDocumentSegment_CH3_TROLLCANYON_Cave);
                DC(int64(0xdd0d8f1014f0c513), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcCave);
                DC(int64(0xdd0d8f1014f0c513), EConversationDebugInfo::Done);
                DC(int64(0xdd0d8f1014f0c51c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdd0d8f1014f0c51c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten96705 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x1ca6b233bbce9b78);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147899);
            default Rules.HideIfKnows(UChoiceMilten96705);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_WZNXFNE_20240508_132120_1924"), int64(0x1ca6b233bbce9b78));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1ca6b233bbce9b7b), G1R.Milten_Time_Troll.IsValid() && G1R.Milten_Time_Troll.IsAtLeastXMinutesAgo(5));
                    DB(int64(0xaa16f763e4240240), TC_TROLLADULT_01 != nullptr && !TC_TROLLADULT_01.IsEveryoneOfThisKindDead());
                }
                
                if (G1R.Milten_Time_Troll.IsValid() && !G1R.Milten_Time_Troll.IsAtLeastXMinutesAgo(5))
                    return false;
                
                if (TC_TROLLADULT_01 != nullptr && TC_TROLLADULT_01.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1ca6b233bbce9b6d), EConversationDebugInfo::Executing);
                // By Innos, it worked! I can't believe it. Here, take it. 
                Milten.AI.Say(LocText("TEXT_WIP_WZNXFNE_20240508_144632_2785"));
                DC(int64(0x1ca6b233bbce9b6d), EConversationDebugInfo::Done);
                DC(int64(0x1ca6b233bbce9b86), EConversationDebugInfo::Executing);
                
                // How do I use it? 
                Hero.AI.Say(LocText("TEXT_WIP_WZNXFNE_20240508_153055"));
                DC(int64(0x1ca6b233bbce9b86), EConversationDebugInfo::Done);
                DC(int64(0x1ca6b233bbce9b87), EConversationDebugInfo::Executing);
                
                // It should be simple - just focus on the troll and on the ...
                Milten.AI.Say(LocText("TEXT_WIP_WZNXFNE_20240508_153126"));
                DC(int64(0x1ca6b233bbce9b87), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a460), EConversationDebugInfo::Executing);
                
                // Okay. I'll handle it. 
                Hero.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_140345"));
                DC(int64(0x240082aadb87a460), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Milten.AddItemToInventory(UItAr_Scroll_Shrink, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x1ca6b233bbce9b89), EConversationDebugInfo::Executing);
                Milten.AI.GiveItemTo(Hero, UItAr_Scroll_Shrink, 1);
                DC(int64(0x1ca6b233bbce9b89), EConversationDebugInfo::Done);
                DC(int64(0x1ca6b233bbce9bb5), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TCFollow);
                DC(int64(0x1ca6b233bbce9bb5), EConversationDebugInfo::Done);
                DC(int64(0x7945cc7fe45b525a), EConversationDebugInfo::Executing);
                Milten.JoinPartyOf(Hero);
                DC(int64(0x7945cc7fe45b525a), EConversationDebugInfo::Done);
                DC(int64(0x8a72e3c510423a63), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL.StartQuest();
                DC(int64(0x8a72e3c510423a63), EConversationDebugInfo::Done);
                DC(int64(0x1ca6b233bbce9bb6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1ca6b233bbce9bb6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten96861 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x494baa273ff5067d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147899);
            default Rules.HideIfKnows(UChoiceMilten96861);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_TC_MILTEN_ALTAR", 700.0f, int64(0x494baa273ff5067d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xaa16f763e4240241), TC_TROLLADULT_01 != nullptr && TC_TROLLADULT_01.IsEveryoneOfThisKindDead());
                    DB(int64(0x97c84464d850251b), Milten != nullptr && !Milten.CanSenseAnyAliveCharacterOfKind(HARPY, 3000.0f));
                }
                
                if (TC_TROLLADULT_01 != nullptr && !TC_TROLLADULT_01.IsEveryoneOfThisKindDead())
                    return false;
                
                if (Milten != nullptr && Milten.CanSenseAnyAliveCharacterOfKind(HARPY, 3000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x494baa273ff50672), EConversationDebugInfo::Executing);
                // There it is. You do the honors. 
                Milten.AI.Say(LocText("TEXT_WIP_JXCQQOE_20240510_113930_41"));
                DC(int64(0x494baa273ff50672), EConversationDebugInfo::Done);
                DC(int64(0x494baa273ff5068c), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcAltar);
                DC(int64(0x494baa273ff5068c), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b561b), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b561b), EConversationDebugInfo::Done);
                DC(int64(0x494baa273ff50697), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x494baa273ff50697), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten96928 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x494baa273ff506ae);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147899);
            default Rules.HideIfKnows(UChoiceMilten96928);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x494baa273ff506bc), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x494baa273ff506bd), Hero != nullptr && Hero.HasItem(UItMs_Focus_02, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_02, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x494baa273ff506a2), EConversationDebugInfo::Executing);
                // I got it.
                Hero.AI.Say(LocText("TEXT_WIP_JXCQQOE_20240510_114228"));
                DC(int64(0x494baa273ff506a2), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a462), EConversationDebugInfo::Executing);
                
                // Fantastic. What a journey ... Best you get it back to ...
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_140842"));
                DC(int64(0x240082aadb87a462), EConversationDebugInfo::Done);
                DC(int64(0x494baa273ff506a3), EConversationDebugInfo::Executing);
                // I'll stay back here a little longer. Now that that beast ...
                Milten.AI.Say(LocText("TEXT_WIP_JXCQQOE_20240510_114228_2238"));
                DC(int64(0x494baa273ff506a3), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a46d), EConversationDebugInfo::Executing);
                // So much history ... 
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_141056"));
                DC(int64(0x240082aadb87a46d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_TrollCanyon);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TROLLCANYON, Document::UDocumentSegment_CH3_TROLLCANYON_Focus);
                DC(int64(0x7945cc7fe45b5262), EConversationDebugInfo::Executing);
                Milten.LeavePartyOf(Hero);
                DC(int64(0x7945cc7fe45b5262), EConversationDebugInfo::Done);
                DC(int64(0x7945cc7fe45b5269), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7945cc7fe45b5269), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten97011 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x1ca6b233bbce9bdb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147899);
            default Rules.HideIfKnows(UChoiceMilten97011);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1ca6b233bbce9bde), TC_TROLLADULT_01 != nullptr && TC_TROLLADULT_01.IsEveryoneOfThisKindDead());
                }
                
                return TC_TROLLADULT_01 != nullptr && TC_TROLLADULT_01.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1ca6b233bbce9bd0), EConversationDebugInfo::Executing);
                // Ha! That was amazing! Well done. 
                Milten.AI.Say(LocText("TEXT_WIP_WZNXFNE_20240508_154814_3286"));
                DC(int64(0x1ca6b233bbce9bd0), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a461), EConversationDebugInfo::Executing);
                
                // We should be able to open that gate now.
                Hero.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_140438"));
                DC(int64(0x240082aadb87a461), EConversationDebugInfo::Done);
                DC(int64(0x7521375513f105b6), EConversationDebugInfo::Executing);
                
                // Straight back to business, huh? All right. Let's get ...
                Milten.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_161241"));
                DC(int64(0x7521375513f105b6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TROLLCANYON, Document::UDocumentSegment_CH3_TROLLCANYON_TrollDefeated);
                DC(int64(0x7521375513f105c2), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcGate);
                DC(int64(0x7521375513f105c2), EConversationDebugInfo::Done);
                DC(int64(0x8a72e3c510423a61), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_TROLL.SucceedQuest();
                DC(int64(0x8a72e3c510423a61), EConversationDebugInfo::Done);
                DC(int64(0x1ca6b233bbce9be9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1ca6b233bbce9be9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten97204 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x240082aadb87a3e6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten147899);
            default Rules.HideIfKnows(UChoiceMilten97204);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_TC_MILTEN_CAVE", 200.0f, int64(0x240082aadb87a3e6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xaa16f763e424023e), TC_TROLLADULT_01 != nullptr && !TC_TROLLADULT_01.IsEveryoneOfThisKindDead());
                }
                
                return TC_TROLLADULT_01 != nullptr && !TC_TROLLADULT_01.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240082aadb87a456), EConversationDebugInfo::Executing);
                // (relieved sigh) Are you all right? 
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_134907"));
                DC(int64(0x240082aadb87a456), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e07), EConversationDebugInfo::Executing);
                
                // Yes. What now? 
                Hero.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_155550"));
                DC(int64(0x7fd7e3bb29d17e07), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e08), EConversationDebugInfo::Executing);
                
                // Well, we're not killing him by force, that's for sure. ...
                Milten.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_155550_41"));
                DC(int64(0x7fd7e3bb29d17e08), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e15), EConversationDebugInfo::Executing);
                // Maybe ... hmm. Yes. That could work. 
                Milten.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_160642"));
                DC(int64(0x7fd7e3bb29d17e15), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a459), EConversationDebugInfo::Executing);
                
                // Spit it out. 
                Hero.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_135321"));
                DC(int64(0x240082aadb87a459), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a45a), EConversationDebugInfo::Executing);
                
                // See those benches here? Those are mage utensils. Whoever ...
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_135325"));
                DC(int64(0x240082aadb87a45a), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e16), EConversationDebugInfo::Executing);
                // Maybe I could make us something that will help us kill ...
                Milten.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_160725"));
                DC(int64(0x7fd7e3bb29d17e16), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e19), EConversationDebugInfo::Executing);
                
                // Really? That sounds almost too easy.
                Hero.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_160846"));
                DC(int64(0x7fd7e3bb29d17e19), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e1a), EConversationDebugInfo::Executing);
                
                // It might be - IF I manage to write the scroll. 
                Milten.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_160906"));
                DC(int64(0x7fd7e3bb29d17e1a), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e26), EConversationDebugInfo::Executing);
                // But I'll need something from the troll himself. Fur, ...
                Milten.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_160943"));
                DC(int64(0x7fd7e3bb29d17e26), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_97401,
                    UTopic_Milten_97381
                );
            }
        }
        
        
        class UTopic_Milten_97401 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x7fd7e3bb29d17e36);
            default Caption = LocText("TEXT_WIP_LCQKTDL_20240513_161040_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_97401);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fd7e3bb29d17e37), EConversationDebugInfo::Executing);
                // Let me get this straight: you want us to cut off a tuft ...
                Hero.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_161040_2785"));
                DC(int64(0x7fd7e3bb29d17e37), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e6c), EConversationDebugInfo::Executing);
                
                // Well, actually, I was hoping you could take care of that ...
                Milten.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_161730"));
                DC(int64(0x7fd7e3bb29d17e6c), EConversationDebugInfo::Done);
                DC(int64(0x7fd7e3bb29d17e6f), EConversationDebugInfo::Executing);
                // But odds are there won't be any "cutting" involved. He ...
                Milten.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_161850"));
                DC(int64(0x7fd7e3bb29d17e6f), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a441), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x240082aadb87a441), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_97381 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x7fd7e3bb29d17e32);
            default Caption = LocText("TEXT_WIP_LCQKTDL_20240513_161040_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_97381);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fd7e3bb29d17e33), EConversationDebugInfo::Executing);
                // I'll find something. 
                Hero.AI.Say(LocText("TEXT_WIP_LCQKTDL_20240513_161040_2238"));
                DC(int64(0x7fd7e3bb29d17e33), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a45b), EConversationDebugInfo::Executing);
                
                // I was hoping you'd say that. Be careful, okay? 
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_135634"));
                DC(int64(0x240082aadb87a45b), EConversationDebugInfo::Done);
                DC(int64(0x1ca6b233bbce9aa6), EConversationDebugInfo::Executing);
                if (ensure(IsValid(TC_TROLLADULT_01))) { TC_TROLLADULT_01.ExchangeDailyRoutineToClass(UDailyRoutine_TC_TrollAdult_01_Patrol); }
                DC(int64(0x1ca6b233bbce9aa6), EConversationDebugInfo::Done);
                DC(int64(0x7945cc7fe45b5258), EConversationDebugInfo::Executing);
                Milten.LeavePartyOf(Hero);
                DC(int64(0x7945cc7fe45b5258), EConversationDebugInfo::Done);
                DC(int64(0x8a72e3c510423a67), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FUR.StartQuest();
                DC(int64(0x8a72e3c510423a67), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten97321 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x50da5a9055849f0b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten97574);
            default Rules.HideIfKnows(UChoiceMilten97321);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c0cc70a4b380449), G1R.FireMagesDead != 0);
                }
                
                return G1R.FireMagesDead != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50da5a9055849f00), EConversationDebugInfo::Executing);
                // Wh... he ... he killed them? But ...
                Milten.AI.Say(LocText("TEXT_WIP_CAKMKKE_20240524_125842_2238"));
                DC(int64(0x50da5a9055849f00), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae20), EConversationDebugInfo::Executing);
                
                // We gotta get out of here. 
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_185745"));
                DC(int64(0x49de3dea7d6eae20), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f0e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Guard)) && ensure(IsValid(Guard.AI))) { Guard.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x50da5a9055849f0e), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f1a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD16_232)) && ensure(IsValid(OC_GRD_GUARD16_232.AI))) { OC_GRD_GUARD16_232.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x50da5a9055849f1a), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f1c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD09_225)) && ensure(IsValid(OC_GRD_GUARD09_225.AI))) { OC_GRD_GUARD09_225.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x50da5a9055849f1c), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f20), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_EscapeOC_First);
                DC(int64(0x50da5a9055849f20), EConversationDebugInfo::Done);
                DC(int64(0x22783134a296340b), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"SpawnFreemineEntraceOCGuards");
                DC(int64(0x22783134a296340b), EConversationDebugInfo::Done);
                DC(int64(0xee660343e7b62fc0), EConversationDebugInfo::Executing);
                G1R.WaterMaguesTeleportBlocked = 1;
                DC(int64(0xee660343e7b62fc0), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5638), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5638), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f21), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x50da5a9055849f21), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMilten97374 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x50da5a9055849f38);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten97321);
            default Rules.HideIfKnows(UChoiceMilten97374);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OC_SCPAPE", 200.0f, int64(0x50da5a9055849f38));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50da5a9055849f2d), EConversationDebugInfo::Executing);
                // I ... I think we're safe here. By Innos, what just ...
                Milten.AI.Say(LocText("TEXT_WIP_CAKMKKE_20240524_133054_2785"));
                DC(int64(0x50da5a9055849f2d), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f47), EConversationDebugInfo::Executing);
                
                // Seems like he was questioning their loyalty. 
                Hero.AI.Say(LocText("TEXT_WIP_CAKMKKE_20240524_133236"));
                DC(int64(0x50da5a9055849f47), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae21), EConversationDebugInfo::Executing);
                
                // Yes, I heard that, but THIS? How could he do this? How?
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190011"));
                DC(int64(0x49de3dea7d6eae21), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_FireMagesEscape);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_GOMEZ, Document::UDocumentSegment_Glossary_OC_EBR_GOMEZ_FireMages);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FIREMAGES, Document::UDocumentSegment_CH4_FIREMAGES_Warn);
                Subdialog(
                    UTopic_Milten_102186,
                    UTopic_Milten_102206,
                    UTopic_Milten_102228
                );
                DC(int64(0x49de3dea7d6eae6c), EConversationDebugInfo::Executing);
                // What about you? 
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190155_686"));
                DC(int64(0x49de3dea7d6eae6c), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae98), EConversationDebugInfo::Executing);
                
                // Honestly? I don't know. But I'll stay away from the Old ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190605"));
                DC(int64(0x49de3dea7d6eae98), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae9a), EConversationDebugInfo::Executing);
                // This plan with the Barrier, it has to work ... if it ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190749"));
                DC(int64(0x49de3dea7d6eae9a), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f4e), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_AbandonedHouse);
                DC(int64(0x50da5a9055849f4e), EConversationDebugInfo::Done);
                DC(int64(0x6a4c421cb0684d6e), EConversationDebugInfo::Executing);
                Milten.LeavePartyOf(Hero);
                DC(int64(0x6a4c421cb0684d6e), EConversationDebugInfo::Done);
                DC(int64(0x1a78964262307546), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE.SucceedQuest();
                DC(int64(0x1a78964262307546), EConversationDebugInfo::Done);
                DC(int64(0xfb9f99644b643447), EConversationDebugInfo::Executing);
                G1R.SunkenTowerRevealed();
                DC(int64(0xfb9f99644b643447), EConversationDebugInfo::Done);
                DC(int64(0x50da5a9055849f59), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x50da5a9055849f59), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Milten_102186 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x49de3dea7d6eae2d);
            default Caption = LocText("TEXT_WIP_QRQTACJ_20240605_190139_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_102186);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49de3dea7d6eae2e), EConversationDebugInfo::Executing);
                // With a sword and a lot of crossbow bolts.
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190139_1924"));
                DC(int64(0x49de3dea7d6eae2e), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae95), EConversationDebugInfo::Executing);
                
                // What, you think this is funny? Gods - why is everything ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190324"));
                DC(int64(0x49de3dea7d6eae95), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae96), EConversationDebugInfo::Executing);
                // (exhales heavily) Either way. Now is not the time for ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190422"));
                DC(int64(0x49de3dea7d6eae96), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_102206 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x49de3dea7d6eae31);
            default Caption = LocText("TEXT_WIP_QRQTACJ_20240605_190139_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_102206);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49de3dea7d6eae32), EConversationDebugInfo::Executing);
                
                // You have to pull yourself together. Let's focus on ...
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190139_3436"));
                DC(int64(0x49de3dea7d6eae32), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae9b), EConversationDebugInfo::Executing);
                
                // (heavy sigh) I suppose you're right. 
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190933"));
                DC(int64(0x49de3dea7d6eae9b), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae9c), EConversationDebugInfo::Executing);
                // You have to tell Saturas about this, and you have to do ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190949"));
                DC(int64(0x49de3dea7d6eae9c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_102228 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x49de3dea7d6eae3f);
            default Caption = LocText("TEXT_WIP_QRQTACJ_20240605_190146_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_102228);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49de3dea7d6eae40), EConversationDebugInfo::Executing);
                
                // Looked to me like he's been thinking about doing this ...
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_190146_3286"));
                DC(int64(0x49de3dea7d6eae40), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae9e), EConversationDebugInfo::Executing);
                
                // I suppose you're right. I just ... I never thought he'd ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_191050"));
                DC(int64(0x49de3dea7d6eae9e), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae9f), EConversationDebugInfo::Executing);
                // (exhales heavily) Either way. Now is not the time for ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_191111"));
                DC(int64(0x49de3dea7d6eae9f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMilten97574 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xc002ec0bd95de7f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMilten97574);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_WRQTACJ_20240603_193211"), int64(0xc002ec0bd95de7f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1d9a089e246f2c60), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x1d9a089e246f2c81), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49de3dea7d6ead89), EConversationDebugInfo::Executing);
                // Oh, hey. 
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_184455"));
                DC(int64(0x49de3dea7d6ead89), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eadad), EConversationDebugInfo::Executing);
                // Did you find the foci? What brings you here? 
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_184612_2083"));
                DC(int64(0x49de3dea7d6eadad), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eadc7), EConversationDebugInfo::Executing);
                
                // They're with the Water Mages. They sent me here to ask ...
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_184750"));
                DC(int64(0x49de3dea7d6eadc7), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eadc6), EConversationDebugInfo::Executing);
                
                // ... Because it'll be too powerful. I had a hunch it ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_184748"));
                DC(int64(0x49de3dea7d6eadc6), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eadc8), EConversationDebugInfo::Executing);
                // So? What did he say? 
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_184839"));
                DC(int64(0x49de3dea7d6eadc8), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eadc9), EConversationDebugInfo::Executing);
                
                // They'll do it, but Corristo wants you to take me out of ...
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_184847"));
                DC(int64(0x49de3dea7d6eadc9), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae03), EConversationDebugInfo::Executing);
                // Apparently it's better if Gomez doesn't see me around ...
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_185008"));
                DC(int64(0x49de3dea7d6eae03), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eadca), EConversationDebugInfo::Executing);
                
                // Oh. Yes, I've heard - he blames you for some of what's ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_184847_2238"));
                DC(int64(0x49de3dea7d6eadca), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae04), EConversationDebugInfo::Executing);
                // And since you're the one who made it possible ... 
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_185431"));
                DC(int64(0x49de3dea7d6eae04), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae05), EConversationDebugInfo::Executing);
                
                // That's stupid. 
                Hero.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_185442"));
                DC(int64(0x49de3dea7d6eae05), EConversationDebugInfo::Done);
                DC(int64(0x49de3dea7d6eae06), EConversationDebugInfo::Executing);
                
                // I wouldn't say that with warders in earshot. Anyway, I ...
                Milten.AI.Say(LocText("TEXT_WIP_QRQTACJ_20240605_185457"));
                DC(int64(0x49de3dea7d6eae06), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FIREMAGES, Document::UDocumentSegment_CH4_FIREMAGES_Milten);
                DC(int64(0x1d9a089e246f2ca3), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_Hide);
                DC(int64(0x1d9a089e246f2ca3), EConversationDebugInfo::Done);
                DC(int64(0x1a789642623074f8), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_MILTEN.SucceedQuest();
                DC(int64(0x1a789642623074f8), EConversationDebugInfo::Done);
                DB(int64(0x552b62514959c52f), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning())
                {
                    DC(int64(0x552b62514959c583), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.FailQuest();
                    DC(int64(0x552b62514959c583), EConversationDebugInfo::Done);
                }
                DB(int64(0x552b62514959c6bf), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning())
                {
                    DC(int64(0x552b62514959c559), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.FailQuest();
                    DC(int64(0x552b62514959c559), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xe5560d504115560d), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Seraphia))) { Seraphia.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_NoGomez); }
                    DC(int64(0xe5560d504115560d), EConversationDebugInfo::Done);
                }
                DC(int64(0x1d9a089e246f2cad), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1d9a089e246f2cad), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenComesback : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a65d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMiltenLetter);
            default Rules.HideIfKnows(UChoiceMiltenComesback);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6e5363e5c91a65e), Milten != nullptr && !Milten.IsRefusingToTalkWith(Hero));
                    DB(int64(0xf6e5363e5c91a65f), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0xec5c436c4aeb73ed), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning());
                }
                
                if (Milten != nullptr && Milten.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xf6e5363e5c91a661), G1R.Milten_HasLetter == 0);
                
                if (G1R.Milten_HasLetter == 0)
                {
                    DC(int64(0xf6e5363e5c91a662), EConversationDebugInfo::Executing);
                    // All right. Master Corristo was saddened at your lack of ...
                    Milten.AI.Say(LocText("DIA_MILTEN_COMESBACK_02_00"));
                    DC(int64(0xf6e5363e5c91a662), EConversationDebugInfo::Done);
                    DC(int64(0xf6e5363e5c91a663), EConversationDebugInfo::Executing);
                    // However, he thanks you for delivering this letter, and ...
                    Milten.AI.Say(LocText("DIA_MILTEN_COMESBACK_02_01"));
                    DC(int64(0xf6e5363e5c91a663), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_DeliverToTorrez);
                    
                    Other.Remember(n"choice_milten_comesback_exit_1");
                }
                else
                {
                    DC(int64(0xf6e5363e5c91a664), EConversationDebugInfo::Executing);
                    // All right. Corristo thanks you for delivering this ...
                    Milten.AI.Say(LocText("DIA_MILTEN_COMESBACK_02_02"));
                    DC(int64(0xf6e5363e5c91a664), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_milten_comesback_exit_2");
                }
            }
        }
        
        
        class UChoiceMiltenExit : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a5fc);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xf6e5363e5c91a5fe), Hero != nullptr && Hero.IsInPartyWith(Milten));
                
                if (Hero != nullptr && Hero.IsInPartyWith(Milten))
                {
                    DC(int64(0xf6e5363e5c91a5ff), EConversationDebugInfo::Executing);
                    // On we go.
                    Milten.AI.Say(LocText("DIA_MILTEN_EXIT_02_00"));
                    DC(int64(0xf6e5363e5c91a5ff), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf6e5363e5c91a600), EConversationDebugInfo::Executing);
                    // See you later.
                    Milten.AI.Say(LocText("DIA_MILTEN_EXIT_02_01"));
                    DC(int64(0xf6e5363e5c91a600), EConversationDebugInfo::Done);
                }
                DC(int64(0xf6e5363e5c91a601), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6e5363e5c91a601), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenFirst : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a602);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd200ThorusWannabemage);
            default Rules.HideIfKnows(UChoiceMiltenFirst);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OC_STANDAROUND_92_MILTEN", 500.0f, int64(0xf6e5363e5c91a602));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6e5363e5c91a603), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    DB(int64(0xf6e5363e5c91a604), Milten != nullptr && Milten.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0xce11cc9452ea4c36), Milten != nullptr && !Milten.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Milten_WaitYard));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    return false;
                
                if (Milten != nullptr && !Milten.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Milten != nullptr && Milten.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Milten_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a605), EConversationDebugInfo::Executing);
                // Hm? 
                Milten.AI.Say(LocText("DIA_MILTEN_FIRST_02_00"));
                DC(int64(0xf6e5363e5c91a605), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Introduction);
                DB(int64(0xf0eff4e7b516a199), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning())
                {
                    DB(int64(0xf0eff4e7b516a1d8), G1R.MiltenAlreadyKnown == 0);
                    
                    if (G1R.MiltenAlreadyKnown == 0)
                    {
                        DC(int64(0x4b5e48d3affa8e3a), EConversationDebugInfo::Executing);
                        // I'm sorry, but you can't go in here without-
                        Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154648"));
                        DC(int64(0x4b5e48d3affa8e3a), EConversationDebugInfo::Done);
                        DC(int64(0x4b5e48d3affa8e2e), EConversationDebugInfo::Executing);
                        // Wait a moment. You're that new guy, aren't you?
                        Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154210_3436"));
                        DC(int64(0x4b5e48d3affa8e2e), EConversationDebugInfo::Done);
                        DC(int64(0x4b5e48d3affa8e37), EConversationDebugInfo::Executing);
                        
                        // That depends.
                        Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154239"));
                        DC(int64(0x4b5e48d3affa8e37), EConversationDebugInfo::Done);
                        DC(int64(0x4b5e48d3affa8e38), EConversationDebugInfo::Executing);
                        
                        // No, you're him. Ponytail, beard ... Lester told me about ...
                        Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154244"));
                        DC(int64(0x4b5e48d3affa8e38), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x4b5e48d3affa8e26), EConversationDebugInfo::Executing);
                        // Oh, it's you again. Lester has been speaking about you. 
                        Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154205_2785"));
                        DC(int64(0x4b5e48d3affa8e26), EConversationDebugInfo::Done);
                        DC(int64(0x4b5e48d3affa8e3b), EConversationDebugInfo::Executing);
                        
                        // He has?
                        Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154750"));
                        DC(int64(0x4b5e48d3affa8e3b), EConversationDebugInfo::Done);
                        DC(int64(0x4b5e48d3affa8e3c), EConversationDebugInfo::Executing);
                        
                        // Yeah. 
                        Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154828"));
                        DC(int64(0x4b5e48d3affa8e3c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x4b5e48d3affa8e3e), EConversationDebugInfo::Executing);
                    // Word is, the whole Swamp Camp is talking about you ... ...
                    Milten.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_154925_3286"));
                    DC(int64(0x4b5e48d3affa8e3e), EConversationDebugInfo::Done);
                    DC(int64(0x4b5e48d3affa8e4d), EConversationDebugInfo::Executing);
                    
                    // Long story. Can I go in?
                    Hero.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_155020"));
                    DC(int64(0x4b5e48d3affa8e4d), EConversationDebugInfo::Done);
                    DC(int64(0x6fdd4e97a36cd066), EConversationDebugInfo::Executing);
                    
                    // I'm afraid not... only mages can enter the temple. What ...
                    Milten.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_171628"));
                    DC(int64(0x6fdd4e97a36cd066), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_milten_first_exit_1");
                }
                else
                {
                    DC(int64(0xc08c3238b6d3e39d), EConversationDebugInfo::Executing);
                    // I'm sorry, but you can't come in here. Not unless you ...
                    Milten.AI.Say(LocText("TEXT_WIP_JTYFCYK_20240416_193214_41"));
                    DC(int64(0xc08c3238b6d3e39d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_milten_first_exit_2");
                }
            }
        }
        
        
        class UChoiceMiltenGotocorristo : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a60a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::LetOtherWalk;
            
            default Rules.HideIfKnows(UChoiceMiltenGotocorristo);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_200_THORUS_WANNABEMAGE_INFO_09_02"), int64(0xf6e5363e5c91a60a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x75cc35d21797ddfa), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xa6700c26f150daf0), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x149f4f43870baebe), EConversationDebugInfo::Executing);
                // Oh, it's you. Talking about good timing. 
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_154918"));
                DC(int64(0x149f4f43870baebe), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c37f5), EConversationDebugInfo::Executing);
                
                // How so?
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155753"));
                DC(int64(0x149f4f43870c37f5), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870baefa), EConversationDebugInfo::Executing);
                
                // Master Corristo wants to see you. He heard about your, ...
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155333_2238"));
                DC(int64(0x149f4f43870baefa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Introduction);
                Subdialog(
                    UTopic_Milten_151616,
                    UTopic_Milten_151636,
                    UTopic_Milten_302533,
                    UTopic_Milten_303260
                );
            }
        }
        
        
        class UTopic_Milten_151616 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x149f4f43870baf0a);
            default Caption = LocText("TEXT_WIP_AOZVQKH_20250206_155433_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_151616);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x149f4f43870baf0b), EConversationDebugInfo::Executing);
                // What does he know about that?
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155433_1924"));
                DC(int64(0x149f4f43870baf0b), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c37e4), EConversationDebugInfo::Executing);
                
                // A lot, actually. Master Corristo may be a recluse, but ...
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155603"));
                DC(int64(0x149f4f43870c37e4), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c37e5), EConversationDebugInfo::Executing);
                // Especially things such as a newcomer shaking up the ...
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155651"));
                DC(int64(0x149f4f43870c37e5), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c37e6), EConversationDebugInfo::Executing);
                // Inadvertendly, yes, but still. 
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155721"));
                DC(int64(0x149f4f43870c37e6), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870baf0d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x149f4f43870baf0d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_151636 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x149f4f43870baf0e);
            default Caption = LocText("TEXT_WIP_AOZVQKH_20250206_155433_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_151636);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x149f4f43870baf0f), EConversationDebugInfo::Executing);
                // Should I be worried? 
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155433_3436"));
                DC(int64(0x149f4f43870baf0f), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c37f6), EConversationDebugInfo::Executing);
                
                // I don't think so. He's just curious. 
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155809"));
                DC(int64(0x149f4f43870c37f6), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870baf11), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x149f4f43870baf11), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_302533 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x149f4f43870c37f7);
            default Caption = LocText("TEXT_WIP_AOZVQKH_20250206_155818_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_302533);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x149f4f43870c3802), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                    DB(int64(0x425e95e2cf9e7966), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                }
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0))
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x149f4f43870c37f8), EConversationDebugInfo::Executing);
                // That's convenient. I still have a letter for Corristo. 
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155818_3286"));
                DC(int64(0x149f4f43870c37f8), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c380f), EConversationDebugInfo::Executing);
                
                // ... From the outside? 
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155853"));
                DC(int64(0x149f4f43870c380f), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3810), EConversationDebugInfo::Executing);
                
                // Yes. Some mage gave it to me before they tossed me in. 
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155858"));
                DC(int64(0x149f4f43870c3810), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3811), EConversationDebugInfo::Executing);
                
                // And you didn't try to bring it to us until now? I'm ...
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155913"));
                DC(int64(0x149f4f43870c3811), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3812), EConversationDebugInfo::Executing);
                // Most men in here would kill for an opportunity to curry ...
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155945"));
                DC(int64(0x149f4f43870c3812), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3813), EConversationDebugInfo::Executing);
                // Anyway. Normally, outsiders aren't allowed in the ...
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_155953"));
                DC(int64(0x149f4f43870c3813), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c37fa), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x149f4f43870c37fa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_303260 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x149f4f43870c3814);
            default Caption = LocText("TEXT_WIP_AOZVQKH_20250206_160021_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_303260);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x149f4f43870c3815), EConversationDebugInfo::Executing);
                // Alright. I'll talk to him. 
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_160021_686"));
                DC(int64(0x149f4f43870c3815), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c381e), EConversationDebugInfo::Executing);
                
                // Do that. I know it probalby doesn't feel like this, but ...
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_160029"));
                DC(int64(0x149f4f43870c381e), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c381f), EConversationDebugInfo::Executing);
                // So ... you know. Try not to break anything. 
                Milten.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_160049"));
                DC(int64(0x149f4f43870c381f), EConversationDebugInfo::Done);
                DC(int64(0x425e95e2cf9e78c8), EConversationDebugInfo::Executing);
                G1R.FireMagesPermission = 1;
                DC(int64(0x425e95e2cf9e78c8), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3826), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x149f4f43870c3826), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenHello : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a606);
            default Caption = LocText("DIA_MILTEN_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceMiltenGotocorristo);
            default Rules.HideIfKnows(UChoiceMiltenHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6e5363e5c91a607), G1R.Saturas_BringFoci == 0);
                    DB(int64(0x5c5254a4f15ecd2), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0xec5c436c4aeb7340), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning());
                }
                
                if (G1R.Saturas_BringFoci != 0)
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a608), EConversationDebugInfo::Executing);
                // I'm looking for your boss. The highest Fire Mage.
                Hero.AI.Say(LocText("DIA_MILTEN_HELLO_15_00"));
                DC(int64(0xf6e5363e5c91a608), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a609), EConversationDebugInfo::Executing);
                
                // That would be Master Corristo. Why do you want to see ...
                Milten.AI.Say(LocText("DIA_MILTEN_HELLO_02_01"));
                DC(int64(0xf6e5363e5c91a609), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Introduction);
            }
        }
        
        
        class UChoiceMiltenLetter : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a61d);
            default Caption = LocText("DIA_MILTEN_LETTER_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMiltenHello);
            default Rules.HideIfKnows(UChoiceMiltenLetter);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x75cc35d21797de10), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                    DB(int64(0x75cc35d21797de11), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x75cc35d21797de12), G1R.Saturas_BringFoci == 0);
                    DB(int64(0xec5c436c4aeb73eb), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning());
                    DB(int64(0x75cc35d21797de13), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                    DB(int64(0x75cc35d21797de14), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x75cc35d21797de15), G1R.Saturas_BringFoci == 0);
                    DB(int64(0xec5c436c4aeb73ec), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning());
                }
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0) && G1R != nullptr && !G1R.HasReachedChapter(4) && G1R.Saturas_BringFoci == 0 && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning())
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0) && G1R != nullptr && !G1R.HasReachedChapter(4) && G1R.Saturas_BringFoci == 0 && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a621), EConversationDebugInfo::Executing);
                // I have a letter addressed to him.
                Hero.AI.Say(LocText("DIA_MILTEN_LETTER_15_00"));
                DC(int64(0xf6e5363e5c91a621), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a622), EConversationDebugInfo::Executing);
                
                // Hmm ... interesting. So you come from outside? Are you ...
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_02_01"));
                DC(int64(0xf6e5363e5c91a622), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a623), EConversationDebugInfo::Executing);
                
                // Something like that. A mage gave me the letter before ...
                Hero.AI.Say(LocText("DIA_MILTEN_LETTER_15_02"));
                DC(int64(0xf6e5363e5c91a623), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a624), EConversationDebugInfo::Executing);
                
                // I understand. Can I see it?
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_02_03"));
                DC(int64(0xf6e5363e5c91a624), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a627), EConversationDebugInfo::Executing);
                
                // Not before I get my reward.
                Hero.AI.Say(LocText("DIA_MILTEN_LETTER_NO_15_00"));
                DC(int64(0xf6e5363e5c91a627), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a628), EConversationDebugInfo::Executing);
                
                // You will get it from Torrez as soon as Corristo has the ...
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_NO_02_01"));
                DC(int64(0xf6e5363e5c91a628), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a629), EConversationDebugInfo::Executing);
                // My oaths to Innos bind me to truthfulness, so you can ...
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_NO_02_02"));
                DC(int64(0xf6e5363e5c91a629), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_TorrezReward);
                Subdialog(
                    UChoiceMiltenLetterNoAgain,
                    UChoiceMiltenLetterGive
                );
            }
        }
        
        
        class UChoiceMiltenLetterNoAgain : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xe8603e87342bda78);
            default Caption = LocText("DIA_MILTEN_LETTER_NO_AGAIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a62c), EConversationDebugInfo::Executing);
                // I'll give the letter straight to Torrez. 
                Hero.AI.Say(LocText("DIA_MILTEN_LETTER_NO_AGAIN_15_00"));
                DC(int64(0xf6e5363e5c91a62c), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a62d), EConversationDebugInfo::Executing);
                
                // ... Gods, you're stubborn.
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_NO_AGAIN_02_01"));
                DC(int64(0xf6e5363e5c91a62d), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a62e), EConversationDebugInfo::Executing);
                
                // Just cautious.
                Hero.AI.Say(LocText("DIA_MILTEN_LETTER_NO_AGAIN_15_02"));
                DC(int64(0xf6e5363e5c91a62e), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a62f), EConversationDebugInfo::Executing);
                
                // Well, fine then. Wait here - I'll fetch him. 
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_NO_AGAIN_02_03"));
                DC(int64(0xf6e5363e5c91a62f), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150ab5e), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_Smalltalk);
                DC(int64(0xa6700c26f150ab5e), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150ab60), EConversationDebugInfo::Executing);
                G1R.Milten_HasLetter = 0;
                DC(int64(0xa6700c26f150ab60), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150ab62), EConversationDebugInfo::Executing);
                Milten.RefuseToTalk(10);
                DC(int64(0xa6700c26f150ab62), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a634), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6e5363e5c91a634), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenLetterGive : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xe8603e87342bda83);
            default Caption = LocText("DIA_MILTEN_LETTER_GIVE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a636), EConversationDebugInfo::Executing);
                // All right. Here.
                Hero.AI.Say(LocText("DIA_MILTEN_LETTER_GIVE_15_00"));
                DC(int64(0xf6e5363e5c91a636), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_DeliveredMilten);
                DB(int64(0x5087260e415ea185), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                DB(int64(0x5087260e415ea198), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0))
                {
                    DC(int64(0xe0c066655822e413), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0xe0c066655822e413), EConversationDebugInfo::Done);
                    DC(int64(0x5087260e415ea19a), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Milten, UItWr_Scroll_Letter_01, 1);
                    DC(int64(0x5087260e415ea19a), EConversationDebugInfo::Done);
                    DC(int64(0x12c9a998e3ced51d), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_OC_FIREMAGESLETTER_COMPLETE);
                    DC(int64(0x12c9a998e3ced51d), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0))
                {
                    DC(int64(0xe0c066655822e413), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0xe0c066655822e413), EConversationDebugInfo::Done);
                    DC(int64(0x5087260e415ea1ae), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Milten, UItWr_Scroll_Letter_02, 1);
                    DC(int64(0x5087260e415ea1ae), EConversationDebugInfo::Done);
                    DC(int64(0x12c9a998e3ced51f), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_OC_FIREMAGESLETTER_OPENED);
                    DC(int64(0x12c9a998e3ced51f), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xe0c066655822e413), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0xe0c066655822e413), EConversationDebugInfo::Done);
                }
                DC(int64(0x90f69e33d9b4953d), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FIREMAGESLETTER_FIREMAGESLETTER_OBJ_DELIVER.SucceedQuest();
                DC(int64(0x90f69e33d9b4953d), EConversationDebugInfo::Done);
                DC(int64(0x5087260e415ea20a), EConversationDebugInfo::Executing);
                Milten.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll, 4);
                DC(int64(0x5087260e415ea20a), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a639), EConversationDebugInfo::Executing);
                // ... Interesting. 
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_GIVE_02_03"));
                DC(int64(0xf6e5363e5c91a639), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a63a), EConversationDebugInfo::Executing);
                
                // What does it say?
                Hero.AI.Say(LocText("DIA_MILTEN_LETTER_GIVE_15_04"));
                DC(int64(0xf6e5363e5c91a63a), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a63b), EConversationDebugInfo::Executing);
                
                // Nothing. At least nothing you have to concern yourself ...
                Milten.AI.Say(LocText("DIA_MILTEN_LETTER_GIVE_02_05"));
                DC(int64(0xf6e5363e5c91a63b), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150ab79), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_Smalltalk);
                DC(int64(0xa6700c26f150ab79), EConversationDebugInfo::Done);
                DC(int64(0x814e98028469b2ec), EConversationDebugInfo::Executing);
                Milten.AI.EndAnyOngoingInteraction();
                DC(int64(0x814e98028469b2ec), EConversationDebugInfo::Done);
                DB(int64(0xf6e5363e5c91a642), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                DB(int64(0xf6e5363e5c91a644), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0))
                {
                    DC(int64(0xa6700c26f150ab71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Milten, UItWr_Scroll_Letter_01, 1);
                    DC(int64(0xa6700c26f150ab71), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0))
                {
                    DC(int64(0xa6700c26f150ab74), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Milten, UItWr_Scroll_Letter_02, 1);
                    DC(int64(0xa6700c26f150ab74), EConversationDebugInfo::Done);
                }
                DC(int64(0xa6700c26f150ab6b), EConversationDebugInfo::Executing);
                G1R.Milten_HasLetter = 1;
                DC(int64(0xa6700c26f150ab6b), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150ab6d), EConversationDebugInfo::Executing);
                Milten.RefuseToTalk(10);
                DC(int64(0xa6700c26f150ab6d), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a648), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6e5363e5c91a648), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenLoadsword : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a73d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMiltenLoadsword);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd47f896dcbb4cd9a), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                }
                
                return Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a740), EConversationDebugInfo::Executing);
                // There you are! I've been wondering where you went. What ...
                Milten.AI.Say(LocText("INFO_MILTEN_LOADSWORD_02_01"));
                DC(int64(0xf6e5363e5c91a740), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd74), EConversationDebugInfo::Executing);
                // Lester mentioned something about you wandering around ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_103709"));
                DC(int64(0xd14ef02467f8dd74), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a741), EConversationDebugInfo::Executing);
                
                // Long story. Let's save the details for another time.
                Hero.AI.Say(LocText("INFO_MILTEN_LOADSWORD_15_02"));
                DC(int64(0xf6e5363e5c91a741), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMiltenLoadsword1 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xd14ef02467f8df25);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMiltenLoadsword);
            default Rules.HideIfKnows(UChoiceMiltenLoadsword1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a745), EConversationDebugInfo::Executing);
                
                // Always in a rush. All right, then, I guess you're here ...
                Milten.AI.Say(LocText("INFO_MILTEN_LOADSWORD1_02_02"));
                DC(int64(0xf6e5363e5c91a745), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd9b), EConversationDebugInfo::Executing);
                // What is it?
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_104451"));
                DC(int64(0xd14ef02467f8dd9b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_1192180,
                    UTopic_Milten_1192200
                );
                DC(int64(0xa6700c26f150abbb), EConversationDebugInfo::Executing);
                Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_Lsaway);
                DC(int64(0xa6700c26f150abbb), EConversationDebugInfo::Done);
                DC(int64(0x5423fb12cd501f04), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Myxir))) { Myxir.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Myxir_601_TalkMiltenAway); }
                DC(int64(0x5423fb12cd501f04), EConversationDebugInfo::Done);
                DC(int64(0x4fb57591c3ff8d47), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Riordian))) { Riordian.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Riordian_605_TalkMiltenAway); }
                DC(int64(0x4fb57591c3ff8d47), EConversationDebugInfo::Done);
                DC(int64(0xbf12e8b49a5cd5fe), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Merdarion))) { Merdarion.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Merdarion_602_TalkMiltenAway); }
                DC(int64(0xbf12e8b49a5cd5fe), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a749), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6e5363e5c91a749), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Milten_1192180 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x7a4b0b7937cb7e55);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_203910_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_1192180);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937cb7e56), EConversationDebugInfo::Executing);
                // I'll tell you in a moment, but not here. Come.
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_203910_1769"));
                DC(int64(0x7a4b0b7937cb7e56), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_1192200 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x7a4b0b7937cb7e59);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_203910_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_1192200);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937cb7e5a), EConversationDebugInfo::Executing);
                // I need your help. I'll tell you more, but not here. ...
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_203910_2995"));
                DC(int64(0x7a4b0b7937cb7e5a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMiltenLsaway : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a74a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMiltenLoadsword1);
            default Rules.HideIfKnows(UChoiceMiltenLsaway);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_WATER_MILTEN_IN", 200.0f, int64(0xf6e5363e5c91a74a));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a74d), EConversationDebugInfo::Executing);
                
                // Okay, now you got me worried. What's this about?
                Milten.AI.Say(LocText("INFO_MILTEN_LSAWAY_02_01"));
                DC(int64(0xf6e5363e5c91a74d), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dd9c), EConversationDebugInfo::Executing);
                
                // I need the magic of the ore pile. See this sword? ...
                Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_104607"));
                DC(int64(0xd14ef02467f8dd9c), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a74f), EConversationDebugInfo::Executing);
                
                // Hold on a bloody moment. XARDAS? The demon summoner?
                Milten.AI.Say(LocText("INFO_MILTEN_LSAWAY_02_03"));
                DC(int64(0xf6e5363e5c91a74f), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a750), EConversationDebugInfo::Executing);
                
                // Yes, he's helping me. The long and short of it is that ...
                Hero.AI.Say(LocText("INFO_MILTEN_LSAWAY_15_04"));
                DC(int64(0xf6e5363e5c91a750), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a759), EConversationDebugInfo::Executing);
                // That's why I went into the orc enclave. There's a temple ...
                Hero.AI.Say(LocText("INFO_MILTEN_LSAWAY_15_13"));
                DC(int64(0xf6e5363e5c91a759), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dda8), EConversationDebugInfo::Executing);
                
                // I'm ... I'm not sure what to say.
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_104935"));
                DC(int64(0xd14ef02467f8dda8), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Milten_866177,
                    UTopic_Milten_866197,
                    UTopic_Milten_866219
                );
                DC(int64(0xf6e5363e5c91a75b), EConversationDebugInfo::Executing);
                // What matters is that this sword, Uriziel, can get us to ...
                Hero.AI.Say(LocText("INFO_MILTEN_LOADSWORD4_15_01"));
                DC(int64(0xf6e5363e5c91a75b), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a75c), EConversationDebugInfo::Executing);
                // But we have to restore its power in order for that to ...
                Hero.AI.Say(LocText("INFO_MILTEN_LOADSWORD4_15_02"));
                DC(int64(0xf6e5363e5c91a75c), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8dda9), EConversationDebugInfo::Executing);
                
                // ... Hence the ore pile. By Innos, that's madness. The ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_105047"));
                DC(int64(0xd14ef02467f8dda9), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8ddaa), EConversationDebugInfo::Executing);
                
                // Beats getting eaten by a monster.
                Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_105106"));
                DC(int64(0xd14ef02467f8ddaa), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8ddab), EConversationDebugInfo::Executing);
                
                // Well ... I can't argue with that. All right, then, let ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_105142"));
                DC(int64(0xd14ef02467f8ddab), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8ddac), EConversationDebugInfo::Executing);
                
                // How did you know?
                Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_105209"));
                DC(int64(0xd14ef02467f8ddac), EConversationDebugInfo::Done);
                DC(int64(0xd14ef02467f8ddad), EConversationDebugInfo::Executing);
                
                // I've studied blue ore and its magic for years. Show me ...
                Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_105228"));
                DC(int64(0xd14ef02467f8ddad), EConversationDebugInfo::Done);
                DC(int64(0xd47f896dcbb4cea6), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Milten, UItWr_Scroll_Milten, 1);
                DC(int64(0xd47f896dcbb4cea6), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150abc5), EConversationDebugInfo::Executing);
                Milten.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll, 4);
                DC(int64(0xa6700c26f150abc5), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a75e), EConversationDebugInfo::Executing);
                // Hmm ... yes, I can do that. What about the guards?
                Milten.AI.Say(LocText("INFO_MILTEN_LOADSWORD4_02_03"));
                DC(int64(0xf6e5363e5c91a75e), EConversationDebugInfo::Done);
                DB(int64(0xd14ef02467f8ddcd), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_VACYRLF_20240725_173636")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_VACYRLF_20240725_173636")))
                {
                    DC(int64(0xd14ef02467f8dde2), EConversationDebugInfo::Executing);
                    // Gorn will take care of that.
                    Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_105455"));
                    DC(int64(0xd14ef02467f8dde2), EConversationDebugInfo::Done);
                    DC(int64(0xd14ef02467f8dde3), EConversationDebugInfo::Executing);
                    
                    // Sounds sinister when you say it like that. Ah, ...
                    Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_105455_2238"));
                    DC(int64(0xd14ef02467f8dde3), EConversationDebugInfo::Done);
                    DC(int64(0xd14ef02467f8de02), EConversationDebugInfo::Executing);
                    // Fine then. I'll meet you at the ore pile. 
                    Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_110245"));
                    DC(int64(0xd14ef02467f8de02), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_MiltenAgreed);
                    DC(int64(0xd14ef02467f8df4b), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Myxir))) { Myxir.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Myxir_601_Start); }
                    DC(int64(0xd14ef02467f8df4b), EConversationDebugInfo::Done);
                    DC(int64(0xd14ef02467f8df72), EConversationDebugInfo::Executing);
                    Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_LsGuideOre);
                    DC(int64(0xd14ef02467f8df72), EConversationDebugInfo::Done);
                    DC(int64(0xd14ef02467f8dfaa), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Mercenary11))) { Mercenary11.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary11_726_Loadsword); }
                    DC(int64(0xd14ef02467f8dfaa), EConversationDebugInfo::Done);
                    DC(int64(0xd47f896dcbb4cdd6), EConversationDebugInfo::Executing);
                    Milten.JoinPartyOf(Hero);
                    DC(int64(0xd47f896dcbb4cdd6), EConversationDebugInfo::Done);
                    DC(int64(0xf6453bf67b3b74b), EConversationDebugInfo::Executing);
                    Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN.SucceedQuest();
                    DC(int64(0xf6453bf67b3b74b), EConversationDebugInfo::Done);
                    DC(int64(0xbf12e8b49a5cd5ee), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Riordian))) { Riordian.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Riordian_605_Start); }
                    DC(int64(0xbf12e8b49a5cd5ee), EConversationDebugInfo::Done);
                    DC(int64(0xbf12e8b49a5cd602), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Merdarion))) { Merdarion.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Merdarion_602_TalkMiltenAway); }
                    DC(int64(0xbf12e8b49a5cd602), EConversationDebugInfo::Done);
                    DC(int64(0xf6e5363e5c91a76d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf6e5363e5c91a76d), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xd14ef02467f8de0e), EConversationDebugInfo::Executing);
                    // I'm still figuring that part out.
                    Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_110744"));
                    DC(int64(0xd14ef02467f8de0e), EConversationDebugInfo::Done);
                    DC(int64(0xd14ef02467f8de0f), EConversationDebugInfo::Executing);
                    
                    // I see. Ask Gorn, maybe - he knows these guys, so maybe ...
                    Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_110744_1924"));
                    DC(int64(0xd14ef02467f8de0f), EConversationDebugInfo::Done);
                    DC(int64(0xd14ef02467f8de1c), EConversationDebugInfo::Executing);
                    // Let me know what he says.
                    Milten.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_110810"));
                    DC(int64(0xd14ef02467f8de1c), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_Gorn);
                    DC(int64(0xf6453bf67b3b73b), EConversationDebugInfo::Executing);
                    Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN.StartQuest();
                    DC(int64(0xf6453bf67b3b73b), EConversationDebugInfo::Done);
                    DC(int64(0xd14ef02467f8de29), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd14ef02467f8de29), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Milten_866177 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x7a4b0b7937ca5558);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_195106_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_866177);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937ca5559), EConversationDebugInfo::Executing);
                // You don't have to say anything.
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_195106_1609"));
                DC(int64(0x7a4b0b7937ca5559), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_866197 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x7a4b0b7937ca555c);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_195106_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_866197);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937ca555d), EConversationDebugInfo::Executing);
                // If we get out of this alive, I'll tell you the whole ...
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_195106_2801"));
                DC(int64(0x7a4b0b7937ca555d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_866219 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0x7a4b0b7937ca556c);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_195109_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_866219);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937ca556d), EConversationDebugInfo::Executing);
                // Doesn't matter.
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_195109_443"));
                DC(int64(0x7a4b0b7937ca556d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMiltenLsdone : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a781);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceMiltenLsdone);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_XARDAS_LOADSWORD02_14_02"), int64(0xf6e5363e5c91a781));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6e5363e5c91a782), Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC.HasSucceeded());
                    DB(int64(0xf6e5363e5c91a783), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC.HasSucceeded())
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd0e0fc7d99cfd137), EConversationDebugInfo::Executing);
                
                // Innos save us ... That power.
                Milten.AI.Say(LocText("INFO_MILTEN_LSDONE_02_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL", bUnskippable = true);
                DC(int64(0xd0e0fc7d99cfd137), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Uriziel);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_Charged);
                DC(int64(0xd0e0fc7d99cfd0ca), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowUriziel);
                DC(int64(0xd0e0fc7d99cfd0ca), EConversationDebugInfo::Done);
                DC(int64(0xd0e0fc7d99cfd138), EConversationDebugInfo::Executing);
                // Not bad at all.
                Hero.AI.Say(LocText("INFO_MILTEN_LSDONE_15_02"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL", bUnskippable = true);
                DC(int64(0xd0e0fc7d99cfd138), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a78a), EConversationDebugInfo::Executing);
                
                // That's the understatment of the century. I've never seen ...
                Milten.AI.Say(LocText("INFO_MILTEN_LSDONE_02_03"), ForceCameraPreset = n"TWO SHOT WIDE URIZIEL", bUnskippable = true);
                DC(int64(0xf6e5363e5c91a78a), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5b57), EConversationDebugInfo::Executing);
                // What now? 
                Milten.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_154239"), ForceCameraPreset = n"TWO SHOT WIDE URIZIEL", bUnskippable = true);
                DC(int64(0x89230389776d5b57), EConversationDebugInfo::Done);
                DC(int64(0xd0e0fc7d99cfd152), EConversationDebugInfo::Executing);
                Hero.AI.EndAnyOngoingInteraction();
                DC(int64(0xd0e0fc7d99cfd152), EConversationDebugInfo::Done);
                DC(int64(0xd0e0fc7d99cfd1f5), EConversationDebugInfo::Executing);
                Hero.AI.WaitUntilNoLongerSpeaking();
                DC(int64(0xd0e0fc7d99cfd1f5), EConversationDebugInfo::Done);
                DC(int64(0xd0e0fc7d99cfd183), EConversationDebugInfo::Executing);
                // Now we're gonna send the Sleeper back to where he came ...
                Hero.AI.Say(LocText("TEXT_WIP_WOWDQLC_20240821_134641"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL", bUnskippable = true);
                DC(int64(0xd0e0fc7d99cfd183), EConversationDebugInfo::Done);
                DC(int64(0xd0e0fc7d99cfd191), EConversationDebugInfo::Executing);
                
                // Your word in Innos' ear. All right, then - it's probably ...
                Milten.AI.Say(LocText("INFO_MILTEN_LSDONE_02_05"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL", bUnskippable = true);
                DC(int64(0xd0e0fc7d99cfd191), EConversationDebugInfo::Done);
                DC(int64(0xd0e0fc7d99cfd184), EConversationDebugInfo::Executing);
                // Saturas is right. The others likely won't be as ...
                Milten.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_154250"), ForceCameraPreset = n"TWO SHOT WIDE URIZIEL");
                DC(int64(0xd0e0fc7d99cfd184), EConversationDebugInfo::Done);
                DC(int64(0xc943d94564ad2653), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"SpawnEventCharacters");
                DC(int64(0xc943d94564ad2653), EConversationDebugInfo::Done);
                DC(int64(0x28003880c3e17207), EConversationDebugInfo::Executing);
                G1R.ChangeChapter(6);
                DC(int64(0x28003880c3e17207), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a799), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6e5363e5c91a799), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenLsnow : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a771);
            default Caption = LocText("INFO_MILTEN_LSNOW_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMiltenLsoreheap);
            default Rules.HideIfKnows(UChoiceMiltenLsnow);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_NC_OREMOUNT_MILTEN", 500.0f, int64(0xf6e5363e5c91a771));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a775), EConversationDebugInfo::Executing);
                // We are. You got that spell?
                Hero.AI.Say(LocText("INFO_MILTEN_LSNOW_15_01"));
                DC(int64(0xf6e5363e5c91a775), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a777), EConversationDebugInfo::Executing);
                
                // Yes. What about the mages? They'll notice. 
                Milten.AI.Say(LocText("INFO_MILTEN_LSNOW_02_03"));
                DC(int64(0xf6e5363e5c91a777), EConversationDebugInfo::Done);
                DC(int64(0xe14c05e090897aae), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Saturas))) { Saturas.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Saturas_600_OreMount); }
                DC(int64(0xe14c05e090897aae), EConversationDebugInfo::Done);
                DC(int64(0x8ecf46a8de449999), EConversationDebugInfo::Executing);
                // We'll figure it out. Let's-
                Hero.AI.Say(LocText("INFO_MILTEN_LSNOW_15_04"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x8ecf46a8de449999), EConversationDebugInfo::Done);
                DC(int64(0xd47f896dcbb4cefb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd47f896dcbb4cefb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenLsoreheap : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a76e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMilten106630);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866177);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866177);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866197);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866197);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866219);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_866219);
            default Rules.HideIfKnows(UChoiceMiltenLsoreheap);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_NC_OREMOUNT_MILTEN", 400.0f, int64(0xf6e5363e5c91a76e));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a770), EConversationDebugInfo::Executing);
                // Here we are. We're really doing this, are we?
                Milten.AI.Say(LocText("INFO_MILTEN_LSOREHEAP_02_01"));
                DC(int64(0xf6e5363e5c91a770), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMiltenNocheinbrief : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a66a);
            default Caption = LocText("DIA_MILTEN_NOCHEINBRIEF_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceMiltenNocheinbrief);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_CRONOS_BANDIT_08_01"), int64(0xf6e5363e5c91a66a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6e5363e5c91a66b), Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER != nullptr && Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER.IsRunning());
                    DB(int64(0xf6e5363e5c91a66c), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER != nullptr && !Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER.IsRunning())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a66d), EConversationDebugInfo::Executing);
                
                // I have a letter from the Water Mages.
                Hero.AI.Say(LocText("DIA_MILTEN_NOCHEINBRIEF_15_00"));
                DC(int64(0xf6e5363e5c91a66d), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a66e), EConversationDebugInfo::Executing);
                
                // Ah, very good - I'll make sure Corristo gets it.
                Milten.AI.Say(LocText("DIA_MILTEN_NOCHEINBRIEF_02_01"));
                DC(int64(0xf6e5363e5c91a66e), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a66f), EConversationDebugInfo::Executing);
                // I don't have a reward right here, but I'm sure the Water ...
                Milten.AI.Say(LocText("DIA_MILTEN_NOCHEINBRIEF_02_02"));
                DC(int64(0xf6e5363e5c91a66f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_CRONOS_MESSENGER, Document::UDocumentSegment_CH2_CRONOS_MESSENGER_Milten);
                DC(int64(0xa6700c26f150ac22), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER.SucceedQuest();
                DC(int64(0xa6700c26f150ac22), EConversationDebugInfo::Done);
                DC(int64(0xa6700c26f150ac24), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Milten, UItWr_Scroll_Cronos, 1);
                DC(int64(0xa6700c26f150ac24), EConversationDebugInfo::Done);
                DC(int64(0x647eaafbd8b43c39), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD.StartQuest();
                DC(int64(0x647eaafbd8b43c39), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMiltenShwait : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a67f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMiltenShwait);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_TC_MILTEN_FOCUS", 300.0f, int64(0xf6e5363e5c91a67f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdd0d8f1014f0c4c3), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x494baa273ff50622), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a682), EConversationDebugInfo::Executing);
                // Ah, there he is. So - we're doing this, aren't we?
                Milten.AI.Say(LocText("INFO_MILTEN_SHWAIT_02_01"));
                DC(int64(0xf6e5363e5c91a682), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TROLLCANYON, Document::UDocumentSegment_CH3_TROLLCANYON_Start);
                Subdialog(
                    UTopic_Milten_96915,
                    UTopic_Milten_97156,
                    UTopic_Milten_96935
                );
            }
        }
        
        
        class UTopic_Milten_96915 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xcb50b9c8faeff506);
            default Caption = LocText("TEXT_WIP_MCQKTDL_20240510_144410_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_96915);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x733f33806b6965c3), EConversationDebugInfo::Executing);
                // Let's go.
                Hero.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144410_41"));
                DC(int64(0x733f33806b6965c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_97156 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xcb50b9c8faeff531);
            default Caption = LocText("TEXT_WIP_MCQKTDL_20240510_144700_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_97156);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcb50b9c8faeff532), EConversationDebugInfo::Executing);
                // You sound nervous.
                Hero.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144700_1924"));
                DC(int64(0xcb50b9c8faeff532), EConversationDebugInfo::Done);
                DC(int64(0xcb50b9c8faeff540), EConversationDebugInfo::Executing);
                
                // Well, I am. Do you know Cavalorn, the hunter? Even he ...
                Milten.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144724"));
                DC(int64(0xcb50b9c8faeff540), EConversationDebugInfo::Done);
                DC(int64(0xcb50b9c8faeff541), EConversationDebugInfo::Executing);
                // Some even say there's a troll in there ... let's just ...
                Milten.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144947"));
                DC(int64(0xcb50b9c8faeff541), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a360), EConversationDebugInfo::Executing);
                // Anyway - are you ready? 
                Milten.AI.Say(LocText("TEXT_WIP_IHGWENC_20240515_132713"));
                DC(int64(0x240082aadb87a360), EConversationDebugInfo::Done);
                DC(int64(0xcb50b9c8faeff534), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xcb50b9c8faeff534), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_96935 : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xcb50b9c8faeff50a);
            default Caption = LocText("TEXT_WIP_MCQKTDL_20240510_144410_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Milten_96935);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcb50b9c8faeff50b), EConversationDebugInfo::Executing);
                // Give me a minute.
                Hero.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144410_2238"));
                DC(int64(0xcb50b9c8faeff50b), EConversationDebugInfo::Done);
                DC(int64(0xcb50b9c8faeff52f), EConversationDebugInfo::Executing);
                
                // Fine. Just don't take too long. 
                Milten.AI.Say(LocText("TEXT_WIP_MCQKTDL_20240510_144557"));
                DC(int64(0xcb50b9c8faeff52f), EConversationDebugInfo::Done);
                DC(int64(0x240082aadb87a326), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x240082aadb87a326), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMiltenWannamage : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a679);
            default Caption = LocText("DIA_MILTEN_WANNAMAGE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_milten_perm");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6e5363e5c91a67a), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    DB(int64(0xec5c436c4aeb73ef), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a67b), EConversationDebugInfo::Executing);
                // What do I have to do so the mages accept me as an ...
                Hero.AI.Say(LocText("DIA_MILTEN_WANNAMAGE_15_00"));
                DC(int64(0xf6e5363e5c91a67b), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a67c), EConversationDebugInfo::Executing);
                
                // Oh, I'm afraid that will be difficult. I'm the only ...
                Milten.AI.Say(LocText("DIA_MILTEN_WANNAMAGE_02_01"));
                DC(int64(0xf6e5363e5c91a67c), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a67d), EConversationDebugInfo::Executing);
                // In other words, unless you do something that will draw ...
                Milten.AI.Say(LocText("DIA_MILTEN_WANNAMAGE_02_02"));
                DC(int64(0xf6e5363e5c91a67d), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a67e), EConversationDebugInfo::Executing);
                // Oh, and of course you'll have to be a member of the Old ...
                Milten.AI.Say(LocText("DIA_MILTEN_WANNAMAGE_02_03"));
                DC(int64(0xf6e5363e5c91a67e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMiltenWotorrez : UTopic_Hero__OC_KDF_MILTEN
        {
            default DebugId = int64(0xf6e5363e5c91a665);
            default Caption = LocText("DIA_MILTEN_WOTORREZ_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMiltenComesback);
            default Rules.HideIfKnows(UChoiceMiltenWotorrez);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6e5363e5c91a666), G1R.Saturas_BringFoci == 0);
                    DB(int64(0xec5c436c4aeb73ee), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning());
                }
                
                if (G1R.Saturas_BringFoci != 0)
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6e5363e5c91a667), EConversationDebugInfo::Executing);
                
                // Where can I find this Torrez?
                Hero.AI.Say(LocText("DIA_MILTEN_WOTORREZ_15_00"));
                DC(int64(0xf6e5363e5c91a667), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a668), EConversationDebugInfo::Executing);
                
                // He's usually just outside the temple. 
                Milten.AI.Say(LocText("DIA_MILTEN_WOTORREZ_02_01"));
                DC(int64(0xf6e5363e5c91a668), EConversationDebugInfo::Done);
                DC(int64(0xf6e5363e5c91a669), EConversationDebugInfo::Executing);
                // Of course, he's inside at night, so you'll have to catch ...
                Milten.AI.Say(LocText("DIA_MILTEN_WOTORREZ_02_02"));
                DC(int64(0xf6e5363e5c91a669), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */