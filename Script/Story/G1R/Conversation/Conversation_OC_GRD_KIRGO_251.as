#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_KIRGO_251 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_KIRGO_251";
        }
        
        
        class UTopic_Hero__OC_GRD_KIRGO_251 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_KIRGO_251";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetKirgo() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
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
            
            AGothicCharacterState GetKharim() const property
            {
                return GetCharacter(n"OC_SLD_KHARIM_729");
            }
            
            AGothicCharacterState GetGorHanis() const property
            {
                return GetCharacter(n"SC_TPL_GORHANIS_1422");
            }
        }
        
        
        class UChoiceKirgo109412 : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xc57744e51237a305);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceKirgo109412);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc57744e51237a315), Hero != nullptr && Hero.HasRecentlyDefeated(Kirgo));
                    DB(int64(0x73254a4874b4a655), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xec5a70ca82b4d51a), G1R.Kirgo_Charged != 0);
                    DB(int64(0xa691a6912751f6d), G1R.Kirgo_Challenged != 0);
                }
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Kirgo))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Kirgo_Charged == 0)
                    return false;
                
                if (G1R.Kirgo_Challenged == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc57744e51237a302), EConversationDebugInfo::Executing);
                // Ouch ... Didn't see that coming. Not bad, freshie. Not ...
                Kirgo.AI.Say(LocText("TEXT_WIP_LZBNQQL_20240909_161249_41"));
                DC(int64(0xc57744e51237a302), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e484475033d), EConversationDebugInfo::Executing);
                // You should really think about joining up with us. We can ...
                Kirgo.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_180514"));
                DC(int64(0xe6a87e484475033d), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e484475033e), EConversationDebugInfo::Executing);
                
                // We'll see. 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_180637"));
                DC(int64(0xe6a87e484475033e), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc237a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start); }
                DC(int64(0xf0c92a1570bc237a), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc237e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start); }
                DC(int64(0xf0c92a1570bc237e), EConversationDebugInfo::Done);
                DC(int64(0x5265f0ad15a47ff), EConversationDebugInfo::Executing);
                Kirgo.MakeLootable();
                DC(int64(0x5265f0ad15a47ff), EConversationDebugInfo::Done);
                DC(int64(0xec5a70ca82b4d5da), EConversationDebugInfo::Executing);
                G1R.Kirgo_Charged -= 1;
                DC(int64(0xec5a70ca82b4d5da), EConversationDebugInfo::Done);
                DC(int64(0x16e0efa6d8d84c7b), EConversationDebugInfo::Executing);
                G1R.Kirgo_Win = 1;
                DC(int64(0x16e0efa6d8d84c7b), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc237f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0c92a1570bc237f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKirgo109428 : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xc57744e51237a30b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceKirgo109428);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc57744e51237a316), Kirgo != nullptr && Kirgo.HasRecentlyDefeated(Hero));
                    DB(int64(0x73254a4874b4a656), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xec5a70ca82b4d51b), G1R.Kirgo_Charged != 0);
                    DB(int64(0xa691a6912751f6e), G1R.Kirgo_Challenged != 0);
                }
                
                if (Kirgo != nullptr && !Kirgo.HasRecentlyDefeated(Hero))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Kirgo_Charged == 0)
                    return false;
                
                if (G1R.Kirgo_Challenged == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc57744e51237a308), EConversationDebugInfo::Executing);
                // You all right? Hope I didn't break anything. 
                Kirgo.AI.Say(LocText("TEXT_WIP_LZBNQQL_20240909_161255_2238"));
                DC(int64(0xc57744e51237a308), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e484475033f), EConversationDebugInfo::Executing);
                // Here, have a sip. 
                Kirgo.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_180722"));
                DC(int64(0xe6a87e484475033f), EConversationDebugInfo::Done);
                DB(int64(0xc57744e51237a31b), Kirgo != nullptr && Kirgo.HasItem(UItFo_Potion_Health_01, 1, 0));
                
                if (Kirgo != nullptr && Kirgo.HasItem(UItFo_Potion_Health_01, 1, 0))
                {
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                    Kirgo.AddItemToInventory(UItFo_Potion_Health_01, 1);
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                    DC(int64(0xc57744e51237a325), EConversationDebugInfo::Executing);
                    Kirgo.AI.GiveItemTo(Hero, UItFo_Potion_Health_01, 1);
                    DC(int64(0xc57744e51237a325), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xe69140cc3304ee96), EConversationDebugInfo::Executing);
                    Kirgo.AddItemToInventory(UItFo_Potion_Health_01, 1);
                    DC(int64(0xe69140cc3304ee96), EConversationDebugInfo::Done);
                    DC(int64(0xe69140cc3304ee98), EConversationDebugInfo::Executing);
                    Kirgo.AI.GiveItemTo(Hero, UItFo_Potion_Health_01, 1);
                    DC(int64(0xe69140cc3304ee98), EConversationDebugInfo::Done);
                }
                DC(int64(0xc57744e51237a328), EConversationDebugInfo::Executing);
                // ... Thanks.
                Hero.AI.Say(LocText("TEXT_WIP_LZBNQQL_20240909_161847"));
                DC(int64(0xc57744e51237a328), EConversationDebugInfo::Done);
                DC(int64(0xc57744e51237a329), EConversationDebugInfo::Executing);
                
                // Sure. You got potential, friend - you just need some ...
                Kirgo.AI.Say(LocText("TEXT_WIP_LZBNQQL_20240909_161847_3436"));
                DC(int64(0xc57744e51237a329), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e4844750340), EConversationDebugInfo::Executing);
                // I gotta take care of something now, but I'll see you ...
                Kirgo.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_180755"));
                DC(int64(0xe6a87e4844750340), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e4844750341), EConversationDebugInfo::Executing);
                // Good fight. 
                Kirgo.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_180818"));
                DC(int64(0xe6a87e4844750341), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc2385), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start); }
                DC(int64(0xf0c92a1570bc2385), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc2389), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start); }
                DC(int64(0xf0c92a1570bc2389), EConversationDebugInfo::Done);
                DC(int64(0x5265f0ad15a4801), EConversationDebugInfo::Executing);
                Kirgo.MakeLootable();
                DC(int64(0x5265f0ad15a4801), EConversationDebugInfo::Done);
                DC(int64(0xec5a70ca82b4d5dc), EConversationDebugInfo::Executing);
                G1R.Kirgo_Charged -= 1;
                DC(int64(0xec5a70ca82b4d5dc), EConversationDebugInfo::Done);
                DC(int64(0x16e0efa6d8d84c7d), EConversationDebugInfo::Executing);
                G1R.Kirgo_Lose = 1;
                DC(int64(0x16e0efa6d8d84c7d), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc238a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0c92a1570bc238a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKirgo133200 : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0x84d011413d331ceb);
            default Caption = LocText("TEXT_WIP_OHRCFQN_20241217_110612");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceKirgo133200);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"EZ_KIRGO_WAIT", 1000.0f, int64(0x84d011413d331ceb));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x84d011413d331cee), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x84d011413d331ce5), EConversationDebugInfo::Executing);
                // Thorus sends me. I'm here to help with the shipment.
                Hero.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_110612"));
                DC(int64(0x84d011413d331ce5), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331ce6), EConversationDebugInfo::Executing);
                
                // You? I thought it was Jackal. 
                Kirgo.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_110612_2785"));
                DC(int64(0x84d011413d331ce6), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1ec3), EConversationDebugInfo::Executing);
                
                // Plan's changed. 
                Hero.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142204"));
                DC(int64(0xb83604057efe1ec3), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1ec4), EConversationDebugInfo::Executing);
                
                // Well, I'll take what I can get. I got a bad feeling ...
                Kirgo.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142215"));
                DC(int64(0xb83604057efe1ec4), EConversationDebugInfo::Done);
                DB(int64(0x84d011413d331dbf), G1R.RecruitedDiggers == 3);
                
                if (G1R.RecruitedDiggers == 3)
                {
                    DC(int64(0x84d011413d331dff), EConversationDebugInfo::Executing);
                    // I see you've brought some carriers too. 
                    Kirgo.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_114450_3569"));
                    DC(int64(0x84d011413d331dff), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kirgo_133200_exit_1");
                }
                else
                {
                    DC(int64(0x84d011413d331dcb), EConversationDebugInfo::Executing);
                    // Where are the carriers though? We need three men at ...
                    Kirgo.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_113442_3984"));
                    DC(int64(0x84d011413d331dcb), EConversationDebugInfo::Done);
                    DC(int64(0xb83604057efe1ec5), EConversationDebugInfo::Executing);
                    
                    // ... Right. Forgot about that.
                    Hero.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142256"));
                    DC(int64(0xb83604057efe1ec5), EConversationDebugInfo::Done);
                    DC(int64(0x84d011413d331de0), EConversationDebugInfo::Executing);
                    
                    // (annoyed sigh) Well, take care of it. Ask the diggers, ...
                    Kirgo.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_113905"));
                    DC(int64(0x84d011413d331de0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kirgo_133200_exit_2");
                    DC(int64(0x84d011413d331de1), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x84d011413d331de1), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKirgo133684 : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0x44869f122f483ad5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceKirgo133684);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_OHRCFQN_20241217_120452"), int64(0x44869f122f483ad5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x44869f122f483ad8), NC_ORG_ROGUE33_882N != nullptr && NC_ORG_ROGUE33_882N.IsEveryoneOfThisKindDead());
                    DB(int64(0x44869f122f483adf), NC_ORG_ROGUE34_883N != nullptr && NC_ORG_ROGUE34_883N.IsEveryoneOfThisKindDead());
                    DB(int64(0x44869f122f483ae0), NC_ORG_ROGUE35_884N != nullptr && NC_ORG_ROGUE35_884N.IsEveryoneOfThisKindDead());
                    DB(int64(0x44869f122f483ae1), NC_ORG_ROGUE36_885N != nullptr && NC_ORG_ROGUE36_885N.IsEveryoneOfThisKindDead());
                }
                
                if (NC_ORG_ROGUE33_882N != nullptr && !NC_ORG_ROGUE33_882N.IsEveryoneOfThisKindDead())
                    return false;
                
                if (NC_ORG_ROGUE34_883N != nullptr && !NC_ORG_ROGUE34_883N.IsEveryoneOfThisKindDead())
                    return false;
                
                if (NC_ORG_ROGUE35_884N != nullptr && !NC_ORG_ROGUE35_884N.IsEveryoneOfThisKindDead())
                    return false;
                
                if (NC_ORG_ROGUE36_885N != nullptr && !NC_ORG_ROGUE36_885N.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44869f122f483ace), EConversationDebugInfo::Executing);
                // Bloody hell. What a fight. Good work.
                Kirgo.AI.Say(LocText("TEXT_WIP_HKQHPDM_20241218_124037_41"));
                DC(int64(0x44869f122f483ace), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483ae3), EConversationDebugInfo::Executing);
                // I'll take it from here - thanks, man, that would have ...
                Kirgo.AI.Say(LocText("TEXT_WIP_HKQHPDM_20241218_124708"));
                DC(int64(0x44869f122f483ae3), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1ec6), EConversationDebugInfo::Executing);
                // Thorus will be very happy with you. 
                Kirgo.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142530"));
                DC(int64(0xb83604057efe1ec6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPGUARD, Document::UDocumentSegment_CH3_RANKUPGUARD_Raid);
                DC(int64(0xaea7c2c474a8b385), EConversationDebugInfo::Executing);
                Kirgo.RemoveImmortality();
                DC(int64(0xaea7c2c474a8b385), EConversationDebugInfo::Done);
                DC(int64(0xa378a13b6d0f139a), EConversationDebugInfo::Executing);
                G1R.ReturnToDefaultDailyroutine();
                DC(int64(0xa378a13b6d0f139a), EConversationDebugInfo::Done);
                DC(int64(0x821db0237f618ab9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT.SucceedQuest();
                DC(int64(0x821db0237f618ab9), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483ae4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x44869f122f483ae4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKirgo133947 : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0x84d011413d331e1a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKirgo133200);
            default Rules.HideIfKnows(UChoiceKirgo133947);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"EZ_KIRGO_WAIT", 1000.0f, int64(0x84d011413d331e1a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x84d011413d331e22), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x84d011413d331e2a), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0x84d011413d331e2b), G1R.RecruitedDiggers == 3);
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (G1R.RecruitedDiggers != 3)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x84d011413d331dc5), EConversationDebugInfo::Executing);
                // Good. Let's try to-
                Kirgo.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_113440_2386"));
                DC(int64(0x84d011413d331dc5), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331dd9), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnShipmentAttack");
                DC(int64(0x84d011413d331dd9), EConversationDebugInfo::Done);
                DC(int64(0x821db0237f618aac), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO.SucceedQuest();
                DC(int64(0x821db0237f618aac), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331de9), EConversationDebugInfo::Executing);
                // Oh, shit. 
                Kirgo.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_113954_1609"));
                DC(int64(0x84d011413d331de9), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331e42), EConversationDebugInfo::Executing);
                // There they are!
                Kirgo.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_120452"));
                DC(int64(0x84d011413d331e42), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331df1), EConversationDebugInfo::Executing);
                Kirgo.JoinPartyOf(Hero);
                DC(int64(0x84d011413d331df1), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331e59), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x84d011413d331e59), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKirgoCharge : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xb35cdb7e3a5cb450);
            default Caption = LocText("INFO_KIRGO_CHARGE_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceKirgoCharge);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb35cdb7e3a5cb451), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x784fe565aac8ab12), Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY != nullptr && Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.HasBeenStarted());
                    DB(int64(0xd5bbd9d87f157cdb), G1R.GorHanis_Charged == 0);
                    DB(int64(0x34afc38000899505), G1R.Kharim_Charged == 0);
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY != nullptr && !Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.HasBeenStarted())
                    return false;
                
                if (G1R.GorHanis_Charged != 0)
                    return false;
                
                if (G1R.Kharim_Charged != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb35cdb7e3a5cb452), EConversationDebugInfo::Executing);
                // I'm challenging you to a fight. 
                Hero.AI.Say(LocText("INFO_KIRGO_CHARGE_15_00"));
                DC(int64(0xb35cdb7e3a5cb452), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb453), EConversationDebugInfo::Executing);
                
                // What? No, I'm not in the mood. How about we have a beer ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_05_01"));
                DC(int64(0xb35cdb7e3a5cb453), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceKirgoChargeNow,
                    UChoiceKirgoChargeBeer
                );
            }
        }
        
        
        class UChoiceKirgoChargeNow : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xe8603e87342bd649);
            default Caption = LocText("INFO_KIRGO_CHARGE_NOW_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb35cdb7e3a5cb456), EConversationDebugInfo::Executing);
                // I don't have time for that. Let's fight, now. 
                Hero.AI.Say(LocText("INFO_KIRGO_CHARGE_NOW_15_00"));
                DC(int64(0xb35cdb7e3a5cb456), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb457), EConversationDebugInfo::Executing);
                
                // Someone's eager. Fine. I'm ready when you are.
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_NOW_05_01"));
                DC(int64(0xb35cdb7e3a5cb457), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKirgoChargeBeer : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xe8603e87342bd64d);
            default Caption = LocText("INFO_KIRGO_CHARGE_BEER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x76e8e4f31dfd8592), EConversationDebugInfo::Executing);
                
                // Why not. Pass me a beer. 
                Hero.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_15_00"));
                DC(int64(0x76e8e4f31dfd8592), EConversationDebugInfo::Done);
                DC(int64(0x8dda1061ea6d0af3), EConversationDebugInfo::Executing);
                Kirgo.AddItemToInventory(UItFo_Potion_Beer, 2);
                DC(int64(0x8dda1061ea6d0af3), EConversationDebugInfo::Done);
                DC(int64(0x8dda1061ea6d0b03), EConversationDebugInfo::Executing);
                Kirgo.AI.GiveItemTo(Hero, UItFo_Potion_Beer, 1);
                DC(int64(0x8dda1061ea6d0b03), EConversationDebugInfo::Done);
                DC(int64(0x8dda1061ea6d0b0c), EConversationDebugInfo::Executing);
                // Here you go. 
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_05_01"), bUnskippable = true, ForceCameraPreset = n"TWO SHOT COWBOY");
                DC(int64(0x8dda1061ea6d0b0c), EConversationDebugInfo::Done);
                DC(int64(0x2c01e07654cb31af), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink);
                DC(int64(0x2c01e07654cb31af), EConversationDebugInfo::Done);
                DC(int64(0x4a9c400a7bb3fb96), EConversationDebugInfo::Executing);
                Kirgo.AI.WaitSeconds(0.5);
                DC(int64(0x4a9c400a7bb3fb96), EConversationDebugInfo::Done);
                DC(int64(0x4a9c400a7bb3fbb9), EConversationDebugInfo::Executing);
                Kirgo.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink);
                DC(int64(0x4a9c400a7bb3fbb9), EConversationDebugInfo::Done);
                DC(int64(0x4a9c400a7bb3fbca), EConversationDebugInfo::Executing);
                Hero.AI.WaitSeconds(6);
                DC(int64(0x4a9c400a7bb3fbca), EConversationDebugInfo::Done);
                DC(int64(0x4a9c400a7bb3fbcc), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Potion_Beer, 1, 0);
                DC(int64(0x4a9c400a7bb3fbcc), EConversationDebugInfo::Done);
                DC(int64(0x4a9c400a7bb3fc0b), EConversationDebugInfo::Executing);
                Kirgo.SetRelationshipTowards(Hero, ERelationship::Friend);
                DC(int64(0x4a9c400a7bb3fc0b), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb45b), EConversationDebugInfo::Executing);
                // Thanks. There isn't that much to tell, though. I was ...
                Hero.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_15_02"));
                DC(int64(0xb35cdb7e3a5cb45b), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb45c), EConversationDebugInfo::Executing);
                
                // Pity ... well, what can you do. Though, I've got to say, ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_05_03"));
                DC(int64(0xb35cdb7e3a5cb45c), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb45d), EConversationDebugInfo::Executing);
                
                // I'll make sure it stays that way.
                Hero.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_15_04"));
                DC(int64(0xb35cdb7e3a5cb45d), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb45e), EConversationDebugInfo::Executing);
                
                // Do that. So, how come you want to fight? Practice your ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_05_05"));
                DC(int64(0xb35cdb7e3a5cb45e), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb45f), EConversationDebugInfo::Executing);
                
                // I'm trying to make a name for myself.
                Hero.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_15_06"));
                DC(int64(0xb35cdb7e3a5cb45f), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb460), EConversationDebugInfo::Executing);
                
                // Meaning, you want to impress Scatty. Hmm ... makes ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_05_07"));
                DC(int64(0xb35cdb7e3a5cb460), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb461), EConversationDebugInfo::Executing);
                // Between us, though, if you really want to drop his jaw, ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_05_08"));
                DC(int64(0xb35cdb7e3a5cb461), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb462), EConversationDebugInfo::Executing);
                // Anyway. If you still want to fight, let's do it. I won't ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGE_BEER_05_09"));
                DC(int64(0xb35cdb7e3a5cb462), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKirgoChargereal : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xb35cdb7e3a5cb466);
            default Caption = LocText("INFO_KIRGO_CHARGEREAL_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKirgoCharge);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb35cdb7e3a5cb467), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xbd1f07e6065656d8), G1R.Kirgo_Challenged == 0);
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Kirgo_Challenged != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb35cdb7e3a5cb468), EConversationDebugInfo::Executing);
                
                // Let's fight. Are you ready?
                Hero.AI.Say(LocText("INFO_KIRGO_CHARGEREAL_15_00"));
                DC(int64(0xb35cdb7e3a5cb468), EConversationDebugInfo::Done);
                DC(int64(0x8f5d6e11921e1f55), EConversationDebugInfo::Executing);
                Quest::SCATTY_CHARGEKIRGO.StartQuest();
                DC(int64(0x8f5d6e11921e1f55), EConversationDebugInfo::Done);
                DB(int64(0x2c6ecb01f6f76f70), GameTime.CurrentClockTime.IsBetween(FClockTime(7, 45), FClockTime(23, 44)));
                
                if (GameTime.CurrentClockTime.IsBetween(FClockTime(7, 45), FClockTime(23, 44)))
                {
                    DB(int64(0x5678c9c180beff9c), Kirgo != nullptr && Kirgo.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f));
                    
                    if (Kirgo != nullptr && Kirgo.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f))
                    {
                        DC(int64(0x5678c9c180beffcf), EConversationDebugInfo::Executing);
                        G1R.Kirgo_Charged = 1;
                        DC(int64(0x5678c9c180beffcf), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180beffd8), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait); }
                        DC(int64(0x5678c9c180beffd8), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180beffda), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Wait); }
                        DC(int64(0x5678c9c180beffda), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_kirgo_chargereal_exit_1");
                    }
                    else
                    {
                        DC(int64(0xb35cdb7e3a5cb469), EConversationDebugInfo::Executing);
                        // As ever. Follow me.
                        Kirgo.AI.Say(LocText("INFO_KIRGO_CHARGEREAL_05_01"));
                        DC(int64(0xb35cdb7e3a5cb469), EConversationDebugInfo::Done);
                        DC(int64(0x2c01e07654cb31bd), EConversationDebugInfo::Executing);
                        G1R.Kirgo_Charged = 1;
                        DC(int64(0x2c01e07654cb31bd), EConversationDebugInfo::Done);
                        DC(int64(0x2c01e07654cb31bf), EConversationDebugInfo::Executing);
                        Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Guide);
                        DC(int64(0x2c01e07654cb31bf), EConversationDebugInfo::Done);
                        DC(int64(0xf0c92a1570bc2374), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait); }
                        DC(int64(0xf0c92a1570bc2374), EConversationDebugInfo::Done);
                        DC(int64(0xf0c92a1570bc2376), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Wait); }
                        DC(int64(0xf0c92a1570bc2376), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_kirgo_chargereal_exit_2");
                        DC(int64(0xb35cdb7e3a5cb46c), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xb35cdb7e3a5cb46c), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0x2c6ecb01f6f76f77), EConversationDebugInfo::Executing);
                    // What, at this hour? Nah, man. Come back tomorrow. 
                    Kirgo.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_132610"));
                    DC(int64(0x2c6ecb01f6f76f77), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kirgo_chargereal_exit_3");
                }
            }
        }
        
        
        class UChoiceKirgoExit : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xb35cdb7e3a5cb446);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb35cdb7e3a5cb447), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb35cdb7e3a5cb447), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKirgoGood : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xb35cdb7e3a5cb44d);
            default Caption = LocText("INFO_KIRGO_GOOD_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKirgoWhat);
            default Rules.HideIfKnows(UChoiceKirgoGood);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb35cdb7e3a5cb44e), EConversationDebugInfo::Executing);
                // Are you good?
                Hero.AI.Say(LocText("INFO_KIRGO_GOOD_15_00"));
                DC(int64(0xb35cdb7e3a5cb44e), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb44f), EConversationDebugInfo::Executing);
                
                // As a fighter? Well, I haven't been doing it for long, ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_GOOD_05_01"));
                DC(int64(0xb35cdb7e3a5cb44f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKirgoInarena : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xb35cdb7e3a5cb46d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceKirgoInarena);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OC_FIGHTTRAINING_04", 500.0f, int64(0xb35cdb7e3a5cb46d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb35cdb7e3a5cb46e), G1R.Kirgo_Charged != 0);
                }
                
                return G1R.Kirgo_Charged != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xb35cdb7e3a5cb471), G1R != nullptr && !G1R.HasReachedChapter(2));
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                {
                    DC(int64(0x5678c9c180beff7a), EConversationDebugInfo::Executing);
                    RequestStopConversationCamera();
                    DC(int64(0x5678c9c180beff7a), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180beff88), EConversationDebugInfo::Executing);
                    RequestCameraToLookAtCharacter(Kirgo);
                    DC(int64(0x5678c9c180beff88), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180beff8c), EConversationDebugInfo::Executing);
                    Kirgo.AI.GotoWaypoint(n"FP_OC_ARENAFIGHT2");
                    DC(int64(0x5678c9c180beff8c), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180beff8e), EConversationDebugInfo::Executing);
                    Hero.AI.TurnToCharacter(Kirgo);
                    DC(int64(0x5678c9c180beff8e), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180beff90), EConversationDebugInfo::Executing);
                    Kirgo.AI.TurnToCharacter(Hero);
                    DC(int64(0x5678c9c180beff90), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180beff92), EConversationDebugInfo::Executing);
                    Kirgo.AI.DrawCombatWeapon();
                    DC(int64(0x5678c9c180beff92), EConversationDebugInfo::Done);
                    DC(int64(0xb35cdb7e3a5cb472), EConversationDebugInfo::Executing);
                    // All right, let's do this. May the better fighter win!
                    Kirgo.AI.Say(LocText("INFO_KIRGO_INARENA_05_00"));
                    DC(int64(0xb35cdb7e3a5cb472), EConversationDebugInfo::Done);
                    DC(int64(0x2c01e07654cb31cf), EConversationDebugInfo::Executing);
                    Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start);
                    DC(int64(0x2c01e07654cb31cf), EConversationDebugInfo::Done);
                    DC(int64(0x2c01e07654cb31d1), EConversationDebugInfo::Executing);
                    Hero.AI.DrawCombatWeapon();
                    DC(int64(0x2c01e07654cb31d1), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180beff94), EConversationDebugInfo::Executing);
                    Kirgo.AI.StartTrainingFight(Hero);
                    DC(int64(0x5678c9c180beff94), EConversationDebugInfo::Done);
                    DC(int64(0x5265f0ad15a47fd), EConversationDebugInfo::Executing);
                    Kirgo.MakeUnlootable();
                    DC(int64(0x5265f0ad15a47fd), EConversationDebugInfo::Done);
                    DC(int64(0xa691a6912751f6c), EConversationDebugInfo::Executing);
                    G1R.Kirgo_Challenged = 1;
                    DC(int64(0xa691a6912751f6c), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kirgo_inarena_exit_1");
                    DC(int64(0xb35cdb7e3a5cb476), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb35cdb7e3a5cb476), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xb35cdb7e3a5cb477), EConversationDebugInfo::Executing);
                    // Den kleinen Streit vergessen wir, okay?
                    Kirgo.AI.Say(LocText("SVM_5_LETSFORGETOURLITTLEFIGHT"));
                    DC(int64(0xb35cdb7e3a5cb477), EConversationDebugInfo::Done);
                    DC(int64(0x2c01e07654cb31d5), EConversationDebugInfo::Executing);
                    Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start);
                    DC(int64(0x2c01e07654cb31d5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kirgo_inarena_exit_2");
                    DC(int64(0xb35cdb7e3a5cb479), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb35cdb7e3a5cb479), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKirgoWhat : UTopic_Hero__OC_GRD_KIRGO_251
        {
            default DebugId = int64(0xb35cdb7e3a5cb448);
            default Caption = LocText("INFO_KIRGO_WHAT_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceKirgoWhat);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb35cdb7e3a5cb449), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb35cdb7e3a5cb44a), EConversationDebugInfo::Executing);
                // Hi, I'm new here.
                Hero.AI.Say(LocText("INFO_KIRGO_WHAT_15_00"));
                DC(int64(0xb35cdb7e3a5cb44a), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb44b), EConversationDebugInfo::Executing);
                
                // Wait, a freshie? No way. You've got to tell me the ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_WHAT_05_01"));
                DC(int64(0xb35cdb7e3a5cb44b), EConversationDebugInfo::Done);
                DC(int64(0xb35cdb7e3a5cb44c), EConversationDebugInfo::Executing);
                // Oh Name's Kirgo, by the way. I fight in the arena, but ...
                Kirgo.AI.Say(LocText("INFO_KIRGO_WHAT_05_02"));
                DC(int64(0xb35cdb7e3a5cb44c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_KIRGO, Document::UDocumentSegment_Glossary_OC_GRD_KIRGO_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */