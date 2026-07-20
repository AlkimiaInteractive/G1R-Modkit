#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_NOV_BAALPARVEZ_1330 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_NOV_BAALPARVEZ_1330";
        }
        
        
        class UTopic_Hero__OC_NOV_BAALPARVEZ_1330 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_NOV_BAALPARVEZ_1330";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalParvez() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceBaalparvez219711 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xf7e1f6d991f5f9a3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219711);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_start", 400.0f, int64(0xf7e1f6d991f5f9a3));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7e1f6d991f5f9a2), EConversationDebugInfo::Executing);
                // Lets get out of here.
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134307_1924"));
                DC(int64(0xf7e1f6d991f5f9a2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219732 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f32a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219732);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_2", 400.0f, int64(0x30300594d887f32a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f329), EConversationDebugInfo::Executing);
                // When you're on the move, stick to the paths if you can.
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134402"));
                DC(int64(0x30300594d887f329), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219759 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f331);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219759);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_3", 400.0f, int64(0x30300594d887f331));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f330), EConversationDebugInfo::Executing);
                // You can find useful plants out here. Best pick up ...
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134404"));
                DC(int64(0x30300594d887f330), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219779 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f336);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219779);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_4", 400.0f, int64(0x30300594d887f336));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f335), EConversationDebugInfo::Executing);
                // We're a lot already, but we're always looking for new ...
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134407"));
                DC(int64(0x30300594d887f335), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219799 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f33b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219799);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_5", 400.0f, int64(0x30300594d887f33b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f33a), EConversationDebugInfo::Executing);
                // The templars protect us. They're the best fighters ...
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134411"));
                DC(int64(0x30300594d887f33a), EConversationDebugInfo::Done);
                DC(int64(0x30300594d887f33d), EConversationDebugInfo::Executing);
                // The gurus guide us. Their wisdom and inner strength ...
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134413"));
                DC(int64(0x30300594d887f33d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219821 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f341);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219821);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_6", 400.0f, int64(0x30300594d887f341));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f340), EConversationDebugInfo::Executing);
                // I'm sure you'll get along fine with the other novices.
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134415"));
                DC(int64(0x30300594d887f340), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219841 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f346);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219841);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_7", 400.0f, int64(0x30300594d887f346));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f345), EConversationDebugInfo::Executing);
                // No one has to slave away in the mines with us. You can ...
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134417"));
                DC(int64(0x30300594d887f345), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219863 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f34c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219863);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_8", 400.0f, int64(0x30300594d887f34c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f34b), EConversationDebugInfo::Executing);
                // Its not far now.
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134420"));
                DC(int64(0x30300594d887f34b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvez219883 : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0x30300594d887f351);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UChoiceBaalparvez219883);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_end", 400.0f, int64(0x30300594d887f351));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x30300594d887f350), EConversationDebugInfo::Executing);
                // Ah, the swamp... smell that? The scent of freedom...
                BaalParvez.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_134422"));
                DC(int64(0x30300594d887f350), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvezAtpsi : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c182);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezRightway);
            default Rules.HideIfKnows(UChoiceBaalparvezAtpsi);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"Guide_Path_FromTo_SwampCamp_end", 1500.0f, int64(0xab67c32864e0c182));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xab67c32864e0c184), BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                return BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_Arrival);
                DB(int64(0xab67c32864e0c186), G1R.BaalParvez_GotoSC_Day.IsValid() && G1R.BaalParvez_GotoSC_Day.IsLessThanXDaysAgo(2));
                
                if (G1R.BaalParvez_GotoSC_Day.IsValid() && G1R.BaalParvez_GotoSC_Day.IsLessThanXDaysAgo(2))
                {
                    DC(int64(0xab67c32864e0c187), EConversationDebugInfo::Executing);
                    // Here we are. That down there is our camp. 
                    BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_ATPSI_10_00"));
                    DC(int64(0xab67c32864e0c187), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xab67c32864e0c188), EConversationDebugInfo::Executing);
                    // You took your time, Brother, didn't you? Either way, ...
                    BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_ATPSI_LATE_10_00"));
                    DC(int64(0xab67c32864e0c188), EConversationDebugInfo::Done);
                }
                DC(int64(0xab67c32864e0c189), EConversationDebugInfo::Executing);
                // The templars will let you through - once you're in, take ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_ATPSI_10_01"));
                DC(int64(0xab67c32864e0c189), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c18a), EConversationDebugInfo::Executing);
                // If you decide to join, ask for Cor Kalom. He supervises ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_ATPSI_10_02"));
                DC(int64(0xab67c32864e0c18a), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c18b), EConversationDebugInfo::Executing);
                // I'll make my way back to the Old Camp now. There's still ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_ATPSI_10_03"));
                DC(int64(0xab67c32864e0c18b), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c18c), EConversationDebugInfo::Executing);
                
                // Good luck!
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_ATPSI_15_04"));
                DC(int64(0xab67c32864e0c18c), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c18d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_JOINPSI_ARRIVE);
                DC(int64(0xab67c32864e0c18d), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c18e), EConversationDebugInfo::Executing);
                BaalParvez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_NOV_BaalParvez_1330_Start);
                DC(int64(0xab67c32864e0c18e), EConversationDebugInfo::Done);
                DC(int64(0x177474618b93f959), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM.StartQuest();
                DC(int64(0x177474618b93f959), EConversationDebugInfo::Done);
                DC(int64(0xde4c90d6d02ed51), EConversationDebugInfo::Executing);
                BaalParvez.LeavePartyOf(Hero);
                DC(int64(0xde4c90d6d02ed51), EConversationDebugInfo::Done);
                DC(int64(0x935e8610a6a48999), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"SpawnMonstersAfterParvez");
                DC(int64(0x935e8610a6a48999), EConversationDebugInfo::Done);
                DB(int64(0x11437211dc44a212), Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning())
                {
                    DC(int64(0x11437211dc44a214), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.SucceedQuest();
                    DC(int64(0x11437211dc44a214), EConversationDebugInfo::Done);
                }
                DC(int64(0xab67c32864e0c18f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xab67c32864e0c18f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalparvezExit : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c14c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c14d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xab67c32864e0c14d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalparvezGotopsi : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c171);
            default Caption = LocText("DIA_BAALPARVEZ_GOTOPSI_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezRightway);
            default Rules.HideIfKnows(UChoiceBaalparvezAtpsi);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xab67c32864e0c172), BaalParvez != nullptr && !BaalParvez.IsRefusingToTalkWith(Hero));
                    DB(int64(0xab67c32864e0c173), BaalParvez != nullptr && !BaalParvez.IsCloseToWaypoint(n"Guide_Path_FromTo_SwampCamp_end", 2000.0f));
                    DB(int64(0xc12c60aa26238072), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xd723a4f0b886320e), BaalParvez != nullptr && !BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide));
                }
                
                if (BaalParvez != nullptr && BaalParvez.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (BaalParvez != nullptr && BaalParvez.IsCloseToWaypoint(n"Guide_Path_FromTo_SwampCamp_end", 2000.0f))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (BaalParvez != nullptr && BaalParvez.HasAssignedDailyRoutine(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c175), EConversationDebugInfo::Executing);
                // All right, take me to your camp. I want to see it. 
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_GOTOPSI_15_00"));
                DC(int64(0xab67c32864e0c175), EConversationDebugInfo::Done);
                DB(int64(0xab67c32864e0c177), G1R.SC_Walk == 0);
                
                if (G1R.SC_Walk == 0)
                {
                    DC(int64(0xab67c32864e0c17b), EConversationDebugInfo::Executing);
                    G1R.SC_Walk = 1;
                    DC(int64(0xab67c32864e0c17b), EConversationDebugInfo::Done);
                }
                DC(int64(0xab67c32864e0c17c), EConversationDebugInfo::Executing);
                // Certainly! I will lead the way - just follow me.
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_GOTOPSI_10_01"));
                DC(int64(0xab67c32864e0c17c), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c17e), EConversationDebugInfo::Executing);
                BaalParvez.RefuseToTalk(300);
                DC(int64(0xab67c32864e0c17e), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c17f), EConversationDebugInfo::Executing);
                BaalParvez.SetRelationshipTowards(Hero, ERelationship::Friend);
                DC(int64(0xab67c32864e0c17f), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d0a), EConversationDebugInfo::Executing);
                G1R.BaalParvez_GotoSC_Day = FInGameTime::Now();
                DC(int64(0x51c1a02622cc9d0a), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c180), EConversationDebugInfo::Executing);
                BaalParvez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_NOV_BaalParvez_1330_Guide);
                DC(int64(0xab67c32864e0c180), EConversationDebugInfo::Done);
                DC(int64(0xde4c90d6d02ed4f), EConversationDebugInfo::Executing);
                BaalParvez.JoinPartyOf(Hero);
                DC(int64(0xde4c90d6d02ed4f), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c181), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xab67c32864e0c181), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalparvezGreet : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c14e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBaalparvezGreet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xab67c32864e0c14f), BaalParvez != nullptr && BaalParvez.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f));
                }
                
                return BaalParvez != nullptr && BaalParvez.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c150), EConversationDebugInfo::Executing);
                // May the Sleeper be with you, stranger!
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_GREET_10_00"));
                DC(int64(0xab67c32864e0c150), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c151), EConversationDebugInfo::Executing);
                // I'm here to guide you to the path of salvation.
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_GREET_10_01"));
                DC(int64(0xab67c32864e0c151), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_NOV_BAALPARVEZ, Document::UDocumentSegment_Glossary_OC_NOV_BAALPARVEZ_Introduction);
                DC(int64(0xc44819b251d63502), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ.SucceedQuest();
                DC(int64(0xc44819b251d63502), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvezMyadvantage : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c159);
            default Caption = LocText("DIA_BAALPARVEZ_MYADVANTAGE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezRightway);
            default Rules.HideIfKnows(UChoiceBaalparvezMyadvantage);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c15a), EConversationDebugInfo::Executing);
                // What do I get out of joining you?
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_MYADVANTAGE_15_00"));
                DC(int64(0xab67c32864e0c15a), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c15b), EConversationDebugInfo::Executing);
                
                // Besides the honor of serving the Sleeper? You might just ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_MYADVANTAGE_10_01"));
                DC(int64(0xab67c32864e0c15b), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c15c), EConversationDebugInfo::Executing);
                // Or you might rise into the highest ranks and become a ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_MYADVANTAGE_10_02"));
                DC(int64(0xab67c32864e0c15c), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c15d), EConversationDebugInfo::Executing);
                // There are even templars who have mastered both the skill ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_MYADVANTAGE_10_03"));
                DC(int64(0xab67c32864e0c15d), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c15e), EConversationDebugInfo::Executing);
                // Either way, for a true believer, our Brotherhood is a ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_MYADVANTAGE_10_04"));
                DC(int64(0xab67c32864e0c15e), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c15f), EConversationDebugInfo::Executing);
                // But, please, go ahead and see for yourself. Visit our ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_MYADVANTAGE_10_05"));
                DC(int64(0xab67c32864e0c15f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvezPsimagic : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c16d);
            default Caption = LocText("DIA_BAALPARVEZ_PSIMAGIC_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezSleepersaid);
            default Rules.HideIfKnows(UChoiceBaalparvezPsimagic);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x74883fd3a65f3a5e), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c16e), EConversationDebugInfo::Executing);
                
                // Tell me more about the Sleeper's magic.
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_PSIMAGIC_15_00"));
                DC(int64(0xab67c32864e0c16e), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c16f), EConversationDebugInfo::Executing);
                
                // It allows its wielder to control things with the power ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_PSIMAGIC_10_01"));
                DC(int64(0xab67c32864e0c16f), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c170), EConversationDebugInfo::Executing);
                // But only our gurus and the best of the templars can ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_PSIMAGIC_10_02"));
                DC(int64(0xab67c32864e0c170), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvezRightway : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c152);
            default Caption = LocText("DIA_BAALPARVEZ_RIGHTWAY_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezGreet);
            default Rules.HideIfKnows(UChoiceBaalparvezRightway);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x74883fd3a65f3a58), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c153), EConversationDebugInfo::Executing);
                
                // The "path of salvation?"
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_RIGHTWAY_15_00"));
                DC(int64(0xab67c32864e0c153), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c154), EConversationDebugInfo::Executing);
                
                // Yes. That of the Sleeper. He alone holds the power to ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_RIGHTWAY_10_01"));
                DC(int64(0xab67c32864e0c154), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c155), EConversationDebugInfo::Executing);
                // You see, I'm part of the Brotherhood, the Sleeper's ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_RIGHTWAY_10_02"));
                DC(int64(0xab67c32864e0c155), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835ca8), EConversationDebugInfo::Executing);
                
                // Sounds interesting. 
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_131856"));
                DC(int64(0x4f4013217835ca8), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c156), EConversationDebugInfo::Executing);
                
                // You have no idea. Until now, the Sleeper only spoke to ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_RIGHTWAY_10_03"));
                DC(int64(0xab67c32864e0c156), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c157), EConversationDebugInfo::Executing);
                // However, we will need as many Brothers as we can for the ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_RIGHTWAY_10_04"));
                DC(int64(0xab67c32864e0c157), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c158), EConversationDebugInfo::Executing);
                // You, stranger, could be a part of this - like me, you ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_RIGHTWAY_10_05"));
                DC(int64(0xab67c32864e0c158), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835ca9), EConversationDebugInfo::Executing);
                // What do you say? Our camp is not far from here, down in ...
                BaalParvez.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_132033"));
                DC(int64(0x4f4013217835ca9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_NOV_BAALPARVEZ, Document::UDocumentSegment_Glossary_OC_NOV_BAALPARVEZ_Guide);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_ParvezOffer);
                DB(int64(0x11437211dc44a203), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted())
                {
                    DC(int64(0x11437211dc44a205), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI.StartQuest();
                    DC(int64(0x11437211dc44a205), EConversationDebugInfo::Done);
                    DC(int64(0x11437211dc44a209), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.StartQuest();
                    DC(int64(0x11437211dc44a209), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalparvez_rightway_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_baalparvez_rightway_exit_2");
                }
            }
        }
        
        
        class UChoiceBaalparvezSleeper : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c160);
            default Caption = LocText("DIA_BAALPARVEZ_SLEEPER_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezGreet);
            default Rules.HideIfKnows(UChoiceBaalparvezSleeper);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x74883fd3a65f3a5a), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c161), EConversationDebugInfo::Executing);
                // Who is "the Sleeper?"
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPER_15_00"));
                DC(int64(0xab67c32864e0c161), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c162), EConversationDebugInfo::Executing);
                
                // He, my friend, is our salvation. He speaks to us through ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPER_10_01"));
                DC(int64(0xab67c32864e0c162), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c163), EConversationDebugInfo::Executing);
                // Five years ago, he visited our Master Y'Berion in his ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPER_10_02"));
                DC(int64(0xab67c32864e0c163), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c164), EConversationDebugInfo::Executing);
                // And yes, that means what you think it does: we have ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPER_10_03"));
                DC(int64(0xab67c32864e0c164), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c165), EConversationDebugInfo::Executing);
                
                // And how exactly is that going to help you in here?
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPER_15_04"));
                DC(int64(0xab67c32864e0c165), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c166), EConversationDebugInfo::Executing);
                
                // What do you think? He will liberate us from this ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPER_10_05"));
                DC(int64(0xab67c32864e0c166), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalparvezSleepersaid : UTopic_Hero__OC_NOV_BAALPARVEZ_1330
        {
            default DebugId = int64(0xab67c32864e0c167);
            default Caption = LocText("DIA_BAALPARVEZ_SLEEPERSAID_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezSleeper);
            default Rules.HideIfKnows(UChoiceBaalparvezSleepersaid);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x74883fd3a65f3a5c), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab67c32864e0c168), EConversationDebugInfo::Executing);
                
                // What has the Sleeper been telling you?
                Hero.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPERSAID_15_00"));
                DC(int64(0xab67c32864e0c168), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c169), EConversationDebugInfo::Executing);
                
                // He told Y'Berion to travel to the old ruins in the ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPERSAID_10_01"));
                DC(int64(0xab67c32864e0c169), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c16a), EConversationDebugInfo::Executing);
                // He liberated many of us from the ore barons - thanks to ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPERSAID_10_02"));
                DC(int64(0xab67c32864e0c16a), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835caa), EConversationDebugInfo::Executing);
                
                // How does your camp sustain itself?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_134151"));
                DC(int64(0x4f4013217835caa), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c16b), EConversationDebugInfo::Executing);
                
                // Oh, there's plenty of food in the swamp if you know ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPERSAID_10_03"));
                DC(int64(0xab67c32864e0c16b), EConversationDebugInfo::Done);
                DC(int64(0xab67c32864e0c16c), EConversationDebugInfo::Executing);
                // Lastly, the Sleeper has also blessed some of us with the ...
                BaalParvez.AI.Say(LocText("DIA_BAALPARVEZ_SLEEPERSAID_10_04"));
                DC(int64(0xab67c32864e0c16c), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */