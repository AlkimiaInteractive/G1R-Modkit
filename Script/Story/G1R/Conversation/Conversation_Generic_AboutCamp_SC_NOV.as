#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_SC_NOV : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_SC_NOV";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_SC_NOV";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_SC_NOV() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampScNov150829 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x26cbf7282644572c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf7282644572e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf7282644572e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGenericAboutcampScNov213199 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea74);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"GuideSmithy_Novice", 200.0f, int64(0xa147a5e54cfeea74));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa147a5e54cfeea6e), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Smith));
                }
                
                return Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Smith);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa89f006bb73644db), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived);
                DC(int64(0xa89f006bb73644db), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.NPCState.AssignDefaultDailyRoutine();
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Done);
                DC(int64(0x23fcbbf5c9a6793), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Smithy = 0;
                DC(int64(0x23fcbbf5c9a6793), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea79), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea79), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGenericAboutcampScNov213244 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea7f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"GuideTemple_Novice", 200.0f, int64(0xa147a5e54cfeea7f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa147a5e54cfeea6e), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Temple));
                }
                
                return Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Temple);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa89f006bb73644dc), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived);
                DC(int64(0xa89f006bb73644dc), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.NPCState.AssignDefaultDailyRoutine();
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Done);
                DC(int64(0x23fcbbf5c9a6795), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Temple = 0;
                DC(int64(0x23fcbbf5c9a6795), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea84), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea84), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGenericAboutcampScNov213287 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea8a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"GuideKalom_Novice", 200.0f, int64(0xa147a5e54cfeea8a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa147a5e54cfeea6e), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Kalom));
                }
                
                return Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Kalom);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa89f006bb73644dd), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived);
                DC(int64(0xa89f006bb73644dd), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.NPCState.AssignDefaultDailyRoutine();
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Done);
                DC(int64(0x23fcbbf5c9a6797), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Kalom = 0;
                DC(int64(0x23fcbbf5c9a6797), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea94), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea94), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGenericAboutcampScNov213348 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea98);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"GuideTrain_Novice", 200.0f, int64(0xa147a5e54cfeea98));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa147a5e54cfeea6e), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Train));
                }
                
                return Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_Train);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa89f006bb73644de), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived);
                DC(int64(0xa89f006bb73644de), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.NPCState.AssignDefaultDailyRoutine();
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Done);
                DC(int64(0x23fcbbf5c9a6799), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Train = 0;
                DC(int64(0x23fcbbf5c9a6799), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea9d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea9d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_SCNOVCantell : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33c2);
            default Caption = LocText("Info_Nov_5_DasLager_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply2)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc67fdb594de780aa), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xc67fdb594de780ab), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33c4), EConversationDebugInfo::Executing);
                // What can you tell me about this camp?
                Hero.AI.Say(LocText("Info_Nov_5_DasLager_15_00"));
                DC(int64(0x716b63fb436e33c4), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc17), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply1);
                DC(int64(0x5eab3726d24bdc17), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc18), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply2);
                DC(int64(0x5eab3726d24bdc18), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e33c7), EConversationDebugInfo::Executing);
                
                // Where can I find him?
                Hero.AI.Say(LocText("Info_Nov_5_DasLager_15_03"));
                DC(int64(0x716b63fb436e33c7), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc19), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply3);
                DC(int64(0x5eab3726d24bdc19), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVEndGuide : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea61);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"GuideMainGate_Novice", 200.0f, int64(0xa147a5e54cfeea61));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa147a5e54cfeea6e), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_MainGate));
                }
                
                return Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasAssignedDailyRoutine(UDailyRoutine_GenericNovice_Guide_MainGate);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa89f006bb73644da), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived);
                DC(int64(0xa89f006bb73644da), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.NPCState.AssignDefaultDailyRoutine();
                DC(int64(0xa147a5e54cfeea6a), EConversationDebugInfo::Done);
                DC(int64(0x23fcbbf5c9a6791), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_MainGate = 0;
                DC(int64(0x23fcbbf5c9a6791), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea6b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea6b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_SCNOVGuide : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfee9d6);
            default Caption = LocText("PC_PSIONIC_GUIDEFIRST_INFO_15_01");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x65da167ad7b429b9), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xca16a6a13202aa93), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice37));
                    DB(int64(0x65da167ad7b429b9), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xca16a6a13202aa93), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice43));
                    DB(int64(0x65da167ad7b429b9), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xca16a6a13202aa93), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice47));
                    DB(int64(0x65da167ad7b429b9), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xca16a6a13202aa93), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice39));
                    DB(int64(0x65da167ad7b429b9), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xca16a6a13202aa93), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice44));
                    DB(int64(0x65da167ad7b429b9), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xca16a6a13202aa93), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice42));
                    DB(int64(0x65da167ad7b429b9), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xca16a6a13202aa93), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice45));
                }
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice37))
                    return true;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice43))
                    return true;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice47))
                    return true;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice39))
                    return true;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice44))
                    return true;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice42))
                    return true;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.HasVoicetype(GameplayTag::VoiceType_G1R_Voice45))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa147a5e54cfee9d4), EConversationDebugInfo::Executing);
                // I'm looking for ...
                Hero.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_INFO_15_01"));
                DC(int64(0xa147a5e54cfee9d4), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_AboutCamp_SC_NOV_212582,
                    UTopic_Generic_AboutCamp_SC_NOV_212602,
                    UTopic_Generic_AboutCamp_SC_NOV_212655,
                    UTopic_Generic_AboutCamp_SC_NOV_212685,
                    UTopic_Generic_AboutCamp_SC_NOV_212727,
                    UTopic_Generic_AboutCamp_SC_NOV_212771
                );
            }
        }
        
        
        class UTopic_Generic_AboutCamp_SC_NOV_212582 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfee9e9);
            default Caption = LocText("TEXT_WIP_WYKLUSD_20251103_112248");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe60cb7cc5b512bb0), G1R.Novice_Guide_MainGate != 1);
                }
                
                return G1R.Novice_Guide_MainGate != 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa147a5e54cfeea35), EConversationDebugInfo::Executing);
                // Take me back to the main gate.
                Hero.AI.Say(LocText("TEXT_WIP_WYKLUSD_20251103_115156_3984"));
                DC(int64(0xa147a5e54cfeea35), EConversationDebugInfo::Done);
                DC(int64(0xe1a5057f0a54171c), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe);
                DC(int64(0xe1a5057f0a54171c), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.ExchangeDailyRoutineToClass(UDailyRoutine_GenericNovice_Guide_MainGate);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Done);
                DC(int64(0xe60cb7cc5b512ba6), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_MainGate = 1;
                DC(int64(0xe60cb7cc5b512ba6), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea5a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea5a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Generic_AboutCamp_SC_NOV_212602 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfee9ed);
            default Caption = LocText("TEXT_WIP_WYKLUSD_20251103_112248_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe60cb7cc5b512bb0), G1R.Novice_Guide_Smithy != 1);
                }
                
                return G1R.Novice_Guide_Smithy != 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa147a5e54cfee9ee), EConversationDebugInfo::Executing);
                // The smithy.
                Hero.AI.Say(LocText("TEXT_WIP_WYKLUSD_20251103_112248_2785"));
                DC(int64(0xa147a5e54cfee9ee), EConversationDebugInfo::Done);
                DC(int64(0xe1a5057f0a54171d), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe);
                DC(int64(0xe1a5057f0a54171d), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.ExchangeDailyRoutineToClass(UDailyRoutine_GenericNovice_Guide_Smith);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Done);
                DC(int64(0xe60cb7cc5b512ba8), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Smithy = 1;
                DC(int64(0xe60cb7cc5b512ba8), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea71), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea71), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Generic_AboutCamp_SC_NOV_212655 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea01);
            default Caption = LocText("TEXT_WIP_WYKLUSD_20251103_112652_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe60cb7cc5b512bb0), G1R.Novice_Guide_Temple != 1);
                }
                
                return G1R.Novice_Guide_Temple != 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa147a5e54cfeea02), EConversationDebugInfo::Executing);
                // The temple.
                Hero.AI.Say(LocText("TEXT_WIP_WYKLUSD_20251103_112652_3436"));
                DC(int64(0xa147a5e54cfeea02), EConversationDebugInfo::Done);
                DC(int64(0xe1a5057f0a54171f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe);
                DC(int64(0xe1a5057f0a54171f), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.ExchangeDailyRoutineToClass(UDailyRoutine_GenericNovice_Guide_Temple);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Done);
                DC(int64(0xe60cb7cc5b512baa), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Temple = 1;
                DC(int64(0xe60cb7cc5b512baa), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea7c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea7c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Generic_AboutCamp_SC_NOV_212685 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea0d);
            default Caption = LocText("TEXT_WIP_WYKLUSD_20251103_112713_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe60cb7cc5b512bb0), G1R.Novice_Guide_Kalom != 1);
                }
                
                return G1R.Novice_Guide_Kalom != 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa147a5e54cfeea0e), EConversationDebugInfo::Executing);
                // The alchemy laboratory.
                Hero.AI.Say(LocText("TEXT_WIP_WYKLUSD_20251103_112713_3286"));
                DC(int64(0xa147a5e54cfeea0e), EConversationDebugInfo::Done);
                DC(int64(0xe1a5057f0a541720), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe);
                DC(int64(0xe1a5057f0a541720), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.ExchangeDailyRoutineToClass(UDailyRoutine_GenericNovice_Guide_Kalom);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Done);
                DC(int64(0xe60cb7cc5b512bac), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Kalom = 1;
                DC(int64(0xe60cb7cc5b512bac), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea87), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeea87), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Generic_AboutCamp_SC_NOV_212727 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea15);
            default Caption = LocText("TEXT_WIP_WYKLUSD_20251103_112734_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe60cb7cc5b512bb0), G1R.Novice_Guide_Train != 1);
                }
                
                return G1R.Novice_Guide_Train != 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa147a5e54cfeea16), EConversationDebugInfo::Executing);
                // Someone who can teach me.
                Hero.AI.Say(LocText("TEXT_WIP_WYKLUSD_20251103_112734_686"));
                DC(int64(0xa147a5e54cfeea16), EConversationDebugInfo::Done);
                DC(int64(0xe1a5057f0a541721), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe);
                DC(int64(0xe1a5057f0a541721), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.ExchangeDailyRoutineToClass(UDailyRoutine_GenericNovice_Guide_Train);
                DC(int64(0xa147a5e54cfeea55), EConversationDebugInfo::Done);
                DC(int64(0xe60cb7cc5b512bae), EConversationDebugInfo::Executing);
                G1R.Novice_Guide_Train = 1;
                DC(int64(0xe60cb7cc5b512bae), EConversationDebugInfo::Done);
                DC(int64(0xa147a5e54cfeeaa2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa147a5e54cfeeaa2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Generic_AboutCamp_SC_NOV_212771 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xa147a5e54cfeea1d);
            default Caption = LocText("TEXT_WIP_WYKLUSD_20251103_113244");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UInfo_SCNOVHowareyou : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33b5);
            default Caption = LocText("Info_Nov_3_DieLage_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowareyou_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc67fdb594de780b1), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                }
                
                return Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33b7), EConversationDebugInfo::Executing);
                // How are you?
                Hero.AI.Say(LocText("Info_Nov_3_DieLage_15_00"));
                DC(int64(0x716b63fb436e33b7), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24b4d49), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowareyou_Reply1);
                DC(int64(0x5eab3726d24b4d49), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVHowcancamp : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33b9);
            default Caption = LocText("Info_Nov_5_EinerVonEuchWerden_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48376), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xc67fdb594de780ba), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xc67fdb594de780bb), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33bb), EConversationDebugInfo::Executing);
                
                // How can I join this camp?
                Hero.AI.Say(LocText("Info_Nov_5_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e33bb), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc1b), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply1);
                DC(int64(0x5eab3726d24bdc1b), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc1c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply2);
                DC(int64(0x5eab3726d24bdc1c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVHowcani : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33a6);
            default Caption = LocText("Info_Nov_3_EinerVonEuchWerden_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48376), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xc67fdb594de780ba), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xc67fdb594de780bb), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33a8), EConversationDebugInfo::Executing);
                
                // How can I join this camp?
                Hero.AI.Say(LocText("Info_Nov_3_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e33a8), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc09), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply1);
                DC(int64(0x5eab3726d24bdc09), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc0a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply2);
                DC(int64(0x5eab3726d24bdc0a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVHowsitgo : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33a2);
            default Caption = LocText("Info_Nov_2_DieLage_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowsitgo_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc67fdb594de780b9), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                }
                
                return Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33a4), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Nov_2_DieLage_15_00"));
                DC(int64(0x716b63fb436e33a4), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc11), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowsitgo_Reply1);
                DC(int64(0x5eab3726d24bdc11), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVHowthings : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33c9);
            default Caption = LocText("Info_Nov_5_DieLage_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowthings_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc67fdb594de780ac), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xc67fdb594de780ad), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33cb), EConversationDebugInfo::Executing);
                
                // How are things?
                Hero.AI.Say(LocText("Info_Nov_5_DieLage_15_00"));
                DC(int64(0x716b63fb436e33cb), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc1a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowthings_Reply1);
                DC(int64(0x5eab3726d24bdc1a), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e33cd), EConversationDebugInfo::Executing);
                
                // I've only just arrived.
                Hero.AI.Say(LocText("Info_Nov_5_DieLage_15_02"));
                DC(int64(0x716b63fb436e33cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVIsthere : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33b0);
            default Caption = LocText("Info_Nov_3_DasLager_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf9dd277662800e81), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0xc67fdb594de780aa), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33b2), EConversationDebugInfo::Executing);
                // Is there anywhere important here where I should go?
                Hero.AI.Say(LocText("Info_Nov_3_DasLager_15_00"));
                DC(int64(0x716b63fb436e33b2), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc0d), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply1);
                DC(int64(0x5eab3726d24bdc0d), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc0e), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply2);
                DC(int64(0x5eab3726d24bdc0e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVIwantto : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e3393);
            default Caption = LocText("Info_Nov_2_EinerVonEuchWerden_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48376), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xc67fdb594de780ba), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xc67fdb594de780bb), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3395), EConversationDebugInfo::Executing);
                
                // I want to join you.
                Hero.AI.Say(LocText("Info_Nov_2_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e3395), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc12), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply1);
                DC(int64(0x5eab3726d24bdc12), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc13), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply2);
                DC(int64(0x5eab3726d24bdc13), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVWhatshould : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e339d);
            default Caption = LocText("Info_Nov_2_DasLager_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf9dd277662800e81), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0xc67fdb594de780aa), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e339f), EConversationDebugInfo::Executing);
                
                // What should I know about this place?
                Hero.AI.Say(LocText("Info_Nov_2_DasLager_15_00"));
                DC(int64(0x716b63fb436e339f), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc0f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply1);
                DC(int64(0x5eab3726d24bdc0f), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc10), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply2);
                DC(int64(0x5eab3726d24bdc10), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVWhocalls : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33be);
            default Caption = LocText("Info_Nov_5_WichtigePersonen_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhocalls_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf9dd277662800e81), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0xc67fdb594de780aa), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33c0), EConversationDebugInfo::Executing);
                
                // Who calls the shots around here?
                Hero.AI.Say(LocText("Info_Nov_5_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e33c0), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc16), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhocalls_Reply1);
                DC(int64(0x5eab3726d24bdc16), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVWholeader : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e3398);
            default Caption = LocText("Info_Nov_2_WichtigePersonen_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc67fdb594de780bc), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                    DB(int64(0xc67fdb594de780bd), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e339a), EConversationDebugInfo::Executing);
                
                // Who are your leaders?
                Hero.AI.Say(LocText("Info_Nov_2_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e339a), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc14), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply1);
                DC(int64(0x5eab3726d24bdc14), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc15), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply2);
                DC(int64(0x5eab3726d24bdc15), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCNOVWhostheboss : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x716b63fb436e33ab);
            default Caption = LocText("Info_Nov_3_WichtigePersonen_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply1)) return false;
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc67fdb594de780b4), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xc67fdb594de780b5), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33ad), EConversationDebugInfo::Executing);
                
                // Who's the boss round here?
                Hero.AI.Say(LocText("Info_Nov_3_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e33ad), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc0b), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply1);
                DC(int64(0x5eab3726d24bdc0b), EConversationDebugInfo::Done);
                DC(int64(0x5eab3726d24bdc0c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply2);
                DC(int64(0x5eab3726d24bdc0c), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCNOVCaine : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xc2bbabf13f180b9d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCNOVCaine);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCaine_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bba), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasSucceeded());
                    DB(int64(0xc2bbabf13f180bbb), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f));
                    DB(int64(0xf9dd277662800e8d), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                }
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && !Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4efb30e5f16997fa), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCaine_Ambient1);
                DC(int64(0x4efb30e5f16997fa), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCNOVDisturb : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xed4abbb5972f51c5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCNOVDisturb);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDisturb_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f51ca), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 600.0f));
                    DB(int64(0xc67fdb594de780c7), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 600.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4efb30e5f16997fe), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDisturb_Ambient1);
                DC(int64(0x4efb30e5f16997fe), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCNOVDonttalk : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xc2bbabf13f180bed);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCNOVDonttalk);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_POQECXC_20240424_164026"), int64(0xc2bbabf13f180bed));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDonttalk_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bc7), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f));
                    DB(int64(0xc67fdb594de780c2), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xc67fdb594de780c3), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4efb30e5f16997fb), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDonttalk_Ambient1);
                DC(int64(0x4efb30e5f16997fb), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCNOVNewbrother : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x722d62fdc5af99f2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCNOVNewbrother);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVNewbrother_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x722d62fdc5af99fb), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xc2bbabf13f180ba5), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f));
                    DB(int64(0xc67fdb594de780be), Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4efb30e5f16997f8), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVNewbrother_Ambient1);
                DC(int64(0x4efb30e5f16997f8), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCNOVTattoos : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0x722d62fdc5af99f6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCNOVTattoos);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTattoos_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x722d62fdc5af99fb), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xc2bbabf13f180ba6), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f));
                    DB(int64(0xc67fdb594de780bf), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4efb30e5f16997f9), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTattoos_Ambient1);
                DC(int64(0x4efb30e5f16997f9), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCNOVTimesmoke : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xed4abbb5972f50af);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCNOVTimesmoke);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTimesmoke_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                    DB(int64(0xc67fdb594de780c5), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xc67fdb594de780c6), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4efb30e5f16997fd), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTimesmoke_Ambient1);
                DC(int64(0x4efb30e5f16997fd), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCNOVWhatdoyou : UTopic_Hero__GENERIC_ABOUTCAMP_SC_NOV
        {
            default DebugId = int64(0xc2bbabf13f180bf1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCNOVWhatdoyou);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_POQECXC_20240424_164026"), int64(0xc2bbabf13f180bf1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatdoyou_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bc7), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f));
                    DB(int64(0xc67fdb594de780c4), Generic_AboutCamp_SC_NOV != nullptr && Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_NOV, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_NOV != nullptr && !Generic_AboutCamp_SC_NOV.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4efb30e5f16997fc), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatdoyou_Ambient1);
                DC(int64(0x4efb30e5f16997fc), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */