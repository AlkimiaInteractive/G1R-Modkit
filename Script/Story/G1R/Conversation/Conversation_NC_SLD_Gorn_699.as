#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_GORN_699 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_GORN_699";
        }
        
        
        class UTopic_Hero__NC_SLD_GORN_699 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_GORN_699";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorn() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetAM_JUVENILETROLL_01() const property
            {
                return GetCharacter(n"AM_JUVENILETROLL_01");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetShrike() const property
            {
                return GetCharacter(n"NC_ORG_SHRIKE_842");
            }
            
            AGothicCharacterState GetCord() const property
            {
                return GetCharacter(n"NC_SLD_CORD_709");
            }
            
            AGothicCharacterState GetMercenary10() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY10_725");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY17_735() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY17_735");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY18_736() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY18_736");
            }
            
            AGothicCharacterState GetJackal() const property
            {
                return GetCharacter(n"OC_GRD_JACKAL_201");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
        }
        
        
        class UChoiceGorn100001 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xdac37845dba43890);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornLeaveforpost);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64682365a32fa893), EConversationDebugInfo::Executing);
                G1R.Gorn_JoinedForFM = 0;
                DC(int64(0x64682365a32fa893), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa895), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Guardnc);
                DC(int64(0x64682365a32fa895), EConversationDebugInfo::Done);
                DC(int64(0x8e9dbe3a3c4a37ee), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Gorn))) { Gorn.LeavePartyOf(Hero); }
                DC(int64(0x8e9dbe3a3c4a37ee), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba43873), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cord))) { Cord.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Cord_709_Fmtaken); }
                DC(int64(0xdac37845dba43873), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba43875), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY17_735))) { NC_SLD_MERCENARY17_735.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary17_735_Fmtaken); }
                DC(int64(0xdac37845dba43875), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba43877), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY18_736))) { NC_SLD_MERCENARY18_736.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary18_736_Fmtaken); }
                DC(int64(0xdac37845dba43877), EConversationDebugInfo::Done);
                DC(int64(0x3d72a998a4e81766), EConversationDebugInfo::Executing);
                Gorn.RefuseToTalk(10);
                DC(int64(0x3d72a998a4e81766), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76604), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e76604), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorn104381 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xe14c05e090897a50);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGorn104381);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe14c05e090897a53), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0xd47f896dcbb4cd40), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe0777e9560dc845a), EConversationDebugInfo::Executing);
                // Well. Here's someone who looks like he's just fought his ...
                Gorn.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_183159"));
                DC(int64(0xe0777e9560dc845a), EConversationDebugInfo::Done);
                DC(int64(0xe14c05e090897a48), EConversationDebugInfo::Executing);
                
                // The Sleeper Temple is more like it. I might need your ...
                Hero.AI.Say(LocText("TEXT_WIP_VACYRLF_20240725_171905"));
                DC(int64(0xe14c05e090897a48), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc8461), EConversationDebugInfo::Executing);
                // I found this ancient sword, and we can restore its magic ...
                Hero.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_183526"));
                DC(int64(0xe0777e9560dc8461), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc8463), EConversationDebugInfo::Executing);
                // Xardas thinks it's our only chance against the Sleeper. 
                Hero.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_183604"));
                DC(int64(0xe0777e9560dc8463), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc8462), EConversationDebugInfo::Executing);
                
                // ... Come again?
                Gorn.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_183600"));
                DC(int64(0xe0777e9560dc8462), EConversationDebugInfo::Done);
                DC(int64(0xe14c05e090897a70), EConversationDebugInfo::Executing);
                
                // It's a long story. Will you help me get to the pile or ...
                Hero.AI.Say(LocText("TEXT_WIP_VACYRLF_20240725_172001"));
                DC(int64(0xe14c05e090897a70), EConversationDebugInfo::Done);
                DC(int64(0xe14c05e090897a71), EConversationDebugInfo::Executing);
                
                // ... That's a big ask, my friend. A fucking big ask. 
                Gorn.AI.Say(LocText("TEXT_WIP_VACYRLF_20240725_172010"));
                DC(int64(0xe14c05e090897a71), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_GornAgreed);
                Subdialog(
                    UTopic_Gorn_1954666,
                    UTopic_Gorn_1954686
                );
                DC(int64(0xe14c05e090897a8e), EConversationDebugInfo::Executing);
                // Oh, for fuck's sake. All right, I'll help. I'll distract ...
                Gorn.AI.Say(LocText("TEXT_WIP_VACYRLF_20240725_173636"));
                DC(int64(0xe14c05e090897a8e), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc8465), EConversationDebugInfo::Executing);
                // I just have one condition: no killing. If there's any of ...
                Gorn.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_183851"));
                DC(int64(0xe0777e9560dc8465), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc8466), EConversationDebugInfo::Executing);
                
                // Crystal. Thanks, Gorn. 
                Hero.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_183916"));
                DC(int64(0xe0777e9560dc8466), EConversationDebugInfo::Done);
                DC(int64(0xf13c4b467b43556f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Mercenary10))) { Mercenary10.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary10_725_Rest); }
                DC(int64(0xf13c4b467b43556f), EConversationDebugInfo::Done);
                DC(int64(0xf6453bf67b3b755), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN.SucceedQuest();
                DC(int64(0xf6453bf67b3b755), EConversationDebugInfo::Done);
                DC(int64(0xe14c05e090897a72), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe14c05e090897a72), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Gorn_1954666 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x7a4b0b7937ce3561);
            default Caption = LocText("TEXT_WIP_XRDAKHC_20240813_183744");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_1954666);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe0777e9560dc8464), EConversationDebugInfo::Executing);
                // Like I said: it's our only chance against the Sleeper. 
                Hero.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_183744"));
                DC(int64(0xe0777e9560dc8464), EConversationDebugInfo::Done);
                DC(int64(0x7a4b0b7937ce3589), EConversationDebugInfo::Executing);
                
                // (long sigh) You're saying the truth, aren't you?
                Gorn.AI.Say(LocText("TEXT_WIP_KGRCRRE_20240905_015805"));
                DC(int64(0x7a4b0b7937ce3589), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Gorn_1954686 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x7a4b0b7937ce3565);
            default Caption = LocText("TEXT_WIP_KGRCRRE_20240905_013214_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_1954686);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937ce3566), EConversationDebugInfo::Executing);
                
                // Come on, Gorn. This is important.
                Hero.AI.Say(LocText("TEXT_WIP_KGRCRRE_20240905_013214_292"));
                DC(int64(0x7a4b0b7937ce3566), EConversationDebugInfo::Done);
                DC(int64(0x7a4b0b7937ce3582), EConversationDebugInfo::Executing);
                
                // (long sigh) It always is ... 
                Gorn.AI.Say(LocText("TEXT_WIP_KGRCRRE_20240905_014412"));
                DC(int64(0x7a4b0b7937ce3582), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorn147646_0 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa7b4296109582c68);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGorn147646);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ITYFCYK_20240417_111618"), int64(0xa7b4296109582c68));
            default Rules.HideIfKnows(UChoiceGorn147646_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), Gorn != nullptr && Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay));
                    DB(int64(0xc7a8be143f043fac), Hero != nullptr && Hero.IsCloseToCharacter(Gorn, 800.0f));
                    DB(int64(0xb4d34737b4129f47), G1R.FourFriendsFocus.IsValid() && G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20));
                }
                
                if (Gorn != nullptr && !Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Gorn, 800.0f))
                    return false;
                
                if (G1R.FourFriendsFocus.IsValid() && !G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7b4296109582c63), EConversationDebugInfo::Executing);
                // Got that stone to the mages yet? This better be worth it ...
                Gorn.AI.Say(LocText("TEXT_WIP_GVXGRO_20250128_112106_41"));
                DC(int64(0xa7b4296109582c63), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorn147646 : UTopic_Hero__NC_SLD_GORN_699
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorn147646_0);
            default Rules.HideIfKnows(UChoiceGorn147646);
            default DebugId = int64(0xa7b4296109582c68);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4d34737b4129f42), EConversationDebugInfo::Executing);
                G1R.FourFriendsFocus = FInGameTime::Now();
                DC(int64(0xb4d34737b4129f42), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorn77865 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xfc096ab7ee10137e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGorn77865);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_FM_ENTRANCE_GATE2", 500.0f, int64(0xfc096ab7ee10137e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfc096ab7ee101381), G1R.Gorn_JoinedForFM != 0);
                }
                
                return G1R.Gorn_JoinedForFM != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfc096ab7ee10137d), EConversationDebugInfo::Executing);
                // Okay, then, you open the gate. We'll watch your back.
                Gorn.AI.Say(LocText("INFO_GORN_FMGATE_09_03"));
                DC(int64(0xfc096ab7ee10137d), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee101385), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Waitfm);
                DC(int64(0xfc096ab7ee101385), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee101387), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0xfc096ab7ee101387), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee101388), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfc096ab7ee101388), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorn77916 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xfc096ab7ee10138b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorn77865);
            default Rules.HideIfKnows(UChoiceGorn77916);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_FM_ENTRANCE_GATE2", 500.0f, int64(0xfc096ab7ee10138b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfc096ab7ee10138e), G1R != nullptr && G1R.IsDoorOpen(n"MainDoorEntranceFreeMineGate"));
                    DB(int64(0xfc096ab7ee10138f), G1R.Gorn_JoinedForFM != 0);
                }
                
                if (G1R != nullptr && !G1R.IsDoorOpen(n"MainDoorEntranceFreeMineGate"))
                    return false;
                
                if (G1R.Gorn_JoinedForFM == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfc096ab7ee10138a), EConversationDebugInfo::Executing);
                // All right, then. Let's give those bastards a taste of ...
                Gorn.AI.Say(LocText("TEXT_USUARIO_20240202_133552_2238"));
                DC(int64(0xfc096ab7ee10138a), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5b9), EConversationDebugInfo::Executing);
                // Lead on.
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230537"));
                DC(int64(0x86da55731415a5b9), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee101393), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Followtofmc);
                DC(int64(0xfc096ab7ee101393), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee101395), EConversationDebugInfo::Executing);
                Gorn.JoinPartyOf(Hero);
                DC(int64(0xfc096ab7ee101395), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee101396), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfc096ab7ee101396), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorn77984 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xfc096ab7ee101399);
            default Caption = LocText("INFO_GORNFM_FOLLOW_15_01");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorn77916);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfc096ab7ee10139e), Gorn != nullptr && !Gorn.IsInPartyWith(Hero));
                    DB(int64(0x55b89e2ce8503629), G1R.EnteredFreeMine == 0);
                }
                
                if (Gorn != nullptr && Gorn.IsInPartyWith(Hero))
                    return false;
                
                if (G1R.EnteredFreeMine != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfc096ab7ee101397), EConversationDebugInfo::Executing);
                // I need your help. Let's go.
                Hero.AI.Say(LocText("INFO_GORNFM_FOLLOW_15_01"));
                DC(int64(0xfc096ab7ee101397), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee10139c), EConversationDebugInfo::Executing);
                
                // Finally. You go first, I'll cover your back.
                Gorn.AI.Say(LocText("INFO_GORNFM_FOLLOW_09_02"));
                DC(int64(0xfc096ab7ee10139c), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee1013a1), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Followtofmc);
                DC(int64(0xfc096ab7ee1013a1), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee1013a3), EConversationDebugInfo::Executing);
                Gorn.JoinPartyOf(Hero);
                DC(int64(0xfc096ab7ee1013a3), EConversationDebugInfo::Done);
                DC(int64(0x55b89e2ce850362b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x55b89e2ce850362b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorn78022 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xfc096ab7ee1013a6);
            default Caption = LocText("INFO_GORNFM_WAIT_15_01");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorn77916);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfc096ab7ee1013aa), Gorn != nullptr && Gorn.IsInPartyWith(Hero));
                    DB(int64(0x55b89e2ce850362a), G1R.EnteredFreeMine == 0);
                }
                
                if (Gorn != nullptr && !Gorn.IsInPartyWith(Hero))
                    return false;
                
                if (G1R.EnteredFreeMine != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfc096ab7ee1013a4), EConversationDebugInfo::Executing);
                // Stay here for a minute. I'll scout ahead.
                Hero.AI.Say(LocText("INFO_GORNFM_WAIT_15_01"));
                DC(int64(0xfc096ab7ee1013a4), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee1013a5), EConversationDebugInfo::Executing);
                
                // All right, just don't get yourself killed. I'll wait at ...
                Gorn.AI.Say(LocText("INFO_GORNFM_WAIT_09_02"));
                DC(int64(0xfc096ab7ee1013a5), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee1013ac), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Wait);
                DC(int64(0xfc096ab7ee1013ac), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee1013ae), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0xfc096ab7ee1013ae), EConversationDebugInfo::Done);
                DC(int64(0x55b89e2ce8503634), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x55b89e2ce8503634), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorn86248 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xcdcf1295daa95782);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGorn86248);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c881458f), Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN.IsRunning());
                    DB(int64(0x65f4f79c338d27c5), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcdcf1295daa95781), EConversationDebugInfo::Executing);
                // Hm? 
                Gorn.AI.Say(LocText("TEXT_WIP_JYPYEZL_20240321_144729_2238"));
                DC(int64(0xcdcf1295daa95781), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_GORN, Document::UDocumentSegment_Glossary_NC_SLD_GORN_Introduction);
                DB(int64(0x36f542dcf94cee23), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GORN_FIRST_09_00")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GORN_FIRST_09_00")))
                {
                    DC(int64(0x36f542dcf94cee31), EConversationDebugInfo::Executing);
                    // Ain't seen your face before. Freshie?
                    Gorn.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_155053_3436"));
                    DC(int64(0x36f542dcf94cee31), EConversationDebugInfo::Done);
                    DC(int64(0x36f542dcf94cee64), EConversationDebugInfo::Executing);
                    
                    // Yeah. You're Gorn, right?
                    Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_155412"));
                    DC(int64(0x36f542dcf94cee64), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x36f542dcf94cee3a), EConversationDebugInfo::Executing);
                    
                    // You again. What do you want? 
                    Gorn.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_155109_3286"));
                    DC(int64(0x36f542dcf94cee3a), EConversationDebugInfo::Done);
                }
                DC(int64(0xacc1b8ac36111ee6), EConversationDebugInfo::Executing);
                //  Lares said you'd give me a weapon for the raid.
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_135439"));
                DC(int64(0xacc1b8ac36111ee6), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111ee7), EConversationDebugInfo::Executing);
                
                // The raid. So he's going through with it? Think that's a ...
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_135518"));
                DC(int64(0xacc1b8ac36111ee7), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111ee8), EConversationDebugInfo::Executing);
                // What's your kind of steel? 
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_135614"));
                DC(int64(0xacc1b8ac36111ee8), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Gorn_89528,
                    UTopic_Gorn_89548,
                    UTopic_Gorn_89978,
                    UTopic_Gorn_90013
                );
                DC(int64(0xacc1b8ac36111f03), EConversationDebugInfo::Executing);
                // Here you go. Good luck out there.
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_141102"));
                DC(int64(0xacc1b8ac36111f03), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111f04), EConversationDebugInfo::Executing);
                
                // Thanks. 
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_141102_2386"));
                DC(int64(0xacc1b8ac36111f04), EConversationDebugInfo::Done);
                DC(int64(0xdb653d5a3e483358), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN.SucceedQuest();
                DC(int64(0xdb653d5a3e483358), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Gorn_89528 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xacc1b8ac36111eec);
            default Caption = LocText("TEXT_WIP_GGLOWIC_20240322_140358_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_89528);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xacc1b8ac36111eed), EConversationDebugInfo::Executing);
                // Why is the raid a bad idea?
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_140358_2238"));
                DC(int64(0xacc1b8ac36111eed), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111ef4), EConversationDebugInfo::Executing);
                
                // 'Cause things are tense enough with the Reds as it is. 
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_140407"));
                DC(int64(0xacc1b8ac36111ef4), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111ef5), EConversationDebugInfo::Executing);
                // I get it, Lares wants loot, but Gomez has been on the ...
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_140416"));
                DC(int64(0xacc1b8ac36111ef5), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111ef6), EConversationDebugInfo::Executing);
                // But enough of that. What weapon do you want? 
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_140958"));
                DC(int64(0xacc1b8ac36111ef6), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111eef), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xacc1b8ac36111eef), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Gorn_89548 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xacc1b8ac36111ef0);
            default Caption = LocText("TEXT_WIP_GGLOWIC_20240322_140358_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_89548);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xacc1b8ac36111ef1), EConversationDebugInfo::Executing);
                // A mace.
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_140358_2785"));
                DC(int64(0xacc1b8ac36111ef1), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111f05), EConversationDebugInfo::Executing);
                
                // My kind of man. 
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_141159"));
                DC(int64(0xacc1b8ac36111f05), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Gorn.AddItemToInventory(UItMw_1H_Mace_04, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c88145e9), EConversationDebugInfo::Executing);
                Gorn.AI.GiveItemTo(Hero, UItMw_1H_Mace_04, 1);
                DC(int64(0x7e544846c88145e9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Gorn_89978 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xacc1b8ac36111ef7);
            default Caption = LocText("TEXT_WIP_GGLOWIC_20240322_141026_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_89978);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xacc1b8ac36111ef8), EConversationDebugInfo::Executing);
                // A sword.
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_141026_3436"));
                DC(int64(0xacc1b8ac36111ef8), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111f06), EConversationDebugInfo::Executing);
                
                // Not what I'd go with, but sure. 
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_141244"));
                DC(int64(0xacc1b8ac36111f06), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Gorn.AddItemToInventory(UItMw_1H_Sword_02, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c8814609), EConversationDebugInfo::Executing);
                Gorn.AI.GiveItemTo(Hero, UItMw_1H_Sword_02, 1);
                DC(int64(0x7e544846c8814609), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Gorn_90013 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xacc1b8ac36111efb);
            default Caption = LocText("TEXT_WIP_GGLOWIC_20240322_141036_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_90013);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xacc1b8ac36111efc), EConversationDebugInfo::Executing);
                // A bow.
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_141036_3286"));
                DC(int64(0xacc1b8ac36111efc), EConversationDebugInfo::Done);
                DC(int64(0xacc1b8ac36111f07), EConversationDebugInfo::Executing);
                
                // That kind of bastard, eh? Good choice, I guess. 
                Gorn.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_141300"));
                DC(int64(0xacc1b8ac36111f07), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Gorn.AddItemToInventory(UItRw_Bow_Small_03, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x7e544846c881461d), EConversationDebugInfo::Executing);
                Gorn.AI.GiveItemTo(Hero, UItRw_Bow_Small_03, 1);
                DC(int64(0x7e544846c881461d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorn93168 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x50028f2ea692bca0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGorn93168);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x50028f2ea692bcc8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x50028f2ea692bcd9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0x50028f2ea692bda6), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xe5f0d12b37cd609f), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xecfb6fe4d4cbbb9e), EConversationDebugInfo::Executing);
                // Ah, you. How'd that ritual go? The Barrier's still here, ...
                Gorn.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_134230"));
                DC(int64(0xecfb6fe4d4cbbb9e), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbb9f), EConversationDebugInfo::Executing);
                
                // No. The Sleeper isn't what they thought he was. 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_134308"));
                DC(int64(0xecfb6fe4d4cbbb9f), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbba0), EConversationDebugInfo::Executing);
                
                // Meaning, you stuck your head into a minecrawler lair for ...
                Gorn.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_134323"));
                DC(int64(0xecfb6fe4d4cbbba0), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbba4), EConversationDebugInfo::Executing);
                
                // More or less. 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_134718"));
                DC(int64(0xecfb6fe4d4cbbba4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ESCAPEPLANNC, Document::UDocumentSegment_CH3_ESCAPEPLANNC_Gorn);
                DB(int64(0x50028f2ea692bd0d), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YPUISQL_20240425_111753_2083")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YPUISQL_20240425_111753_2083")))
                {
                    DC(int64(0x50028f2ea692bd3a), EConversationDebugInfo::Executing);
                    // Lares said you were looking for me? 
                    Hero.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_140417"));
                    DC(int64(0x50028f2ea692bd3a), EConversationDebugInfo::Done);
                    DC(int64(0x50028f2ea692bd3b), EConversationDebugInfo::Executing);
                    
                    // Right.
                    Gorn.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_140417_2238"));
                    DC(int64(0x50028f2ea692bd3b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x50028f2ea692bd41), EConversationDebugInfo::Executing);
                    // Hm. Anyway, I've been looking for you. 
                    Gorn.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_140420_1924"));
                    DC(int64(0x50028f2ea692bd41), EConversationDebugInfo::Done);
                }
                DC(int64(0x50028f2ea692bd74), EConversationDebugInfo::Executing);
                //  Saturas, the highest Water Mage, wants to see you. 
                Gorn.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_140452"));
                DC(int64(0x50028f2ea692bd74), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbbf1), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_135140"));
                DC(int64(0xecfb6fe4d4cbbbf1), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692bd85), EConversationDebugInfo::Executing);
                
                // Word is they got a job for you. But it's better he tells ...
                Gorn.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_140459"));
                DC(int64(0x50028f2ea692bd85), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbbf8), EConversationDebugInfo::Executing);
                // Here, take this map, and come to this location when ...
                Gorn.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_135211"));
                DC(int64(0xecfb6fe4d4cbbbf8), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbbf9), EConversationDebugInfo::Executing);
                
                // I'll be there. 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_135230"));
                DC(int64(0xecfb6fe4d4cbbbf9), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Gorn.AddItemToInventory(UItWr_Map_Lighthouse, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692bd49), EConversationDebugInfo::Executing);
                G1R.Friends_SendToNC = 1;
                DC(int64(0x50028f2ea692bd49), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692bdda), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC.StartQuest();
                DC(int64(0x50028f2ea692bdda), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c0f1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Diego))) { Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_LightHouse); }
                DC(int64(0x50028f2ea692c0f1), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c0f5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_LightHouse); }
                DC(int64(0x50028f2ea692c0f5), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c0f7), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_LightHouse); }
                DC(int64(0x50028f2ea692c0f7), EConversationDebugInfo::Done);
                DC(int64(0xa9075e981a82a04a), EConversationDebugInfo::Executing);
                Gorn.AI.GiveItemTo(Hero, UItWr_Map_Lighthouse, 1);
                DC(int64(0xa9075e981a82a04a), EConversationDebugInfo::Done);
                DC(int64(0xa326d2a684224bb5), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE.StartQuest();
                DC(int64(0xa326d2a684224bb5), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b555a), EConversationDebugInfo::Executing);
                G1R.LighthouseMeeting();
                DC(int64(0x1a0c7e304e9b555a), EConversationDebugInfo::Done);
                DC(int64(0xb19fe5feff638c1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_Door); }
                DC(int64(0xb19fe5feff638c1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorn97879 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x5334654b0e1b2dc8);
            default Caption = LocText("TEXT_WIP_BXKHAXF_20240521_095222");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGorn97879);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5334654b0e1b2d73), Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0));
                    DB(int64(0x5334654b0e1b2d77), Hero != nullptr && !Hero.HasSaid(LocText("TEXT_WIP_BXKHAXF_20240521_092823")));
                    DB(int64(0x64b188d21af94bf0), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_04, 1, 0))
                    return false;
                
                if (Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_BXKHAXF_20240521_092823")))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && !Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5334654b0e1b2d6b), EConversationDebugInfo::Executing);
                // I found the focus stone.
                Hero.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_095222"));
                DC(int64(0x5334654b0e1b2d6b), EConversationDebugInfo::Done);
                DC(int64(0x5334654b0e1b2d6c), EConversationDebugInfo::Executing);
                
                // Where is it?
                Gorn.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_095222_2238"));
                DC(int64(0x5334654b0e1b2d6c), EConversationDebugInfo::Done);
                DB(int64(0xd8ff4daa1bdabc0e), Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0))
                {
                    
                }
            }
        }
        
        
        class UChoiceGorn98516 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x64b188d21af94be6);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorn97879);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornRuinvictory);
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_1");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5334654b0e1b2d5c), EConversationDebugInfo::Executing);
                // Here.
                Hero.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_092823"));
                DC(int64(0x5334654b0e1b2d5c), EConversationDebugInfo::Done);
                DC(int64(0x5334654b0e1b2d5d), EConversationDebugInfo::Executing);
                
                // Well done. Bring it straight to Saturas - he's gonna be ...
                Gorn.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_092823_41"));
                DC(int64(0x5334654b0e1b2d5d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Gorn_91184,
                    UTopic_Gorn_91204
                );
            }
        }
        
        
        class UTopic_Gorn_91184 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x7668d3ba5f4869fc);
            default Caption = LocText("TEXT_WIP_ITYFCYK_20240417_111905");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_91184);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7668d3ba5f486a1a), EConversationDebugInfo::Executing);
                // I ran into a shadowbeast down there. It felt like it was ...
                Hero.AI.Say(LocText("TEXT_WIP_ITYFCYK_20240417_111905"));
                DC(int64(0x7668d3ba5f486a1a), EConversationDebugInfo::Done);
                DC(int64(0x7668d3ba5f486a0a), EConversationDebugInfo::Executing);
                
                // Really? Hm. Maybe they get attracted by magic ... ah, ...
                Gorn.AI.Say(LocText("TEXT_WIP_ITYFCYK_20240417_111444"));
                DC(int64(0x7668d3ba5f486a0a), EConversationDebugInfo::Done);
                DC(int64(0x7668d3ba5f4869ff), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7668d3ba5f4869ff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Gorn_91204 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x7668d3ba5f486a00);
            default Caption = LocText("TEXT_WIP_ITYFCYK_20240417_110744_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_91204);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7668d3ba5f486a01), EConversationDebugInfo::Executing);
                // Are you coming back with me?
                Hero.AI.Say(LocText("TEXT_WIP_ITYFCYK_20240417_110744_2238"));
                DC(int64(0x7668d3ba5f486a01), EConversationDebugInfo::Done);
                DC(int64(0x7668d3ba5f486a0b), EConversationDebugInfo::Executing);
                
                // Nah, I think I'll stay here for a bit. There's ... ...
                Gorn.AI.Say(LocText("TEXT_WIP_ITYFCYK_20240417_111547"));
                DC(int64(0x7668d3ba5f486a0b), EConversationDebugInfo::Done);
                DC(int64(0x7668d3ba5f486a0c), EConversationDebugInfo::Executing);
                // Anyway, pleasure hunting with you. I'll see you around.
                Gorn.AI.Say(LocText("TEXT_WIP_ITYFCYK_20240417_111618"));
                DC(int64(0x7668d3ba5f486a0c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_GORN, Document::UDocumentSegment_Glossary_NC_SLD_GORN_Monastery);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_GornStay);
                DC(int64(0x64682365a32fa944), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay);
                DC(int64(0x64682365a32fa944), EConversationDebugInfo::Done);
                DC(int64(0x62647774bd17b0ab), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0x62647774bd17b0ab), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e687c0), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT.SucceedQuest();
                DC(int64(0x273e200a45e687c0), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b571e), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b571e), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76585), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e76585), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornAfterfm : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76629);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGornAfterfm);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x55b89e2ce850363d), G1R.Freemine_Recovered != 0);
                    DB(int64(0x73203ead319a99bb), G1R != nullptr && G1R.IsInChapter(4));
                }
                
                if (G1R.Freemine_Recovered == 0)
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e7662c), EConversationDebugInfo::Executing);
                // I ... I think that was all of them. Godsdammit, I ...
                Gorn.AI.Say(LocText("INFO_GORN_AFTERFM_09_01"));
                DC(int64(0xa09d6bcc2e7662c), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5ba), EConversationDebugInfo::Executing);
                // Tenacious bastards ...
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230619"));
                DC(int64(0x86da55731415a5ba), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7662e), EConversationDebugInfo::Executing);
                
                // It's over now. The mine's ours. 
                Hero.AI.Say(LocText("INFO_GORN_AFTERFM_15_03"));
                DC(int64(0xa09d6bcc2e7662e), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7662f), EConversationDebugInfo::Executing);
                
                // For now. Without a supply of ore, Gomez won't be running ...
                Gorn.AI.Say(LocText("INFO_GORN_AFTERFM_09_04"));
                DC(int64(0xa09d6bcc2e7662f), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5bb), EConversationDebugInfo::Executing);
                // He knows that, too ... and he'll do everything in his ...
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230736"));
                DC(int64(0x86da55731415a5bb), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5bc), EConversationDebugInfo::Executing);
                
                // You think he'll attack again?
                Hero.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230810"));
                DC(int64(0x86da55731415a5bc), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5bd), EConversationDebugInfo::Executing);
                
                // Rabid dogs bite until you put them down. Anyway - I'll ...
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230844"));
                DC(int64(0x86da55731415a5bd), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5be), EConversationDebugInfo::Executing);
                // You got business to do, don't you? Please, tell me that ...
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230919"));
                DC(int64(0x86da55731415a5be), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5bf), EConversationDebugInfo::Executing);
                
                // It's complicated.
                Hero.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230938"));
                DC(int64(0x86da55731415a5bf), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5c0), EConversationDebugInfo::Executing);
                
                // Ain't it always. All right, then. Good job down here - ...
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230943"));
                DC(int64(0x86da55731415a5c0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_GORN, Document::UDocumentSegment_Glossary_NC_SLD_GORN_WaitFreeMine);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_RECOVERFREEMINE, Document::UDocumentSegment_CH4_RECOVERFREEMINE_Recovered);
                DC(int64(0x64682365a32fa7b9), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_WaitMine);
                DC(int64(0x64682365a32fa7b9), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa7d5), EConversationDebugInfo::Executing);
                G1R.EnteredFreeMine = 1;
                DC(int64(0x64682365a32fa7d5), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa7d7), EConversationDebugInfo::Executing);
                G1R.Lee_freeminereport = 1;
                DC(int64(0x64682365a32fa7d7), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee1013b0), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0xfc096ab7ee1013b0), EConversationDebugInfo::Done);
                DC(int64(0x2a9130fe43128791), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER.SucceedQuest();
                DC(int64(0x2a9130fe43128791), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5724), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5724), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76640), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e76640), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornBecomesld : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e764e5);
            default Caption = LocText("DIA_GORN_BECOMESLD_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornFirst);
            default Rules.HideIfKnows(UChoiceGornBecomesld);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e764e6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e764e7), EConversationDebugInfo::Executing);
                // How do I join the New Camp?
                Hero.AI.Say(LocText("DIA_GORN_BECOMESLD_15_00"));
                DC(int64(0xa09d6bcc2e764e7), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764e8), EConversationDebugInfo::Executing);
                
                // If by that you mean joining us mercs, you'll have to be ...
                Gorn.AI.Say(LocText("DIA_GORN_BECOMESLD_09_01"));
                DC(int64(0xa09d6bcc2e764e8), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764e9), EConversationDebugInfo::Executing);
                // Not to mention you have to know your way around the ...
                Gorn.AI.Say(LocText("DIA_GORN_BECOMESLD_09_02"));
                DC(int64(0xa09d6bcc2e764e9), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764ea), EConversationDebugInfo::Executing);
                // To say it plainly, no chance in the world Lee would sign ...
                Gorn.AI.Say(LocText("DIA_GORN_BECOMESLD_09_03"));
                DC(int64(0xa09d6bcc2e764ea), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornCronos : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76507);
            default Caption = LocText("INFO_GORN_CRONOS_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornMages);
            default Rules.HideIfKnows(UChoiceGornCronos);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76508), Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC != nullptr && Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC != nullptr && Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76509), EConversationDebugInfo::Executing);
                
                // Where do I find this "Keeper of Ore?" 
                Hero.AI.Say(LocText("INFO_GORN_CRONOS_15_01"));
                DC(int64(0xa09d6bcc2e76509), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7650a), EConversationDebugInfo::Executing);
                
                // In the cave, right above the pile. 
                Gorn.AI.Say(LocText("INFO_GORN_CRONOS_09_01A"));
                DC(int64(0xa09d6bcc2e7650a), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7650b), EConversationDebugInfo::Executing);
                // He's a bit arrogant, though. 
                Gorn.AI.Say(LocText("INFO_GORN_CRONOS_09_02"));
                DC(int64(0xa09d6bcc2e7650b), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7650c), EConversationDebugInfo::Executing);
                // You're gonna have to convince him you're not wasting his ...
                Gorn.AI.Say(LocText("INFO_GORN_CRONOS_09_03"));
                DC(int64(0xa09d6bcc2e7650c), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa7e7), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Start);
                DC(int64(0x64682365a32fa7e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornExit : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e764c6);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xa09d6bcc2e764c8), Gorn != nullptr && Gorn.IsInPartyWith(Hero));
                
                if (Gorn != nullptr && Gorn.IsInPartyWith(Hero))
                {
                    DC(int64(0xa09d6bcc2e764c9), EConversationDebugInfo::Executing);
                    // Let's fight.
                    Gorn.AI.Say(LocText("INFO_GORN_EXIT_09_01"));
                    DC(int64(0xa09d6bcc2e764c9), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa09d6bcc2e764ca), EConversationDebugInfo::Executing);
                    // Be seeing you. 
                    Gorn.AI.Say(LocText("INFO_GORN_EXIT_09_02"));
                    DC(int64(0xa09d6bcc2e764ca), EConversationDebugInfo::Done);
                }
                DC(int64(0xa09d6bcc2e764cb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e764cb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornFirst : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e764cc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGornFirst);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_JYPYEZL_20240321_144729_2238"), int64(0xa09d6bcc2e764cc));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e764cd), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x7336f5aad0cb33f0), Gorn != nullptr && Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Start));
                    DB(int64(0x65f4f79c338d2826), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Gorn != nullptr && !Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Start))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e764ce), EConversationDebugInfo::Executing);
                // Hey. A new face.
                Gorn.AI.Say(LocText("DIA_GORN_FIRST_09_00"));
                DC(int64(0xa09d6bcc2e764ce), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764cf), EConversationDebugInfo::Executing);
                
                // Who are you?
                Hero.AI.Say(LocText("DIA_GORN_FIRST_15_01"));
                DC(int64(0xa09d6bcc2e764cf), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764d0), EConversationDebugInfo::Executing);
                
                // Gorn. Mercenary of the mages. 
                Gorn.AI.Say(LocText("DIA_GORN_FIRST_09_02"));
                DC(int64(0xa09d6bcc2e764d0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_GORN, Document::UDocumentSegment_Glossary_NC_SLD_GORN_Introduction);
            }
        }
        
        
        class UChoiceGornFmcentrance : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76616);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGornFmcentrance);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76617), G1R.Gorn_JoinedForFM != 0);
                    DB(int64(0xa09d6bcc2e76618), G1R.Gorn_AloneForFM != 0);
                }
                
                if (G1R.Gorn_JoinedForFM == 0)
                    return false;
                
                if (G1R.Gorn_AloneForFM == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e7661a), EConversationDebugInfo::Executing);
                // Fuck ... they didn't take any prisoners. 
                Gorn.AI.Say(LocText("INFO_GORN_FMCENTRANCE_09_01"));
                DC(int64(0xa09d6bcc2e7661a), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5b7), EConversationDebugInfo::Executing);
                
                // You knew these guys?
                Hero.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230200"));
                DC(int64(0x86da55731415a5b7), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5b8), EConversationDebugInfo::Executing);
                
                // Some. Anyway, we shouldn't go down there without cover. 
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_230217"));
                DC(int64(0x86da55731415a5b8), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7661b), EConversationDebugInfo::Executing);
                // Guys - you stay up here and make sure there won't be any ...
                Gorn.AI.Say(LocText("INFO_GORN_FMCENTRANCE_09_02"));
                DC(int64(0xa09d6bcc2e7661b), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7661c), EConversationDebugInfo::Executing);
                // Lead the way. We'll make them pay for this.
                Gorn.AI.Say(LocText("INFO_GORN_FMCENTRANCE_09_03"));
                DC(int64(0xa09d6bcc2e7661c), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa828), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cord))) { Cord.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Cord_709_Fmtaken2); }
                DC(int64(0x64682365a32fa828), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba438a3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY17_735))) { NC_SLD_MERCENARY17_735.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary17_735_Fmtaken2); }
                DC(int64(0xdac37845dba438a3), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba438a5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY18_736))) { NC_SLD_MERCENARY18_736.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary18_736_Fmtaken2); }
                DC(int64(0xdac37845dba438a5), EConversationDebugInfo::Done);
                DC(int64(0x611c6ace772f7c07), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cord))) { Cord.RemoveImmortality(); }
                DC(int64(0x611c6ace772f7c07), EConversationDebugInfo::Done);
                DC(int64(0x611c6ace772f7c09), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY17_735))) { NC_SLD_MERCENARY17_735.RemoveImmortality(); }
                DC(int64(0x611c6ace772f7c09), EConversationDebugInfo::Done);
                DC(int64(0x611c6ace772f7c0b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY18_736))) { NC_SLD_MERCENARY18_736.RemoveImmortality(); }
                DC(int64(0x611c6ace772f7c0b), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7661e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e7661e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornFmgate_0 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e7661f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceGornFmgate);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_FM_ENTRANCE_GATE", 1000.0f, int64(0xa09d6bcc2e7661f));
            default Rules.HideIfKnows(UChoiceGornFmgate_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdac37845dba438df), Jackal != nullptr && Jackal.IsEveryoneOfThisKindDead());
                }
                
                return Jackal != nullptr && Jackal.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76624), EConversationDebugInfo::Executing);
                // What a fight. You knew that guy?
                Gorn.AI.Say(LocText("INFO_GORN_FMGATE_09_01"));
                DC(int64(0xa09d6bcc2e76624), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornFmgate : UTopic_Hero__NC_SLD_GORN_699
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornFmgate_0);
            default Rules.HideIfKnows(UChoiceGornFmgate);
            default DebugId = int64(0xa09d6bcc2e7661f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76625), EConversationDebugInfo::Executing);
                
                // Not anymore.
                Hero.AI.Say(LocText("INFO_GORN_FMGATE_15_02"));
                DC(int64(0xa09d6bcc2e76625), EConversationDebugInfo::Done);
                DC(int64(0xfc096ab7ee101383), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfc096ab7ee101383), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornFmwatch : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76641);
            default Caption = LocText("INFO_GORN_FMWATCH_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornAfterfm);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6b0b27c1e9acb4b), G1R != nullptr && G1R.IsInChapter(4));
                }
                
                return G1R != nullptr && G1R.IsInChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76642), EConversationDebugInfo::Executing);
                // How's the situation?
                Hero.AI.Say(LocText("INFO_GORN_FMWATCH_15_01"));
                DC(int64(0xa09d6bcc2e76642), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76643), EConversationDebugInfo::Executing);
                
                // All good so far. Seems we really got them all.
                Gorn.AI.Say(LocText("INFO_GORN_FMWATCH_09_02"));
                DC(int64(0xa09d6bcc2e76643), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76644), EConversationDebugInfo::Executing);
                // Still, Lee is sending some reinforcements. 
                Gorn.AI.Say(LocText("INFO_GORN_FMWATCH_09_03"));
                DC(int64(0xa09d6bcc2e76644), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76645), EConversationDebugInfo::Executing);
                // I'm getting too old for this shit ... 
                Gorn.AI.Say(LocText("INFO_GORN_FMWATCH_09_04"));
                DC(int64(0xa09d6bcc2e76645), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornFoundulumulu : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76646);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGornFoundulumulu);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76647), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0x3430be7100e9bf1b), Quest::ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE.HasSucceeded());
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76649), EConversationDebugInfo::Executing);
                // By Beliar's Ass. What is THAT?
                Gorn.AI.Say(LocText("INFO_GORN_FOUNDULUMULU_09_01"));
                DC(int64(0xa09d6bcc2e76649), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5c1), EConversationDebugInfo::Executing);
                
                // An Ulu-Mulu.
                Hero.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_231053"));
                DC(int64(0x86da55731415a5c1), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7664a), EConversationDebugInfo::Executing);
                
                // Is that a word or are you just making up sounds? 
                Gorn.AI.Say(LocText("INFO_GORN_FOUNDULUMULU_09_02"));
                DC(int64(0xa09d6bcc2e7664a), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7664b), EConversationDebugInfo::Executing);
                
                // It's a banner ... it proves my skill as a warrior to the ...
                Hero.AI.Say(LocText("INFO_GORN_FOUNDULUMULU_15_03"));
                DC(int64(0xa09d6bcc2e7664b), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a5c2), EConversationDebugInfo::Executing);
                
                // Enter the - did you smoke your brains out, or what? ...
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_231143"));
                DC(int64(0x86da55731415a5c2), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7664c), EConversationDebugInfo::Executing);
                // So long as this helps to get us out of here, I don't ...
                Gorn.AI.Say(LocText("INFO_GORN_FOUNDULUMULU_09_04"));
                DC(int64(0xa09d6bcc2e7664c), EConversationDebugInfo::Done);
                DC(int64(0x244fe8de2651fc48), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x244fe8de2651fc48), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornFreemine : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76592);
            default Caption = LocText("INFO_GORN_FREEMINE_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGornFreemine);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_SATURAS_MURDER_14_05"), int64(0xa09d6bcc2e76592));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76593), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76594), EConversationDebugInfo::Executing);
                // What exactly happened in the mine?
                Hero.AI.Say(LocText("INFO_GORN_FREEMINE_15_01"));
                DC(int64(0xa09d6bcc2e76594), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76595), EConversationDebugInfo::Executing);
                
                // I don't know all of it. I was just on my way back from ...
                Gorn.AI.Say(LocText("INFO_GORN_FREEMINE_09_02"));
                DC(int64(0xa09d6bcc2e76595), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76596), EConversationDebugInfo::Executing);
                // When I got there, everyone was already dead, and the ...
                Gorn.AI.Say(LocText("INFO_GORN_FREEMINE_09_03"));
                DC(int64(0xa09d6bcc2e76596), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76598), EConversationDebugInfo::Executing);
                
                // They took them by surprise. 
                Hero.AI.Say(LocText("INFO_GORN_FREEMINE_15_05"));
                DC(int64(0xa09d6bcc2e76598), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76599), EConversationDebugInfo::Executing);
                
                // Yeah. That damned mountain pass.
                Gorn.AI.Say(LocText("INFO_GORN_FREEMINE_09_06"));
                DC(int64(0xa09d6bcc2e76599), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7659a), EConversationDebugInfo::Executing);
                // It's a fucking mess. 
                Gorn.AI.Say(LocText("INFO_GORN_FREEMINE_09_07"));
                DC(int64(0xa09d6bcc2e7659a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_GORN, Document::UDocumentSegment_Glossary_NC_SLD_GORN_FreeMine);
            }
        }
        
        
        class UChoiceGornGuardnc : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e7659b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGornGuardnc);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_SATURAS_MURDER_14_05"), int64(0xa09d6bcc2e7659b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe449908c8b4f4d85), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x86da55731415a5b6), EConversationDebugInfo::Executing);
                // Ain't you a sight for sore eyes. 
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_225636"));
                DC(int64(0x86da55731415a5b6), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7659c), EConversationDebugInfo::Executing);
                
                // Heard about the mine ... what are your plans now?
                Hero.AI.Say(LocText("INFO_GORN_GUARDNC_15_01"));
                DC(int64(0xa09d6bcc2e7659c), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7659d), EConversationDebugInfo::Executing);
                
                // For now? We hang back. We lost a lot of men, and we need ...
                Gorn.AI.Say(LocText("INFO_GORN_GUARDNC_09_02"));
                DC(int64(0xa09d6bcc2e7659d), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7659f), EConversationDebugInfo::Executing);
                
                // You're planning to retake it, though?
                Hero.AI.Say(LocText("INFO_GORN_GUARDNC_15_04"));
                DC(int64(0xa09d6bcc2e7659f), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765a0), EConversationDebugInfo::Executing);
                
                // What do you think? Of course. But not just yet. 
                Gorn.AI.Say(LocText("INFO_GORN_GUARDNC_09_05"));
                DC(int64(0xa09d6bcc2e765a0), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765a1), EConversationDebugInfo::Executing);
                // Anyway, shouldn't you be talking to Saturas? If you need ...
                Gorn.AI.Say(LocText("INFO_GORN_GUARDNC_09_06"));
                DC(int64(0xa09d6bcc2e765a1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_GORN, Document::UDocumentSegment_Glossary_NC_SLD_GORN_FreeMine);
                DC(int64(0xa09d6bcc2e765a6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e765a6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornGuardncrunning : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e765a7);
            default Caption = LocText("INFO_GORN_GUARDNCRUNNING_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornGuardnc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e765a8), G1R.UrShak_SpokeOfUluMulu == 0);
                }
                
                return G1R.UrShak_SpokeOfUluMulu == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765a9), EConversationDebugInfo::Executing);
                // What's the status?
                Hero.AI.Say(LocText("INFO_GORN_GUARDNCRUNNING_15_01"));
                DC(int64(0xa09d6bcc2e765a9), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765aa), EConversationDebugInfo::Executing);
                
                // All quiet. Looks like they've holed up in the mine. 
                Gorn.AI.Say(LocText("INFO_GORN_GUARDNCRUNNING_09_02"));
                DC(int64(0xa09d6bcc2e765aa), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765ab), EConversationDebugInfo::Executing);
                // Here's hoping Lee will come up with a plan soon.
                Gorn.AI.Say(LocText("INFO_GORN_GUARDNCRUNNING_09_03"));
                DC(int64(0xa09d6bcc2e765ab), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornHut : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e764d6);
            default Caption = LocText("TEXT_CHOICE_GORN_HUT");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorn86248);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornFirst);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornLeben);
            default Rules.HideIfKnows(UChoiceGornHut);
            
            default Rules.RequireCharacterCloseToWaypoint(n"NC_SLD_GORN_699", n"FP_NC_GUARD_46", 8000.0f, int64(0xa09d6bcc2e764d6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e764d7), Quest::NewCamp_NCCHAPTER1_SHRIKESHUT != nullptr && !Quest::NewCamp_NCCHAPTER1_SHRIKESHUT.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_SHRIKESHUT != nullptr && !Quest::NewCamp_NCCHAPTER1_SHRIKESHUT.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e764d8), EConversationDebugInfo::Executing);
                
                // Where can I sleep around here?
                Hero.AI.Say(LocText("DIA_GORN_HUT_15_00"));
                DC(int64(0xa09d6bcc2e764d8), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764d9), EConversationDebugInfo::Executing);
                
                // Well, the huts are all taken. But you could go and take ...
                Gorn.AI.Say(LocText("DIA_GORN_HUT_09_01"));
                DC(int64(0xa09d6bcc2e764d9), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764da), EConversationDebugInfo::Executing);
                // He's a bandit, who just claimed the hut by the edge of ...
                Gorn.AI.Say(LocText("DIA_GORN_HUT_09_02"));
                DC(int64(0xa09d6bcc2e764da), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764db), EConversationDebugInfo::Executing);
                
                // Who's "us"?
                Hero.AI.Say(LocText("DIA_GORN_HUT_15_03"));
                DC(int64(0xa09d6bcc2e764db), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764dc), EConversationDebugInfo::Executing);
                
                // The mercenaries. Mercs and bandits don't share the same ...
                Gorn.AI.Say(LocText("DIA_GORN_HUT_09_04"));
                DC(int64(0xa09d6bcc2e764dc), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764dd), EConversationDebugInfo::Executing);
                // Teach Shrike a lesson, and you can have that hut for ...
                Gorn.AI.Say(LocText("DIA_GORN_HUT_09_05"));
                DC(int64(0xa09d6bcc2e764dd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SHRIKESHUT, Document::UDocumentSegment_CH1_SHRIKESHUT_Start);
                DC(int64(0x64682365a32fa86b), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SHRIKESHUT.StartQuest();
                DC(int64(0x64682365a32fa86b), EConversationDebugInfo::Done);
                DC(int64(0xdb653d5a3e4834a0), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE.StartQuest();
                DC(int64(0xdb653d5a3e4834a0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornHutfree : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e764df);
            default Caption = LocText("DIA_GORN_HUTFREE_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceGornHutfree);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e764e0), Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_REPORT != nullptr && Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_REPORT.IsRunning());
                    DB(int64(0xdf3fc084a70e16e2), Shrike != nullptr && Shrike.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Shrike_842_AfterFight));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_REPORT != nullptr && !Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_REPORT.IsRunning())
                    return false;
                
                if (Shrike != nullptr && !Shrike.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Shrike_842_AfterFight))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e764e1), EConversationDebugInfo::Executing);
                // Shrike "relocated" to another hut.
                Hero.AI.Say(LocText("DIA_GORN_HUTFREE_15_00"));
                DC(int64(0xa09d6bcc2e764e1), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764e2), EConversationDebugInfo::Executing);
                
                // Good. Torlof just told me he'd give that guy a good ...
                Gorn.AI.Say(LocText("DIA_GORN_HUTFREE_09_01"));
                DC(int64(0xa09d6bcc2e764e2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SHRIKESHUT, Document::UDocumentSegment_CH1_SHRIKESHUT_End);
                DC(int64(0x64682365a32fa875), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_REPORT.SucceedQuest();
                DC(int64(0x64682365a32fa875), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornLeaveforpost : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e765f8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e765f9), G1R.Gorn_JoinedForFM != 0);
                    DB(int64(0xa09d6bcc2e765fa), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_GORN_BACK", 1000.0f));
                    DB(int64(0xa09d6bcc2e765fb), Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE != nullptr && !Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE.HasSucceeded());
                    DB(int64(0x44e9931de03699d8), G1R.Gorn_JoinedForFM != 0);
                    DB(int64(0x44e9931de03699df), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_GORN_BACK2", 1000.0f));
                    DB(int64(0x44e9931de03699e0), Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE != nullptr && !Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE.HasSucceeded());
                }
                
                if (G1R.Gorn_JoinedForFM != 0 && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_GORN_BACK", 1000.0f) && Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE != nullptr && !Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE.HasSucceeded())
                    return true;
                
                if (G1R.Gorn_JoinedForFM != 0 && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_GORN_BACK2", 1000.0f) && Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE != nullptr && !Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xa09d6bcc2e765fe), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_WOLF_SPEAK_15_01")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_WOLF_SPEAK_15_01")))
                {
                    DB(int64(0x86c0ae18e38ab4d0), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_GORN_BACK", 1500.0f));
                    
                    if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_GORN_BACK", 1500.0f))
                    {
                        DC(int64(0xa09d6bcc2e765ff), EConversationDebugInfo::Executing);
                        // You're gonna talk to Wolf? All right. 
                        Gorn.AI.Say(LocText("INFO_GORN_LEAVEFORPOST_09_01"));
                        DC(int64(0xa09d6bcc2e765ff), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa09d6bcc2e76600), EConversationDebugInfo::Executing);
                        // Wrong way, friend. We gotta go to the mine.
                        Gorn.AI.Say(LocText("INFO_GORN_LEAVEFORPOST_09_02"));
                        DC(int64(0xa09d6bcc2e76600), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xa09d6bcc2e76601), EConversationDebugInfo::Executing);
                    // I'll wait here. But don't take too long. 
                    Gorn.AI.Say(LocText("INFO_GORN_LEAVEFORPOST_09_03"));
                    DC(int64(0xa09d6bcc2e76601), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorn_leaveforpost_exit_1");
                }
                else
                {
                    DC(int64(0xa09d6bcc2e76600), EConversationDebugInfo::Executing);
                    // Wrong way, friend. We gotta go to the mine.
                    Gorn.AI.Say(LocText("INFO_GORN_LEAVEFORPOST_09_02"));
                    DC(int64(0xa09d6bcc2e76600), EConversationDebugInfo::Done);
                    DC(int64(0xa09d6bcc2e76601), EConversationDebugInfo::Executing);
                    // I'll wait here. But don't take too long. 
                    Gorn.AI.Say(LocText("INFO_GORN_LEAVEFORPOST_09_03"));
                    DC(int64(0xa09d6bcc2e76601), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorn_leaveforpost_exit_2");
                }
            }
        }
        
        
        class UChoiceGornLeben : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e764d1);
            default Caption = LocText("DIA_GORN_LEBEN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorn86248);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornFirst);
            default Rules.HideIfKnows(UChoiceGornLeben);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e764d2), EConversationDebugInfo::Executing);
                // "Mercenary of the Mages?"
                Hero.AI.Say(LocText("DIA_GORN_LEBEN_15_00"));
                DC(int64(0xa09d6bcc2e764d2), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764d3), EConversationDebugInfo::Executing);
                
                // Yeah. We protect the diggers in the New Mine, and the ...
                Gorn.AI.Say(LocText("DIA_GORN_LEBEN_09_01"));
                DC(int64(0xa09d6bcc2e764d3), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764d4), EConversationDebugInfo::Executing);
                // You might have heard of our commander - Lee. He's a ...
                Gorn.AI.Say(LocText("DIA_GORN_LEBEN_09_02"));
                DC(int64(0xa09d6bcc2e764d4), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764d5), EConversationDebugInfo::Executing);
                // That's us. 
                Gorn.AI.Say(LocText("DIA_GORN_LEBEN_09_03"));
                DC(int64(0xa09d6bcc2e764d5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornMages : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76501);
            default Caption = LocText("INFO_GORN_MAGES_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornNcwait);
            default Rules.HideIfKnows(UChoiceGornMages);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76502), EConversationDebugInfo::Executing);
                
                // I have a message for the Water Mages. Any idea who I ...
                Hero.AI.Say(LocText("INFO_GORN_MAGES_15_01"));
                DC(int64(0xa09d6bcc2e76502), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76503), EConversationDebugInfo::Executing);
                
                // Hmm ... probably Saturas. He's more or less their ...
                Gorn.AI.Say(LocText("INFO_GORN_MAGES_09_02"));
                DC(int64(0xa09d6bcc2e76503), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76504), EConversationDebugInfo::Executing);
                // Problem is, the guards won't let you through, even if ...
                Gorn.AI.Say(LocText("INFO_GORN_MAGES_09_03"));
                DC(int64(0xa09d6bcc2e76504), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76505), EConversationDebugInfo::Executing);
                
                // Could you put in a good word for me?
                Hero.AI.Say(LocText("INFO_GORN_MAGES_15_04"));
                DC(int64(0xa09d6bcc2e76505), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76506), EConversationDebugInfo::Executing);
                
                // Me? I'm just a regular mercenary. Cronos, the keeper of ...
                Gorn.AI.Say(LocText("INFO_GORN_MAGES_09_05"));
                DC(int64(0xa09d6bcc2e76506), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornMyway : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e765d8);
            default Caption = LocText("INFO_GORN_MYWAY_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornTakeback);
            default Rules.HideIfKnows(UChoiceGornMyway);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e765d9), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765da), EConversationDebugInfo::Executing);
                
                // Why not. I have business in the mine anyway.
                Hero.AI.Say(LocText("INFO_GORN_MYWAY_15_01"));
                DC(int64(0xa09d6bcc2e765da), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765db), EConversationDebugInfo::Executing);
                
                // Related to that demon summoner, I guess? You know what, ...
                Gorn.AI.Say(LocText("INFO_GORN_MYWAY_09_02"));
                DC(int64(0xa09d6bcc2e765db), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765dc), EConversationDebugInfo::Executing);
                // Here, take this key. It opens the gatehouse in front of ...
                Gorn.AI.Say(LocText("INFO_GORN_MYWAY_09_03"));
                DC(int64(0xa09d6bcc2e765dc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_RECOVERFREEMINE, Document::UDocumentSegment_CH4_RECOVERFREEMINE_Start);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Gorn.AddItemToInventory(UItKe_Freemine, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa887), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Followtofmc);
                DC(int64(0x64682365a32fa887), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa88b), EConversationDebugInfo::Executing);
                G1R.Gorn_JoinedForFM = 1;
                DC(int64(0x64682365a32fa88b), EConversationDebugInfo::Done);
                DC(int64(0x8e9dbe3a3c4a37e8), EConversationDebugInfo::Executing);
                Hero.JoinPartyOf(Gorn);
                DC(int64(0x8e9dbe3a3c4a37e8), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba43867), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cord))) { Cord.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Cord_709_Follow); }
                DC(int64(0xdac37845dba43867), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba43869), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY17_735))) { NC_SLD_MERCENARY17_735.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary17_735_Follow); }
                DC(int64(0xdac37845dba43869), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba4386b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY18_736))) { NC_SLD_MERCENARY18_736.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary18_736_Follow); }
                DC(int64(0xdac37845dba4386b), EConversationDebugInfo::Done);
                DC(int64(0x716285043bea32cd), EConversationDebugInfo::Executing);
                Gorn.AI.GiveItemTo(Hero, UItKe_Freemine, 1);
                DC(int64(0x716285043bea32cd), EConversationDebugInfo::Done);
                DC(int64(0x2a9130fe4312868f), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE.StartQuest();
                DC(int64(0x2a9130fe4312868f), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5720), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5720), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornNcwait : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e764fb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGornNcwait);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"NC_PATH52", 1000.0f, int64(0xa09d6bcc2e764fb));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e764fe), EConversationDebugInfo::Executing);
                // Ahh, it's you - my friend Lester from the Swamp Camp ...
                Gorn.AI.Say(LocText("INFO_GORN_NCWAIT_09_01"));
                DC(int64(0xa09d6bcc2e764fe), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e764ff), EConversationDebugInfo::Executing);
                // I gotta say, for a green blood, you've become quite the ...
                Gorn.AI.Say(LocText("INFO_GORN_NCWAIT_09_02"));
                DC(int64(0xa09d6bcc2e764ff), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76500), EConversationDebugInfo::Executing);
                
                // Honestly, I'm just glad I haven't become fodder for the ...
                Hero.AI.Say(LocText("INFO_GORN_NCWAIT_15_03"));
                DC(int64(0xa09d6bcc2e76500), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornPost : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e765ac);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGornPost);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e765ad), G1R.UrShak_SpokeOfUluMulu != 0);
                }
                
                return G1R.UrShak_SpokeOfUluMulu != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765af), EConversationDebugInfo::Executing);
                
                // Just in time. We're getting ready to take back the mine.
                Gorn.AI.Say(LocText("INFO_GORN_POST_09_01"));
                DC(int64(0xa09d6bcc2e765af), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765b0), EConversationDebugInfo::Executing);
                // Can we count on you?
                Gorn.AI.Say(LocText("INFO_GORN_POST_09_02"));
                DC(int64(0xa09d6bcc2e765b0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornRejoinforfm : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76605);
            default Caption = LocText("INFO_GORN_REJOINFORFM_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornMyway);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_NC_GORN_GUARD", 1000.0f, int64(0xa09d6bcc2e76605));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_GORN_FMCENTRANCE_09_01"), int64(0xa09d6bcc2e76605));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921e899f1d838866), Gorn != nullptr && Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Guardnc));
                }
                
                return Gorn != nullptr && Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Guardnc);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76608), EConversationDebugInfo::Executing);
                
                // Let's take care of that mine.
                Hero.AI.Say(LocText("INFO_GORN_REJOINFORFM_15_01"));
                DC(int64(0xa09d6bcc2e76608), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76609), EConversationDebugInfo::Executing);
                
                // Let's.
                Gorn.AI.Say(LocText("INFO_GORN_REJOINFORFM_09_02"));
                DC(int64(0xa09d6bcc2e76609), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7660a), EConversationDebugInfo::Executing);
                // You lead the way - I'll cover your back. 
                Gorn.AI.Say(LocText("INFO_GORN_REJOINFORFM_09_03"));
                DC(int64(0xa09d6bcc2e7660a), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa8da), EConversationDebugInfo::Executing);
                G1R.Gorn_JoinedForFM = 1;
                DC(int64(0x64682365a32fa8da), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa8dc), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Followtofmc);
                DC(int64(0x64682365a32fa8dc), EConversationDebugInfo::Done);
                DC(int64(0x8e9dbe3a3c4a37e6), EConversationDebugInfo::Executing);
                Gorn.JoinPartyOf(Hero);
                DC(int64(0x8e9dbe3a3c4a37e6), EConversationDebugInfo::Done);
                DC(int64(0x55b89e2ce8503648), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cord))) { Cord.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Cord_709_Follow); }
                DC(int64(0x55b89e2ce8503648), EConversationDebugInfo::Done);
                DC(int64(0x55b89e2ce8503652), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY17_735))) { NC_SLD_MERCENARY17_735.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary17_735_Follow); }
                DC(int64(0x55b89e2ce8503652), EConversationDebugInfo::Done);
                DC(int64(0x55b89e2ce8503654), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY18_736))) { NC_SLD_MERCENARY18_736.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary18_736_Follow); }
                DC(int64(0x55b89e2ce8503654), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7660d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e7660d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornRuinabyss : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e7652e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGornRuinabyss);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_AM_GORN_CHAMBER", 300.0f, int64(0xa09d6bcc2e7652e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76530), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76532), EConversationDebugInfo::Executing);
                // Look at that. Looks like a supply room of those monks ...
                Gorn.AI.Say(LocText("INFO_GORN_RUINABYSS_09_01"));
                DC(int64(0xa09d6bcc2e76532), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e67635a1), EConversationDebugInfo::Executing);
                
                // No sign of a secret entrance, though. 
                Hero.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_125413"));
                DC(int64(0xafbf62a2e67635a1), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e67635a2), EConversationDebugInfo::Executing);
                
                // Yeah. Guess it's gonna be the front gate after all. 
                Gorn.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_125526"));
                DC(int64(0xafbf62a2e67635a2), EConversationDebugInfo::Done);
                DC(int64(0xc08c3238b6d3e3d4), EConversationDebugInfo::Executing);
                // Come, let's go on up. Maybe we'll find a way through ...
                Gorn.AI.Say(LocText("TEXT_WIP_JTYFCYK_20240416_224143"));
                DC(int64(0xc08c3238b6d3e3d4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_CaveLoot);
                DC(int64(0x64682365a32fa8e4), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinfollow);
                DC(int64(0x64682365a32fa8e4), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e686bf), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_RAVINE.SucceedQuest();
                DC(int64(0x273e200a45e686bf), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76535), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e76535), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornRuingate : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76555);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGornRuingate);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76556), G1R != nullptr && G1R.IsDoorOpen(n"MainDooAncientMonastery_Gate"));
                    DB(int64(0xa09d6bcc2e76557), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                    DB(int64(0xbe3cca6eb8ae63bd), AM_JUVENILETROLL_01 != nullptr && !AM_JUVENILETROLL_01.IsEveryoneOfThisKindDead());
                }
                
                if (G1R != nullptr && !G1R.IsDoorOpen(n"MainDooAncientMonastery_Gate"))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && !Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
                    return false;
                
                if (AM_JUVENILETROLL_01 != nullptr && AM_JUVENILETROLL_01.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76559), EConversationDebugInfo::Executing);
                // Hah! Not bad. You look good as a meatbug.
                Gorn.AI.Say(LocText("INFO_GORN_RUINGATE_09_01"));
                DC(int64(0xa09d6bcc2e76559), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7655a), EConversationDebugInfo::Executing);
                
                // Thanks. What now? 
                Hero.AI.Say(LocText("INFO_GORN_RUINGATE_15_02"));
                DC(int64(0xa09d6bcc2e7655a), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e6768eaf), EConversationDebugInfo::Executing);
                
                // Now we're getting what we came here for. 
                Gorn.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_130744"));
                DC(int64(0xafbf62a2e6768eaf), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e6768eb0), EConversationDebugInfo::Executing);
                // I'll stay here and cover your back while you look around ...
                Gorn.AI.Say(LocText("TEXT_WIP_HVDLGBG_20240516_152253"));
                DC(int64(0xafbf62a2e6768eb0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_Meatbug);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_DoorOpened);
                DC(int64(0x64682365a32fa8f2), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay);
                DC(int64(0x64682365a32fa8f2), EConversationDebugInfo::Done);
                DC(int64(0x62647774bd17b0a9), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0x62647774bd17b0a9), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e687a3), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR.SucceedQuest();
                DC(int64(0x273e200a45e687a3), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7655c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e7655c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornRuinleave : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76536);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGornRuinleave);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_GORN_RUINGATE_09_01"), int64(0xa09d6bcc2e76536));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76537), G1R.Monastery_Outside != 0);
                    DB(int64(0x45785c73c25bb7bd), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                    DB(int64(0xe470f8c648d27ce2), Gorn != nullptr && Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinfollow));
                }
                
                if (G1R.Monastery_Outside == 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && !Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
                    return false;
                
                if (Gorn != nullptr && !Gorn.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinfollow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76539), EConversationDebugInfo::Executing);
                // Where are you going? That's the wrong way. 
                Gorn.AI.Say(LocText("INFO_GORN_RUINLEAVE_09_01"));
                DC(int64(0xa09d6bcc2e76539), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e67635a3), EConversationDebugInfo::Executing);
                
                // Just looking around. 
                Hero.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_125639"));
                DC(int64(0xafbf62a2e67635a3), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7653a), EConversationDebugInfo::Executing);
                
                // Look fast then. 
                Gorn.AI.Say(LocText("INFO_GORN_RUINLEAVE_09_02"));
                DC(int64(0xa09d6bcc2e7653a), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7653b), EConversationDebugInfo::Executing);
                // I'll wait here. 
                Gorn.AI.Say(LocText("INFO_GORN_RUINLEAVE_09_03"));
                DC(int64(0xa09d6bcc2e7653b), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa909), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinwait);
                DC(int64(0x64682365a32fa909), EConversationDebugInfo::Done);
                DC(int64(0x62647774bd17b0a5), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0x62647774bd17b0a5), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7653d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e7653d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornRuinleaveinside : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e7655d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGornRuinleaveinside);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_AM_GORN_BRIDGE", 1000.0f, int64(0xa09d6bcc2e7655d));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LKRDULC_20240507_130833"), int64(0xa09d6bcc2e7655d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e7655f), Hero != nullptr && !Hero.HasItem(UItMs_Focus_04, 1, 0));
                    DB(int64(0x45785c73c25bb7fd), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                }
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && !Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76561), EConversationDebugInfo::Executing);
                // Where are you going? Done already? 
                Gorn.AI.Say(LocText("INFO_GORN_RUINLEAVEINSIDE_09_01"));
                DC(int64(0xa09d6bcc2e76561), EConversationDebugInfo::Done);
                DC(int64(0xc08c3238b6d3e401), EConversationDebugInfo::Executing);
                
                // Just checking something.
                Hero.AI.Say(LocText("TEXT_WIP_JTYFCYK_20240416_232438"));
                DC(int64(0xc08c3238b6d3e401), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76563), EConversationDebugInfo::Executing);
                
                // Hm, all right. I'll wait here. 
                Gorn.AI.Say(LocText("INFO_GORN_RUINLEAVEINSIDE_09_03"));
                DC(int64(0xa09d6bcc2e76563), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa913), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay);
                DC(int64(0x64682365a32fa913), EConversationDebugInfo::Done);
                DC(int64(0x45785c73c25bb7dd), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0x45785c73c25bb7dd), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76565), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e76565), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornRuinvictory : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e7657a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGornRuinvictory);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e7657b), AM_JUVENILETROLL_01 != nullptr && AM_JUVENILETROLL_01.IsEveryoneOfThisKindDead());
                    DB(int64(0xa09d6bcc2e7657c), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                    DB(int64(0x55f4b65ae2ef8770), Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0));
                    DB(int64(0x19f1dcac6d80fa3e), IsCharacterInWorld(AM_JUVENILETROLL_01));
                }
                
                if (AM_JUVENILETROLL_01 != nullptr && !AM_JUVENILETROLL_01.IsEveryoneOfThisKindDead())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && !Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_04, 1, 0))
                    return false;
                
                if (!IsCharacterInWorld(AM_JUVENILETROLL_01))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e7657e), EConversationDebugInfo::Executing);
                // By Adanos. That one was a piece of work. 
                Gorn.AI.Say(LocText("INFO_GORN_RUINVICTORY_09_01"));
                DC(int64(0xa09d6bcc2e7657e), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e7657f), EConversationDebugInfo::Executing);
                
                // Where did it come from?
                Hero.AI.Say(LocText("INFO_GORN_RUINVICTORY_15_02"));
                DC(int64(0xa09d6bcc2e7657f), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76580), EConversationDebugInfo::Executing);
                
                // No idea. But we were lucky it was just a cub. Otherwise ...
                Gorn.AI.Say(LocText("INFO_GORN_RUINVICTORY_09_03"));
                DC(int64(0xa09d6bcc2e76580), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76583), EConversationDebugInfo::Executing);
                // Any luck with the focus stone? 
                Gorn.AI.Say(LocText("INFO_GORN_RUINVICTORY_09_06"));
                DC(int64(0xa09d6bcc2e76583), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_Troll);
                DB(int64(0x5334654b0e1b2d1d), Hero != nullptr && !Hero.HasItem(UItMs_Focus_04, 1, 0));
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_04, 1, 0))
                {
                    DC(int64(0x5334654b0e1b2d62), EConversationDebugInfo::Executing);
                    // Not yet.
                    Hero.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_095106"));
                    DC(int64(0x5334654b0e1b2d62), EConversationDebugInfo::Done);
                    DC(int64(0x5334654b0e1b2d63), EConversationDebugInfo::Executing);
                    
                    // Then go and find it.
                    Gorn.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_095106_2083"));
                    DC(int64(0x5334654b0e1b2d63), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorn_ruinvictory_exit_1");
                    DC(int64(0x5334654b0e1b2d67), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x5334654b0e1b2d67), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6fdd4e97a36cd04d), EConversationDebugInfo::Executing);
                    // I have it. 
                    Hero.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_155811"));
                    DC(int64(0x6fdd4e97a36cd04d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorn_ruinvictory_exit_2");
                }
            }
        }
        
        
        class UChoiceGornRuinwait : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e7650e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGornRuinwait);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_AM_GORN_BRIDGE", 500.0f, int64(0xa09d6bcc2e7650e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x62647774bd17b09f), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76511), EConversationDebugInfo::Executing);
                // Been wondering when you'd show up. Ready to find that ...
                Gorn.AI.Say(LocText("INFO_GORN_RUINWAIT_09_01"));
                DC(int64(0xa09d6bcc2e76511), EConversationDebugInfo::Done);
                DB(int64(0xbe3cca6eb8ae63a6), Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0))
                {
                    DC(int64(0xbe3cca6eb8ae63af), EConversationDebugInfo::Executing);
                    // I found the focus stone.
                    Hero.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_095222"));
                    DC(int64(0xbe3cca6eb8ae63af), EConversationDebugInfo::Done);
                    DC(int64(0xbe3cca6eb8ae63b0), EConversationDebugInfo::Executing);
                    
                    // Where is it?
                    Gorn.AI.Say(LocText("TEXT_WIP_BXKHAXF_20240521_095222_2238"));
                    DC(int64(0xbe3cca6eb8ae63b0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorn_ruinwait_exit_1");
                }
                else
                {
                    DC(int64(0xafbf62a2e6763590), EConversationDebugInfo::Executing);
                    // Yes. I'm guessing it's in that ruin up there?
                    Hero.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_123002"));
                    DC(int64(0xafbf62a2e6763590), EConversationDebugInfo::Done);
                    DC(int64(0xafbf62a2e676358a), EConversationDebugInfo::Executing);
                    
                    // It is. An old monastery of Adanos. There's a problem we ...
                    Gorn.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_122727"));
                    DC(int64(0xafbf62a2e676358a), EConversationDebugInfo::Done);
                    DC(int64(0xa09d6bcc2e76524), EConversationDebugInfo::Executing);
                    
                    // What's the problem?
                    Hero.AI.Say(LocText("INFO_GORN_RUINJOIN_15_01"));
                    DC(int64(0xa09d6bcc2e76524), EConversationDebugInfo::Done);
                    DC(int64(0xa09d6bcc2e76525), EConversationDebugInfo::Executing);
                    
                    // Snappers. The area's swarming with them, I guess they ...
                    Gorn.AI.Say(LocText("INFO_GORN_RUINJOIN_09_02"));
                    DC(int64(0xa09d6bcc2e76525), EConversationDebugInfo::Done);
                    DC(int64(0xa09d6bcc2e76526), EConversationDebugInfo::Executing);
                    // We should clear it before we do anything else, and look ...
                    Gorn.AI.Say(LocText("INFO_GORN_RUINJOIN_09_03"));
                    DC(int64(0xa09d6bcc2e76526), EConversationDebugInfo::Done);
                    DC(int64(0xc08c3238b6d3e3c8), EConversationDebugInfo::Executing);
                    // The front gate's shut tight, but I've spotted some of ...
                    Gorn.AI.Say(LocText("TEXT_WIP_JTYFCYK_20240416_222359"));
                    DC(int64(0xc08c3238b6d3e3c8), EConversationDebugInfo::Done);
                    DC(int64(0xa09d6bcc2e76528), EConversationDebugInfo::Executing);
                    
                    // You think there might be a way in through the ravine?
                    Hero.AI.Say(LocText("INFO_GORN_RUINJOIN_15_05"));
                    DC(int64(0xa09d6bcc2e76528), EConversationDebugInfo::Done);
                    DC(int64(0xa09d6bcc2e76529), EConversationDebugInfo::Executing);
                    
                    // Can't hurt to check. 
                    Gorn.AI.Say(LocText("INFO_GORN_RUINJOIN_09_06"));
                    DC(int64(0xa09d6bcc2e76529), EConversationDebugInfo::Done);
                    DC(int64(0xc08c3238b6d3e3c9), EConversationDebugInfo::Executing);
                    
                    // Then let's head out. 
                    Hero.AI.Say(LocText("TEXT_WIP_JTYFCYK_20240416_223134"));
                    DC(int64(0xc08c3238b6d3e3c9), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_Start);
                    DC(int64(0x64682365a32fa8fb), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.StartQuest();
                    DC(int64(0x64682365a32fa8fb), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32fa8fd), EConversationDebugInfo::Executing);
                    Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinabyss);
                    DC(int64(0x64682365a32fa8fd), EConversationDebugInfo::Done);
                    DC(int64(0x62647774bd17b0a3), EConversationDebugInfo::Executing);
                    Gorn.JoinPartyOf(Hero);
                    DC(int64(0x62647774bd17b0a3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorn_ruinwait_exit_2");
                    DC(int64(0xa09d6bcc2e7652d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa09d6bcc2e7652d), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGornRuinwall : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e7653e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGornRuinwall);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_AM_GORN_GATE", 500.0f, int64(0xa09d6bcc2e7653e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e76540), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                    DB(int64(0x485a05db1e2cb233), G1R != nullptr && !G1R.IsDoorOpen(n"MainDooAncientMonastery_Gate"));
                }
                
                if (Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && !Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
                    return false;
                
                if (G1R != nullptr && G1R.IsDoorOpen(n"MainDooAncientMonastery_Gate"))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76542), EConversationDebugInfo::Executing);
                // Fuck's sake ... that gate could stop a troll. Let's see ...
                Gorn.AI.Say(LocText("INFO_GORN_RUINWALL_09_01"));
                DC(int64(0xa09d6bcc2e76542), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_DoorClosed);
                DC(int64(0x64682365a32fa957), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinwall);
                DC(int64(0x64682365a32fa957), EConversationDebugInfo::Done);
                DC(int64(0x62647774bd17b0a7), EConversationDebugInfo::Executing);
                Gorn.LeavePartyOf(Hero);
                DC(int64(0x62647774bd17b0a7), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76545), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e76545), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornRuinwallwhat : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76546);
            default Caption = LocText("INFO_GORN_RUINWALLWHAT_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornRuinwall);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ff519512fc24292), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                    DB(int64(0x4ff519512fc2429f), G1R != nullptr && !G1R.IsDoorOpen(n"MainDooAncientMonastery_Gate"));
                }
                
                if (Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && !Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
                    return false;
                
                if (G1R != nullptr && G1R.IsDoorOpen(n"MainDooAncientMonastery_Gate"))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76547), EConversationDebugInfo::Executing);
                // Any idea how we can get through?
                Hero.AI.Say(LocText("INFO_GORN_RUINWALLWHAT_15_01"));
                DC(int64(0xa09d6bcc2e76547), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76548), EConversationDebugInfo::Executing);
                
                // Nah. But I doubt breaking it open is gonna be an option ...
                Gorn.AI.Say(LocText("INFO_GORN_RUINWALLWHAT_09_02"));
                DC(int64(0xa09d6bcc2e76548), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e67635b8), EConversationDebugInfo::Executing);
                // Same goes for climbing. That wall's just to steep. 
                Gorn.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_130034"));
                DC(int64(0xafbf62a2e67635b8), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e67635ba), EConversationDebugInfo::Executing);
                
                // I'll think of something. 
                Hero.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_130204"));
                DC(int64(0xafbf62a2e67635ba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornRuinwhat : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e76513);
            default Caption = LocText("INFO_GORN_RUINWHAT_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorn_ruinwait_exit_2");
            default Rules.HideIfKnows(UChoiceGornRuinwhat);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbe3cca6eb8ae645b), Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e76514), EConversationDebugInfo::Executing);
                // Anything I should know about that monastery?
                Hero.AI.Say(LocText("INFO_GORN_RUINWHAT_15_01"));
                DC(int64(0xa09d6bcc2e76514), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e76515), EConversationDebugInfo::Executing);
                
                // Not really. It's been abandoned since long before the ...
                Gorn.AI.Say(LocText("INFO_GORN_RUINWHAT_09_02"));
                DC(int64(0xa09d6bcc2e76515), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e6763593), EConversationDebugInfo::Executing);
                // All I know is that, apparently, the monks there were ...
                Gorn.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_123308"));
                DC(int64(0xafbf62a2e6763593), EConversationDebugInfo::Done);
                DC(int64(0xafbf62a2e6763594), EConversationDebugInfo::Executing);
                // Anyway, they won't be a problem. They're all dead. 
                Gorn.AI.Say(LocText("TEXT_WIP_LKRDULC_20240507_123421"));
                DC(int64(0xafbf62a2e6763594), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornSecond : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e765c1);
            default Caption = LocText("INFO_GORN_SECOND_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornPost);
            default Rules.HideIfKnows(UChoiceGornSecond);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765c2), EConversationDebugInfo::Executing);
                
                // What's the long-term plan? Even if we win it back, Gomez ...
                Hero.AI.Say(LocText("INFO_GORN_SECOND_15_01"));
                DC(int64(0xa09d6bcc2e765c2), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765c3), EConversationDebugInfo::Executing);
                
                // That's why the next step is sealing the mountain pass ...
                Gorn.AI.Say(LocText("INFO_GORN_SECOND_09_02"));
                DC(int64(0xa09d6bcc2e765c3), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765c4), EConversationDebugInfo::Executing);
                // That path was what fucked us over. They'd have never ...
                Gorn.AI.Say(LocText("INFO_GORN_SECOND_09_03"));
                DC(int64(0xa09d6bcc2e765c4), EConversationDebugInfo::Done);
                DC(int64(0xff8bcf6e654fc362), EConversationDebugInfo::Executing);
                // But first things first. Are you helping or not?
                Gorn.AI.Say(LocText("TEXT_WIP_GSMIFZI_20240627_190834"));
                DC(int64(0xff8bcf6e654fc362), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornTakeback : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e765b1);
            default Caption = LocText("TEXT_CHOICE_GORN_TAKEBACK");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornPost);
            default Rules.HideIfKnows(UChoiceGornTakeback);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765b2), EConversationDebugInfo::Executing);
                
                // Just the four of you? What about the rest of the mercs? 
                Hero.AI.Say(LocText("INFO_GORN_TAKEBACK_15_01"));
                DC(int64(0xa09d6bcc2e765b2), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765b3), EConversationDebugInfo::Executing);
                
                // They're covering our backs. A frontal charge won't ...
                Gorn.AI.Say(LocText("INFO_GORN_TAKEBACK_09_02"));
                DC(int64(0xa09d6bcc2e765b3), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765b4), EConversationDebugInfo::Executing);
                // Just the four of us, though ... they won't know what hit ...
                Gorn.AI.Say(LocText("INFO_GORN_TAKEBACK_09_03"));
                DC(int64(0xa09d6bcc2e765b4), EConversationDebugInfo::Done);
                DC(int64(0xfa651c556ad02576), EConversationDebugInfo::Executing);
                // Actually, Lee wants you to lead the charge.
                Gorn.AI.Say(LocText("TEXT_WIP_VHPDFRJ_20240802_144925"));
                DC(int64(0xfa651c556ad02576), EConversationDebugInfo::Done);
                DC(int64(0xff8bcf6e654fc363), EConversationDebugInfo::Executing);
                
                // Me?
                Hero.AI.Say(LocText("TEXT_WIP_GSMIFZI_20240627_191152"));
                DC(int64(0xff8bcf6e654fc363), EConversationDebugInfo::Done);
                DB(int64(0xa09d6bcc2e765b8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                DB(int64(0xa09d6bcc2e765ba), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                DB(int64(0xa09d6bcc2e765bc), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                {
                    DC(int64(0xa09d6bcc2e765b9), EConversationDebugInfo::Executing);
                    // Yeah. You're new to our ranks, but you've shown your ...
                    Gorn.AI.Say(LocText("INFO_GORN_TAKEBACK_09_05"));
                    DC(int64(0xa09d6bcc2e765b9), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                {
                    DC(int64(0xa09d6bcc2e765bb), EConversationDebugInfo::Executing);
                    // Yeah. As a Water Mage who has seen battle, he thinks ...
                    Gorn.AI.Say(LocText("INFO_GORN_TAKEBACK_09_06"));
                    DC(int64(0xa09d6bcc2e765bb), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                {
                    DC(int64(0xa09d6bcc2e765bd), EConversationDebugInfo::Executing);
                    // You're a bandit, but you've shown your skill over and ...
                    Gorn.AI.Say(LocText("INFO_GORN_TAKEBACK_09_07"));
                    DC(int64(0xa09d6bcc2e765bd), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa09d6bcc2e765be), EConversationDebugInfo::Executing);
                    // You're not a part of our camp, but you have proven your ...
                    Gorn.AI.Say(LocText("INFO_GORN_TAKEBACK_09_08"));
                    DC(int64(0xa09d6bcc2e765be), EConversationDebugInfo::Done);
                }
                DC(int64(0xa09d6bcc2e765c0), EConversationDebugInfo::Executing);
                // I agree with him, and I don't say that lightly.
                Gorn.AI.Say(LocText("INFO_GORN_TAKEBACK_09_10"));
                DC(int64(0xa09d6bcc2e765c0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornWolf : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xa09d6bcc2e765e5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGornWolf);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_WOLF_SPEAK_15_01"), int64(0xa09d6bcc2e765e5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa09d6bcc2e765e6), G1R.Gorn_JoinedForFM != 0);
                    DB(int64(0xa09d6bcc2e765e8), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning());
                }
                
                if (G1R.Gorn_JoinedForFM == 0)
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765ea), EConversationDebugInfo::Executing);
                // Hold on, I forgot something.
                Gorn.AI.Say(LocText("INFO_GORN_WOLF_09_01"));
                DC(int64(0xa09d6bcc2e765ea), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765eb), EConversationDebugInfo::Executing);
                // Wolf, the bandit, wants to talk to you before we set ...
                Gorn.AI.Say(LocText("INFO_GORN_WOLF_09_02"));
                DC(int64(0xa09d6bcc2e765eb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_RECOVERFREEMINE, Document::UDocumentSegment_CH4_RECOVERFREEMINE_Wolf);
                DC(int64(0x64682365a32fa9a2), EConversationDebugInfo::Executing);
                G1R.Gorn_GotoWolf = 1;
                DC(int64(0x64682365a32fa9a2), EConversationDebugInfo::Done);
                DC(int64(0x2a9130fe43128698), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF.StartQuest();
                DC(int64(0x2a9130fe43128698), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Gorn_101355,
                    UChoiceGornWolfFm,
                    UChoiceGornWolfWolf
                );
            }
        }
        
        
        class UTopic_Gorn_101355 : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0x86da55731415a593);
            default Caption = LocText("TEXT_WIP_FSMIFZI_20240628_165030_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gorn_101355);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x86da55731415a594), EConversationDebugInfo::Executing);
                // What does he want?
                Hero.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_165030_41"));
                DC(int64(0x86da55731415a594), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a59d), EConversationDebugInfo::Executing);
                
                // If I knew that, I'd have told you.
                Gorn.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_165044"));
                DC(int64(0x86da55731415a59d), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a596), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x86da55731415a596), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornWolfFm : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xe8603e87342bce50);
            default Caption = LocText("INFO_GORN_WOLF_15_04");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765ef), EConversationDebugInfo::Executing);
                // He can wait.
                Hero.AI.Say(LocText("INFO_GORN_WOLF_15_04"));
                DC(int64(0xa09d6bcc2e765ef), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765f0), EConversationDebugInfo::Executing);
                
                // You sure about that? All right, your call. 
                Gorn.AI.Say(LocText("INFO_GORN_WOLF_09_05"));
                DC(int64(0xa09d6bcc2e765f0), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765f1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e765f1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornWolfWolf : UTopic_Hero__NC_SLD_GORN_699
        {
            default DebugId = int64(0xe8603e87342bce55);
            default Caption = LocText("INFO_GORN_WOLF_15_06");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa09d6bcc2e765f3), EConversationDebugInfo::Executing);
                // All right, I'll go see him.
                Hero.AI.Say(LocText("INFO_GORN_WOLF_15_06"));
                DC(int64(0xa09d6bcc2e765f3), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765f4), EConversationDebugInfo::Executing);
                
                // Good. We'll wait right here. 
                Gorn.AI.Say(LocText("INFO_GORN_WOLF_09_07"));
                DC(int64(0xa09d6bcc2e765f4), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa99b), EConversationDebugInfo::Executing);
                G1R.Gorn_JoinedForFM = 0;
                DC(int64(0x64682365a32fa99b), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32fa99d), EConversationDebugInfo::Executing);
                Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Guardnc);
                DC(int64(0x64682365a32fa99d), EConversationDebugInfo::Done);
                DC(int64(0x8e9dbe3a3c4a37ec), EConversationDebugInfo::Executing);
                Hero.LeavePartyOf(Gorn);
                DC(int64(0x8e9dbe3a3c4a37ec), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba4386d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cord))) { Cord.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Cord_709_Fmtaken); }
                DC(int64(0xdac37845dba4386d), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba4386f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY17_735))) { NC_SLD_MERCENARY17_735.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary17_735_Fmtaken); }
                DC(int64(0xdac37845dba4386f), EConversationDebugInfo::Done);
                DC(int64(0xdac37845dba43871), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY18_736))) { NC_SLD_MERCENARY18_736.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary18_736_Fmtaken); }
                DC(int64(0xdac37845dba43871), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5722), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5722), EConversationDebugInfo::Done);
                DC(int64(0xa09d6bcc2e765f7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa09d6bcc2e765f7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */