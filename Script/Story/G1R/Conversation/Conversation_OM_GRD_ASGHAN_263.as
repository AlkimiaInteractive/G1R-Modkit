#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_GRD_ASGHAN_263 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_GRD_ASGHAN_263";
        }
        
        
        class UTopic_Hero__OM_GRD_ASGHAN_263 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_GRD_ASGHAN_263";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetAsghan() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMINECRAWLER() const property
            {
                return GetCharacter(n"MINECRAWLER");
            }
            
            AGothicCharacterState GetGorNaBar() const property
            {
                return GetCharacter(n"OM_TPL_GORNABAR_1400");
            }
            
            AGothicCharacterState GetGorNaKosh() const property
            {
                return GetCharacter(n"OM_TPL_GORNAKOSH_1401");
            }
            
            AGothicCharacterState GetGorNaVid() const property
            {
                return GetCharacter(n"OM_TPL_GORNAVID_1433");
            }
        }
        
        
        class UChoiceAsghan144609 : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0xcf6cde32246c7ee1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceAsghan144609);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KOQECXC_20240429_213058"), int64(0xcf6cde32246c7ee1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), G1R.Tunnel_Opened == 1);
                    DB(int64(0xc7a8be143f04404c), Hero != nullptr && Hero.IsCloseToCharacter(Asghan, 300.0f));
                }
                
                if (G1R.Tunnel_Opened != 1)
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Asghan, 300.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7edf), EConversationDebugInfo::Executing);
                // A madman. For sure. Totally mad.
                Asghan.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_142045_3677"));
                DC(int64(0xcf6cde32246c7edf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceAsghan92345 : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0x785897ee2a1af312);
            default Caption = LocText("TEXT_WIP_WPUISQL_20240423_122312");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd263AsghanNest);
            default Rules.HideIfKnows(UChoiceAsghan92345);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("STT_301_IAN_HI_INFO_15_01"), int64(0x785897ee2a1af312));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x785897ee2a1af315), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x785897ee2a1af310), EConversationDebugInfo::Executing);
                
                // Where can I find Ian?
                Hero.AI.Say(LocText("TEXT_WIP_WPUISQL_20240423_122312"));
                DC(int64(0x785897ee2a1af310), EConversationDebugInfo::Done);
                DC(int64(0x785897ee2a1af311), EConversationDebugInfo::Executing);
                
                // Upstairs, by the stockpile. 
                Asghan.AI.Say(LocText("TEXT_WIP_WPUISQL_20240423_122312_41"));
                DC(int64(0x785897ee2a1af311), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceAsghan92765 : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0xe0510cb0d930622d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceAsghan92765);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x945eb85ee72bd724), G1R.Tunnel_Opened != 0);
                    DB(int64(0x945eb85ee72bd726), Asghan != nullptr && !Asghan.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f));
                    DB(int64(0x5dae0ae66c6deff6), Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (G1R.Tunnel_Opened == 0)
                    return false;
                
                if (Asghan != nullptr && Asghan.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe0510cb0d930622b), EConversationDebugInfo::Executing);
                // Godsdammit, that was a ton of them. You sure you wanna ...
                Asghan.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_212840_41"));
                DC(int64(0xe0510cb0d930622b), EConversationDebugInfo::Done);
                DC(int64(0xe0510cb0d9306230), EConversationDebugInfo::Executing);
                
                // There has to be a nest.
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_213006"));
                DC(int64(0xe0510cb0d9306230), EConversationDebugInfo::Done);
                DC(int64(0xe0510cb0d9306231), EConversationDebugInfo::Executing);
                
                // That's my point. 
                Asghan.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_213022"));
                DC(int64(0xe0510cb0d9306231), EConversationDebugInfo::Done);
                DC(int64(0xe0510cb0d9306232), EConversationDebugInfo::Executing);
                // But you do you. And just so we're clear, the templars ...
                Asghan.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_213031"));
                DC(int64(0xe0510cb0d9306232), EConversationDebugInfo::Done);
                DC(int64(0xe0510cb0d9306234), EConversationDebugInfo::Executing);
                // Good luck in there. You wanted that thing open - it's ...
                Asghan.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_213058"));
                DC(int64(0xe0510cb0d9306234), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f5a), EConversationDebugInfo::Executing);
                Asghan.LeavePartyOf(Hero);
                DC(int64(0xd4bfca7c20283f5a), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f5e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaVid))) { GorNaVid.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f5e), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f60), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaBar))) { GorNaBar.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f60), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f62), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaKosh))) { GorNaKosh.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f62), EConversationDebugInfo::Done);
                DC(int64(0x4fcece367f256ee6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OM_BLOWTHEENTRANCE_COMPLETE);
                DC(int64(0x4fcece367f256ee6), EConversationDebugInfo::Done);
                DC(int64(0xc7a8be143f04404e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc7a8be143f04404e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd263AsghanExit : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0x68da50675d6f8996);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x68da50675d6f8997), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x68da50675d6f8997), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd263AsghanLairfound : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0x68da50675d6f89b1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd263AsghanLairfound);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x68da50675d6f89b2), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 3, 0));
                    DB(int64(0x68da50675d6f89b3), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 3, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x28f8ba30074eea2f), EConversationDebugInfo::Executing);
                // Well, call me an orc and put a spike up my ass. You're ...
                Asghan.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_181651"));
                DC(int64(0x28f8ba30074eea2f), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89b4), EConversationDebugInfo::Executing);
                
                // Unlike the minecrawler queen. 
                Hero.AI.Say(LocText("GRD_263_ASGHAN_LAIRFOUND_INFO_15_01"));
                DC(int64(0x68da50675d6f89b4), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89b5), EConversationDebugInfo::Executing);
                
                // Queen? You can't be serious. 
                Asghan.AI.Say(LocText("GRD_263_ASGHAN_LAIRFOUND_INFO_06_02"));
                DC(int64(0x68da50675d6f89b5), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea30), EConversationDebugInfo::Executing);
                
                // You can check if you want. 
                Hero.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_182000"));
                DC(int64(0x28f8ba30074eea30), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea31), EConversationDebugInfo::Executing);
                
                // Ha! No, I'm good. Not bad, my friend, not bad at all. ...
                Asghan.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_182014"));
                DC(int64(0x28f8ba30074eea31), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_ASGHAN, Document::UDocumentSegment_Glossary_OM_GRD_ASGHAN_Impress);
                DB(int64(0x28f8ba30074eea33), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0x28f8ba30074eea34), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x28f8ba30074eea36), EConversationDebugInfo::Executing);
                    // Shame you're with the Loons. We could use men like you. 
                    Asghan.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_182114_1924"));
                    DC(int64(0x28f8ba30074eea36), EConversationDebugInfo::Done);
                    DC(int64(0x7858bf075764a1ad), EConversationDebugInfo::Executing);
                    Asghan.RemoveImmortality();
                    DC(int64(0x7858bf075764a1ad), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_263_asghan_lairfound_exit_1");
                    DC(int64(0x7858bf075764a1a5), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7858bf075764a1a5), EConversationDebugInfo::Done);
                    return;
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x28f8ba30074eea38), EConversationDebugInfo::Executing);
                    // Shame you're with the rice-eaters. We could use a guy ...
                    Asghan.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_182123_2785"));
                    DC(int64(0x28f8ba30074eea38), EConversationDebugInfo::Done);
                    DC(int64(0x7858bf075764a1ad), EConversationDebugInfo::Executing);
                    Asghan.RemoveImmortality();
                    DC(int64(0x7858bf075764a1ad), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_263_asghan_lairfound_exit_3");
                    DC(int64(0x28f8ba30074eea3b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x28f8ba30074eea3b), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x28f8ba30074eea3f), EConversationDebugInfo::Executing);
                    // I know you did this for the Loons, but Gomez will love ...
                    Asghan.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_182129_3436"));
                    DC(int64(0x28f8ba30074eea3f), EConversationDebugInfo::Done);
                    DC(int64(0x7858bf075764a1ad), EConversationDebugInfo::Executing);
                    Asghan.RemoveImmortality();
                    DC(int64(0x7858bf075764a1ad), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_263_asghan_lairfound_exit_3");
                    DC(int64(0x28f8ba30074eea43), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x28f8ba30074eea43), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGrd263AsghanNest : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0x68da50675d6f8998);
            default Caption = LocText("GRD_263_ASGHAN_NEST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd263AsghanNest);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LPQXWNL_20240404_123929"), int64(0x68da50675d6f8998));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x68da50675d6f8999), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x68da50675d6f899a), EConversationDebugInfo::Executing);
                // Lester thinks the minecrawlers have a nest somewhere in ...
                Hero.AI.Say(LocText("GRD_263_ASGHAN_NEST_INFO_15_01"));
                DC(int64(0x68da50675d6f899a), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f899b), EConversationDebugInfo::Executing);
                
                // One more reason to keep it closed.
                Asghan.AI.Say(LocText("GRD_263_ASGHAN_NEST_INFO_06_02"));
                DC(int64(0x68da50675d6f899b), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f899e), EConversationDebugInfo::Executing);
                
                // What if someone wants to FIND that nest?
                Hero.AI.Say(LocText("GRD_263_ASGHAN_NEST_INFO_15_05"));
                DC(int64(0x68da50675d6f899e), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea2d), EConversationDebugInfo::Executing);
                
                // Then I'd tell that someone there are more painless ways ...
                Asghan.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_181009"));
                DC(int64(0x28f8ba30074eea2d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_ASGHAN, Document::UDocumentSegment_Glossary_OM_GRD_ASGHAN_Introduction);
                DB(int64(0xc7c3b1053df3a993), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EETMBHG_20241011_134730")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EETMBHG_20241011_134730")))
                {
                    DC(int64(0xc7c3b1053df3a997), EConversationDebugInfo::Executing);
                    // Unless Ian says otherwise, every boulder here stays just ...
                    Asghan.AI.Say(LocText("GRD_263_ASGHAN_NEST_INFO_06_06"));
                    DC(int64(0xc7c3b1053df3a997), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_263_asghan_nest_exit_1");
                }
                else
                {
                    DC(int64(0x68da50675d6f899f), EConversationDebugInfo::Executing);
                    // Unless Ian says otherwise, every boulder here stays just ...
                    Asghan.AI.Say(LocText("GRD_263_ASGHAN_NEST_INFO_06_06"));
                    DC(int64(0x68da50675d6f899f), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_AsghanBlock);
                    
                    Other.Remember(n"choice_grd_263_asghan_nest_exit_2");
                }
            }
        }
        
        
        class UChoiceGrd263AsghanOpen : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0x68da50675d6f89a0);
            default Caption = LocText("GRD_263_ASGHAN_OPEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd263AsghanNest);
            default Rules.HideIfKnows(UChoiceGrd263AsghanOpen);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_EETMBHG_20241011_134730"), int64(0x68da50675d6f89a0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x68da50675d6f89a1), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x68da50675d6f89a2), EConversationDebugInfo::Executing);
                // You might wanna step back. I'm going to clear that ...
                Hero.AI.Say(LocText("GRD_263_ASGHAN_OPEN_INFO_15_01"));
                DC(int64(0x68da50675d6f89a2), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89a3), EConversationDebugInfo::Executing);
                
                // I told you, not without-
                Asghan.AI.Say(LocText("GRD_263_ASGHAN_OPEN_INFO_06_02"));
                DC(int64(0x68da50675d6f89a3), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89a4), EConversationDebugInfo::Executing);
                
                // "It'll be fine, Asghan." Ian gave us permission. 
                Hero.AI.Say(LocText("GRD_263_ASGHAN_OPEN_INFO_15_03"));
                DC(int64(0x68da50675d6f89a4), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89a5), EConversationDebugInfo::Executing);
                
                // Hm ... all right, then. How will you do it? I don't see ...
                Asghan.AI.Say(LocText("GRD_263_ASGHAN_OPEN_INFO_06_04"));
                DC(int64(0x68da50675d6f89a5), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea2e), EConversationDebugInfo::Executing);
                
                // Stand back and watch. 
                Hero.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_181556"));
                DC(int64(0x28f8ba30074eea2e), EConversationDebugInfo::Done);
                DC(int64(0x5223e989f9a016a6), EConversationDebugInfo::Executing);
                Quest::OldMine_BLOWTHEENTRANCE.StartQuest();
                DC(int64(0x5223e989f9a016a6), EConversationDebugInfo::Done);
                DC(int64(0x7f4dc68f25eaae2b), EConversationDebugInfo::Executing);
                Asghan.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Asghan_263_Opengate);
                DC(int64(0x7f4dc68f25eaae2b), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f51), EConversationDebugInfo::Executing);
                Asghan.JoinPartyOf(Hero);
                DC(int64(0xd4bfca7c20283f51), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f53), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaVid))) { GorNaVid.JoinPartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f53), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f55), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaBar))) { GorNaBar.JoinPartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f55), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f57), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaKosh))) { GorNaKosh.JoinPartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f57), EConversationDebugInfo::Done);
                DC(int64(0x5223e989f9a016d6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5223e989f9a016d6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd263AsghanSmalltalk : UTopic_Hero__OM_GRD_ASGHAN_263
        {
            default DebugId = int64(0x68da50675d6f89b7);
            default Caption = LocText("GRD_263_ASGHAN_SMALLTALK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd263AsghanSmalltalk);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x68da50675d6f89b8), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x68da50675d6f89b9), EConversationDebugInfo::Executing);
                // What's behind there?
                Hero.AI.Say(LocText("GRD_263_ASGHAN_SMALLTALK_INFO_15_01"));
                DC(int64(0x68da50675d6f89b9), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89ba), EConversationDebugInfo::Executing);
                
                // Why? Feeling adventurous?
                Asghan.AI.Say(LocText("GRD_263_ASGHAN_SMALLTALK_INFO_06_02"));
                DC(int64(0x68da50675d6f89ba), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89bb), EConversationDebugInfo::Executing);
                
                // Just curious.
                Hero.AI.Say(LocText("GRD_263_ASGHAN_SMALLTALK_INFO_15_03"));
                DC(int64(0x68da50675d6f89bb), EConversationDebugInfo::Done);
                DC(int64(0x68da50675d6f89bc), EConversationDebugInfo::Executing);
                
                // That can be quite bad for your health down there. The ...
                Asghan.AI.Say(LocText("GRD_263_ASGHAN_SMALLTALK_INFO_06_04"));
                DC(int64(0x68da50675d6f89bc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_ASGHAN, Document::UDocumentSegment_Glossary_OM_GRD_ASGHAN_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */