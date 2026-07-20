#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_FINDNPC : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_FINDNPC";
        }
        
        
        class UTopic_Hero__GENERIC_FINDNPC : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_FINDNPC";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_FindNPC() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UTopic_Generic_FindNPC_FindNPC : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa3301);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134345");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9aa68), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a87b), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a952), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9c7), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_8_WichtigePersonen_15_00")));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9d1), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_WichtigePersonen_15_00")));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9fa), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_6_EinerVonEuchWerden_15_00")));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xe3e8ff487e987369), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_DIEGO_JOINOLDCAMP_11_01")));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xe3e8ff487e987354), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe3e8ff487e98736b), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a949), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe3e8ff487e98736c), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a87c), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a860), G1R != nullptr && G1R.IsInChapter(6));
                    DB(int64(0xe34d1bb98fc9a954), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a955), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a956), Quest::SwampCamp_SCCHAPTER2_MEETYBERION != nullptr && Quest::SwampCamp_SCCHAPTER2_MEETYBERION.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a965), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a966), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a97a), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a965), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a966), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a98d), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a9db), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9dc), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_EinerVonEuchWerden_15_00")));
                    DB(int64(0xe34d1bb98fc9a9ec), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9ed), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_13_WichtigePersonen_15_00")));
                    DB(int64(0xe34d1bb98fc9aa02), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9aa03), Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.HasSucceeded());
                    DB(int64(0xe34d1bb98fc9aa05), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9aa0a), Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")));
                }
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted() && Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_8_WichtigePersonen_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_WichtigePersonen_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_6_EinerVonEuchWerden_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("INFO_DIEGO_JOINOLDCAMP_11_01")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && G1R != nullptr && !G1R.HasReachedChapter(3))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && !G1R.HasReachedChapter(3) && Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && !G1R.HasReachedChapter(3) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R != nullptr && G1R.IsInChapter(6))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted() && Quest::SwampCamp_SCCHAPTER2_MEETYBERION != nullptr && Quest::SwampCamp_SCCHAPTER2_MEETYBERION.HasBeenStarted())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && !G1R.HasReachedChapter(3) && Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasBeenStarted())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && !G1R.HasReachedChapter(3) && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_EinerVonEuchWerden_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_13_WichtigePersonen_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.HasSucceeded())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Generic_FindNPC_121248,
                    UTopic_Generic_FindNPC_121268,
                    UTopic_Generic_FindNPC_121290,
                    UTopic_Generic_FindNPC_121310,
                    UTopic_Generic_FindNPC_121330,
                    UTopic_Generic_FindNPC_121350,
                    UTopic_Generic_FindNPC_121370,
                    UTopic_Generic_FindNPC_121414,
                    UTopic_Generic_FindNPC_121434,
                    UTopic_Generic_FindNPC_121623
                );
            }
        }
        
        
        class UTopic_Generic_FindNPC_121248 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa3304);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134402");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindDiego_LocationDiego)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xe3e8ff487e987354), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Generic_FindNPC != nullptr && !Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c67421127), EConversationDebugInfo::Executing);
                // Where can I find Diego?
                Hero.AI.Say(LocText("Info_FindNPC_Diego_15_00"));
                DC(int64(0x7ffb6c9c67421127), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c67421128), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindDiego_LocationDiego);
                DC(int64(0x7ffb6c9c67421128), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3331), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3331), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121268 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa3308);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134402_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_DIEGO_JOINOLDCAMP_11_01"), int64(0xfffa238278fa3308));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindThorus_LocationThorus)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                return Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c6742112b), EConversationDebugInfo::Executing);
                // Where can I find Thorus?
                Hero.AI.Say(LocText("Info_FindNPC_OC_Thorus_15_00"));
                DC(int64(0x7ffb6c9c6742112b), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c6742112f), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindThorus_LocationThorus);
                DC(int64(0x7ffb6c9c6742112f), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3332), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3332), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121290 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa330c);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134415");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindLares_LocationLares)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9fa), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_6_EinerVonEuchWerden_15_00")));
                    DB(int64(0xe34d1bb98fc9aa02), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9aa03), Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.HasSucceeded());
                    DB(int64(0xe34d1bb98fc9aa05), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9aa0a), Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")));
                }
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_6_EinerVonEuchWerden_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.HasSucceeded())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c6742113c), EConversationDebugInfo::Executing);
                // Where can I find Lares?
                Hero.AI.Say(LocText("Info_FindNPC_NC_Lares_15_00"));
                DC(int64(0x7ffb6c9c6742113c), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c6742113d), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindLares_LocationLares);
                DC(int64(0x7ffb6c9c6742113d), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3333), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3333), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121310 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa3310);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134416");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindLee_LocationLee)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9c7), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_8_WichtigePersonen_15_00")));
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9d1), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_WichtigePersonen_15_00")));
                    DB(int64(0xe34d1bb98fc9a9db), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9dc), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_EinerVonEuchWerden_15_00")));
                    DB(int64(0xe34d1bb98fc9a9ec), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a9ed), Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_13_WichtigePersonen_15_00")));
                }
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_8_WichtigePersonen_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_WichtigePersonen_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Sld_11_EinerVonEuchWerden_15_00")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.HasListenedTo(LocText("Info_Org_13_WichtigePersonen_15_00")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c67427e93), EConversationDebugInfo::Executing);
                // Where can I find Lee?
                Hero.AI.Say(LocText("Info_FindNPC_NC_Lee_15_00"));
                DC(int64(0x7ffb6c9c67427e93), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c67427e94), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindLee_LocationLee);
                DC(int64(0x7ffb6c9c67427e94), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3334), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3334), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121330 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa3314);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134418");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindNCMage_LocationNCMage)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9aa68), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                }
                
                if (Generic_FindNPC != nullptr && !Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c67427e99), EConversationDebugInfo::Executing);
                // Where can I find a mage?
                Hero.AI.Say(LocText("Info_FindNPC_NC_Cronos_15_00"));
                DC(int64(0x7ffb6c9c67427e99), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c67427e9e), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindNCMage_LocationNCMage);
                DC(int64(0x7ffb6c9c67427e9e), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3335), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3335), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121350 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa3318);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134419");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindGorn_LocationGorn)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xe34d1bb98fc9a860), G1R != nullptr && G1R.IsInChapter(6));
                }
                
                if (Generic_FindNPC != nullptr && !Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(6))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c67427ea1), EConversationDebugInfo::Executing);
                // Where can I find Gorn?
                Hero.AI.Say(LocText("Info_FindNPC_NC_Gorn_15_00"));
                DC(int64(0x7ffb6c9c67427ea1), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c67427ea2), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindGorn_LocationGorn);
                DC(int64(0x7ffb6c9c67427ea2), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3336), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3336), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121370 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa331c);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134421");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindCorAngar_LocationCorAngar)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe3e8ff487e98736c), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a87c), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                }
                
                if (Generic_FindNPC != nullptr && !Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c67421137), EConversationDebugInfo::Executing);
                // Where can I find Cor Angar?
                Hero.AI.Say(LocText("Info_FindNPC_ST_CorAngar_15_00"));
                DC(int64(0x7ffb6c9c67421137), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c67421138), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindCorAngar_LocationCorAngar);
                DC(int64(0x7ffb6c9c67421138), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3337), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3337), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121414 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa3326);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134631");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindCorKalom_LocationCorKalom)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe3e8ff487e98736b), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a949), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")));
                    DB(int64(0xe34d1bb98fc9a965), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a966), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a97a), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a965), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a966), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xe34d1bb98fc9a98d), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted());
                }
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && !G1R.HasReachedChapter(3) && Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && !G1R.HasReachedChapter(3) && Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasBeenStarted())
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && !G1R.HasReachedChapter(3) && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c67427ea7), EConversationDebugInfo::Executing);
                // Where can I find Cor Kalom?
                Hero.AI.Say(LocText("Info_FindNPC_ST_CorKalom_15_00"));
                DC(int64(0x7ffb6c9c67427ea7), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c67427ea8), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindCorKalom_LocationCorKalom);
                DC(int64(0x7ffb6c9c67427ea8), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3338), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3338), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121434 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa332a);
            default Caption = LocText("TEXT_WIP_QMUAERD_20241204_134632");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_FindNPC.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindYBerion_LocationYberion)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ffb6c9c67421135), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a87b), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a952), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")));
                    DB(int64(0xe34d1bb98fc9a954), Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xe34d1bb98fc9a955), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                    DB(int64(0xe34d1bb98fc9a956), Quest::SwampCamp_SCCHAPTER2_MEETYBERION != nullptr && Quest::SwampCamp_SCCHAPTER2_MEETYBERION.HasBeenStarted());
                }
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted() && Hero != nullptr && Hero.HasListenedTo(LocText("DIA_LESTER_WANNAJOIN_05_01")))
                    return true;
                
                if (Generic_FindNPC != nullptr && Generic_FindNPC.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted() && Quest::SwampCamp_SCCHAPTER2_MEETYBERION != nullptr && Quest::SwampCamp_SCCHAPTER2_MEETYBERION.HasBeenStarted())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ffb6c9c67427eab), EConversationDebugInfo::Executing);
                // Where can I find Y'Berion?
                Hero.AI.Say(LocText("Info_FindNPC_ST_YBerion_15_00"));
                DC(int64(0x7ffb6c9c67427eab), EConversationDebugInfo::Done);
                DC(int64(0x7ffb6c9c67427eac), EConversationDebugInfo::Executing);
                
                Generic_FindNPC.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindYBerion_LocationYberion);
                DC(int64(0x7ffb6c9c67427eac), EConversationDebugInfo::Done);
                DC(int64(0xfffa238278fa3339), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfffa238278fa3339), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_FindNPC_121623 : UTopic_Hero__GENERIC_FINDNPC
        {
            default DebugId = int64(0xfffa238278fa333a);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */