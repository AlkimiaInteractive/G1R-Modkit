#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_LARES_801 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_LARES_801";
        }
        
        
        class UTopic_NC_SLD_TORLOF_737__NC_ORG_LARES_801 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_LARES_801";
            default WithCharacter = n"NC_SLD_TORLOF_737";
            
            AGothicCharacterState GetLares() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetButch() const property
            {
                return GetCharacter(n"NC_ORG_BUTCH_851");
            }
            
            AGothicCharacterState GetLefty() const property
            {
                return GetCharacter(n"NC_ORG_LEFTY_844");
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
            
            AGothicCharacterState GetRoscoe() const property
            {
                return GetCharacter(n"NC_ORG_ROSCOE_840");
            }
            
            AGothicCharacterState GetWedge() const property
            {
                return GetCharacter(n"NC_ORG_WEDGE_850");
            }
            
            AGothicCharacterState GetTorlof() const property
            {
                return GetCharacter(n"NC_SLD_TORLOF_737");
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
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_Mordrag_826");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UTopic_Hero__NC_ORG_LARES_801 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_LARES_801";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetLares() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetButch() const property
            {
                return GetCharacter(n"NC_ORG_BUTCH_851");
            }
            
            AGothicCharacterState GetLefty() const property
            {
                return GetCharacter(n"NC_ORG_LEFTY_844");
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
            
            AGothicCharacterState GetRoscoe() const property
            {
                return GetCharacter(n"NC_ORG_ROSCOE_840");
            }
            
            AGothicCharacterState GetWedge() const property
            {
                return GetCharacter(n"NC_ORG_WEDGE_850");
            }
            
            AGothicCharacterState GetTorlof() const property
            {
                return GetCharacter(n"NC_SLD_TORLOF_737");
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
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_Mordrag_826");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UChoiceLares105815_0 : UTopic_NC_SLD_TORLOF_737__NC_ORG_LARES_801
        {
            default DebugId = int64(0xf4e84fe813e6f26f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLares105815);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.HideIfKnows(UChoiceLares105815_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x177894285efd165e), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0xf4e84fe813e6f27a), Hero != nullptr && Hero.IsCloseToCharacter(Lares, 1400.0f));
                    DB(int64(0xf4e84fe813e6f2aa), Torlof != nullptr && Torlof.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Torlof_737_Collapse));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Lares, 1400.0f))
                    return false;
                
                if (Torlof != nullptr && !Torlof.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Torlof_737_Collapse))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4e84fe813e6f265), EConversationDebugInfo::Executing);
                // The whole fuckin' mine? Are you havin' me on, or what?
                Lares.AI.Say(LocText("TEXT_WIP_RACNPYL_20241022_120542_41"));
                DC(int64(0xf4e84fe813e6f265), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares105815_1 : UTopic_NC_SLD_TORLOF_737__NC_ORG_LARES_801
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLares105815_0);
            default Rules.HideIfKnows(UChoiceLares105815_1);
            default DebugId = int64(0xf4e84fe813e6f26f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4e84fe813e6f27b), EConversationDebugInfo::Executing);
                
                // Wish I was. 
                Torlof.AI.Say(LocText("TEXT_WIP_RACNPYL_20241022_121023"));
                DC(int64(0xf4e84fe813e6f27b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares105815_2 : UTopic_NC_SLD_TORLOF_737__NC_ORG_LARES_801
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLares105815_1);
            default Rules.HideIfKnows(UChoiceLares105815_2);
            default DebugId = int64(0xf4e84fe813e6f26f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4e84fe813e6f27c), EConversationDebugInfo::Executing);
                
                // What about Ian? He make it out? 
                Lares.AI.Say(LocText("TEXT_WIP_RACNPYL_20241022_121144"));
                DC(int64(0xf4e84fe813e6f27c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares105815_3 : UTopic_NC_SLD_TORLOF_737__NC_ORG_LARES_801
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLares105815_2);
            default Rules.HideIfKnows(UChoiceLares105815_3);
            default DebugId = int64(0xf4e84fe813e6f26f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4e84fe813e6f27d), EConversationDebugInfo::Executing);
                
                // Think so. 
                Torlof.AI.Say(LocText("TEXT_WIP_RACNPYL_20241022_121153"));
                DC(int64(0xf4e84fe813e6f27d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares105815 : UTopic_NC_SLD_TORLOF_737__NC_ORG_LARES_801
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLares105815_3);
            default Rules.HideIfKnows(UChoiceLares105815);
            default DebugId = int64(0xf4e84fe813e6f26f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4e84fe813e6f27e), EConversationDebugInfo::Executing);
                
                // Hm. Well, thanks for the heads up. This is gonna be fun. 
                Lares.AI.Say(LocText("TEXT_WIP_RACNPYL_20241022_121159"));
                DC(int64(0xf4e84fe813e6f27e), EConversationDebugInfo::Done);
                DC(int64(0xf4e84fe813e6f29d), EConversationDebugInfo::Executing);
                Torlof.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Torlof_737_Wait);
                DC(int64(0xf4e84fe813e6f29d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares109508 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x5db6374fc44e0a99);
            default Caption = LocText("TEXT_WIP_EEIKOQE_20240906_104947");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresWannajoin);
            default Rules.HideIfKnows(UChoiceLares109508);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5db6374fc44e0aa3), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x5db6374fc44e0aab), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted());
                    DB(int64(0x5db6374fc44e0aac), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasSucceeded());
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5db6374fc44e0a90), EConversationDebugInfo::Executing);
                // I did some work for the Rice Lord, and he recommended I ...
                Hero.AI.Say(LocText("TEXT_WIP_EEIKOQE_20240906_104947"));
                DC(int64(0x5db6374fc44e0a90), EConversationDebugInfo::Done);
                DC(int64(0x5db6374fc44e0a91), EConversationDebugInfo::Executing);
                
                // Is that right? Hmm. Hakons's got a knack for sniffin' ...
                Lares.AI.Say(LocText("TEXT_WIP_EEIKOQE_20240906_104947_41"));
                DC(int64(0x5db6374fc44e0a91), EConversationDebugInfo::Done);
                DC(int64(0x73fa8602822d592a), EConversationDebugInfo::Executing);
                // Still, that alone won't cut it. 
                Lares.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_144549"));
                DC(int64(0x73fa8602822d592a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_RicelordEntry);
                DB(int64(0x5db6374fc44e0aae), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0x5db6374fc44e0ab7), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_JOINNC.StartQuest();
                    DC(int64(0x5db6374fc44e0ab7), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_lares_109508_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_lares_109508_exit_2");
                }
            }
        }
        
        
        class UChoiceLares181606 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x3fad8d97598fa2b5);
            default Caption = LocText("TEXT_WIP_RVXAWSC_20240419_124321");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLares84973);
            default Rules.HideIfKnows(UChoiceLares181606);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3fad8d97598fa2aa), EConversationDebugInfo::Executing);
                // Alright. Can I still go to the other camps now that I'm ...
                Hero.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_124321"));
                DC(int64(0x3fad8d97598fa2aa), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa2ab), EConversationDebugInfo::Executing);
                
                // Course you can. The templars and the warders are gonna ...
                Lares.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_124341"));
                DC(int64(0x3fad8d97598fa2ab), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa2b7), EConversationDebugInfo::Executing);
                
                // What about the Old Camp castle?
                Hero.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_122438"));
                DC(int64(0x3fad8d97598fa2b7), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa2b8), EConversationDebugInfo::Executing);
                
                // Got business with the ore barons? 
                Lares.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_124859"));
                DC(int64(0x3fad8d97598fa2b8), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa2b9), EConversationDebugInfo::Executing);
                
                // Just curious. 
                Hero.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_124934"));
                DC(int64(0x3fad8d97598fa2b9), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa2ba), EConversationDebugInfo::Executing);
                
                // Hm. Well, castle's off limit for bandits and mercs, but ...
                Lares.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_122504"));
                DC(int64(0x3fad8d97598fa2ba), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa2bb), EConversationDebugInfo::Executing);
                // Anyway, enough of the chit chat. See you around. 
                Lares.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_125013"));
                DC(int64(0x3fad8d97598fa2bb), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa2c5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3fad8d97598fa2c5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLares215224 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x39af4de912cc6a91);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_174211");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLares84973);
            default Rules.HideIfKnows(UChoiceLares215224);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39af4de912cc6a9f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39af4de912cc6a84), EConversationDebugInfo::Executing);
                // Do you know who could improve my armor?
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_174211"));
                DC(int64(0x39af4de912cc6a84), EConversationDebugInfo::Done);
                DC(int64(0x39af4de912cc6a85), EConversationDebugInfo::Executing);
                
                // Ask Wolf, he is the best here.
                Lares.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_174211_2785"));
                DC(int64(0x39af4de912cc6a85), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares84904 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xa193faa2e0fc117b);
            default Caption = LocText("TEXT_WIP_NWAGUXL_20240318_101943");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_IGLOWIC_20240320_181135_2238"), int64(0xa193faa2e0fc117b));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FPBBQAJ_20240617_190210"), int64(0xa193faa2e0fc117b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c8814416), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xb2966751e42fdf85), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa193faa2e0fc1179), EConversationDebugInfo::Executing);
                
                // Tell me about that "special assignment." What do you ...
                Hero.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_101943"));
                DC(int64(0xa193faa2e0fc1179), EConversationDebugInfo::Done);
                DB(int64(0x6ff6d4d9e13a3a34), Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.IsRunning())
                {
                    DC(int64(0x6ff6d4d9e13a3a35), EConversationDebugInfo::Executing);
                    // Maybe get that wax outta your ear. I told you, first ...
                    Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_181944"));
                    DC(int64(0x6ff6d4d9e13a3a35), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_lares_84904_exit_1");
                    DC(int64(0x7e544846c8814357), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7e544846c8814357), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6ff6d4d9e13a3a37), EConversationDebugInfo::Executing);
                    // Help us raid one of Gomez's convoys. 
                    Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_182029"));
                    DC(int64(0x6ff6d4d9e13a3a37), EConversationDebugInfo::Done);
                    DC(int64(0x6ff6d4d9e13a3a39), EConversationDebugInfo::Executing);
                    // Not long from now, the Old Camp is gonna send supplies ...
                    Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_182103"));
                    DC(int64(0x6ff6d4d9e13a3a39), EConversationDebugInfo::Done);
                    DC(int64(0x7e544846c88142e8), EConversationDebugInfo::Executing);
                    
                    // The goods from the supply list.
                    Hero.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_121937"));
                    DC(int64(0x7e544846c88142e8), EConversationDebugInfo::Done);
                    DC(int64(0x7e544846c88142e9), EConversationDebugInfo::Executing);
                    
                    // That's right. Thanks to you, it'll be even more packed ...
                    Lares.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_121938"));
                    DC(int64(0x7e544846c88142e9), EConversationDebugInfo::Done);
                    DC(int64(0x7e544846c881431c), EConversationDebugInfo::Executing);
                    // Join me lads for the raid, and don't fuck up - then ...
                    Lares.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_122017"));
                    DC(int64(0x7e544846c881431c), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Lares_88238,
                        UTopic_Lares_88280,
                        UTopic_Lares_88258,
                        UTopic_Lares_89030
                    );
                }
            }
        }
        
        
        class UTopic_Lares_88238 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x6ff6d4d9e13a3a43);
            default Caption = LocText("TEXT_WIP_IGLOWIC_20240320_182859_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_88238);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ff6d4d9e13a3a44), EConversationDebugInfo::Executing);
                // Don't you think they'll see it coming? Diego sounded odd ...
                Hero.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_182859_686"));
                DC(int64(0x6ff6d4d9e13a3a44), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a50), EConversationDebugInfo::Executing);
                
                // Maybe they do, maybe they don't. And if they send some ...
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_183037"));
                DC(int64(0x6ff6d4d9e13a3a50), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a46), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6ff6d4d9e13a3a46), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_88280 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x6ff6d4d9e13a3a4b);
            default Caption = LocText("TEXT_WIP_IGLOWIC_20240320_182908_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_88280);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ff6d4d9e13a3a4c), EConversationDebugInfo::Executing);
                // How will you handle the guards? Will you kill them?
                Hero.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_182908_1609"));
                DC(int64(0x6ff6d4d9e13a3a4c), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a57), EConversationDebugInfo::Executing);
                
                // What, and start an all out war with Gomez? You're way ...
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_183648"));
                DC(int64(0x6ff6d4d9e13a3a57), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db0716a), EConversationDebugInfo::Executing);
                // We're just gonna knock their lights out. No reason for ...
                Lares.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_185650"));
                DC(int64(0xeefac5320db0716a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CONVOY, Document::UDocumentSegment_CH1_CONVOY_Nokills);
                DC(int64(0x6ff6d4d9e13a3a4e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6ff6d4d9e13a3a4e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_88258 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x6ff6d4d9e13a3a47);
            default Caption = LocText("TEXT_WIP_IGLOWIC_20240320_182859_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ff6d4d9e13a3a48), EConversationDebugInfo::Executing);
                // I'll have to think about. 
                Hero.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_182859_3984"));
                DC(int64(0x6ff6d4d9e13a3a48), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a51), EConversationDebugInfo::Executing);
                
                // Do you, now? Alright, but don't think too long. 
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_183445"));
                DC(int64(0x6ff6d4d9e13a3a51), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a58), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ff6d4d9e13a3a58), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Lares_89030 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x6ff6d4d9e13a3a53);
            default Caption = LocText("TEXT_WIP_IGLOWIC_20240320_183619_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_89030);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ff6d4d9e13a3a54), EConversationDebugInfo::Executing);
                // I'm in. Give me the details. 
                Hero.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_183619_3569"));
                DC(int64(0x6ff6d4d9e13a3a54), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a59), EConversationDebugInfo::Executing);
                
                // Wedge is gonna do that - he's leading the raidin' party ...
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_183801"));
                DC(int64(0x6ff6d4d9e13a3a59), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db07176), EConversationDebugInfo::Executing);
                
                // Where do I find Wedge? 
                Hero.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_190009"));
                DC(int64(0xeefac5320db07176), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a5a), EConversationDebugInfo::Executing);
                
                // At the road that leads from the Old Camp to the Old ...
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_183844"));
                DC(int64(0x6ff6d4d9e13a3a5a), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c8814460), EConversationDebugInfo::Executing);
                // Oh, and if the Reds are already en route, make sure they ...
                Lares.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_130052"));
                DC(int64(0x7e544846c8814460), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c8814461), EConversationDebugInfo::Executing);
                // You're a fresh face, but if they smell somethin' fishy, ...
                Lares.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_130156"));
                DC(int64(0x7e544846c8814461), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db07177), EConversationDebugInfo::Executing);
                
                // I'll keep my distance. 
                Hero.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_190200"));
                DC(int64(0xeefac5320db07177), EConversationDebugInfo::Done);
                DC(int64(0xeefac5320db07178), EConversationDebugInfo::Executing);
                
                // Good. Curious to see how you'll do. 
                Lares.AI.Say(LocText("TEXT_WIP_FPBBQAJ_20240617_190210"));
                DC(int64(0xeefac5320db07178), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CONVOY, Document::UDocumentSegment_CH1_CONVOY_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CONVOY, Document::UDocumentSegment_CH1_CONVOY_WedgeLeads);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CONVOY, Document::UDocumentSegment_CH1_CONVOY_GornWeapon);
                DC(int64(0x2833fa3cd7752637), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnConvoyAttack");
                DC(int64(0x2833fa3cd7752637), EConversationDebugInfo::Done);
                DC(int64(0x2833fa3cd7752639), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Wedge))) { Wedge.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Wedge_850_Convoy); }
                DC(int64(0x2833fa3cd7752639), EConversationDebugInfo::Done);
                DC(int64(0x2833fa3cd775263b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Butch_851_Convoy); }
                DC(int64(0x2833fa3cd775263b), EConversationDebugInfo::Done);
                DC(int64(0x2833fa3cd775263d), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY.StartQuest();
                DC(int64(0x2833fa3cd775263d), EConversationDebugInfo::Done);
                DC(int64(0xd1b38339089a83d0), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Wedge))) { Wedge.SetTrueGuild(UGE_Guild_Human_Convoy_NewCamp); }
                DC(int64(0xd1b38339089a83d0), EConversationDebugInfo::Done);
                DC(int64(0xd1b38339089a83d2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.SetTrueGuild(UGE_Guild_Human_Convoy_NewCamp); }
                DC(int64(0xd1b38339089a83d2), EConversationDebugInfo::Done);
                DC(int64(0x9e4b0bbfb29e11a7), EConversationDebugInfo::Executing);
                G1R.ActivateStoryDataLayer("ConvoyAttack");
                DC(int64(0x9e4b0bbfb29e11a7), EConversationDebugInfo::Done);
                DC(int64(0x3c4d2c30d03fbe76), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_CONVOY.StartQuest();
                DC(int64(0x3c4d2c30d03fbe76), EConversationDebugInfo::Done);
                DC(int64(0xdb653d5a3e48334e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN.StartQuest();
                DC(int64(0xdb653d5a3e48334e), EConversationDebugInfo::Done);
                DC(int64(0xd159e82c5954caa0), EConversationDebugInfo::Executing);
                G1R.ClearPathForConvoy();
                DC(int64(0xd159e82c5954caa0), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c88141d0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7e544846c88141d0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLares84973 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xa193faa2e0fc118b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceLares84973);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd1837ccde47da7be), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xc909484e69156b97), Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE.HasSucceeded());
                    DB(int64(0xc909484e69156ba3), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE.HasSucceeded())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa193faa2e0fc118a), EConversationDebugInfo::Executing);
                // Look who it is. How did it go?
                Lares.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_102429_2386"));
                DC(int64(0xa193faa2e0fc118a), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a77), EConversationDebugInfo::Executing);
                
                // They didn't know what hit them. 
                Hero.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_191432"));
                DC(int64(0x6ff6d4d9e13a3a77), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a78), EConversationDebugInfo::Executing);
                
                // (laughs) That's the spirit. Well done, mate - I knew you ...
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_191514"));
                DC(int64(0x6ff6d4d9e13a3a78), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaefd1), EConversationDebugInfo::Executing);
                
                // Does that mean I'm in? 
                Hero.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_142140"));
                DC(int64(0xebd1924233aaefd1), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaefd2), EConversationDebugInfo::Executing);
                
                // Damn right it does. I'm a man of me word. 
                Lares.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_142244"));
                DC(int64(0xebd1924233aaefd2), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a79), EConversationDebugInfo::Executing);
                // Here, this will be more useful than those rags you're ...
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_191723"));
                DC(int64(0x6ff6d4d9e13a3a79), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_Success);
                DB(int64(0x56788585a6b9103), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINOC, Document::UDocumentSegment_CH1_JOINOC_FailNC);
                }
                DB(int64(0x56788585a6b9831), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_FailNC);
                }
                DC(int64(0x9c096e8facaf947f), EConversationDebugInfo::Executing);
                Hero.SetTrueGuild(UGE_Guild_Human_NewCamp_Rogue);
                DC(int64(0x9c096e8facaf947f), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf9481), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UOrg_Armor, 1);
                DC(int64(0x9c096e8facaf9481), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf9489), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipArmorOfClass(UOrg_Armor);
                DC(int64(0x9c096e8facaf9489), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf948d), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC.SucceedQuest();
                DC(int64(0x9c096e8facaf948d), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf948f), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC.FailQuest();
                DC(int64(0x9c096e8facaf948f), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf9491), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI.FailQuest();
                DC(int64(0x9c096e8facaf9491), EConversationDebugInfo::Done);
                DC(int64(0x71f71de0def59587), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Wedge))) { Wedge.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Wedge_850_Start); }
                DC(int64(0x71f71de0def59587), EConversationDebugInfo::Done);
                DC(int64(0x71f71de0def59589), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Butch_851_Start); }
                DC(int64(0x71f71de0def59589), EConversationDebugInfo::Done);
                DC(int64(0x71f71de0def595cc), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES.SucceedQuest();
                DC(int64(0x71f71de0def595cc), EConversationDebugInfo::Done);
                DC(int64(0x3c4d2c30d03fbe78), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_CONVOY.SucceedQuest();
                DC(int64(0x3c4d2c30d03fbe78), EConversationDebugInfo::Done);
                DC(int64(0x68a7182b4ab6a545), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS.FailQuest();
                DC(int64(0x68a7182b4ab6a545), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a12e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.RemoveImmortality(); }
                DC(int64(0x7858bf075764a12e), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a149), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Wedge))) { Wedge.RemoveImmortality(); }
                DC(int64(0x7858bf075764a149), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a14b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE35_884N))) { NC_ORG_ROGUE35_884N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a14b), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a14d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE34_883N))) { NC_ORG_ROGUE34_883N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a14d), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a14f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE33_882N))) { NC_ORG_ROGUE33_882N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a14f), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a151), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE37_886N))) { NC_ORG_ROGUE37_886N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a151), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a153), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE36_885N))) { NC_ORG_ROGUE36_885N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a153), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a16c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Guard31))) { Guard31.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a16c), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a16e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD32_284N))) { OC_GRD_GUARD32_284N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a16e), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a170), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD33_285N))) { OC_GRD_GUARD33_285N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a170), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a172), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD34_286N))) { OC_GRD_GUARD34_286N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a172), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a174), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD35_287N))) { OC_GRD_GUARD35_287N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a174), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a176), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD36_288N))) { OC_GRD_GUARD36_288N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a176), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a178), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD37_289N))) { OC_GRD_GUARD37_289N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a178), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a17a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD38_290N))) { OC_GRD_GUARD38_290N.NPCState.RemoveFromWorld(); }
                DC(int64(0x7858bf075764a17a), EConversationDebugInfo::Done);
                DC(int64(0x15a7fd7cded127ac), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD39_291N))) { OC_GRD_GUARD39_291N.NPCState.RemoveFromWorld(); }
                DC(int64(0x15a7fd7cded127ac), EConversationDebugInfo::Done);
                DC(int64(0x15a7fd7cded127ae), EConversationDebugInfo::Executing);
                G1R.Thorus_Permission_Interior = 0;
                DC(int64(0x15a7fd7cded127ae), EConversationDebugInfo::Done);
                DC(int64(0xd9e510f986d14bbc), EConversationDebugInfo::Executing);
                G1R.DeactivateStoryDataLayer("ConvoyAttack");
                DC(int64(0xd9e510f986d14bbc), EConversationDebugInfo::Done);
                DC(int64(0xd9e510f986d14bbe), EConversationDebugInfo::Executing);
                G1R.ActivateStoryDataLayer("ConvoyAttack_After");
                DC(int64(0xd9e510f986d14bbe), EConversationDebugInfo::Done);
                DC(int64(0x37bd0af5f6d33d33), EConversationDebugInfo::Executing);
                G1R.Thorus_Permission_Exterior = 0;
                DC(int64(0x37bd0af5f6d33d33), EConversationDebugInfo::Done);
                DB(int64(0x3eed5775e7b3eaf9), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3eb06), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.FailQuest();
                    DC(int64(0x3eed5775e7b3eb06), EConversationDebugInfo::Done);
                }
                DB(int64(0x3eed5775e7b3eb2b), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3eb38), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.FailQuest();
                    DC(int64(0x3eed5775e7b3eb38), EConversationDebugInfo::Done);
                }
                DB(int64(0x3eed5775e7b3eb45), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3eb68), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BRINGLIST.FailQuest();
                    DC(int64(0x3eed5775e7b3eb68), EConversationDebugInfo::Done);
                }
                DB(int64(0x3eed5775e7b3eb75), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning())
                {
                    DC(int64(0x3eed5775e7b3eb8d), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_MORDRAGKO.FailQuest();
                    DC(int64(0x3eed5775e7b3eb8d), EConversationDebugInfo::Done);
                }
                DB(int64(0x9852e53caa8f78fe), Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning())
                {
                    DC(int64(0x9852e53caa8f7921), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_FINGERS_RING.FailQuest();
                    DC(int64(0x9852e53caa8f7921), EConversationDebugInfo::Done);
                }
                DB(int64(0x9a4c498930550bab), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait));
                
                if (Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait))
                {
                    DC(int64(0x9a4c498930550be8), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Mordrag))) { Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated); }
                    DC(int64(0x9a4c498930550be8), EConversationDebugInfo::Done);
                }
                DC(int64(0xe07185f7dcebccb7), EConversationDebugInfo::Executing);
                // What now? 
                Hero.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_122221"));
                DC(int64(0xe07185f7dcebccb7), EConversationDebugInfo::Done);
                DC(int64(0xe07185f7dcebccb8), EConversationDebugInfo::Executing);
                
                // Now you go get settled in. Come find me when you have, I ...
                Lares.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_122221_2238"));
                DC(int64(0xe07185f7dcebccb8), EConversationDebugInfo::Done);
                DC(int64(0xd8f47a43dfcb94f4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd8f47a43dfcb94f4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLares86268 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xdc24fe363c0a9c15);
            default Caption = LocText("TEXT_WIP_MWAGUXL_20240319_113500");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceLares86268);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdc24fe363c0a9c18), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning());
                    DB(int64(0xdc24fe363c0a9c19), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0));
                    DB(int64(0xdc24fe363c0a9c20), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning());
                    DB(int64(0xdc24fe363c0a9c21), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning() && Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0))
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc24fe363c0a9c13), EConversationDebugInfo::Executing);
                // Caine's dead.
                Hero.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_113500"));
                DC(int64(0xdc24fe363c0a9c13), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c14), EConversationDebugInfo::Executing);
                
                // What?
                Lares.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_113500_2386"));
                DC(int64(0xdc24fe363c0a9c14), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c22), EConversationDebugInfo::Executing);
                
                // He had visions that lead him to some tomb in the ...
                Hero.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_122044"));
                DC(int64(0xdc24fe363c0a9c22), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c24), EConversationDebugInfo::Executing);
                
                // Fuck me ... any other strange turns I should know about? ...
                Lares.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_122111"));
                DC(int64(0xdc24fe363c0a9c24), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c25), EConversationDebugInfo::Executing);
                
                // No, but Caine had this here with him - some kind of ...
                Hero.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_122112"));
                DC(int64(0xdc24fe363c0a9c25), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c26), EConversationDebugInfo::Executing);
                
                // What's - ugh. That's magical, ain't it? Fuckin' thing ...
                Lares.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_122125"));
                DC(int64(0xdc24fe363c0a9c26), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf7d5), EConversationDebugInfo::Executing);
                // Or, wait, I have a better idea. Take this and show it to ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185155"));
                DC(int64(0x927b2472124bf7d5), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf80b), EConversationDebugInfo::Executing);
                
                // You think he knows what it is? 
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185615"));
                DC(int64(0x927b2472124bf80b), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf80c), EConversationDebugInfo::Executing);
                
                // Don't know, don't care. What matters is, the Loons are ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185620"));
                DC(int64(0x927b2472124bf80c), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaefef), EConversationDebugInfo::Executing);
                // And who knows, if you tell them about the vision Caine ...
                Lares.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_143721"));
                DC(int64(0xebd1924233aaefef), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf80d), EConversationDebugInfo::Executing);
                
                // ... I might be able to win their trust.
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185721"));
                DC(int64(0x927b2472124bf80d), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf80e), EConversationDebugInfo::Executing);
                
                // That's right. 
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185742"));
                DC(int64(0x927b2472124bf80e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GOTOPSICAMP, Document::UDocumentSegment_CH2_GOTOPSICAMP_AfterReport);
                DC(int64(0xa71e1f215c818531), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES.SucceedQuest();
                DC(int64(0xa71e1f215c818531), EConversationDebugInfo::Done);
                DC(int64(0xfaea3afa98467b1b), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CONVIDENCE.StartQuest();
                DC(int64(0xfaea3afa98467b1b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lares_93417,
                    UTopic_Lares_93437,
                    UTopic_Lares_112842
                );
            }
        }
        
        
        class UTopic_Lares_93417 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x927b2472124bf7e7);
            default Caption = LocText("TEXT_WIP_BTMTGUC_20240402_185419_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_93417);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf7e8), EConversationDebugInfo::Executing);
                // Why do you care about the Loons?
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185419_443"));
                DC(int64(0x927b2472124bf7e8), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf801), EConversationDebugInfo::Executing);
                
                // I don't, per se. But they're fanatics with big swords ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185525"));
                DC(int64(0x927b2472124bf801), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf80f), EConversationDebugInfo::Executing);
                // And there's rumors some of them are starting to doubt ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_190108"));
                DC(int64(0x927b2472124bf80f), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaeff9), EConversationDebugInfo::Executing);
                // So, if there's about to be a power struggle, I want to ...
                Lares.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_144211"));
                DC(int64(0xebd1924233aaeff9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_93437 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x927b2472124bf7eb);
            default Caption = LocText("TEXT_WIP_BTMTGUC_20240402_185419_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_93437);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf7ec), EConversationDebugInfo::Executing);
                
                // Alright. I'll take care of it. 
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_185419_491"));
                DC(int64(0x927b2472124bf7ec), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf810), EConversationDebugInfo::Executing);
                
                // I'm countin' on it. 
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_190149"));
                DC(int64(0x927b2472124bf810), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_112842 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x162ad6fd32a9dc66);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_190714_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_112842);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x162ad6fd32a9dc67), EConversationDebugInfo::Executing);
                
                // Is that really necessary? I want to work for YOU, not ...
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_190714_1340"));
                DC(int64(0x162ad6fd32a9dc67), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dc96), EConversationDebugInfo::Executing);
                
                // Very touching. But you ARE workin' for me by workin' for ...
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_190749"));
                DC(int64(0x162ad6fd32a9dc96), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dc97), EConversationDebugInfo::Executing);
                // See it as a compliment, freshie: sure, I could have you ...
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_190814"));
                DC(int64(0x162ad6fd32a9dc97), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dc98), EConversationDebugInfo::Executing);
                // Getting intel on the other camps helps us even more than ...
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_190847"));
                DC(int64(0x162ad6fd32a9dc98), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares90982 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x177894285efd1649);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceLares90982);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x177894285efd165e), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0x18da1901c69a2f9), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x63b552139e58fe44), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x63b552139e58fe45), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x177894285efd163f), EConversationDebugInfo::Executing);
                // The lost sheep returns. I was half expecting you'd come ...
                Lares.AI.Say(LocText("TEXT_WIP_TLUUHUE_20240417_095929_41"));
                DC(int64(0x177894285efd163f), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fdc2), EConversationDebugInfo::Executing);
                // The lads were already takin' bets when you'd turn coat ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_123745"));
                DC(int64(0xd58c60a1de7fdc2), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fdd7), EConversationDebugInfo::Executing);
                
                // Heard your chat with Torlof - you already know about the ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_123957"));
                DC(int64(0xd58c60a1de7fdd7), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fde2), EConversationDebugInfo::Executing);
                
                // As do you, it seems. 
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_124120"));
                DC(int64(0xd58c60a1de7fde2), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fdf2), EConversationDebugInfo::Executing);
                // Right proper fuck up, that is ... fingers crossed Gomez ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_124709_2238"));
                DC(int64(0xd58c60a1de7fdf2), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lares_92460,
                    UTopic_Lares_92480,
                    UTopic_Lares_94381
                );
            }
        }
        
        
        class UTopic_Lares_92460 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xd58c60a1de7fe08);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_124745_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_92460);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7fe09), EConversationDebugInfo::Executing);
                // Do you know how it happened, anyway? 
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_124745_1924"));
                DC(int64(0xd58c60a1de7fe09), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe20), EConversationDebugInfo::Executing);
                
                // Nah, not really. Some folk say it was a cave-in, others ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_125833"));
                DC(int64(0xd58c60a1de7fe20), EConversationDebugInfo::Done);
                DC(int64(0x58dd47ffed4f7a0b), EConversationDebugInfo::Executing);
                // Maybe time will tell. 
                Lares.AI.Say(LocText("TEXT_WIP_RDMVSBC_20240910_154739"));
                DC(int64(0x58dd47ffed4f7a0b), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe0b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd58c60a1de7fe0b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_92480 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xd58c60a1de7fe0c);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_124745_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_92480);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7fe0d), EConversationDebugInfo::Executing);
                // You're worried about Gomez?
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_124745_3436"));
                DC(int64(0xd58c60a1de7fe0d), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe19), EConversationDebugInfo::Executing);
                
                // Course I am. That mine is the bedrock of Gomez's power ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_124829"));
                DC(int64(0xd58c60a1de7fe19), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe1c), EConversationDebugInfo::Executing);
                // With no ore, the king is gonna treat him like the ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_125049"));
                DC(int64(0xd58c60a1de7fe1c), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe1d), EConversationDebugInfo::Executing);
                
                // You think he might come after our ore. 
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_125112"));
                DC(int64(0xd58c60a1de7fe1d), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe1f), EConversationDebugInfo::Executing);
                
                // I dunno. I'd like to think he ain't that daft, but with ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_125403"));
                DC(int64(0xd58c60a1de7fe1f), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe0f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd58c60a1de7fe0f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_94381 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xd58c60a1de7fe21);
            default Caption = LocText("TEXT_WIP_QVXAWSC_20240418_125905_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_94381);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd58c60a1de7fe22), EConversationDebugInfo::Executing);
                // Y'Berion is dead. 
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_125905_3286"));
                DC(int64(0xd58c60a1de7fe22), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe37), EConversationDebugInfo::Executing);
                
                // Tell me what happened. 
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_125931"));
                DC(int64(0xd58c60a1de7fe37), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe38), EConversationDebugInfo::Executing);
                
                // The Great Awakening killed him. Turns out the Sleeper is ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_125936"));
                DC(int64(0xd58c60a1de7fe38), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe39), EConversationDebugInfo::Executing);
                // Kalom refuses to believe it and left the camp with his ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_130702"));
                DC(int64(0xd58c60a1de7fe39), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe3a), EConversationDebugInfo::Executing);
                
                // Well, fuck me to the sky and back. And here I thought ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_130757"));
                DC(int64(0xd58c60a1de7fe3a), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe3b), EConversationDebugInfo::Executing);
                // Let me guess, Angar's in charge now? What's he make of ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_131117"));
                DC(int64(0xd58c60a1de7fe3b), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe3c), EConversationDebugInfo::Executing);
                
                // Yes, Angar leads them now. And he doesn't know what to ...
                Hero.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_131411"));
                DC(int64(0xd58c60a1de7fe3c), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe3d), EConversationDebugInfo::Executing);
                
                // Probably not. Well, what can I say? Good job, I s'pose. ...
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_131526"));
                DC(int64(0xd58c60a1de7fe3d), EConversationDebugInfo::Done);
                DC(int64(0xd58c60a1de7fe49), EConversationDebugInfo::Executing);
                // Here, take that. You've earned it. 
                Lares.AI.Say(LocText("TEXT_WIP_QVXAWSC_20240418_131913"));
                DC(int64(0xd58c60a1de7fe49), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GOTOPSICAMP, Document::UDocumentSegment_CH2_GOTOPSICAMP_Completed);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Lares.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a320), EConversationDebugInfo::Executing);
                Lares.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x18da1901c69a320), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a32a), EConversationDebugInfo::Executing);
                // What now? 
                Hero.AI.Say(LocText("TEXT_WIP_YPUISQL_20240425_111753"));
                DC(int64(0x18da1901c69a32a), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a32b), EConversationDebugInfo::Executing);
                
                // Now you lay low for a bit. At least as far as I'm ...
                Lares.AI.Say(LocText("TEXT_WIP_YPUISQL_20240425_111753_2083"));
                DC(int64(0x18da1901c69a32b), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a335), EConversationDebugInfo::Executing);
                // I think I'm gonna smoke meself some swampweed now ... I ...
                Lares.AI.Say(LocText("TEXT_WIP_YPUISQL_20240425_111820"));
                DC(int64(0x18da1901c69a335), EConversationDebugInfo::Done);
                DC(int64(0xf4e84fe813e6f289), EConversationDebugInfo::Executing);
                Lares.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Lares_801_Smoke);
                DC(int64(0xf4e84fe813e6f289), EConversationDebugInfo::Done);
                DC(int64(0xf4e84fe813e6f2a9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Roscoe))) { Roscoe.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Roscoe_840_Start); }
                DC(int64(0xf4e84fe813e6f2a9), EConversationDebugInfo::Done);
                DC(int64(0xfaea3afa98467b2b), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT.SucceedQuest();
                DC(int64(0xfaea3afa98467b2b), EConversationDebugInfo::Done);
                DC(int64(0x18da1901c69a351), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x18da1901c69a351), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLares97151 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x45363f081b0459c0);
            default Caption = LocText("TEXT_WIP_JSOSVZF_20240509_150708");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceLares97151);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5db6374fc44e0a04), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0x5db6374fc44e0a17), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x45363f081b0459b5), EConversationDebugInfo::Executing);
                // Y'Berion asked me to find something else for him. An ...
                Hero.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_150708"));
                DC(int64(0x45363f081b0459b5), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b0459b6), EConversationDebugInfo::Executing);
                
                // Well, that sounds ominous. What for? That ritual of ...
                Lares.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_150708_2083"));
                DC(int64(0x45363f081b0459b6), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dca2), EConversationDebugInfo::Executing);
                
                // Yeah. Apparently the Fire Mages have it - any way you ...
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191039"));
                DC(int64(0x162ad6fd32a9dca2), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dca3), EConversationDebugInfo::Executing);
                
                // Afraid not - but if you haven't done it already, go see ...
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191104"));
                DC(int64(0x162ad6fd32a9dca3), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dca4), EConversationDebugInfo::Executing);
                // That'll at least get you into the castle. 
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191123"));
                DC(int64(0x162ad6fd32a9dca4), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dca5), EConversationDebugInfo::Executing);
                // Thanks for coming in - keep playing along. 
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191130"));
                DC(int64(0x162ad6fd32a9dca5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLares97168 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x45363f081b0459d6);
            default Caption = LocText("TEXT_WIP_JSOSVZF_20240509_150742");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceLares97168);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5db6374fc44e0a3c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0x5db6374fc44e0a44), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x45363f081b0459cb), EConversationDebugInfo::Executing);
                
                // Cor Kalom, the alchemist of the Swamp Campers, sent me ...
                Hero.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_150742"));
                DC(int64(0x45363f081b0459cb), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b0459cc), EConversationDebugInfo::Executing);
                
                // Well that sounds like one perfectly miserable way to ...
                Lares.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_150742_1924"));
                DC(int64(0x45363f081b0459cc), EConversationDebugInfo::Done);
                DB(int64(0x45363f081b045a06), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YPWRGKF_20250113_121029")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YPWRGKF_20250113_121029")))
                {
                    DC(int64(0x45363f081b045a13), EConversationDebugInfo::Executing);
                    // How did it go? 
                    Lares.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_150923_686"));
                    DC(int64(0x45363f081b045a13), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9dcc4), EConversationDebugInfo::Executing);
                    
                    // I found the nest, and killed their queen. There were ...
                    Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191407"));
                    DC(int64(0x162ad6fd32a9dcc4), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9dcc5), EConversationDebugInfo::Executing);
                    
                    // For that dreamjuice, ain't it? Interesting. 
                    Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191431"));
                    DC(int64(0x162ad6fd32a9dcc5), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x45363f081b045a20), EConversationDebugInfo::Executing);
                    // Wedge already told me about it, though. Word is you made ...
                    Lares.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_150926_2386"));
                    DC(int64(0x45363f081b045a20), EConversationDebugInfo::Done);
                }
                DC(int64(0x162ad6fd32a9dcb2), EConversationDebugInfo::Executing);
                // Any chance you scooped up some extra ore for us in that ...
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191352_3719"));
                DC(int64(0x162ad6fd32a9dcb2), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dcc6), EConversationDebugInfo::Executing);
                
                // I was kind of busy staying alive. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191535"));
                DC(int64(0x162ad6fd32a9dcc6), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dcc7), EConversationDebugInfo::Executing);
                
                // (laughs) Fair enough. 
                Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_191537"));
                DC(int64(0x162ad6fd32a9dcc7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801Lares400ore : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e49);
            default Caption = LocText("ORG_801_LARES_400ORE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_org_801_lares_getkraut_exit_1");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e99a6693986522f), Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.IsRunning());
                    DB(int64(0x7e99a66939865230), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasSucceeded());
                    DB(int64(0x7e99a66939865231), Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.IsRunning());
                    DB(int64(0x7e99a66939865232), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.IsRunning() && Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasSucceeded())
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.IsRunning() && Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35e4c), EConversationDebugInfo::Executing);
                
                // I have the four hundred nuggets from Isidro's swampweed. 
                Hero.AI.Say(LocText("ORG_801_LARES_400ORE_15_00"));
                DC(int64(0x4495089632c35e4c), EConversationDebugInfo::Done);
                DB(int64(0x4495089632c35e4e), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 400, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 400, 0))
                {
                    DC(int64(0x4495089632c35e4f), EConversationDebugInfo::Executing);
                    // Well, well, what have we here. Good job. I'll remember ...
                    Lares.AI.Say(LocText("ORG_801_LARES_400ORE_11_01"));
                    DC(int64(0x4495089632c35e4f), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_Success);
                    DC(int64(0x9c096e8facaf93f6), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET400ORE_OBJ_REPORT.SucceedQuest();
                    DC(int64(0x9c096e8facaf93f6), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf93f8), EConversationDebugInfo::Executing);
                    G1R.Points_NC += 5;
                    DC(int64(0x9c096e8facaf93f8), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf93fa), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Lares, UItMi_Orenugget, 400);
                    DC(int64(0x9c096e8facaf93fa), EConversationDebugInfo::Done);
                    DC(int64(0x681c1c2a21cf2930), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE.SucceedQuest();
                    DC(int64(0x681c1c2a21cf2930), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_801_lares_400ore_exit_1");
                }
                else
                {
                    DC(int64(0x4495089632c35e54), EConversationDebugInfo::Executing);
                    // Countin' ain't your strong suit, eh? Come back when you ...
                    Lares.AI.Say(LocText("ORG_801_LARES_400ORE_NOORE_11_00"));
                    DC(int64(0x4495089632c35e54), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_801_lares_400ore_exit_2");
                }
            }
        }
        
        
        class UChoiceOrg801LaresBringlist : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e02);
            default Caption = LocText("ORG_801_LARES_BRINGLIST_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresWannajoin);
            default Rules.HideIfKnows(UChoiceOrg801LaresBringlist);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35e03), Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0));
                    DB(int64(0x5db6374fc44e0d06), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_List, 1, 0))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35e05), EConversationDebugInfo::Executing);
                // I have something for you. Ian's supply list from the Old ...
                Hero.AI.Say(LocText("ORG_801_LARES_BRINGLIST_15_00"));
                DC(int64(0x4495089632c35e05), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e06), EConversationDebugInfo::Executing);
                
                // You - you takin' the piss or what? Show me. 
                Lares.AI.Say(LocText("ORG_801_LARES_BRINGLIST_11_01"));
                DC(int64(0x4495089632c35e06), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e08), EConversationDebugInfo::Executing);
                
                // Sure. 
                Hero.AI.Say(LocText("ORG_801_LARES_BRINGLIST_15_03"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x4495089632c35e08), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_BRINGLISTBACK, Document::UDocumentSegment_CH1_LARES_BRINGLISTBACK_Start);
                DB(int64(0xf1a5f3f5be0af07a), Lares != nullptr && Lares.IsSitting());
                
                if (Lares != nullptr && Lares.IsSitting())
                {
                    DC(int64(0x971243ef24ebba9), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0x971243ef24ebba9), EConversationDebugInfo::Done);
                    DC(int64(0x61c1053967412eb4), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Lares, UItWr_Scroll_List, 1);
                    DC(int64(0x61c1053967412eb4), EConversationDebugInfo::Done);
                    DC(int64(0x61c1053967412eb6), EConversationDebugInfo::Executing);
                    Lares.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScrollSeated, 2);
                    DC(int64(0x61c1053967412eb6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x971243ef24ebba9), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0x971243ef24ebba9), EConversationDebugInfo::Done);
                    DC(int64(0x61c1053967412eb4), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Lares, UItWr_Scroll_List, 1);
                    DC(int64(0x61c1053967412eb4), EConversationDebugInfo::Done);
                    DC(int64(0x61c1053967412eb6), EConversationDebugInfo::Executing);
                    Lares.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll, 2);
                    DC(int64(0x61c1053967412eb6), EConversationDebugInfo::Done);
                }
                DC(int64(0x4495089632c35e0a), EConversationDebugInfo::Executing);
                // Well, fuck me to the sky and back. It's the real thing. ...
                Lares.AI.Say(LocText("ORG_801_LARES_BRINGLIST_11_04"));
                DC(int64(0x4495089632c35e0a), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e0b), EConversationDebugInfo::Executing);
                // Here - I added a couple o' things. Take it back to Diego ...
                Lares.AI.Say(LocText("ORG_801_LARES_BRINGLIST_11_05"));
                DC(int64(0x4495089632c35e0b), EConversationDebugInfo::Done);
                DC(int64(0x4a4cf8eecd84caf7), EConversationDebugInfo::Executing);
                
                // You're going to raid that convoy? 
                Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_185616"));
                DC(int64(0x4a4cf8eecd84caf7), EConversationDebugInfo::Done);
                DC(int64(0x4a4cf8eecd84caf8), EConversationDebugInfo::Executing);
                
                // Look at the man, he got the guts AND the brains. But ...
                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_185621"));
                DC(int64(0x4a4cf8eecd84caf8), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf940d), EConversationDebugInfo::Executing);
                G1R.Points_NC += 10;
                DC(int64(0x9c096e8facaf940d), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf940f), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.StartQuest();
                DC(int64(0x9c096e8facaf940f), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf9413), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItWr_Scroll_Listnc, 1);
                DC(int64(0x9c096e8facaf9413), EConversationDebugInfo::Done);
                DC(int64(0x681c1c2a21cf2941), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK.StartQuest();
                DC(int64(0x681c1c2a21cf2941), EConversationDebugInfo::Done);
                DB(int64(0x4495089632c35e11), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                DB(int64(0x7674f1422e78c061), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted());
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None) && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted())
                {
                    DC(int64(0x9c096e8facaf9409), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_JOINNC.StartQuest();
                    DC(int64(0x9c096e8facaf9409), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_801_lares_bringlist_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_org_801_lares_bringlist_exit_2");
                }
            }
        }
        
        
        class UChoiceOrg801LaresBringlistback : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e14);
            default Caption = LocText("ORG_801_LARES_BRINGLISTBACK_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceOrg801LaresBringlistback);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35e15), Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.IsRunning());
                    DB(int64(0x4495089632c35e16), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && !Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.IsRunning())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && !Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35e17), EConversationDebugInfo::Executing);
                // I gave Diego the list. 
                Hero.AI.Say(LocText("ORG_801_LARES_BRINGLISTBACK_15_00"));
                DC(int64(0x4495089632c35e17), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e18), EConversationDebugInfo::Executing);
                
                // Great. He say anythin'?
                Lares.AI.Say(LocText("ORG_801_LARES_BRINGLISTBACK_11_01"));
                DC(int64(0x4495089632c35e18), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a25), EConversationDebugInfo::Executing);
                
                // Only that I "could have done it better." Not sure what ...
                Hero.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_175814"));
                DC(int64(0x6ff6d4d9e13a3a25), EConversationDebugInfo::Done);
                DC(int64(0x6ff6d4d9e13a3a26), EConversationDebugInfo::Executing);
                
                // Hmm ... let's hope he ain't suspicious, then. Good job. 
                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_175851"));
                DC(int64(0x6ff6d4d9e13a3a26), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_BRINGLISTBACK, Document::UDocumentSegment_CH1_LARES_BRINGLISTBACK_Success);
                DC(int64(0x9c096e8facaf942b), EConversationDebugInfo::Executing);
                G1R.Points_NC += 20;
                DC(int64(0x9c096e8facaf942b), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf942d), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT.SucceedQuest();
                DC(int64(0x9c096e8facaf942d), EConversationDebugInfo::Done);
                DC(int64(0x681c1c2a21cf293f), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK.SucceedQuest();
                DC(int64(0x681c1c2a21cf293f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresExit : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35dee);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35def), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4495089632c35def), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg801LaresGetkraut : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e3b);
            default Caption = LocText("ORG_801_LARES_GETKRAUT_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLares109508);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresBringlist);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresMordragsentme);
            default Rules.HideIfKnows(UChoiceOrg801LaresGetkraut);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35e3c), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35e3d), EConversationDebugInfo::Executing);
                // Anything I could do for YOU?
                Hero.AI.Say(LocText("ORG_801_LARES_GETKRAUT_15_00"));
                DC(int64(0x4495089632c35e3d), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e3e), EConversationDebugInfo::Executing);
                
                // Hmm. You know what, there is. Baal Isidro, one of the ...
                Lares.AI.Say(LocText("ORG_801_LARES_GETKRAUT_11_01"));
                DC(int64(0x4495089632c35e3e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_Start);
                DB(int64(0x7e99a66939865224), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning());
                DB(int64(0x7e99a66939865225), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasSucceeded());
                
                if ((Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning()) || (Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasSucceeded()))
                {
                    DC(int64(0x4495089632c35e41), EConversationDebugInfo::Executing);
                    // I know who you mean. I already took his herbs and sold ...
                    Hero.AI.Say(LocText("ORG_801_LARES_GETKRAUT_15_02"));
                    DC(int64(0x4495089632c35e41), EConversationDebugInfo::Done);
                    DC(int64(0x4495089632c35e42), EConversationDebugInfo::Executing);
                    
                    // Really? You're one quick bastard. Then consider givin' ...
                    Lares.AI.Say(LocText("ORG_801_LARES_GETKRAUT_11_03"));
                    DC(int64(0x4495089632c35e42), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4a4cf8eecd84cb0e), EConversationDebugInfo::Executing);
                    // I want you to con the man into giving you those herbs, ...
                    Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_191021_3286"));
                    DC(int64(0x4a4cf8eecd84cb0e), EConversationDebugInfo::Done);
                }
                DC(int64(0x4495089632c35e43), EConversationDebugInfo::Executing);
                // As a, you know, token of commitment. I'd remember that. 
                Lares.AI.Say(LocText("ORG_801_LARES_GETKRAUT_11_04"));
                DC(int64(0x4495089632c35e43), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf943e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.StartQuest();
                DC(int64(0x9c096e8facaf943e), EConversationDebugInfo::Done);
                DC(int64(0x681c1c2a21cf2932), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE.StartQuest();
                DC(int64(0x681c1c2a21cf2932), EConversationDebugInfo::Done);
                DB(int64(0x4495089632c35e47), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0x9c096e8facaf943a), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_JOINNC.StartQuest();
                    DC(int64(0x9c096e8facaf943a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_801_lares_getkraut_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_org_801_lares_getkraut_exit_2");
                }
            }
        }
        
        
        class UChoiceOrg801LaresGotokalom : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e75);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceOrg801LaresGotokalom);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35e76), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0x4495089632c35e77), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && !Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted());
                    DB(int64(0x7e544846c88145a7), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf70a), EConversationDebugInfo::Executing);
                // Look who it is. Ready for that job I mentioned?
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_182405"));
                DC(int64(0x927b2472124bf70a), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e78), EConversationDebugInfo::Executing);
                
                // As ever. 
                Hero.AI.Say(LocText("ORG_801_LARES_GOTOKALOM_15_00"));
                DC(int64(0x4495089632c35e78), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GOTOPSICAMP, Document::UDocumentSegment_CH2_GOTOPSICAMP_Start);
                DC(int64(0xdc24fe363c0a9bf0), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Caine))) { Caine.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Caine_1301_Dead); }
                DC(int64(0xdc24fe363c0a9bf0), EConversationDebugInfo::Done);
                DC(int64(0x608d6fba46cd8293), EConversationDebugInfo::Executing);
                G1R.ActivateStoryDataLayer("FindingCaine");
                DC(int64(0x608d6fba46cd8293), EConversationDebugInfo::Done);
                DC(int64(0x608d6fba46cd8295), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnFindingCaine");
                DC(int64(0x608d6fba46cd8295), EConversationDebugInfo::Done);
                DC(int64(0x8fd0f17b65ab432d), EConversationDebugInfo::Executing);
                G1R.CaineVanished = 1;
                DC(int64(0x8fd0f17b65ab432d), EConversationDebugInfo::Done);
                DC(int64(0x28003880c3e01fef), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Caine))) { Caine.NPCState.RemoveFromWorld(); }
                DC(int64(0x28003880c3e01fef), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c0f), EConversationDebugInfo::Executing);
                // Good. You ever been to the Swamp Camp? 
                Lares.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_112949_686"));
                DC(int64(0xdc24fe363c0a9c0f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lares_90584,
                    UTopic_Lares_90604
                );
                DC(int64(0x927b2472124bf780), EConversationDebugInfo::Executing);
                // I want you to go there and talk to Cor Kalom's ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_183306_2801"));
                DC(int64(0x927b2472124bf780), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf79c), EConversationDebugInfo::Executing);
                // Tell him whatever new concoction they've been puttin' ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_183349"));
                DC(int64(0x927b2472124bf79c), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf79e), EConversationDebugInfo::Executing);
                // The stuff's been gettin' way too strong and addictive, ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_183750"));
                DC(int64(0x927b2472124bf79e), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf79d), EConversationDebugInfo::Executing);
                
                // Alright. I'll handle it. 
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_183539"));
                DC(int64(0x927b2472124bf79d), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf79f), EConversationDebugInfo::Executing);
                
                // Good. Good luck.
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_183940"));
                DC(int64(0x927b2472124bf79f), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c12), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.StartQuest();
                DC(int64(0xdc24fe363c0a9c12), EConversationDebugInfo::Done);
                DC(int64(0xd8f47a43dfcb94ff), EConversationDebugInfo::Executing);
                G1R.ChangeChapter(2);
                DC(int64(0xd8f47a43dfcb94ff), EConversationDebugInfo::Done);
                DC(int64(0x253651f482b4e5e5), EConversationDebugInfo::Executing);
                G1R.Fingers_CanTeach = 1;
                DC(int64(0x253651f482b4e5e5), EConversationDebugInfo::Done);
                DB(int64(0x4495089632c35e7c), Hero != nullptr && Hero.HasSaid(LocText("ORG_801_LARES_MORDRAGSENTME_15_00")));
                
                if (Hero != nullptr && Hero.HasSaid(LocText("ORG_801_LARES_MORDRAGSENTME_15_00")))
                {
                    
                }
                else
                {
                    DB(int64(0x4495089632c35e7f), Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead());
                    
                    if (Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead())
                    {
                        
                    }
                    else
                    {
                        DC(int64(0x9c096e8facaf9456), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Mordrag))) { Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated); }
                        DC(int64(0x9c096e8facaf9456), EConversationDebugInfo::Done);
                    }
                }
            }
        }
        
        
        class UTopic_Lares_90584 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x927b2472124bf748);
            default Caption = LocText("TEXT_WIP_BTMTGUC_20240402_182730_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_90584);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf749), EConversationDebugInfo::Executing);
                // Not yet. 
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_182730_3984"));
                DC(int64(0x927b2472124bf749), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf762), EConversationDebugInfo::Executing);
                
                // You're missin' out. There's a bloke in the Old Camp, ...
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_183223"));
                DC(int64(0x927b2472124bf762), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GOTOPSICAMP, Document::UDocumentSegment_CH2_GOTOPSICAMP_BaalParvez);
                DC(int64(0xc44819b251d6353c), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ.StartQuest();
                DC(int64(0xc44819b251d6353c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_90604 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x927b2472124bf74c);
            default Caption = LocText("TEXT_WIP_BTMTGUC_20240402_182730_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_90604);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b2472124bf74d), EConversationDebugInfo::Executing);
                // Yes.
                Hero.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_182730_3569"));
                DC(int64(0x927b2472124bf74d), EConversationDebugInfo::Done);
                DC(int64(0x927b2472124bf763), EConversationDebugInfo::Executing);
                
                // Man's been around. 
                Lares.AI.Say(LocText("TEXT_WIP_BTMTGUC_20240402_183231"));
                DC(int64(0x927b2472124bf763), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresMordragsentme : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e26);
            default Caption = LocText("ORG_801_LARES_MORDRAGSENTME_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresWannajoin);
            default Rules.HideIfKnows(UChoiceOrg801LaresMordragsentme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35e27), Hero != nullptr && Hero.HasItem(UItAt_Ring_Mordrag, 1, 0));
                    DB(int64(0x4495089632c35e28), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xe1fad33effc6f928), G1R.MordragKO_StayAtNC != 0);
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Ring_Mordrag, 1, 0))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.MordragKO_StayAtNC == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7113927caa74ebf), EConversationDebugInfo::Executing);
                
                // Mordrag sent me. He said to give you this ring here.
                Hero.AI.Say(LocText("ORG_801_LARES_MORDRAGSENTME_15_00"));
                DC(int64(0xf7113927caa74ebf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_MordragPass);
                DC(int64(0x9c096e8facaf9478), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Lares, UItAt_Ring_Mordrag, 1);
                DC(int64(0x9c096e8facaf9478), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e2c), EConversationDebugInfo::Executing);
                // Ah, me cut of his latest haul. Lemme see. Hmm ... that's ...
                Lares.AI.Say(LocText("ORG_801_LARES_MORDRAGSENTME_11_01"));
                DC(int64(0x4495089632c35e2c), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e2d), EConversationDebugInfo::Executing);
                // Guess that's his way of tellin' us you ain't half bad. ...
                Lares.AI.Say(LocText("ORG_801_LARES_MORDRAGSENTME_11_02"));
                DC(int64(0x4495089632c35e2d), EConversationDebugInfo::Done);
                DB(int64(0x4495089632c35e32), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                DB(int64(0x7674f1422e78c08f), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted());
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None) && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted())
                {
                    DC(int64(0x9c096e8facaf946d), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_JOINNC.StartQuest();
                    DC(int64(0x9c096e8facaf946d), EConversationDebugInfo::Done);
                }
                DC(int64(0x9c096e8facaf9467), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_JOINNC_LARESRING);
                DC(int64(0x9c096e8facaf9467), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf9469), EConversationDebugInfo::Executing);
                G1R.Points_NC += 5;
                DC(int64(0x9c096e8facaf9469), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresReicht : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e55);
            default Caption = LocText("ORG_801_LARES_REICHT_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresWannajoin);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_IGLOWIC_20240320_181135_2238"), int64(0x4495089632c35e55));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35e56), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x4495089632c35e57), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x4495089632c35e58), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35e59), EConversationDebugInfo::Executing);
                // How's it looking? Do I have what it takes to be a ...
                Hero.AI.Say(LocText("ORG_801_LARES_REICHT_15_00"));
                DC(int64(0x4495089632c35e59), EConversationDebugInfo::Done);
                DC(int64(0x56a4a1bf169bf48f), EConversationDebugInfo::Executing);
                G1R.RemoveSilas();
                DC(int64(0x56a4a1bf169bf48f), EConversationDebugInfo::Done);
                DB(int64(0x4a4cf8eecd84cafa), G1R.Points_NC >= 10);
                
                if (G1R.Points_NC >= 10)
                {
                    DC(int64(0x4a4cf8eecd84cafd), EConversationDebugInfo::Executing);
                    // Hmm ... 
                    Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_190048"));
                    DC(int64(0x4a4cf8eecd84cafd), EConversationDebugInfo::Done);
                    DB(int64(0x4a4cf8eecd84cb00), Hero != nullptr && Hero.HasDefeated(Lefty));
                    
                    if (Hero != nullptr && Hero.HasDefeated(Lefty))
                    {
                        DB(int64(0xd84afffd503ad711), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_FIWVLHC_20240318_190135_2238")));
                        
                        if (Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_FIWVLHC_20240318_190135_2238")))
                        {
                            DC(int64(0x4a4cf8eecd84cb02), EConversationDebugInfo::Executing);
                            // Word is you beat up Lefty. That true? 
                            Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_190135_2238"));
                            DC(int64(0x4a4cf8eecd84cb02), EConversationDebugInfo::Done);
                            Subdialog(
                                UTopic_Lares_87210,
                                UTopic_Lares_87230
                            );
                            DC(int64(0x4a4cf8eecd84cb13), EConversationDebugInfo::Executing);
                            // Lefty's a bastard - he needs someone to remind him every ...
                            Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_191806_686"));
                            DC(int64(0x4a4cf8eecd84cb13), EConversationDebugInfo::Done);
                            DC(int64(0x4a4cf8eecd84cb14), EConversationDebugInfo::Executing);
                            // Anyway, it shows you don't take shit when people try to ...
                            Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_191831"));
                            DC(int64(0x4a4cf8eecd84cb14), EConversationDebugInfo::Done);
                        }
                        else
                        {
                            DC(int64(0xd84afffd503ad739), EConversationDebugInfo::Executing);
                            // You stood up to Lefty. I like that. 
                            Lares.AI.Say(LocText("TEXT_WIP_OLUUHUE_20240412_120136_2785"));
                            DC(int64(0xd84afffd503ad739), EConversationDebugInfo::Done);
                        }
                    }
                    DB(int64(0x4a4cf8eecd84cb1a), Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && Quest::NewCamp_NCCHAPTER1_DAMLURKER.HasSucceeded());
                    
                    if (Quest::NewCamp_NCCHAPTER1_DAMLURKER != nullptr && Quest::NewCamp_NCCHAPTER1_DAMLURKER.HasSucceeded())
                    {
                        DC(int64(0x4a4cf8eecd84cb1c), EConversationDebugInfo::Executing);
                        // Me lads said you helped Homer with that dam lurker.
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_192039_1609"));
                        DC(int64(0x4a4cf8eecd84cb1c), EConversationDebugInfo::Done);
                        DC(int64(0x56515350ea41990a), EConversationDebugInfo::Executing);
                        
                        // I did. That thing won't cause any more trouble. 
                        Hero.AI.Say(LocText("TEXT_WIP_PGTRMXB_20240921_180056"));
                        DC(int64(0x56515350ea41990a), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb1d), EConversationDebugInfo::Executing);
                        
                        // Good job. I need men who don't faint at the sight of a ...
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_192143"));
                        DC(int64(0x4a4cf8eecd84cb1d), EConversationDebugInfo::Done);
                        DC(int64(0x162ad6fd32a9dba2), EConversationDebugInfo::Executing);
                        // Let's see, what else ...
                        Lares.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_185429"));
                        DC(int64(0x162ad6fd32a9dba2), EConversationDebugInfo::Done);
                    }
                    DB(int64(0x4a4cf8eecd84cb1f), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasSucceeded());
                    DB(int64(0x4a4cf8eecd84cb23), Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.HasSucceeded());
                    
                    if (Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasSucceeded())
                    {
                        DB(int64(0xd84afffd503ad895), Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.HasSucceeded());
                        
                        if (Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.HasSucceeded())
                        {
                            DC(int64(0xfc95763c73405e69), EConversationDebugInfo::Executing);
                            // Right, there was the thing with Isidro. Good job doin' ...
                            Lares.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_112150_2083"));
                            DC(int64(0xfc95763c73405e69), EConversationDebugInfo::Done);
                            DC(int64(0x4a4cf8eecd84cb27), EConversationDebugInfo::Executing);
                            // You're smart, and you're loyal. That's somethin'.
                            Lares.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_112223"));
                            DC(int64(0x4a4cf8eecd84cb27), EConversationDebugInfo::Done);
                        }
                        else
                        {
                            DC(int64(0x4a4cf8eecd84cb21), EConversationDebugInfo::Executing);
                            // Right, you tricked that Loon, Isidro. Not bad.
                            Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_192334_3569"));
                            DC(int64(0x4a4cf8eecd84cb21), EConversationDebugInfo::Done);
                            DC(int64(0xfc95763c73405e6a), EConversationDebugInfo::Executing);
                            // Though I'd be even more impressed if you, you know, ...
                            Lares.AI.Say(LocText("TEXT_WIP_GVXAWSC_20240416_145609"));
                            DC(int64(0xfc95763c73405e6a), EConversationDebugInfo::Done);
                        }
                    }
                    else if (Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE.HasSucceeded())
                    {
                        DC(int64(0xe07185f7dcebcc5b), EConversationDebugInfo::Executing);
                        // Right, there was the thing with Isidro. Good job doin' ...
                        Lares.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_112150_2083"));
                        DC(int64(0xe07185f7dcebcc5b), EConversationDebugInfo::Done);
                        DC(int64(0xe07185f7dcebcc6e), EConversationDebugInfo::Executing);
                        // You're smart, and you're loyal. That's somethin'.
                        Lares.AI.Say(LocText("TEXT_WIP_RRBFMML_20240415_112223"));
                        DC(int64(0xe07185f7dcebcc6e), EConversationDebugInfo::Done);
                    }
                    DB(int64(0x681c1c2a21cf296c), Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.IsRunning());
                    
                    if (Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.IsRunning())
                    {
                        DC(int64(0x681c1c2a21cf2978), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.StartQuest();
                        DC(int64(0x681c1c2a21cf2978), EConversationDebugInfo::Done);
                    }
                    DB(int64(0x4a4cf8eecd84cb2d), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasSucceeded());
                    DB(int64(0x4a4cf8eecd84cb30), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                    DB(int64(0x4a4cf8eecd84cb31), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                    
                    if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasSucceeded())
                    {
                        DC(int64(0x4a4cf8eecd84cb2e), EConversationDebugInfo::Executing);
                        // You heard about my work for the Rice Lord?
                        Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193012"));
                        DC(int64(0x4a4cf8eecd84cb2e), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb2f), EConversationDebugInfo::Executing);
                        
                        // I was gettin' to that. But yeah, good job. 
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193012_1769"));
                        DC(int64(0x4a4cf8eecd84cb2f), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb35), EConversationDebugInfo::Executing);
                        // Hakon's word carries a lot of weight in here. If you got ...
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193706"));
                        DC(int64(0x4a4cf8eecd84cb35), EConversationDebugInfo::Done);
                        DB(int64(0x4a4cf8eecd84cb3b), Hero != nullptr && Hero.HasListenedTo(LocText("ORG_801_LARES_MORDRAGSENTME_11_02")));
                        DB(int64(0x4a4cf8eecd84cb40), Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.HasSucceeded());
                        
                        if (Hero != nullptr && Hero.HasListenedTo(LocText("ORG_801_LARES_MORDRAGSENTME_11_02")))
                        {
                            DB(int64(0xd84afffd503ad82f), Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.HasSucceeded());
                            
                            if (Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.HasSucceeded())
                            {
                                DC(int64(0x4a4cf8eecd84cb3d), EConversationDebugInfo::Executing);
                                // You got Mordrag's ring and brought us that supply list. 
                                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194021_3750"));
                                DC(int64(0x4a4cf8eecd84cb3d), EConversationDebugInfo::Done);
                                DC(int64(0x4a4cf8eecd84cb3e), EConversationDebugInfo::Executing);
                                // That means you're trustworthy and got guts. I respect ...
                                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194150"));
                                DC(int64(0x4a4cf8eecd84cb3e), EConversationDebugInfo::Done);
                            }
                            else
                            {
                                DC(int64(0x4a4cf8eecd84cb42), EConversationDebugInfo::Executing);
                                // You got Mordrag's ring, that's something for sure. He ...
                                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194235_731"));
                                DC(int64(0x4a4cf8eecd84cb42), EConversationDebugInfo::Done);
                            }
                        }
                        else if (Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.HasSucceeded())
                        {
                            DC(int64(0x4a4cf8eecd84cb44), EConversationDebugInfo::Executing);
                            // I probably don't need to tell you bringing us that ...
                            Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194320_1340"));
                            DC(int64(0x4a4cf8eecd84cb44), EConversationDebugInfo::Done);
                            DC(int64(0x4a4cf8eecd84cb45), EConversationDebugInfo::Executing);
                            // You got guts, and I respect that. 
                            Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194403"));
                            DC(int64(0x4a4cf8eecd84cb45), EConversationDebugInfo::Done);
                        }
                        DC(int64(0x4a4cf8eecd84cb46), EConversationDebugInfo::Executing);
                        // So? Is that good enough? 
                        Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194449"));
                        DC(int64(0x4a4cf8eecd84cb46), EConversationDebugInfo::Done);
                        DB(int64(0x6ff6d4d9e13a3a27), G1R.Points_NC >= 45);
                        
                        if (G1R.Points_NC >= 45)
                        {
                            DB(int64(0xd84afffd503ad92b), Hero.GetLevelAttribute() >= 5);
                            
                            if (Hero.GetLevelAttribute() >= 5)
                            {
                                DC(int64(0x4495089632c35e5d), EConversationDebugInfo::Executing);
                                // I think so. 
                                Lares.AI.Say(LocText("ORG_801_LARES_REICHT_AUFNAHME_11_00"));
                                DC(int64(0x4495089632c35e5d), EConversationDebugInfo::Done);
                                DC(int64(0x4a4cf8eecd84cb49), EConversationDebugInfo::Executing);
                                
                                // So I'm in?
                                Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194610"));
                                DC(int64(0x4a4cf8eecd84cb49), EConversationDebugInfo::Done);
                                DC(int64(0x4495089632c35e5e), EConversationDebugInfo::Executing);
                                
                                // Almost. There's one more thing I want you to do. A ... ...
                                Lares.AI.Say(LocText("ORG_801_LARES_REICHT_AUFNAHME_11_01"));
                                DC(int64(0x4495089632c35e5e), EConversationDebugInfo::Done);
                                DB(int64(0x6ff6d4d9e13a3a2d), Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.IsRunning());
                                
                                if (Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.IsRunning())
                                {
                                    DC(int64(0x6ff6d4d9e13a3a2f), EConversationDebugInfo::Executing);
                                    // You brought old man Diego that supply list yet? 
                                    Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_181010_2083"));
                                    DC(int64(0x6ff6d4d9e13a3a2f), EConversationDebugInfo::Done);
                                    DC(int64(0x56515350ea41990b), EConversationDebugInfo::Executing);
                                    
                                    // Not yet.
                                    Hero.AI.Say(LocText("TEXT_WIP_PGTRMXB_20240921_181156"));
                                    DC(int64(0x56515350ea41990b), EConversationDebugInfo::Done);
                                    DC(int64(0x56515350ea41990c), EConversationDebugInfo::Executing);
                                    
                                    // Then do that and come back. 
                                    Lares.AI.Say(LocText("TEXT_WIP_PGTRMXB_20240921_181158"));
                                    DC(int64(0x56515350ea41990c), EConversationDebugInfo::Done);
                                }
                                else
                                {
                                    DC(int64(0x6ff6d4d9e13a3a31), EConversationDebugInfo::Executing);
                                    // Unwind a little, have a drink, and air out your balls. ...
                                    Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_181135_2238"));
                                    DC(int64(0x6ff6d4d9e13a3a31), EConversationDebugInfo::Done);
                                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_Rest);
                                }
                            }
                            else
                            {
                                DC(int64(0x6ff6d4d9e13a3a28), EConversationDebugInfo::Executing);
                                // Not yet. You've shown you got the make of a bandit, but ...
                                Lares.AI.Say(LocText("TEXT_WIP_IGLOWIC_20240320_180452"));
                                DC(int64(0x6ff6d4d9e13a3a28), EConversationDebugInfo::Done);
                                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_Skills);
                                DC(int64(0x6ff6d4d9e13a3a2b), EConversationDebugInfo::Executing);
                                EndConversation();
                                DC(int64(0x6ff6d4d9e13a3a2b), EConversationDebugInfo::Done);
                                return;
                            }
                        }
                        else
                        {
                            DC(int64(0x4a4cf8eecd84cb4a), EConversationDebugInfo::Executing);
                            // Nah, not yet. Do some more work around here, then we'll ...
                            Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_194948"));
                            DC(int64(0x4a4cf8eecd84cb4a), EConversationDebugInfo::Done);
                            DB(int64(0x73e4f9f810df6744), G1R.Points_NC >= 35);
                            DB(int64(0x73e4f9f810df6758), Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && !Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.HasBeenStarted());
                            
                            if (G1R.Points_NC >= 35 && Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK != nullptr && !Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK.HasBeenStarted())
                            {
                                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_ListMissing);
                            }
                            DC(int64(0x73e4f9f810df676b), EConversationDebugInfo::Executing);
                            EndConversation();
                            DC(int64(0x73e4f9f810df676b), EConversationDebugInfo::Done);
                            return;
                        }
                    }
                    else if (Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning())
                    {
                        DC(int64(0x8e70368ac0328b77), EConversationDebugInfo::Executing);
                        // What about Hakon, or "The Rice Lord"? He's a fixture in ...
                        Lares.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_185617"));
                        DC(int64(0x8e70368ac0328b77), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb34), EConversationDebugInfo::Executing);
                        
                        // Yeah, I know, I'm doing some jobs for him right now.
                        Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193638"));
                        DC(int64(0x4a4cf8eecd84cb34), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb33), EConversationDebugInfo::Executing);
                        
                        // Good. His word carries a lot of weight in here. 
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193633_491"));
                        DC(int64(0x4a4cf8eecd84cb33), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328b78), EConversationDebugInfo::Executing);
                        // Come back when you've earned his trust - then we'll keep ...
                        Lares.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_185717"));
                        DC(int64(0x8e70368ac0328b78), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328b20), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x8e70368ac0328b20), EConversationDebugInfo::Done);
                        return;
                    }
                    else if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning())
                    {
                        DC(int64(0x8e70368ac0328b79), EConversationDebugInfo::Executing);
                        // What about Hakon, or "The Rice Lord"? He's a fixture in ...
                        Lares.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_185617"));
                        DC(int64(0x8e70368ac0328b79), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb34), EConversationDebugInfo::Executing);
                        
                        // Yeah, I know, I'm doing some jobs for him right now.
                        Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193638"));
                        DC(int64(0x4a4cf8eecd84cb34), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb33), EConversationDebugInfo::Executing);
                        
                        // Good. His word carries a lot of weight in here. 
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193633_491"));
                        DC(int64(0x4a4cf8eecd84cb33), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328b7a), EConversationDebugInfo::Executing);
                        // Come back when you've earned his trust - then we'll keep ...
                        Lares.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_185717"));
                        DC(int64(0x8e70368ac0328b7a), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328b67), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x8e70368ac0328b67), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x4a4cf8eecd84cb37), EConversationDebugInfo::Executing);
                        // You had a chat with Hakon yet, or the "Rice Lord" as ...
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193745_2995"));
                        DC(int64(0x4a4cf8eecd84cb37), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328af3), EConversationDebugInfo::Executing);
                        
                        // Not yet, no. 
                        Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_185152"));
                        DC(int64(0x8e70368ac0328af3), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb38), EConversationDebugInfo::Executing);
                        
                        // Then you should. Come back when you've made him happy, ...
                        Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193835"));
                        DC(int64(0x4a4cf8eecd84cb38), EConversationDebugInfo::Done);
                        DC(int64(0x4a4cf8eecd84cb39), EConversationDebugInfo::Executing);
                        
                        // Will do. 
                        Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_193919"));
                        DC(int64(0x4a4cf8eecd84cb39), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_HelpRicelord);
                        DC(int64(0x8e70368ac0328b6f), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x8e70368ac0328b6f), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0x4a4cf8eecd84cafb), EConversationDebugInfo::Executing);
                    // Great question! How about you actually DO somethin' ...
                    Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_190007"));
                    DC(int64(0x4a4cf8eecd84cafb), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_NoPoints);
                }
            }
        }
        
        
        class UTopic_Lares_87210 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4a4cf8eecd84cb04);
            default Caption = LocText("TEXT_WIP_FIWVLHC_20240318_190225_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_87210);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4a4cf8eecd84cb05), EConversationDebugInfo::Executing);
                // I had no choice. 
                Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_190225_1924"));
                DC(int64(0x4a4cf8eecd84cb05), EConversationDebugInfo::Done);
                DC(int64(0x4a4cf8eecd84cb11), EConversationDebugInfo::Executing);
                
                // Ah, don't be all somber. 
                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_191744"));
                DC(int64(0x4a4cf8eecd84cb11), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_87230 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4a4cf8eecd84cb08);
            default Caption = LocText("TEXT_WIP_FIWVLHC_20240318_190225_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lares_87230);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4a4cf8eecd84cb09), EConversationDebugInfo::Executing);
                
                // Yes, and I'd do it again. 
                Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_190225_3436"));
                DC(int64(0x4a4cf8eecd84cb09), EConversationDebugInfo::Done);
                DC(int64(0x4a4cf8eecd84cb10), EConversationDebugInfo::Executing);
                
                // That's the spirit!
                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_191735"));
                DC(int64(0x4a4cf8eecd84cb10), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresWannajoin : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35dfd);
            default Caption = LocText("ORG_801_LARES_WANNAJOIN_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg801LaresWannajoin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35dfe), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x4495089632c35dff), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35e00), EConversationDebugInfo::Executing);
                
                // I want to join your gang.
                Hero.AI.Say(LocText("ORG_801_LARES_WANNAJOIN_15_00"));
                DC(int64(0x4495089632c35e00), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e01), EConversationDebugInfo::Executing);
                
                // You and every bleedin' rice farmer out on those fields. 
                Lares.AI.Say(LocText("ORG_801_LARES_WANNAJOIN_11_01"));
                DC(int64(0x4495089632c35e01), EConversationDebugInfo::Done);
                DC(int64(0x4a4cf8eecd84caf3), EConversationDebugInfo::Executing);
                // But you made it in here, so that's somethin'. Let's just ...
                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_184804"));
                DC(int64(0x4a4cf8eecd84caf3), EConversationDebugInfo::Done);
                DC(int64(0x4a4cf8eecd84caf5), EConversationDebugInfo::Executing);
                
                // How? Is there a test?
                Hero.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_185005"));
                DC(int64(0x4a4cf8eecd84caf5), EConversationDebugInfo::Done);
                DC(int64(0x4a4cf8eecd84caf6), EConversationDebugInfo::Executing);
                
                // No tests, no rituals - this ain't the Old Camp. You just ...
                Lares.AI.Say(LocText("TEXT_WIP_FIWVLHC_20240318_185028"));
                DC(int64(0x4a4cf8eecd84caf6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_LARES, Document::UDocumentSegment_Glossary_NC_ORG_LARES_Introduction);
            }
        }
        
        
        class UChoiceOrg801LaresWherelearn : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35e87);
            default Caption = LocText("ORG_801_LARES_WHERELEARN_INFO_15_01");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1a491ba842e98fb2), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0xca7f68f60cf526b4), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xca7f68f60cf526b5), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xca7f68f60cf526b5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning() && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4495089632c35e89), EConversationDebugInfo::Executing);
                // Where can I learn something around here?
                Hero.AI.Say(LocText("ORG_801_LARES_WHERELEARN_INFO_15_01"));
                DC(int64(0x4495089632c35e89), EConversationDebugInfo::Done);
                DC(int64(0x4495089632c35e8a), EConversationDebugInfo::Executing);
                
                // Depends on what. I for one, can help you get stronger ...
                Lares.AI.Say(LocText("ORG_801_LARES_WHERELEARN_INFO_11_02"));
                DC(int64(0x4495089632c35e8a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_LARES, Document::UDocumentSegment_Glossary_NC_ORG_LARES_Teacher);
                DC(int64(0x2a2b6e49b3261af1), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(Lares);
                DC(int64(0x2a2b6e49b3261af1), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceOrg801LaresTeachDex1,
                    UChoiceOrg801LaresTeachStr11,
                    UChoiceOrg801LaresTeachDex51,
                    UChoiceOrg801LaresTeachDex11,
                    UTopic_Lares_120948
                );
            }
        }
        
        
        class UChoiceOrg801LaresTeachDex1 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xcf265152c967e1e8);
            default Caption = LocText("TEXT_CHOICE_ORG_801_LARES_TEACH_DEX_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c096e8facaf94b7), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Lares, 1);
                DC(int64(0x9c096e8facaf94b7), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e9904d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e9904d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresTeachStr11 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xcf265152c967e1ea);
            default Caption = LocText("TEXT_CHOICE_ORG_801_LARES_TEACH_STR_1_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c096e8facaf94bb), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Lares, 5);
                DC(int64(0x9c096e8facaf94bb), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e99057), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e99057), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresTeachDex51 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xcf265152c967e1ec);
            default Caption = LocText("TEXT_CHOICE_ORG_801_LARES_TEACH_DEX_5_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c096e8facaf94c3), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Lares, 1);
                DC(int64(0x9c096e8facaf94c3), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e9906b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e9906b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresTeachDex11 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0xcf265152c967e1ee);
            default Caption = LocText("TEXT_CHOICE_ORG_801_LARES_TEACH_DEX_1_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c096e8facaf94bf), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Lares, 5);
                DC(int64(0x9c096e8facaf94bf), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e99061), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e99061), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lares_120948 : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x1a491ba842e990e2);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a2b6e49b3261b15), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(Lares);
                DC(int64(0x2a2b6e49b3261b15), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg801LaresYouhere : UTopic_Hero__NC_ORG_LARES_801
        {
            default DebugId = int64(0x4495089632c35df0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4495089632c35df1), G1R.Lares_Permission == 0);
                }
                
                return G1R.Lares_Permission == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_LARES, Document::UDocumentSegment_Glossary_NC_ORG_LARES_Introduction);
                DB(int64(0x16b33daa7e9eda26), Roscoe != nullptr && Roscoe.IsFriendlyTowards(Hero));
                DB(int64(0x7e99a669398651d7), Roscoe != nullptr && Roscoe.HasDebuff(GameplayTag::Debuff_Sleep));
                
                if ((Roscoe != nullptr && Roscoe.IsFriendlyTowards(Hero)) || (Roscoe != nullptr && Roscoe.HasDebuff(GameplayTag::Debuff_Sleep)))
                {
                    DC(int64(0x4495089632c35df4), EConversationDebugInfo::Executing);
                    // How did you get in here? Where's Roscoe?
                    Lares.AI.Say(LocText("ORG_801_LARES_YOUHERE_11_00"));
                    DC(int64(0x4495089632c35df4), EConversationDebugInfo::Done);
                    DC(int64(0x4495089632c35df5), EConversationDebugInfo::Executing);
                    
                    // He didn't feel like bouncing today.
                    Hero.AI.Say(LocText("ORG_801_LARES_YOUHERE_15_01"));
                    DC(int64(0x4495089632c35df5), EConversationDebugInfo::Done);
                    DC(int64(0x4495089632c35df6), EConversationDebugInfo::Executing);
                    
                    // What do you want?
                    Lares.AI.Say(LocText("ORG_801_LARES_YOUHERE_11_02"));
                    DC(int64(0x4495089632c35df6), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf94e6), EConversationDebugInfo::Executing);
                    G1R.Lares_Permission = 1;
                    DC(int64(0x9c096e8facaf94e6), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf94e8), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_NC_JOINNC_LARESHUT);
                    DC(int64(0x9c096e8facaf94e8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_801_lares_youhere_exit_1");
                }
                else
                {
                    DC(int64(0x9c096e8facaf94f0), EConversationDebugInfo::Executing);
                    Lares.AI.StartAttackingImmediately(Hero);
                    DC(int64(0x9c096e8facaf94f0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_801_lares_youhere_exit_2");
                    DC(int64(0x4495089632c35dfc), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x4495089632c35dfc), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */