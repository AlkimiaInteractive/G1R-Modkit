#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_OC_GRD : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OC_GRD";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OC_GRD";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_OC_GRD() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetOC_STT_BALAM_324() const property
            {
                return GetCharacter(n"OC_STT_BALAM_324");
            }
            
            AGothicCharacterState GetOC_STT_OMID_325() const property
            {
                return GetCharacter(n"OC_STT_OMID_325");
            }
        }
        
        
        class UChoiceGenericAboutcampOcGrd150664 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x26cbf72826445709);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf7282644570b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf7282644570b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_Couldyoudowith : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e325b);
            default Caption = LocText("Info_Grd_6_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply1)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4836a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x52016d69426fda67), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x56def89a3a04da8c), Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_BALAM_324));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_BALAM_324))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e325d), EConversationDebugInfo::Executing);
                // Could you do with more capable people?
                Hero.AI.Say(LocText("Info_Grd_6_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e325d), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c307), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply1);
                DC(int64(0xa5c77d9ef241c307), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c308), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply2);
                DC(int64(0xa5c77d9ef241c308), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Everyoneworks : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e3283);
            default Caption = LocText("Info_grd_7_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply1)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f482c7), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xbbddf6eaecd6ce8), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x52016d69426fda65), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3285), EConversationDebugInfo::Executing);
                
                // Does everyone here work for Gomez?
                Hero.AI.Say(LocText("Info_grd_7_DasLager_15_00"));
                DC(int64(0x716b63fb436e3285), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef2413388), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply1);
                DC(int64(0xa5c77d9ef2413388), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef2413389), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply2);
                DC(int64(0xa5c77d9ef2413389), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_AboutCamp_OC_GRD_150547,
                    UTopic_Generic_AboutCamp_OC_GRD_150567,
                    UTopic_Generic_AboutCamp_OC_GRD_150589,
                    UTopic_Generic_AboutCamp_OC_GRD_150630
                );
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150547 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f482ac);
            default Caption = LocText("Info_grd_7_DasLager_Buddler_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150547);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply3)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply4)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply5)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply6)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3296), EConversationDebugInfo::Executing);
                // What do the diggers do?
                Hero.AI.Say(LocText("Info_grd_7_DasLager_Buddler_15_00"));
                DC(int64(0x716b63fb436e3296), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241338a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply3);
                DC(int64(0xa5c77d9ef241338a), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241338b), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply4);
                DC(int64(0xa5c77d9ef241338b), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241338c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply5);
                DC(int64(0xa5c77d9ef241338c), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241338d), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply6);
                DC(int64(0xa5c77d9ef241338d), EConversationDebugInfo::Done);
                DC(int64(0x4e041d4835f482b7), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e041d4835f482b7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150567 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f482b0);
            default Caption = LocText("Info_grd_7_DasLager_Schatten_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150567);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply7)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply8)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply9)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply10)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e328f), EConversationDebugInfo::Executing);
                // What do the Shadows do?
                Hero.AI.Say(LocText("Info_grd_7_DasLager_Schatten_15_00"));
                DC(int64(0x716b63fb436e328f), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241338e), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply7);
                DC(int64(0xa5c77d9ef241338e), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241338f), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply8);
                DC(int64(0xa5c77d9ef241338f), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef2413390), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply9);
                DC(int64(0xa5c77d9ef2413390), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef2413391), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply10);
                DC(int64(0xa5c77d9ef2413391), EConversationDebugInfo::Done);
                DC(int64(0x4e041d4835f482af), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e041d4835f482af), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150589 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f482b4);
            default Caption = LocText("Info_grd_7_DasLager_WasIstAerger_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150589);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply11)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply12)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e328a), EConversationDebugInfo::Executing);
                // What do the warders do?
                Hero.AI.Say(LocText("Info_grd_7_DasLager_WasIstAerger_15_00"));
                DC(int64(0x716b63fb436e328a), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef2413392), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply11);
                DC(int64(0xa5c77d9ef2413392), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef2413393), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply12);
                DC(int64(0xa5c77d9ef2413393), EConversationDebugInfo::Done);
                DC(int64(0x4e041d4835f482b3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e041d4835f482b3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150630 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f482c2);
            default Caption = LocText("TEXT_WIP_UAOYHKE_20250204_124807_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e041d4835f482c3), EConversationDebugInfo::Executing);
                // I see.
                Hero.AI.Say(LocText("TEXT_WIP_UAOYHKE_20250204_124807_1609"));
                DC(int64(0x4e041d4835f482c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Howarethings : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e3274);
            default Caption = LocText("Info_Grd_6_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Howarethings_Reply)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3276), EConversationDebugInfo::Executing);
                // How are things?
                Hero.AI.Say(LocText("Info_Grd_6_DieLage_15_00"));
                DC(int64(0x716b63fb436e3276), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c306), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Howarethings_Reply);
                DC(int64(0xa5c77d9ef241c306), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_HowdoIgetin : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e3242);
            default Caption = LocText("Info_grd_13_DasLager_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbbddf6eaecd6ce7), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0x52016d69426fda5d), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x56def89a3a04da8a), Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_OMID_325));
                }
                
                if (G1R.Thorus_Permission_Exterior != 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_OMID_325))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3244), EConversationDebugInfo::Executing);
                
                // How do I get into the castle?
                Hero.AI.Say(LocText("Info_grd_13_DasLager_15_00"));
                DC(int64(0x716b63fb436e3244), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c357), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply1);
                DC(int64(0xa5c77d9ef241c357), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_AboutCamp_OC_GRD_150400,
                    UTopic_Generic_AboutCamp_OC_GRD_150420,
                    UTopic_Generic_AboutCamp_OC_GRD_150485,
                    UTopic_Generic_AboutCamp_OC_GRD_150509
                );
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150400 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f48288);
            default Caption = LocText("Info_grd_13_DasLager_GomezSprechen_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150400);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply2)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf25088c9fb7f0c80), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3253), EConversationDebugInfo::Executing);
                // And if I wanna talk to Gomez?
                Hero.AI.Say(LocText("Info_grd_13_DasLager_GomezSprechen_15_00"));
                DC(int64(0x716b63fb436e3253), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c358), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply2);
                DC(int64(0xa5c77d9ef241c358), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c359), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply3);
                DC(int64(0xa5c77d9ef241c359), EConversationDebugInfo::Done);
                DC(int64(0x4e041d4835f4828b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e041d4835f4828b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150420 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f4828c);
            default Caption = LocText("Info_grd_13_DasLager_WachenBestechen_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150420);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply4)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply5)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply6)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply7)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e324b), EConversationDebugInfo::Executing);
                // And if I bribe the guards?
                Hero.AI.Say(LocText("Info_grd_13_DasLager_WachenBestechen_15_00"));
                DC(int64(0x716b63fb436e324b), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c35a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply4);
                DC(int64(0xa5c77d9ef241c35a), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c35b), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply5);
                DC(int64(0xa5c77d9ef241c35b), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c35c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply6);
                DC(int64(0xa5c77d9ef241c35c), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c35e), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply7);
                DC(int64(0xa5c77d9ef241c35e), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3250), EConversationDebugInfo::Executing);
                
                // I was just curious.
                Hero.AI.Say(LocText("Info_grd_13_DasLager_WachenBestechen_15_05"));
                DC(int64(0x716b63fb436e3250), EConversationDebugInfo::Done);
                DC(int64(0x4e041d4835f48299), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e041d4835f48299), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150485 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f4829c);
            default Caption = LocText("Info_grd_13_EinerVonEuchWerden_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150485);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply8)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf25088c9fb7f0c82), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e323c), EConversationDebugInfo::Executing);
                // I wanna join the warders.
                Hero.AI.Say(LocText("Info_grd_13_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e323c), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c35f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply8);
                DC(int64(0xa5c77d9ef241c35f), EConversationDebugInfo::Done);
                DC(int64(0x4e041d4835f482a4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e041d4835f482a4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150509 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f482a1);
            default Caption = LocText("Info_grd_13_DasLager_Verstehe_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3248), EConversationDebugInfo::Executing);
                // I see.
                Hero.AI.Say(LocText("Info_grd_13_DasLager_Verstehe_15_00"));
                DC(int64(0x716b63fb436e3248), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_HowIJoin : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e3278);
            default Caption = LocText("Info_grd_7_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("Info_grd_7_DasLager_WasIstAerger_15_00"), int64(0x716b63fb436e3278));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply1)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply2)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbbddf6eaecd6cec), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x52016d69426fda64), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e327a), EConversationDebugInfo::Executing);
                // What do I have to do to become one of Gomez's warders?
                Hero.AI.Say(LocText("Info_grd_7_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e327a), EConversationDebugInfo::Done);
                DC(int64(0x53f38cbc601854), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply1);
                DC(int64(0x53f38cbc601854), EConversationDebugInfo::Done);
                DC(int64(0x53f38cbc601855), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply2);
                DC(int64(0x53f38cbc601855), EConversationDebugInfo::Done);
                DC(int64(0x53f38cbc601856), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply3);
                DC(int64(0x53f38cbc601856), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Howsitgoing : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e329b);
            default Caption = LocText("Info_grd_7_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Howsitgoing_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x909d787f487fbb9d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e329d), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_grd_7_DieLage_15_00"));
                DC(int64(0x716b63fb436e329d), EConversationDebugInfo::Done);
                DC(int64(0x53f38cbc601857), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Howsitgoing_Reply1);
                DC(int64(0x53f38cbc601857), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Imnewhere : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e3264);
            default Caption = LocText("Info_Grd_6_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply1)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48369), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x52016d69426fda63), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x56def89a3a04da8b), Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_BALAM_324));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_BALAM_324))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3266), EConversationDebugInfo::Executing);
                
                // I'm new here.
                Hero.AI.Say(LocText("Info_Grd_6_DasLager_15_00"));
                DC(int64(0x716b63fb436e3266), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c301), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply1);
                DC(int64(0xa5c77d9ef241c301), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3268), EConversationDebugInfo::Executing);
                
                // What's the word, then?
                Hero.AI.Say(LocText("Info_Grd_6_DasLager_15_02"));
                DC(int64(0x716b63fb436e3268), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c302), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply2);
                DC(int64(0xa5c77d9ef241c302), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_AboutCamp_OC_GRD_150655,
                    UTopic_Generic_AboutCamp_OC_GRD_150675
                );
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150655 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f482c9);
            default Caption = LocText("Info_Grd_6_DasLager_WasIstAerger_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150655);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply3)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply4)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply5)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e326f), EConversationDebugInfo::Executing);
                // What do you mean by trouble?
                Hero.AI.Say(LocText("Info_Grd_6_DasLager_WasIstAerger_15_00"));
                DC(int64(0x716b63fb436e326f), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c303), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply3);
                DC(int64(0xa5c77d9ef241c303), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c304), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply4);
                DC(int64(0xa5c77d9ef241c304), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c305), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply5);
                DC(int64(0xa5c77d9ef241c305), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3273), EConversationDebugInfo::Executing);
                
                // All right, all right, I get it.
                Hero.AI.Say(LocText("Info_Grd_6_DasLager_WasIstAerger_15_04"));
                DC(int64(0x716b63fb436e3273), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_GRD_150675 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x4e041d4835f482cd);
            default Caption = LocText("Info_Grd_6_DasLager_Verstehe_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_GRD_150675);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e326c), EConversationDebugInfo::Executing);
                // Got it.
                Hero.AI.Say(LocText("Info_Grd_6_DasLager_Verstehe_15_00"));
                DC(int64(0x716b63fb436e326c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Iseverything : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e3256);
            default Caption = LocText("Info_grd_13_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply1)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xf25088c9fb7f0c83), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3258), EConversationDebugInfo::Executing);
                // Is everything all right?
                Hero.AI.Say(LocText("Info_grd_13_DieLage_15_00"));
                DC(int64(0x716b63fb436e3258), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c33e), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply1);
                DC(int64(0xa5c77d9ef241c33e), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c33f), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply2);
                DC(int64(0xa5c77d9ef241c33f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Whogivesorders : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e3260);
            default Caption = LocText("Info_Grd_6_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whogivesorders_Reply)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbbddf6eaecd6cee), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xbbddf6eaecd6cef), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x52016d69426fda68), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0x56def89a3a04da8d), Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_BALAM_324));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.IsCharacter(OC_STT_BALAM_324))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3262), EConversationDebugInfo::Executing);
                
                // Who gives orders around here?
                Hero.AI.Say(LocText("Info_Grd_6_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3262), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c309), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whogivesorders_Reply);
                DC(int64(0xa5c77d9ef241c309), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_whohasthesay : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x716b63fb436e323e);
            default Caption = LocText("Info_grd_13_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_whohasthesay_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3240), EConversationDebugInfo::Executing);
                
                // Who has the say around here?
                Hero.AI.Say(LocText("Info_grd_13_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3240), EConversationDebugInfo::Done);
                DC(int64(0xa5c77d9ef241c356), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_whohasthesay_Reply1);
                DC(int64(0xa5c77d9ef241c356), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCGRDAskme : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0xed4abbb5972f50c6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCGRDAskme);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0xed4abbb5972f50c6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDAskme_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f50e6), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0xed4abbb5972f5124), G1R != nullptr && G1R.IsInChapter(4));
                    DB(int64(0xed4abbb5972f51cb), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 600.0f));
                    DB(int64(0x84d1d57ac748dfbb), Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice45));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 600.0f))
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice45))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab863), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDAskme_Ambient1);
                DC(int64(0x4eec0d260e3ab863), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCGRDCameBack : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x36d532d724ac1906);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCGRDCameBack);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac1906));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDCameBack_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 700.0f));
                    DB(int64(0x84d1d57ac748dfb7), Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice28));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice28))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab85f), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDCameBack_Ambient1);
                DC(int64(0x4eec0d260e3ab85f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCGRDLoonswork : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0xed4abbb5972f50c2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCGRDLoonswork);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0xed4abbb5972f50c2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDLoonswork_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f50e6), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0xed4abbb5972f5124), G1R != nullptr && G1R.IsInChapter(4));
                    DB(int64(0xed4abbb5972f51cb), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 600.0f));
                    DB(int64(0x84d1d57ac748dfba), Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice43));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 600.0f))
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice43))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab862), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDLoonswork_Ambient1);
                DC(int64(0x4eec0d260e3ab862), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCGRDMercs : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0xed4abbb5972f50cc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCGRDMercs);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0xed4abbb5972f50cc));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDMercs_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f50e6), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0xed4abbb5972f5124), G1R != nullptr && G1R.IsInChapter(4));
                    DB(int64(0xed4abbb5972f51cb), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 600.0f));
                    DB(int64(0x84d1d57ac748dfbc), Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice49));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 600.0f))
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice49))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab864), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDMercs_Ambient1);
                DC(int64(0x4eec0d260e3ab864), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCGRDUpstart : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x36d532d724ac190a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCGRDUpstart);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac190a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDUpstart_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 700.0f));
                    DB(int64(0x84d1d57ac748dfb8), Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice29));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice29))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab860), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDUpstart_Ambient1);
                DC(int64(0x4eec0d260e3ab860), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCGRDWrongguy : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x36d532d724ac190e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCGRDWrongguy);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac190e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDWrongguy_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 700.0f));
                    DB(int64(0x84d1d57ac748dfb9), Generic_AboutCamp_OC_GRD != nullptr && Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice37));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_GRD, 700.0f))
                    return false;
                
                if (Generic_AboutCamp_OC_GRD != nullptr && !Generic_AboutCamp_OC_GRD.HasVoicetype(GameplayTag::VoiceType_G1R_Voice37))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab861), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDWrongguy_Ambient1);
                DC(int64(0x4eec0d260e3ab861), EConversationDebugInfo::Done);
            }
        }
        
        
        class UWhostheboss : UTopic_Hero__GENERIC_ABOUTCAMP_OC_GRD
        {
            default DebugId = int64(0x230658702d4ff57b);
            default Caption = LocText("TEXT_WIP_PLUVJRE_20250317_104950");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply1)) return false;
                if (!Generic_AboutCamp_OC_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbbddf6eaecd6cea), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xbbddf6eaecd6ceb), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0x52016d69426fda61), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x230658702d4ff579), EConversationDebugInfo::Executing);
                
                // Who calls the shots around here?
                Hero.AI.Say(LocText("TEXT_WIP_PLUVJRE_20250317_104950"));
                DC(int64(0x230658702d4ff579), EConversationDebugInfo::Done);
                DC(int64(0x230658702d4ff582), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply1);
                DC(int64(0x230658702d4ff582), EConversationDebugInfo::Done);
                DC(int64(0x230658702d4ff583), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply2);
                DC(int64(0x230658702d4ff583), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */