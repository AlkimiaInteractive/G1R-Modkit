#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_OC_VLK : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OC_VLK";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OC_VLK";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_OC_VLK() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampOcVlk150742 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x26cbf7282644571a);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf7282644571c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf7282644571c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_Allgood : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e3319);
            default Caption = LocText("Info_Vlk_4_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Allgood_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e331b), EConversationDebugInfo::Executing);
                // All good?
                Hero.AI.Say(LocText("Info_Vlk_4_DieLage_15_00"));
                DC(int64(0x716b63fb436e331b), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc5), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Allgood_Reply1);
                DC(int64(0xc6e6ecc0ab64fcc5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Howarethingshe : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32ff);
            default Caption = LocText("Info_Vlk_3_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3301), EConversationDebugInfo::Executing);
                
                // How are things?
                Hero.AI.Say(LocText("Info_Vlk_3_DieLage_15_00"));
                DC(int64(0x716b63fb436e3301), EConversationDebugInfo::Done);
                DC(int64(0x32f73a39976958fc), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply1);
                DC(int64(0x32f73a39976958fc), EConversationDebugInfo::Done);
                DC(int64(0x32f73a39976958fd), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply2);
                DC(int64(0x32f73a39976958fd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_HowcanIget : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32cb);
            default Caption = LocText("Info_Vlk_1_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48324), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xd5c761130200c209), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09df), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32cd), EConversationDebugInfo::Executing);
                
                // How can I get accepted into the Camp?
                Hero.AI.Say(LocText("Info_Vlk_1_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e32cd), EConversationDebugInfo::Done);
                DC(int64(0xbef25f0c983b), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply1);
                DC(int64(0xbef25f0c983b), EConversationDebugInfo::Done);
                DC(int64(0xbef25f0c983c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply2);
                DC(int64(0xbef25f0c983c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_HowCanIJoin : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32f1);
            default Caption = LocText("Info_Vlk_3_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowCanIJoin_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48375), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xd5c761130200c20e), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e3), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32f3), EConversationDebugInfo::Executing);
                
                // How can I join this Camp?
                Hero.AI.Say(LocText("Info_Vlk_3_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e32f3), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcbc), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowCanIJoin_Reply1);
                DC(int64(0xc6e6ecc0ab64fcbc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Howsitgoinghe : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32d9);
            default Caption = LocText("Info_Vlk_1_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howsitgoinghe_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32db), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Vlk_1_DieLage_15_00"));
                DC(int64(0x716b63fb436e32db), EConversationDebugInfo::Done);
                DC(int64(0xdf894692605856c4), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howsitgoinghe_Reply1);
                DC(int64(0xdf894692605856c4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Importantplaces : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e3311);
            default Caption = LocText("Info_Vlk_4_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply2)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply3)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply4)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48370), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0xd5c761130200c207), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09db), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3313), EConversationDebugInfo::Executing);
                
                // What are the important places here?
                Hero.AI.Say(LocText("Info_Vlk_4_DasLager_15_00"));
                DC(int64(0x716b63fb436e3313), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcbd), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply1);
                DC(int64(0xc6e6ecc0ab64fcbd), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcbe), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply2);
                DC(int64(0xc6e6ecc0ab64fcbe), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcbf), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply3);
                DC(int64(0xc6e6ecc0ab64fcbf), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3317), EConversationDebugInfo::Executing);
                
                // So they leave the castle? When?
                Hero.AI.Say(LocText("Info_Vlk_4_DasLager_15_04"));
                DC(int64(0x716b63fb436e3317), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc0), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply4);
                DC(int64(0xc6e6ecc0ab64fcc0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Issomething : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32d4);
            default Caption = LocText("Info_Vlk_1_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09de), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32d6), EConversationDebugInfo::Executing);
                
                // Is there something more interesting here than a bunch of ...
                Hero.AI.Say(LocText("Info_Vlk_1_DasLager_15_00"));
                DC(int64(0x716b63fb436e32d6), EConversationDebugInfo::Done);
                DC(int64(0xbef25f0c9836), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply1);
                DC(int64(0xbef25f0c9836), EConversationDebugInfo::Done);
                DC(int64(0xbef25f0c9837), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply2);
                DC(int64(0xbef25f0c9837), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Isthereanyone : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e330c);
            default Caption = LocText("Info_Vlk_4_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09dd), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e330e), EConversationDebugInfo::Executing);
                
                // Is there anyone here I should know?
                Hero.AI.Say(LocText("Info_Vlk_4_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e330e), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc6), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply1);
                DC(int64(0xc6e6ecc0ab64fcc6), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc7), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply2);
                DC(int64(0xc6e6ecc0ab64fcc7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Iwannajoin : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32dd);
            default Caption = LocText("Info_Vlk_2_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Iwannajoin_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48374), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xd5c761130200c20d), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e6), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32df), EConversationDebugInfo::Executing);
                
                // I wanna join you guys.
                Hero.AI.Say(LocText("Info_Vlk_2_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e32df), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb1), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Iwannajoin_Reply1);
                DC(int64(0xc6e6ecc0ab64fcb1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Iwannaknow : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32e6);
            default Caption = LocText("Info_Vlk_2_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Iwannaknow_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48372), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xd5c761130200c20a), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e4), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32e8), EConversationDebugInfo::Executing);
                
                // I wanna know more about this Camp.
                Hero.AI.Say(LocText("Info_Vlk_2_DasLager_15_00"));
                DC(int64(0x716b63fb436e32e8), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcad), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Iwannaknow_Reply1);
                DC(int64(0xc6e6ecc0ab64fcad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_WhatdoIhave : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e3304);
            default Caption = LocText("Info_Vlk_4_EinerVonEuchWerden_15_01");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply2)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply3)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply4)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48323), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xd5c761130200c208), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09dc), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3308), EConversationDebugInfo::Executing);
                
                // What do I have to do to join this Camp?
                Hero.AI.Say(LocText("Info_Vlk_4_EinerVonEuchWerden_15_01"));
                DC(int64(0x716b63fb436e3308), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc1), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply1);
                DC(int64(0xc6e6ecc0ab64fcc1), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc2), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply2);
                DC(int64(0xc6e6ecc0ab64fcc2), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc3), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply3);
                DC(int64(0xc6e6ecc0ab64fcc3), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3306), EConversationDebugInfo::Executing);
                
                // Thanks. Take care.
                Hero.AI.Say(LocText("Info_Vlk_4_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e3306), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcc4), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply4);
                DC(int64(0xc6e6ecc0ab64fcc4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Whatslife : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32ea);
            default Caption = LocText("Info_Vlk_2_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply2)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48373), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xd5c761130200c20c), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e5), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32ec), EConversationDebugInfo::Executing);
                
                // What's life like here?
                Hero.AI.Say(LocText("Info_Vlk_2_DieLage_15_00"));
                DC(int64(0x716b63fb436e32ec), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcae), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply1);
                DC(int64(0xc6e6ecc0ab64fcae), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcaf), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply2);
                DC(int64(0xc6e6ecc0ab64fcaf), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e32ef), EConversationDebugInfo::Executing);
                
                // No one sent me. I'm new here.
                Hero.AI.Say(LocText("Info_Vlk_2_DieLage_15_03"));
                DC(int64(0x716b63fb436e32ef), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb0), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply3);
                DC(int64(0xc6e6ecc0ab64fcb0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Whereareplaces : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32fa);
            default Caption = LocText("Info_Vlk_3_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e2), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32fc), EConversationDebugInfo::Executing);
                
                // What are the important places here?
                Hero.AI.Say(LocText("Info_Vlk_3_DasLager_15_00"));
                DC(int64(0x716b63fb436e32fc), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb8), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply1);
                DC(int64(0xc6e6ecc0ab64fcb8), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb9), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply2);
                DC(int64(0xc6e6ecc0ab64fcb9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Whoischarge : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32e1);
            default Caption = LocText("Info_Vlk_2_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e7), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32e3), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Vlk_2_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e32e3), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb2), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply1);
                DC(int64(0xc6e6ecc0ab64fcb2), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb3), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply2);
                DC(int64(0xc6e6ecc0ab64fcb3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Whorunsthis : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32d0);
            default Caption = LocText("Info_Vlk_1_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whorunsthis_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd5c761130200c1e7), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e0), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32d2), EConversationDebugInfo::Executing);
                
                // Who runs this place?
                Hero.AI.Say(LocText("Info_Vlk_1_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e32d2), EConversationDebugInfo::Done);
                DC(int64(0xe82c616501e0377b), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whorunsthis_Reply1);
                DC(int64(0xe82c616501e0377b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Whostheboss : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x716b63fb436e32f5);
            default Caption = LocText("Info_Vlk_3_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply1)) return false;
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48371), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xd5c761130200c20b), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0xfcd18cba3c5d09e1), Generic_AboutCamp_OC_VLK != nullptr && !Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Generic_AboutCamp_OC_VLK != nullptr && Generic_AboutCamp_OC_VLK.IsCloseToWaypoint(n"WP_Generic_Diggers_OC", 5000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32f7), EConversationDebugInfo::Executing);
                
                // Who's the boss here?
                Hero.AI.Say(LocText("Info_Vlk_3_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e32f7), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb6), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply1);
                DC(int64(0xc6e6ecc0ab64fcb6), EConversationDebugInfo::Done);
                DC(int64(0xc6e6ecc0ab64fcb7), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply2);
                DC(int64(0xc6e6ecc0ab64fcb7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCVLKDonttalk : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x36d532d724ac18f6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCVLKDonttalk);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac18f6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKDonttalk_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f222b4b7ac207cb), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKDonttalk_Ambient1);
                DC(int64(0x4f222b4b7ac207cb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCVLKFalling : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x36d532d724ac18ea);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCVLKFalling);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac18ea));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKFalling_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f222b4b7ac207c8), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKFalling_Ambient1);
                DC(int64(0x4f222b4b7ac207c8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCVLKMug : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x36d532d724ac18f2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCVLKMug);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac18f2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKMug_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f222b4b7ac207ca), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKMug_Ambient1);
                DC(int64(0x4f222b4b7ac207ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCVLKWhat : UTopic_Hero__GENERIC_ABOUTCAMP_OC_VLK
        {
            default DebugId = int64(0x36d532d724ac18ee);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCVLKWhat);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac18ee));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKWhat_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_VLK, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f222b4b7ac207c9), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKWhat_Ambient1);
                DC(int64(0x4f222b4b7ac207c9), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */