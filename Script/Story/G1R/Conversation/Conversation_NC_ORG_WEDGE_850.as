#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_WEDGE_850 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_WEDGE_850";
        }
        
        
        class UTopic_Hero__NC_ORG_WEDGE_850 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_WEDGE_850";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetWedge() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetButch() const property
            {
                return GetCharacter(n"NC_ORG_BUTCH_851");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE33_882N() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE33_882N");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE34_883N() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE34_883N");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE35_884N() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE35_884N");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE36_885N() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE36_885N");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE37_886N() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE37_886N");
            }
            
            AGothicCharacterState GetGuard31() const property
            {
                return GetCharacter(n"OC_GRD_GUARD31_283N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD32_284N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD32_284N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD33_285N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD33_285N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD34_286N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD34_286N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD35_287N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD35_287N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD36_288N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD36_288N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD37_289N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD37_289N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD38_290N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD38_290N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD39_291N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD39_291N");
            }
        }
        
        
        class UChoiceWedge221511 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xef54d6584d30584e);
            default Caption = LocText("TEXT_WIP_KCMTZIF_20260217_143344_41");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceWedge221511);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd646913a1dea2fe2), G1R.Convoy_RaidStart != 0);
                    DB(int64(0xd646913a1dea2fe3), G1R.Convoy_PlayerBriefed == 0);
                }
                
                if (G1R.Convoy_RaidStart == 0)
                    return false;
                
                if (G1R.Convoy_PlayerBriefed != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xef54d6584d30584d), EConversationDebugInfo::Executing);
                // Beliar's balls! Who's that idiot? Attack!
                Wedge.AI.Say(LocText("TEXT_WIP_KCMTZIF_20260217_143344_41"));
                DC(int64(0xef54d6584d30584d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWedge221529 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xd646913a1dea2fd8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceWedge221529);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_DMEKYPF_20240617_112000"), int64(0xd646913a1dea2fd8));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x71f71de0def59566), Guard31 != nullptr && Guard31.IsDefeated());
                    DB(int64(0x71f71de0def59567), OC_GRD_GUARD32_284N != nullptr && OC_GRD_GUARD32_284N.IsDefeated());
                    DB(int64(0x71f71de0def59568), OC_GRD_GUARD33_285N != nullptr && OC_GRD_GUARD33_285N.IsDefeated());
                    DB(int64(0x71f71de0def59569), OC_GRD_GUARD34_286N != nullptr && OC_GRD_GUARD34_286N.IsDefeated());
                    DB(int64(0x71f71de0def5956a), OC_GRD_GUARD35_287N != nullptr && OC_GRD_GUARD35_287N.IsDefeated());
                    DB(int64(0x71f71de0def5956b), OC_GRD_GUARD36_288N != nullptr && OC_GRD_GUARD36_288N.IsDefeated());
                    DB(int64(0x71f71de0def5956c), OC_GRD_GUARD37_289N != nullptr && OC_GRD_GUARD37_289N.IsDefeated());
                    DB(int64(0x71f71de0def5956d), OC_GRD_GUARD38_290N != nullptr && OC_GRD_GUARD38_290N.IsDefeated());
                    DB(int64(0x71f71de0def5958a), OC_GRD_GUARD39_291N != nullptr && OC_GRD_GUARD39_291N.IsDefeated());
                    DB(int64(0x71f71de0def5958c), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x71f71de0def5958d), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xd646913a1dea2fd7), G1R.Convoy_PlayerBriefed != 0);
                }
                
                if (Guard31 != nullptr && !Guard31.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD32_284N != nullptr && !OC_GRD_GUARD32_284N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD33_285N != nullptr && !OC_GRD_GUARD33_285N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD34_286N != nullptr && !OC_GRD_GUARD34_286N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD35_287N != nullptr && !OC_GRD_GUARD35_287N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD36_288N != nullptr && !OC_GRD_GUARD36_288N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD37_289N != nullptr && !OC_GRD_GUARD37_289N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD38_290N != nullptr && !OC_GRD_GUARD38_290N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD39_291N != nullptr && !OC_GRD_GUARD39_291N.IsDefeated())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.Convoy_PlayerBriefed == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xef54d6584d305851), EConversationDebugInfo::Executing);
                // *sigh * We did it. But that's not on you, idiot. What ...
                Wedge.AI.Say(LocText("TEXT_WIP_KCMTZIF_20260217_143644_2238"));
                DC(int64(0xef54d6584d305851), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWedge221548 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xd646913a1dea2fd9);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWedge221529);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWedge99089);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeefac5320db071c0), EConversationDebugInfo::Executing);
                // We'll take it from here - you head back to the New Camp ...
                Wedge.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192159"));
                DC(int64(0xeefac5320db071c0), EConversationDebugInfo::Done);
                DC(int64(0x71f71de0def5958e), EConversationDebugInfo::Executing);
                // We're gonna have a lot of fun together. 
                Wedge.AI.Say(LocText("TEXT_WIP_BJTCJRF_20240604_155319"));
                DC(int64(0x71f71de0def5958e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CONVOY, Document::UDocumentSegment_CH1_CONVOY_End);
                Subdialog(
                    UTopic_Wedge_103790,
                    UTopic_Wedge_104126,
                    UTopic_Wedge_103810
                );
            }
        }
        
        
        class UTopic_Wedge_103790 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xeefac5320db071c2);
            default Caption = LocText("TEXT_WIP_FPBBQAJ_20240617_192252_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Wedge_103790);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeefac5320db071c3), EConversationDebugInfo::Executing);
                // What about my cut? 
                Hero.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192252_41"));
                DC(int64(0xeefac5320db071c3), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071ca), EConversationDebugInfo::Executing);
                
                // Getting greedy, are we? This isn't how we do things, ...
                Wedge.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192310"));
                DC(int64(0xeefac5320db071ca), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071cb), EConversationDebugInfo::Executing);
                // Lares will pay you as he sees fit. And, honestly, you ...
                Wedge.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192330"));
                DC(int64(0xeefac5320db071cb), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071c5), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xeefac5320db071c5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Wedge_104126 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xeefac5320db071cc);
            default Caption = LocText("TEXT_WIP_FPBBQAJ_20240617_192353_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Wedge_104126);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeefac5320db071cd), EConversationDebugInfo::Executing);
                // Will Gomez retaliate? 
                Hero.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192353_1924"));
                DC(int64(0xeefac5320db071cd), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071d0), EConversationDebugInfo::Executing);
                
                // Ah, I doubt it. The Reds have messed up some of our guys ...
                Wedge.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192401"));
                DC(int64(0xeefac5320db071d0), EConversationDebugInfo::Done);
                DC(int64(0xad9e2da78b8f10e4), EConversationDebugInfo::Executing);
                // It's like a tug of war, you know? Just don't start ...
                Wedge.AI.Say(LocText("TEXT_WIP_LPBBQAJ_20240619_180702"));
                DC(int64(0xad9e2da78b8f10e4), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071cf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xeefac5320db071cf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Wedge_103810 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xeefac5320db071c6);
            default Caption = LocText("TEXT_WIP_FPBBQAJ_20240617_192252_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Wedge_103810);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeefac5320db071c7), EConversationDebugInfo::Executing);
                // I'll see you around.
                Hero.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192252_2238"));
                DC(int64(0xeefac5320db071c7), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071d1), EConversationDebugInfo::Executing);
                
                // I'm counting on it. 
                Wedge.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_192421"));
                DC(int64(0xeefac5320db071d1), EConversationDebugInfo::Done);
                DC(int64(0xd23f2c9d92cc35e8), EConversationDebugInfo::Executing);
                Wedge.RemoveImmortality();
                DC(int64(0xd23f2c9d92cc35e8), EConversationDebugInfo::Done);
                DC(int64(0xd23f2c9d92cc35ea), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.RemoveImmortality(); }
                DC(int64(0xd23f2c9d92cc35ea), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecfee), EConversationDebugInfo::Executing);
                Wedge.LeavePartyOf(Hero);
                DC(int64(0xb36e20e0d7eecfee), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecff0), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.LeavePartyOf(Hero); }
                DC(int64(0xb36e20e0d7eecff0), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecff2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE33_882N))) { NC_ORG_ROGUE33_882N.LeavePartyOf(Hero); }
                DC(int64(0xb36e20e0d7eecff2), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecff4), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE34_883N))) { NC_ORG_ROGUE34_883N.LeavePartyOf(Hero); }
                DC(int64(0xb36e20e0d7eecff4), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecff6), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE35_884N))) { NC_ORG_ROGUE35_884N.LeavePartyOf(Hero); }
                DC(int64(0xb36e20e0d7eecff6), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecff8), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE36_885N))) { NC_ORG_ROGUE36_885N.LeavePartyOf(Hero); }
                DC(int64(0xb36e20e0d7eecff8), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecffa), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE37_886N))) { NC_ORG_ROGUE37_886N.LeavePartyOf(Hero); }
                DC(int64(0xb36e20e0d7eecffa), EConversationDebugInfo::Done);
                DC(int64(0x3c4d2c30d03fc058), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE.SucceedQuest();
                DC(int64(0x3c4d2c30d03fc058), EConversationDebugInfo::Done);
                DC(int64(0x3c4d2c30d03fc05a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES.StartQuest();
                DC(int64(0x3c4d2c30d03fc05a), EConversationDebugInfo::Done);
                DC(int64(0xd23f2c9d92cc35eb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd23f2c9d92cc35eb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWedge84938 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xa193faa2e0fc1183);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceWedge84938);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c881444d), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xa2e993f549ef9695), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51ab1d25cd8e72b6), EConversationDebugInfo::Executing);
                // Ha. I knew it. 
                Wedge.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_150400"));
                DC(int64(0x51ab1d25cd8e72b6), EConversationDebugInfo::Done);
                DC(int64(0x51ab1d25cd8e72b7), EConversationDebugInfo::Executing);
                
                // Knew what? 
                Hero.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_150712"));
                DC(int64(0x51ab1d25cd8e72b7), EConversationDebugInfo::Done);
                DC(int64(0x51ab1d25cd8e72b8), EConversationDebugInfo::Executing);
                
                // That YOU are the freshie Lares mentioned. 
                Wedge.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_150738"));
                DC(int64(0x51ab1d25cd8e72b8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_WEDGE, Document::UDocumentSegment_Glossary_NC_ORG_WEDGE_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CONVOY, Document::UDocumentSegment_CH1_CONVOY_Decoy);
                DB(int64(0x6ccca6f0111f817e), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_WEDGE_PSST_05_00")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_WEDGE_PSST_05_00")))
                {
                    DC(int64(0x6ccca6f0111f817f), EConversationDebugInfo::Executing);
                    // Believe it or not, I had a hunch when we chatted the ...
                    Wedge.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_150202"));
                    DC(int64(0x6ccca6f0111f817f), EConversationDebugInfo::Done);
                    DC(int64(0x51ab1d25cd8e72b9), EConversationDebugInfo::Executing);
                    // You got ambition. I can see that from a mile away. 
                    Wedge.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_150205_2083"));
                    DC(int64(0x51ab1d25cd8e72b9), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6ccca6f0111f8181), EConversationDebugInfo::Executing);
                    // I saw you walk into Lares hut the other day, and ...
                    Wedge.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_150205"));
                    DC(int64(0x6ccca6f0111f8181), EConversationDebugInfo::Done);
                    DC(int64(0xb9bbc99044af37da), EConversationDebugInfo::Executing);
                    // You got ambition. I can see that from a mile away. 
                    Wedge.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_150205_2083"));
                    DC(int64(0xb9bbc99044af37da), EConversationDebugInfo::Done);
                }
                DC(int64(0xa193faa2e0fc1182), EConversationDebugInfo::Executing);
                // Anyway, you're right on the dot. These idiots just ...
                Wedge.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_102249_2785"));
                DC(int64(0xa193faa2e0fc1182), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a7c), EConversationDebugInfo::Executing);
                // See the carriage? We soaked the ground and these ...
                Wedge.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_192254"));
                DC(int64(0x6ff6d4d9e13a3a7c), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c8814485), EConversationDebugInfo::Executing);
                // That's where you come in. 
                Wedge.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_130538"));
                DC(int64(0x7e544846c8814485), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071b1), EConversationDebugInfo::Executing);
                
                // I have a feeling I won't like this. 
                Hero.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_191623"));
                DC(int64(0xeefac5320db071b1), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071b2), EConversationDebugInfo::Executing);
                
                // (laughs) It won't be that bad. All you gotta do is walk ...
                Wedge.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_191700"));
                DC(int64(0xeefac5320db071b2), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c8814492), EConversationDebugInfo::Executing);
                // Unlike us, they probably haven't seen your face much, if ...
                Wedge.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_130629"));
                DC(int64(0x7e544846c8814492), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db071be), EConversationDebugInfo::Executing);
                
                // So I'm your decoy. 
                Hero.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_191946"));
                DC(int64(0xeefac5320db071be), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c881449e), EConversationDebugInfo::Executing);
                
                // Aw, that's a nasty word. But ... yeah. You are. 
                Wedge.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_133644"));
                DC(int64(0x7e544846c881449e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Wedge_100053,
                    UTopic_Wedge_98969
                );
            }
        }
        
        
        class UTopic_Wedge_100053 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xad9e2da78b8f10de);
            default Caption = LocText("TEXT_WIP_LPBBQAJ_20240619_180438_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Wedge_100053);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad9e2da78b8f10df), EConversationDebugInfo::Executing);
                // What exactly do you want me to say? 
                Hero.AI.Say(LocText("TEXT_WIP_LPBBQAJ_20240619_180438_41"));
                DC(int64(0xad9e2da78b8f10df), EConversationDebugInfo::Done);
                DC(int64(0xad9e2da78b8f10e2), EConversationDebugInfo::Executing);
                
                // I don't know, do I look like an actor? Lares said you're ...
                Wedge.AI.Say(LocText("TEXT_WIP_LPBBQAJ_20240619_180449"));
                DC(int64(0xad9e2da78b8f10e2), EConversationDebugInfo::Done);
                DC(int64(0xad9e2da78b8f10e1), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xad9e2da78b8f10e1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Wedge_98969 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0x7e544846c88144ba);
            default Caption = LocText("TEXT_WIP_YITCJRF_20240603_133910_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Wedge_98969);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7e544846c88144bb), EConversationDebugInfo::Executing);
                // All right. Let's do this. 
                Hero.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_133910_1924"));
                DC(int64(0x7e544846c88144bb), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c88144f7), EConversationDebugInfo::Executing);
                
                // Good. Oh, and just in case Lares hasn't told you: no ...
                Wedge.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_134146"));
                DC(int64(0x7e544846c88144f7), EConversationDebugInfo::Done);
                DC(int64(0xd23f2c9d92cc35e3), EConversationDebugInfo::Executing);
                Wedge.GiveImmortality();
                DC(int64(0xd23f2c9d92cc35e3), EConversationDebugInfo::Done);
                DC(int64(0xd23f2c9d92cc35e5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.GiveImmortality(); }
                DC(int64(0xd23f2c9d92cc35e5), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecffc), EConversationDebugInfo::Executing);
                Wedge.JoinPartyOf(Hero);
                DC(int64(0xb36e20e0d7eecffc), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eecffe), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.JoinPartyOf(Hero); }
                DC(int64(0xb36e20e0d7eecffe), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eed000), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE33_882N))) { NC_ORG_ROGUE33_882N.JoinPartyOf(Hero); }
                DC(int64(0xb36e20e0d7eed000), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eed002), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE34_883N))) { NC_ORG_ROGUE34_883N.JoinPartyOf(Hero); }
                DC(int64(0xb36e20e0d7eed002), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eed004), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE35_884N))) { NC_ORG_ROGUE35_884N.JoinPartyOf(Hero); }
                DC(int64(0xb36e20e0d7eed004), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eed006), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE36_885N))) { NC_ORG_ROGUE36_885N.JoinPartyOf(Hero); }
                DC(int64(0xb36e20e0d7eed006), EConversationDebugInfo::Done);
                DC(int64(0xb36e20e0d7eed008), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE37_886N))) { NC_ORG_ROGUE37_886N.JoinPartyOf(Hero); }
                DC(int64(0xb36e20e0d7eed008), EConversationDebugInfo::Done);
                DC(int64(0x3c4d2c30d03fbfa8), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_MEETINGPOINT.SucceedQuest();
                DC(int64(0x3c4d2c30d03fbfa8), EConversationDebugInfo::Done);
                DC(int64(0x3c4d2c30d03fbfaa), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_DECOY.StartQuest();
                DC(int64(0x3c4d2c30d03fbfaa), EConversationDebugInfo::Done);
                DC(int64(0xd646913a1dea2fd0), EConversationDebugInfo::Executing);
                G1R.Convoy_PlayerBriefed = 1;
                DC(int64(0xd646913a1dea2fd0), EConversationDebugInfo::Done);
                DC(int64(0xd23f2c9d92cc35e6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd23f2c9d92cc35e6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWedge99089 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0x71f71de0def59563);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceWedge99089);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_DMEKYPF_20240617_112000"), int64(0x71f71de0def59563));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x71f71de0def59566), Guard31 != nullptr && Guard31.IsDefeated());
                    DB(int64(0x71f71de0def59567), OC_GRD_GUARD32_284N != nullptr && OC_GRD_GUARD32_284N.IsDefeated());
                    DB(int64(0x71f71de0def59568), OC_GRD_GUARD33_285N != nullptr && OC_GRD_GUARD33_285N.IsDefeated());
                    DB(int64(0x71f71de0def59569), OC_GRD_GUARD34_286N != nullptr && OC_GRD_GUARD34_286N.IsDefeated());
                    DB(int64(0x71f71de0def5956a), OC_GRD_GUARD35_287N != nullptr && OC_GRD_GUARD35_287N.IsDefeated());
                    DB(int64(0x71f71de0def5956b), OC_GRD_GUARD36_288N != nullptr && OC_GRD_GUARD36_288N.IsDefeated());
                    DB(int64(0x71f71de0def5956c), OC_GRD_GUARD37_289N != nullptr && OC_GRD_GUARD37_289N.IsDefeated());
                    DB(int64(0x71f71de0def5956d), OC_GRD_GUARD38_290N != nullptr && OC_GRD_GUARD38_290N.IsDefeated());
                    DB(int64(0x71f71de0def5958a), OC_GRD_GUARD39_291N != nullptr && OC_GRD_GUARD39_291N.IsDefeated());
                    DB(int64(0x71f71de0def5958c), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x71f71de0def5958d), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xd646913a1dea2fdc), G1R.Convoy_PlayerBriefed != 0);
                }
                
                if (Guard31 != nullptr && !Guard31.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD32_284N != nullptr && !OC_GRD_GUARD32_284N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD33_285N != nullptr && !OC_GRD_GUARD33_285N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD34_286N != nullptr && !OC_GRD_GUARD34_286N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD35_287N != nullptr && !OC_GRD_GUARD35_287N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD36_288N != nullptr && !OC_GRD_GUARD36_288N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD37_289N != nullptr && !OC_GRD_GUARD37_289N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD38_290N != nullptr && !OC_GRD_GUARD38_290N.IsDefeated())
                    return false;
                
                if (OC_GRD_GUARD39_291N != nullptr && !OC_GRD_GUARD39_291N.IsDefeated())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.Convoy_PlayerBriefed == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x71f71de0def59562), EConversationDebugInfo::Executing);
                // Rhobar's Balls, that couldn't have gone any smoother! ...
                Wedge.AI.Say(LocText("TEXT_WIP_BJTCJRF_20240604_141147_41"));
                DC(int64(0x71f71de0def59562), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWedgeExit : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xab78319ddf99abc4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab78319ddf99abc5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xab78319ddf99abc5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWedgeHello : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xab78319ddf99abcd);
            default Caption = LocText("DIA_WEDGE_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWedgePsst);
            default Rules.HideIfKnows(UChoiceWedgeHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c8814450), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab78319ddf99abce), EConversationDebugInfo::Executing);
                // What do you want from me?
                Hero.AI.Say(LocText("DIA_WEDGE_HELLO_15_00"));
                DC(int64(0xab78319ddf99abce), EConversationDebugInfo::Done);
                DC(int64(0xab78319ddf99abcf), EConversationDebugInfo::Executing);
                
                // You haven't been here long, have you? I can tell. 
                Wedge.AI.Say(LocText("DIA_WEDGE_HELLO_05_01"));
                DC(int64(0xab78319ddf99abcf), EConversationDebugInfo::Done);
                DC(int64(0xab78319ddf99abd0), EConversationDebugInfo::Executing);
                // Listen, you won't make it here for long unless you pick ...
                Wedge.AI.Say(LocText("DIA_WEDGE_HELLO_05_02"));
                DC(int64(0xab78319ddf99abd0), EConversationDebugInfo::Done);
                DC(int64(0xab78319ddf99abd1), EConversationDebugInfo::Executing);
                // And just because I'm such in a good mood today, here's a ...
                Wedge.AI.Say(LocText("DIA_WEDGE_HELLO_05_03"));
                DC(int64(0xab78319ddf99abd1), EConversationDebugInfo::Done);
                DC(int64(0x6ccca6f0111f817a), EConversationDebugInfo::Executing);
                // Butch, for example, that guy by the campfire. You should ...
                Wedge.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_145748"));
                DC(int64(0x6ccca6f0111f817a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_BUTCH, Document::UDocumentSegment_Glossary_NC_ORG_BUTCH_Avoid);
            }
        }
        
        
        class UChoiceWedgeLehrer : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xab78319ddf99abd5);
            default Caption = LocText("DIA_WEDGE_LEHRER_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWedgeHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c8814452), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x2c7aefcf57395577), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0xdd5553291fa66889), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xdd5553291fa6688a), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning() && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning() && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_WEDGE, Document::UDocumentSegment_Glossary_NC_ORG_WEDGE_Teacher);
                DB(int64(0xab78319ddf99abd8), G1R.LogWedgelearn == 0);
                
                if (G1R.LogWedgelearn == 0)
                {
                    DC(int64(0x43b55d6bf2cc7317), EConversationDebugInfo::Executing);
                    G1R.LogWedgelearn = 1;
                    DC(int64(0x43b55d6bf2cc7317), EConversationDebugInfo::Done);
                }
                DC(int64(0xab78319ddf99abda), EConversationDebugInfo::Executing);
                // What can you teach me?
                Hero.AI.Say(LocText("DIA_WEDGE_LEHRER_15_00"));
                DC(int64(0xab78319ddf99abda), EConversationDebugInfo::Done);
                DC(int64(0xab78319ddf99abdb), EConversationDebugInfo::Executing);
                
                // Depends. What do you wanna know?
                Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_05_01"));
                DC(int64(0xab78319ddf99abdb), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceWedgeLehrerPickpocket2,
                    UChoiceWedgeLehrerPickpocket,
                    UChoiceWedgeLehrerLockpick,
                    UChoiceWedgeLehrerLockpick2,
                    UChoiceWedgeLehrerBack
                );
            }
        }
        
        
        class UChoiceWedgeLehrerPickpocket2 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0x4ac2b1925a553473);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_3989");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Pickpocketing_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a55347b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master));
                    DB(int64(0x5e925542e2e7cd8), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb669), EConversationDebugInfo::Executing);
                // Teach me how to pick pockets. 
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162103"));
                DC(int64(0xa7deef969d1cb669), EConversationDebugInfo::Done);
                DB(int64(0xf33d474cfc543ed), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Skilled));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Skilled))
                {
                    DB(int64(0xcb6efa8d2649402), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Pickpocket_Skilled));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Pickpocket_Skilled))
                    {
                        DC(int64(0x4ac2b1925a553480), EConversationDebugInfo::Executing);
                        // Very well. Pickpocketing is all about distraction. 
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET_05_01"));
                        DC(int64(0x4ac2b1925a553480), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a553481), EConversationDebugInfo::Executing);
                        // I'll teach you how to improve your skills, but it's ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET_05_02"));
                        DC(int64(0x4ac2b1925a553481), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a553482), EConversationDebugInfo::Executing);
                        // You should only take the risk if nobody but your victim ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET_05_03"));
                        DC(int64(0x4ac2b1925a553482), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a553483), EConversationDebugInfo::Executing);
                        // Only an expert can take things from people's pockets ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET_05_04"));
                        DC(int64(0x4ac2b1925a553483), EConversationDebugInfo::Done);
                        DC(int64(0x85cc8718da69784e), EConversationDebugInfo::Executing);
                        // Oh, and this should go without saying, but the louder ...
                        Wedge.AI.Say(LocText("TEXT_WIP_GGNROOD_20241112_125830"));
                        DC(int64(0x85cc8718da69784e), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0cd), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Pickpocket_Skilled);
                        DC(int64(0x43b55d6bf2ccb0cd), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0ce), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x43b55d6bf2ccb0ce), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x85cc8718da697853), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Wedge.AI.Say(LocText("TEXT_WIP_GGNROOD_20241112_130329"));
                        DC(int64(0x85cc8718da697853), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x43b55d6bf2ccb0dc), EConversationDebugInfo::Executing);
                    // You're not ready to learn more just yet. Get a little ...
                    Wedge.AI.Say(LocText("TEXT_DDIAZ_20231127_135058"));
                    DC(int64(0x43b55d6bf2ccb0dc), EConversationDebugInfo::Done);
                    DC(int64(0x43b55d6bf2ccb0de), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x43b55d6bf2ccb0de), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceWedgeLehrerPickpocket : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0x4ac2b1925a55347a);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_3927");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Pickpocketing_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a553474), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master));
                    DB(int64(0x43b55d6bf2ccb0e0), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ac2b1925a55347c), EConversationDebugInfo::Executing);
                // I want to be an even better pickpocket. 
                Hero.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET_15_00"));
                DC(int64(0x4ac2b1925a55347c), EConversationDebugInfo::Done);
                DB(int64(0xf33d474cfc543fb), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Master))
                {
                    DB(int64(0xcb6efa8d2649407), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Master))
                    {
                        DC(int64(0x4ac2b1925a553477), EConversationDebugInfo::Executing);
                        // I think you've progressed far enough to be taught the ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET2_05_01"));
                        DC(int64(0x4ac2b1925a553477), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a553478), EConversationDebugInfo::Executing);
                        // But you should know that even the best can get caught ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET2_05_02"));
                        DC(int64(0x4ac2b1925a553478), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a553479), EConversationDebugInfo::Executing);
                        // Take care.
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_PICKPOCKET2_05_03"));
                        DC(int64(0x4ac2b1925a553479), EConversationDebugInfo::Done);
                        DC(int64(0x85cc8718da69784f), EConversationDebugInfo::Executing);
                        // If you get caught and the guy is weaker than you, ...
                        Wedge.AI.Say(LocText("TEXT_WIP_GGNROOD_20241112_130053"));
                        DC(int64(0x85cc8718da69784f), EConversationDebugInfo::Done);
                        DC(int64(0x85cc8718da697850), EConversationDebugInfo::Executing);
                        // But pickpocketing a Water Mage? Bad idea ... 
                        Wedge.AI.Say(LocText("TEXT_WIP_GGNROOD_20241112_130058"));
                        DC(int64(0x85cc8718da697850), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0d0), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Pickpocket_Master);
                        DC(int64(0x43b55d6bf2ccb0d0), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0d1), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x43b55d6bf2ccb0d1), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcb6efa8d2649409), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Wedge.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_154731_2785"));
                        DC(int64(0xcb6efa8d2649409), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d264940a), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xcb6efa8d264940a), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x85cc8718da697851), EConversationDebugInfo::Executing);
                    // You're not ready to learn more just yet. Get a little ...
                    Wedge.AI.Say(LocText("TEXT_DDIAZ_20231127_135058"));
                    DC(int64(0x85cc8718da697851), EConversationDebugInfo::Done);
                    DC(int64(0x43b55d6bf2ccb0db), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x43b55d6bf2ccb0db), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceWedgeLehrerLockpick : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0x4ac2b1925a55348c);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_128");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Lockpicking_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a55348d), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0x5e925542e2e7cd9), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ac2b1925a55348e), EConversationDebugInfo::Executing);
                // How do I get better at lockpicking? 
                Hero.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK_15_00"));
                DC(int64(0x4ac2b1925a55348e), EConversationDebugInfo::Done);
                DB(int64(0xf33d474cfc54417), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Skilled));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Skilled))
                {
                    DB(int64(0xcb6efa8d264940e), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Skilled));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Skilled))
                    {
                        DC(int64(0x4ac2b1925a553490), EConversationDebugInfo::Executing);
                        // You'd like to know that, wouldn't you! It's not too ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK_05_01"));
                        DC(int64(0x4ac2b1925a553490), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a553491), EConversationDebugInfo::Executing);
                        // Above all, you have to make sure that your lockpick ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK_05_02"));
                        DC(int64(0x4ac2b1925a553491), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a553492), EConversationDebugInfo::Executing);
                        // If you're a little bit more patient in the future, ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK_05_03"));
                        DC(int64(0x4ac2b1925a553492), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0c7), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Picklock_Skilled);
                        DC(int64(0x43b55d6bf2ccb0c7), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0c8), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x43b55d6bf2ccb0c8), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcb6efa8d264940f), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Wedge.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_154809"));
                        DC(int64(0xcb6efa8d264940f), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d2649411), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xcb6efa8d2649411), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x43b55d6bf2ccb0d3), EConversationDebugInfo::Executing);
                    // You're not ready to learn more just yet. Get a little ...
                    Wedge.AI.Say(LocText("TEXT_DDIAZ_20231127_135058"));
                    DC(int64(0x43b55d6bf2ccb0d3), EConversationDebugInfo::Done);
                    DC(int64(0x43b55d6bf2ccb0d5), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x43b55d6bf2ccb0d5), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceWedgeLehrerLockpick2 : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0x4ac2b1925a553485);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_3829");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Lockpicking_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a553486), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0x43b55d6bf2ccb0df), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ac2b1925a553487), EConversationDebugInfo::Executing);
                // How do I become a master lockpicker? 
                Hero.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK2_15_00"));
                DC(int64(0x4ac2b1925a553487), EConversationDebugInfo::Done);
                DB(int64(0xf33d474cfc5440b), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Master))
                {
                    DB(int64(0xcb6efa8d2649419), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Master))
                    {
                        DC(int64(0x4ac2b1925a553489), EConversationDebugInfo::Executing);
                        // Only when you've gained some experience can you tell ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK2_05_01"));
                        DC(int64(0x4ac2b1925a553489), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a55348a), EConversationDebugInfo::Executing);
                        // I think you have it. Learn to listen for the gentle ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK2_05_02"));
                        DC(int64(0x4ac2b1925a55348a), EConversationDebugInfo::Done);
                        DC(int64(0x4ac2b1925a55348b), EConversationDebugInfo::Executing);
                        // An expert in this field stands a good chance of opening ...
                        Wedge.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK2_05_03"));
                        DC(int64(0x4ac2b1925a55348b), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0ca), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Picklock_Master);
                        DC(int64(0x43b55d6bf2ccb0ca), EConversationDebugInfo::Done);
                        DC(int64(0x43b55d6bf2ccb0cb), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x43b55d6bf2ccb0cb), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcb6efa8d264941b), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Wedge.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_155314_3286"));
                        DC(int64(0xcb6efa8d264941b), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d264941c), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xcb6efa8d264941c), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x43b55d6bf2ccb0d6), EConversationDebugInfo::Executing);
                    // You're not ready to learn more just yet. Get a little ...
                    Wedge.AI.Say(LocText("TEXT_DDIAZ_20231127_135058"));
                    DC(int64(0x43b55d6bf2ccb0d6), EConversationDebugInfo::Done);
                    DC(int64(0x43b55d6bf2ccb0d8), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x43b55d6bf2ccb0d8), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceWedgeLehrerBack : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0x4ac2b1925a553472);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceWedgePsst : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xab78319ddf99abc6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceWedgePsst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xab78319ddf99abc7), Hero != nullptr && Hero.IsCloseToCharacter(Wedge, 900.0f));
                    DB(int64(0xab78319ddf99abc8), GameTime.CurrentClockTime.IsBetween(FClockTime(8, 0), FClockTime(23, 30)));
                    DB(int64(0x7e544846c881444e), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Wedge, 900.0f))
                    return false;
                
                if (!GameTime.CurrentClockTime.IsBetween(FClockTime(8, 0), FClockTime(23, 30)))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab78319ddf99abc9), EConversationDebugInfo::Executing);
                // Shh ... hey, you!
                Wedge.AI.Say(LocText("DIA_WEDGE_PSST_05_00"));
                DC(int64(0xab78319ddf99abc9), EConversationDebugInfo::Done);
                DC(int64(0xab78319ddf99abca), EConversationDebugInfo::Executing);
                
                // Who? Me?
                Hero.AI.Say(LocText("DIA_WEDGE_PSST_15_01"));
                DC(int64(0xab78319ddf99abca), EConversationDebugInfo::Done);
                DC(int64(0xab78319ddf99abcb), EConversationDebugInfo::Executing);
                
                // Yes, you. Come over for a second.
                Wedge.AI.Say(LocText("DIA_WEDGE_PSST_05_02"));
                DC(int64(0xab78319ddf99abcb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_WEDGE, Document::UDocumentSegment_Glossary_NC_ORG_WEDGE_Introduction);
            }
        }
        
        
        class UChoiceWedgeWarnsofbutch : UTopic_Hero__NC_ORG_WEDGE_850
        {
            default DebugId = int64(0xab78319ddf99abd2);
            default Caption = LocText("DIA_WEDGE_WARNSOFBUTCH_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWedgeHello);
            default Rules.HideIfKnows(UChoiceWedgeWarnsofbutch);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c8814454), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab78319ddf99abd3), EConversationDebugInfo::Executing);
                // What's the matter with this "Butch?"
                Hero.AI.Say(LocText("DIA_WEDGE_WARNSOFBUTCH_15_00"));
                DC(int64(0xab78319ddf99abd3), EConversationDebugInfo::Done);
                DC(int64(0xab78319ddf99abd4), EConversationDebugInfo::Executing);
                
                // Oh, he has a habit of greeting freshies with a fist to ...
                Wedge.AI.Say(LocText("DIA_WEDGE_WARNSOFBUTCH_05_01"));
                DC(int64(0xab78319ddf99abd4), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */