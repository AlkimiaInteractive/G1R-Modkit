#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_ORG_MORDRAG_826 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_ORG_MORDRAG_826";
        }
        
        
        class UTopic_Hero__OC_ORG_MORDRAG_826 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_ORG_MORDRAG_826";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMordrag() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceMordrag220432 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee317a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220432);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_start", 400.0f, int64(0xf43954d3ecee317a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee3177), EConversationDebugInfo::Executing);
                // Been here long enough... time to head home.
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_143952_3436"));
                DC(int64(0xf43954d3ecee3177), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220454 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee3189);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220454);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_SwampCamp_2", 400.0f, int64(0xf43954d3ecee3189));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee3186), EConversationDebugInfo::Executing);
                // At the Old Camp, they just watch you all time. Same with ...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144012"));
                DC(int64(0xf43954d3ecee3186), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220474 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee3194);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220474);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_1", 400.0f, int64(0xf43954d3ecee3194));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                    DB(int64(0xf43954d3ecee319d), GameTime.CurrentClockTime.IsBetween(FClockTime(20, 00), FClockTime(5, 00)));
                }
                
                if (Mordrag != nullptr && !Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide))
                    return false;
                
                if (!GameTime.CurrentClockTime.IsBetween(FClockTime(20, 00), FClockTime(5, 00)))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee3191), EConversationDebugInfo::Executing);
                // Not the best idea to be out and about at this hour...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144014"));
                DC(int64(0xf43954d3ecee3191), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220496 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee31b0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220496);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_2", 400.0f, int64(0xf43954d3ecee31b0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee31ad), EConversationDebugInfo::Executing);
                // Some advice from me: get some sleep and head out early ...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144016"));
                DC(int64(0xf43954d3ecee31ad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220516 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee31bd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220516);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_3", 600.0f, int64(0xf43954d3ecee31bd));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee31ba), EConversationDebugInfo::Executing);
                // Cavalorn lives out here- a hunter from the Old Camp. He ...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144022"));
                DC(int64(0xf43954d3ecee31ba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220536 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee31ca);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220536);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_4", 600.0f, int64(0xf43954d3ecee31ca));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee31c7), EConversationDebugInfo::Executing);
                // Be careful around caves. Most of them got something ...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144147"));
                DC(int64(0xf43954d3ecee31c7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220556 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee31d5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220556);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_5", 400.0f, int64(0xf43954d3ecee31d5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee31d2), EConversationDebugInfo::Executing);
                // Somewhere back there is Aidan, one of our hunters...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144148"));
                DC(int64(0xf43954d3ecee31d2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220578 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee31e0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220578);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_6", 400.0f, int64(0xf43954d3ecee31e0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee31dd), EConversationDebugInfo::Executing);
                // The cages... remnants from the revolt back then. Though ...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144150"));
                DC(int64(0xf43954d3ecee31dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220598 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee31eb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UChoiceMordrag220598);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_BLACKMAILER_ENTRANCE", 700.0f, int64(0xf43954d3ecee31eb));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee31e8), EConversationDebugInfo::Executing);
                // Almost there...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144155"));
                DC(int64(0xf43954d3ecee31e8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag220618 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xf43954d3ecee31f6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMordrag220618);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_7", 500.0f, int64(0xf43954d3ecee31f6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                return Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf43954d3ecee31f3), EConversationDebugInfo::Executing);
                // Once you're inside, figure out who's in charge and stick ...
                Mordrag.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_144156"));
                DC(int64(0xf43954d3ecee31f3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMordrag231329 : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0xfee4a13dbb221b3c);
            default Caption = LocText("ORG_826_MORDRAG_GOTONEWCAMP_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg826MordragGotonewcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfee4a13dbb221b49), Mordrag != nullptr && !Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated));
                    DB(int64(0xfee4a13dbb221b6e), G1R != nullptr && G1R.IsInChapter(1));
                    DB(int64(0xd723a4f0b886320b), Mordrag != nullptr && !Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide));
                }
                
                if (Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                if (Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_Guide))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfee4a13dbb221b38), EConversationDebugInfo::Executing);
                
                // Take me to the New Camp.
                Hero.AI.Say(LocText("ORG_826_MORDRAG_GOTONEWCAMP_15_00"));
                DC(int64(0xfee4a13dbb221b38), EConversationDebugInfo::Done);
                DC(int64(0xfee4a13dbb221b56), EConversationDebugInfo::Executing);
                
                // Ha! I knew you'd see sense. Follow me.
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_GOTONEWCAMP_11_01"));
                DC(int64(0xfee4a13dbb221b56), EConversationDebugInfo::Done);
                DC(int64(0x1ce0f15481f962f9), EConversationDebugInfo::Executing);
                Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
                DC(int64(0x1ce0f15481f962f9), EConversationDebugInfo::Done);
                DC(int64(0xfb31217cc8347b3d), EConversationDebugInfo::Executing);
                Mordrag.JoinPartyOf(Hero);
                DC(int64(0xfb31217cc8347b3d), EConversationDebugInfo::Done);
                DC(int64(0xfee4a13dbb221b6b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfee4a13dbb221b6b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg826MordragAtnewcamp : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d11);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresBringlist);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresGetkraut);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg801LaresMordragsentme);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg826MordragGotonewcamp);
            default Rules.HideIfKnows(UChoiceOrg826MordragAtnewcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2efd40f3a040f94c), Mordrag != nullptr && Mordrag.IsCloseToWaypoint(n"Guide_Path_FromTo_NewCamp_end", 1000.0f));
                    DB(int64(0x51c1a02622cc9d12), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0x2efd40f3a040f94c), Mordrag != nullptr && Mordrag.IsCloseToWaypoint(n"FP_NC_MORDRAGWAIT", 1000.0f));
                    DB(int64(0x51c1a02622cc9d12), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                }
                
                if (Mordrag != nullptr && Mordrag.IsCloseToWaypoint(n"Guide_Path_FromTo_NewCamp_end", 1000.0f) && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                    return true;
                
                if (Mordrag != nullptr && Mordrag.IsCloseToWaypoint(n"FP_NC_MORDRAGWAIT", 1000.0f) && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_ORG_MORDRAG, Document::UDocumentSegment_Glossary_OC_ORG_MORDRAG_NewCamp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_MordragRing);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_NCArrival);
                DB(int64(0x51c1a02622cc9d14), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait));
                
                if (Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait))
                {
                    DC(int64(0x51c1a02622cc9d16), EConversationDebugInfo::Executing);
                    // There you are. Thought a shadowbeast got you. Anyway, ...
                    Mordrag.AI.Say(LocText("ORG_826_MORDRAG_ATNEWCAMP_LATE_11_00"));
                    DC(int64(0x51c1a02622cc9d16), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x51c1a02622cc9d15), EConversationDebugInfo::Executing);
                    // Alright. Here we are. 
                    Mordrag.AI.Say(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_00"));
                    DC(int64(0x51c1a02622cc9d15), EConversationDebugInfo::Done);
                }
                DC(int64(0x51c1a02622cc9d17), EConversationDebugInfo::Executing);
                // Well, just head through that gate, and you're inside the ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01"));
                DC(int64(0x51c1a02622cc9d17), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d18), EConversationDebugInfo::Executing);
                // They ain't gonna let you see him otherwise.
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_02"));
                DC(int64(0x51c1a02622cc9d18), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835cc0), EConversationDebugInfo::Executing);
                
                // What are you gonna do?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_143616"));
                DC(int64(0x4f4013217835cc0), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d19), EConversationDebugInfo::Executing);
                
                // Ah, I reckon I'll stick around for a bit. Made enough ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_03"));
                DC(int64(0x51c1a02622cc9d19), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d1a), EConversationDebugInfo::Executing);
                // If you're ever in the mood for a pint, you'll find me in ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_04"));
                DC(int64(0x51c1a02622cc9d1a), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d1b), EConversationDebugInfo::Executing);
                
                // See you around. 
                Hero.AI.Say(LocText("ORG_826_MORDRAG_ATNEWCAMP_15_05"));
                DC(int64(0x51c1a02622cc9d1b), EConversationDebugInfo::Done);
                DB(int64(0xe51d7212e7f9ff4f), Hero != nullptr && Hero.HasItem(UItAt_Ring_Mordrag, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Ring_Mordrag, 1, 0))
                {
                    
                }
                else
                {
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                    Mordrag.AddItemToInventory(UItAt_Ring_Mordrag, 1);
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                    DC(int64(0xe51d7212e7f9ff57), EConversationDebugInfo::Executing);
                    Mordrag.AI.GiveItemTo(Hero, UItAt_Ring_Mordrag, 1);
                    DC(int64(0xe51d7212e7f9ff57), EConversationDebugInfo::Done);
                }
                DC(int64(0x6529242ba425b8f4), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_MORDRAGKO_ESCORT);
                DC(int64(0x6529242ba425b8f4), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b8f6), EConversationDebugInfo::Executing);
                G1R.MordragKO_StayAtNC = 1;
                DC(int64(0x6529242ba425b8f6), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b8f8), EConversationDebugInfo::Executing);
                Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated);
                DC(int64(0x6529242ba425b8f8), EConversationDebugInfo::Done);
                DC(int64(0x63819e1318111ede), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG.SucceedQuest();
                DC(int64(0x63819e1318111ede), EConversationDebugInfo::Done);
                DC(int64(0xde4c90d6d02ed59), EConversationDebugInfo::Executing);
                Mordrag.LeavePartyOf(Hero);
                DC(int64(0xde4c90d6d02ed59), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d21), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x51c1a02622cc9d21), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg826MordragCourier : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9cec);
            default Caption = LocText("ORG_826_MORDRAG_COURIER_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x51c1a02622cc9ced), G1R.Thorus_MordragMageMessenger != 0);
                }
                
                return G1R.Thorus_MordragMageMessenger != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9cee), EConversationDebugInfo::Executing);
                // Is it true you're a courier for the water mages?
                Hero.AI.Say(LocText("ORG_826_MORDRAG_COURIER_15_00"));
                DC(int64(0x51c1a02622cc9cee), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cef), EConversationDebugInfo::Executing);
                
                // What if I am?
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_COURIER_11_01"));
                DC(int64(0x51c1a02622cc9cef), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cf0), EConversationDebugInfo::Executing);
                
                // I'd like to have a chat with the Fire Mages, but I can't ...
                Hero.AI.Say(LocText("ORG_826_MORDRAG_COURIER_15_02"));
                DC(int64(0x51c1a02622cc9cf0), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cf1), EConversationDebugInfo::Executing);
                
                // I see. Well, us mage couriers got a seal that gives us ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_COURIER_11_03"));
                DC(int64(0x51c1a02622cc9cf1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_ORG_MORDRAG, Document::UDocumentSegment_Glossary_OC_ORG_MORDRAG_Courier);
            }
        }
        
        
        class UChoiceOrg826MordragExit : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9ce0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9ce1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x51c1a02622cc9ce1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg826MordragFight : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d22);
            default Caption = LocText("ORG_826_MORDRAG_FIGHT_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceOrg826MordragFight);
            default Rules.HideIfKnows(UChoiceOrg826MordragGotonewcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x51c1a02622cc9d23), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9d24), EConversationDebugInfo::Executing);
                // This camp is too small for the two of us.
                Hero.AI.Say(LocText("ORG_826_MORDRAG_FIGHT_15_00"));
                DC(int64(0x51c1a02622cc9d24), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d25), EConversationDebugInfo::Executing);
                
                // Sorry, what?
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_FIGHT_11_01"));
                DC(int64(0x51c1a02622cc9d25), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_ORG_MORDRAG, Document::UDocumentSegment_Glossary_OC_ORG_MORDRAG_MordragKO);
                Subdialog(
                    UChoiceMordragFightGetaway,
                    UChoiceMordragFightOrebarons,
                    UChoiceMordragFightThorus
                );
            }
        }
        
        
        class UChoiceMordragFightGetaway : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d27);
            default Caption = LocText("INFO_MORDRAG_FIGHT_GETAWAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9d28), EConversationDebugInfo::Executing);
                // You heard me. Get the hell out of here.
                Hero.AI.Say(LocText("INFO_MORDRAG_FIGHT_GETAWAY_15_00"));
                DC(int64(0x51c1a02622cc9d28), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d29), EConversationDebugInfo::Executing);
                
                // Big words from a small man.
                Mordrag.AI.Say(LocText("INFO_MORDRAG_FIGHT_GETAWAY_11_01"));
                DC(int64(0x51c1a02622cc9d29), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b913), EConversationDebugInfo::Executing);
                Mordrag.AI.StartRealFightWithWeaponLootOnly(Hero);
                DC(int64(0x6529242ba425b913), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d2c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x51c1a02622cc9d2c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMordragFightOrebarons : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d2d);
            default Caption = LocText("INFO_MORDRAG_FIGHT_OREBARONS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9d2e), EConversationDebugInfo::Executing);
                // You stole from the ore barons. That crossed the line.
                Hero.AI.Say(LocText("INFO_MORDRAG_FIGHT_OREBARONS_15_00"));
                DC(int64(0x51c1a02622cc9d2e), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d2f), EConversationDebugInfo::Executing);
                
                // Ah, so that's why you're here. Why didn't you just say ...
                Mordrag.AI.Say(LocText("INFO_MORDRAG_FIGHT_OREBARONS_11_01"));
                DC(int64(0x51c1a02622cc9d2f), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b91a), EConversationDebugInfo::Executing);
                G1R.MordragKO_PlayerChoseOreBarons = 1;
                DC(int64(0x6529242ba425b91a), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b91c), EConversationDebugInfo::Executing);
                Mordrag.AI.StartRealFightWithWeaponLootOnly(Hero);
                DC(int64(0x6529242ba425b91c), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d33), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x51c1a02622cc9d33), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMordragFightThorus : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d34);
            default Caption = LocText("INFO_MORDRAG_FIGHT_THORUS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9d35), EConversationDebugInfo::Executing);
                // Thorus sent me. He wants you gone.
                Hero.AI.Say(LocText("INFO_MORDRAG_FIGHT_THORUS_15_00"));
                DC(int64(0x51c1a02622cc9d35), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d36), EConversationDebugInfo::Executing);
                
                // Thorus, is it? I could've guessed. 
                Mordrag.AI.Say(LocText("INFO_MORDRAG_FIGHT_THORUS_11_01"));
                DC(int64(0x51c1a02622cc9d36), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b923), EConversationDebugInfo::Executing);
                G1R.MordragKO_PlayerChoseThorus = 1;
                DC(int64(0x6529242ba425b923), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b925), EConversationDebugInfo::Executing);
                Mordrag.AI.StartRealFightWithWeaponLootOnly(Hero);
                DC(int64(0x6529242ba425b925), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d3a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x51c1a02622cc9d3a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg826MordragGotonewcamp : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d06);
            default Caption = LocText("ORG_826_MORDRAG_GOTONEWCAMP_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg826MordragJoinnewcamp);
            default Rules.HideIfKnows(UChoiceOrg826MordragGotonewcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x51c1a02622cc9d07), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9d08), EConversationDebugInfo::Executing);
                // Take me to the New Camp.
                Hero.AI.Say(LocText("ORG_826_MORDRAG_GOTONEWCAMP_15_00"));
                DC(int64(0x51c1a02622cc9d08), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d09), EConversationDebugInfo::Executing);
                
                // Ha! I knew you'd see sense. Follow me.
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_GOTONEWCAMP_11_01"));
                DC(int64(0x51c1a02622cc9d09), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_MordragStart);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_GuideToNC);
                DC(int64(0x6529242ba425b956), EConversationDebugInfo::Executing);
                G1R.Mordrag_GotoNC_Day = FInGameTime::Now();
                DC(int64(0x6529242ba425b956), EConversationDebugInfo::Done);
                DB(int64(0x51c1a02622cc9d0d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0x6529242ba425b952), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_JOINNC.StartQuest();
                    DC(int64(0x6529242ba425b952), EConversationDebugInfo::Done);
                }
                DC(int64(0x6529242ba425b94e), EConversationDebugInfo::Executing);
                Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_Guide);
                DC(int64(0x6529242ba425b94e), EConversationDebugInfo::Done);
                DC(int64(0xde4c90d6d02ed57), EConversationDebugInfo::Executing);
                Mordrag.JoinPartyOf(Hero);
                DC(int64(0xde4c90d6d02ed57), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d10), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x51c1a02622cc9d10), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg826MordragGreet : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9ce2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceOrg826MordragGreet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x51c1a02622cc9ce3), Mordrag != nullptr && Mordrag.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f));
                }
                
                return Mordrag != nullptr && Mordrag.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9ce4), EConversationDebugInfo::Executing);
                // Oy, freshie! I'm Mordrag - remember that name, 'cause ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_GREET_11_00"));
                DC(int64(0x51c1a02622cc9ce4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_ORG_MORDRAG, Document::UDocumentSegment_Glossary_OC_ORG_MORDRAG_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_ORG_MORDRAG, Document::UDocumentSegment_Glossary_OC_ORG_MORDRAG_Dealer);
                DC(int64(0x63819e1318111bd6), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_FINDMORDRAG.SucceedQuest();
                DC(int64(0x63819e1318111bd6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg826MordragHauab : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d3b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceOrg826MordragHauab);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x51c1a02622cc9d3c), Mordrag != nullptr && Mordrag.WasDefeatedBy(Hero));
                    DB(int64(0x51c1a02622cc9d3d), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                    DB(int64(0x6dc4adcb270563d), Mordrag != nullptr && Mordrag.WasIntentionallyDamagedBy(Hero));
                }
                
                if (Mordrag != nullptr && !Mordrag.WasDefeatedBy(Hero))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && !Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning())
                    return false;
                
                if (Mordrag != nullptr && !Mordrag.WasIntentionallyDamagedBy(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9d3e), EConversationDebugInfo::Executing);
                // Piss off.
                Hero.AI.Say(LocText("ORG_826_HAUAB_GOTONEWCAMP_15_00"));
                DC(int64(0x51c1a02622cc9d3e), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835cc1), EConversationDebugInfo::Executing);
                
                // Fuck's sake ... All right, all right, I'm leavin'!
                Mordrag.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_144205"));
                DC(int64(0x4f4013217835cc1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_MordragBeated);
                DC(int64(0x6529242ba425b962), EConversationDebugInfo::Executing);
                G1R.MordragKO_Exiled = 1;
                DC(int64(0x6529242ba425b962), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425b964), EConversationDebugInfo::Executing);
                Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated);
                DC(int64(0x6529242ba425b964), EConversationDebugInfo::Done);
                DC(int64(0x63819e1318111dd9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_GETRIDEOFMORDRAG.SucceedQuest();
                DC(int64(0x63819e1318111dd9), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d41), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x51c1a02622cc9d41), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg826MordragJoinnewcamp : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9d02);
            default Caption = LocText("ORG_826_MORDRAG_JOINNEWCAMP_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg826MordragNcinfo);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg826MordragProblem);
            default Rules.HideIfKnows(UChoiceOrg826MordragJoinnewcamp);
            
            default Rules.RequireCharacterHasNotListenedTo(n"SELF", LocText("ORG_826_MORDRAG_FIGHT_15_00"), int64(0x51c1a02622cc9d02));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x868d389bf57c8835), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x8591125c9e8720a8), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9d03), EConversationDebugInfo::Executing);
                // Say I wanted to join you guys. Could you help me?
                Hero.AI.Say(LocText("ORG_826_MORDRAG_JOINNEWCAMP_15_00"));
                DC(int64(0x51c1a02622cc9d03), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d04), EConversationDebugInfo::Executing);
                
                // Well, if you're serious about it, we could get goin' ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_JOINNEWCAMP_11_01"));
                DC(int64(0x51c1a02622cc9d04), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d05), EConversationDebugInfo::Executing);
                // That said, if you'd rather have a go at me just 'cause ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_JOINNEWCAMP_11_02"));
                DC(int64(0x51c1a02622cc9d05), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_ORG_MORDRAG, Document::UDocumentSegment_Glossary_OC_ORG_MORDRAG_Guide);
            }
        }
        
        
        class UChoiceOrg826MordragNcinfo : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9cfb);
            default Caption = LocText("ORG_826_MORDRAG_NCINFO_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg826MordragCourier);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg826MordragProblem);
            default Rules.HideIfKnows(UChoiceOrg826MordragNcinfo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9cfc), EConversationDebugInfo::Executing);
                // Tell me something about the New Camp.
                Hero.AI.Say(LocText("ORG_826_MORDRAG_NCINFO_15_00"));
                DC(int64(0x51c1a02622cc9cfc), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cfd), EConversationDebugInfo::Executing);
                
                // What's there to say? We're free. We ain't got no gurus ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_NCINFO_11_01"));
                DC(int64(0x51c1a02622cc9cfd), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cfe), EConversationDebugInfo::Executing);
                // We've even got our own mine - only the king doesn't see ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_NCINFO_11_02"));
                DC(int64(0x51c1a02622cc9cfe), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cff), EConversationDebugInfo::Executing);
                
                // What do you use it for?
                Hero.AI.Say(LocText("ORG_826_MORDRAG_NCINFO_15_03"));
                DC(int64(0x51c1a02622cc9cff), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d00), EConversationDebugInfo::Executing);
                
                // Well let's just say our mages have been brewin' up a ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_NCINFO_11_04"));
                DC(int64(0x51c1a02622cc9d00), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9d01), EConversationDebugInfo::Executing);
                // Anyway, that's the long and short of it: while Gomez and ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_NCINFO_11_05"));
                DC(int64(0x51c1a02622cc9d01), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg826MordragProblem : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9cf2);
            default Caption = LocText("ORG_826_MORDRAG_PROBLEM_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceOrg826MordragProblem);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x51c1a02622cc9cf3), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9cf4), EConversationDebugInfo::Executing);
                
                // You have a problem.
                Hero.AI.Say(LocText("ORG_826_MORDRAG_PROBLEM_15_00"));
                DC(int64(0x51c1a02622cc9cf4), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cf5), EConversationDebugInfo::Executing);
                
                // I do?
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_PROBLEM_11_01"));
                DC(int64(0x51c1a02622cc9cf5), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cf6), EConversationDebugInfo::Executing);
                
                // Yeah. There's people here who want you out of the camp. 
                Hero.AI.Say(LocText("ORG_826_MORDRAG_PROBLEM_15_02"));
                DC(int64(0x51c1a02622cc9cf6), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cf7), EConversationDebugInfo::Executing);
                
                // Then why don't they send someone to take care of that?
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_PROBLEM_11_03"));
                DC(int64(0x51c1a02622cc9cf7), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cf8), EConversationDebugInfo::Executing);
                
                // That's what I'm doing right now. 
                Hero.AI.Say(LocText("ORG_826_MORDRAG_PROBLEM_15_04"));
                DC(int64(0x51c1a02622cc9cf8), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cf9), EConversationDebugInfo::Executing);
                
                // You? Nah. You're a smart lad. Surely, you got bigger ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_PROBLEM_11_05"));
                DC(int64(0x51c1a02622cc9cf9), EConversationDebugInfo::Done);
                DC(int64(0x51c1a02622cc9cfa), EConversationDebugInfo::Executing);
                // Come to think of it, we could use someone like you over ...
                Mordrag.AI.Say(LocText("ORG_826_MORDRAG_PROBLEM_11_06"));
                DC(int64(0x51c1a02622cc9cfa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg826MordragTrade : UTopic_Hero__OC_ORG_MORDRAG_826
        {
            default DebugId = int64(0x51c1a02622cc9ce5);
            default Caption = LocText("ORG_826_MORDRAG_TRADE_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51c1a02622cc9ce6), EConversationDebugInfo::Executing);
                
                // Show me the goods. 
                Hero.AI.Say(LocText("ORG_826_MORDRAG_TRADE_15_00"));
                DC(int64(0x51c1a02622cc9ce6), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168c4c), Mordrag != nullptr && Mordrag.IsAngryTowards(Hero));
                
                if (Mordrag != nullptr && Mordrag.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168c50), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Mordrag.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_114058_1037"));
                    DC(int64(0x7ec56dc721168c50), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_826_mordrag_trade_exit_1");
                    DC(int64(0x7ec56dc721168c53), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168c53), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168c4e), EConversationDebugInfo::Executing);
                    // Take your pick.
                    Mordrag.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_114045_94"));
                    DC(int64(0x7ec56dc721168c4e), EConversationDebugInfo::Done);
                    DB(int64(0x51c1a02622cc9ce9), G1R.Mordrag_Traded == 0);
                    
                    if (G1R.Mordrag_Traded == 0)
                    {
                        DC(int64(0x6529242ba425b99d), EConversationDebugInfo::Executing);
                        G1R.Mordrag_Traded = 1;
                        DC(int64(0x6529242ba425b99d), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x6529242ba425b999), EConversationDebugInfo::Executing);
                    Mordrag.AI.StartTradingWith(Hero);
                    DC(int64(0x6529242ba425b999), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_826_mordrag_trade_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */