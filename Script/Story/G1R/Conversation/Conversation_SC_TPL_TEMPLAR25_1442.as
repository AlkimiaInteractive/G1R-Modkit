#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR25_1442 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR25_1442";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR25_1442 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR25_1442";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTpl1442Attack : UTopic_Hero__SC_TPL_TEMPLAR25_1442
        {
            default DebugId = int64(0x90ed9b8996fb5bd3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_SC_TEMPLE_ENTRANCE", 100.0f, int64(0x90ed9b8996fb5bd3));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x90ed9b8996fb5bd4), G1R.GuardPassageWarning_SC == 2);
                    DB(int64(0x90ed9b8996fb5bd5), G1R.SwampCampTemple_Permision == 0);
                    DB(int64(0x90ed9b8996fb5bd7), Templar != nullptr && Templar.IsAtPreferredLocation(300.0f));
                }
                
                if (G1R.GuardPassageWarning_SC != 2)
                    return false;
                
                if (G1R.SwampCampTemple_Permision != 0)
                    return false;
                
                if (Templar != nullptr && !Templar.IsAtPreferredLocation(300.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e953c06636e3d5d), EConversationDebugInfo::Executing);
                Templar.AI.StartAttackingImmediately(Hero);
                DC(int64(0x1e953c06636e3d5d), EConversationDebugInfo::Done);
                DC(int64(0x90ed9b8996fb5bdd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x90ed9b8996fb5bdd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1442Firstwarn : UTopic_Hero__SC_TPL_TEMPLAR25_1442
        {
            default DebugId = int64(0x90ed9b8996fb5bbd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x90ed9b8996fb5bbe), G1R.GuardPassageWarning_SC == 0);
                    DB(int64(0x90ed9b8996fb5bbf), G1R.SwampCampTemple_Permision == 0);
                    DB(int64(0x90ed9b8996fb5bc0), Templar != nullptr && Templar.IsAtPreferredLocation(300.0f));
                }
                
                if (G1R.GuardPassageWarning_SC != 0)
                    return false;
                
                if (G1R.SwampCampTemple_Permision != 0)
                    return false;
                
                if (Templar != nullptr && !Templar.IsAtPreferredLocation(300.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x90ed9b8996fb5bc1), EConversationDebugInfo::Executing);
                // Halt. No one gets into the temple without explicit ...
                Templar.AI.Say(LocText("INFO_TPL_1442_FIRSTWARN_13_01"));
                DC(int64(0x90ed9b8996fb5bc1), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e445f), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_SC = 1;
                DC(int64(0x1e953c06636e445f), EConversationDebugInfo::Done);
                DB(int64(0x90ed9b8996fb5bc3), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_RWAGUXL_20240314_153447")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_RWAGUXL_20240314_153447")))
                {
                    Subdialog(
                        UChoiceTpl1442FirstwarnConditionYberion,
                        UChoiceTpl1442FirstwarnConditionLester
                    );
                }
                else
                {
                    DC(int64(0x90ed9b8996fb5bcc), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x90ed9b8996fb5bcc), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceTpl1442FirstwarnConditionYberion : UTopic_Hero__SC_TPL_TEMPLAR25_1442
        {
            default DebugId = int64(0xe8603e87342bfc6f);
            default Caption = LocText("INFO_TPL_1442_FIRSTWARN_CONDITION_YBERION_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceTpl1442FirstwarnConditionYberion);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_RWAGUXL_20240314_153447"), int64(0xe8603e87342bfc6f));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x90ed9b8996fb5bc7), EConversationDebugInfo::Executing);
                // Y'Berion himself asked to see me. 
                Hero.AI.Say(LocText("INFO_TPL_1442_FIRSTWARN_CONDITION_YBERION_15_01"));
                DC(int64(0x90ed9b8996fb5bc7), EConversationDebugInfo::Done);
                DC(int64(0x90ed9b8996fb5bc8), EConversationDebugInfo::Executing);
                
                // Of course he did.
                Templar.AI.Say(LocText("INFO_TPL_1442_FIRSTWARN_CONDITION_YBERION_13_02"));
                DC(int64(0x90ed9b8996fb5bc8), EConversationDebugInfo::Done);
                DB(int64(0xcdabb63887226777), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0xcdabb6388722677b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                DB(int64(0xcdabb6388722677c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0xcdabb6388722677e), EConversationDebugInfo::Executing);
                    // I'm sure he couldn't wait to have a SHADOW join him in ...
                    Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_193646_2785"));
                    DC(int64(0xcdabb6388722677e), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0xcdabb63887226781), EConversationDebugInfo::Executing);
                    // I'm sure he couldn't wait to have a BANDIT join him in ...
                    Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_193734_3436"));
                    DC(int64(0xcdabb63887226781), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xcdabb63887226788), EConversationDebugInfo::Executing);
                    // I'm sure he couldn't wait to have a green-eared NOVICE ...
                    Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_193816_3286"));
                    DC(int64(0xcdabb63887226788), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xcdabb6388722678b), EConversationDebugInfo::Executing);
                    // I'm sure he couldn't wait to have some infidel join him ...
                    Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_193938_686"));
                    DC(int64(0xcdabb6388722678b), EConversationDebugInfo::Done);
                }
                DC(int64(0xcdabb6388722678e), EConversationDebugInfo::Executing);
                // Next time you lie to me, I'll cut your tongue out. Now ...
                Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_194003_2386"));
                DC(int64(0xcdabb6388722678e), EConversationDebugInfo::Done);
                DC(int64(0x8dac6e9f52279546), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x8dac6e9f52279546), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1442FirstwarnConditionLester : UTopic_Hero__SC_TPL_TEMPLAR25_1442
        {
            default DebugId = int64(0xe8603e87342bfc75);
            default Caption = LocText("INFO_TPL_1442_FIRSTWARN_CONDITION_LESTER_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x90ed9b8996fb5bca), EConversationDebugInfo::Executing);
                // Cor Kalom sent me. 
                Hero.AI.Say(LocText("INFO_TPL_1442_FIRSTWARN_CONDITION_LESTER_15_01"));
                DC(int64(0x90ed9b8996fb5bca), EConversationDebugInfo::Done);
                DC(int64(0x90ed9b8996fb5bcb), EConversationDebugInfo::Executing);
                
                // I'm SURE he did. What else-
                Templar.AI.Say(LocText("INFO_TPL_1442_FIRSTWARN_CONDITION_LESTER_13_02"));
                DC(int64(0x90ed9b8996fb5bcb), EConversationDebugInfo::Done);
                DC(int64(0xcdabb63887226794), EConversationDebugInfo::Executing);
                // Hm, wait a minute. Are you that freshie they just threw ...
                Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_194747"));
                DC(int64(0xcdabb63887226794), EConversationDebugInfo::Done);
                DC(int64(0xcdabb63887226795), EConversationDebugInfo::Executing);
                
                // Could be. 
                Hero.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_194816"));
                DC(int64(0xcdabb63887226795), EConversationDebugInfo::Done);
                DC(int64(0x377bb24005675132), EConversationDebugInfo::Executing);
                
                // Interesting. Don't ask me how, but Master Y'Berion ...
                Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_201433"));
                DC(int64(0x377bb24005675132), EConversationDebugInfo::Done);
                DC(int64(0x377bb24005675133), EConversationDebugInfo::Executing);
                // Go on in. But I'm warning you - you try anything, and ...
                Templar.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_201518"));
                DC(int64(0x377bb24005675133), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e4463), EConversationDebugInfo::Executing);
                G1R.SwampCampTemple_Permision = 1;
                DC(int64(0x1e953c06636e4463), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e4460), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1e953c06636e4460), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1442Lastwarn : UTopic_Hero__SC_TPL_TEMPLAR25_1442
        {
            default DebugId = int64(0x90ed9b8996fb5bcd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_SC_TEMPLE_ENTRANCE", 250.0f, int64(0x90ed9b8996fb5bcd));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x90ed9b8996fb5bce), G1R.GuardPassageWarning_SC == 1);
                    DB(int64(0x90ed9b8996fb5bd0), Templar != nullptr && Templar.IsAtPreferredLocation(300.0f));
                    DB(int64(0x1e953c06636e445d), G1R.SwampCampTemple_Permision == 0);
                }
                
                if (G1R.GuardPassageWarning_SC != 1)
                    return false;
                
                if (Templar != nullptr && !Templar.IsAtPreferredLocation(300.0f))
                    return false;
                
                if (G1R.SwampCampTemple_Permision != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x90ed9b8996fb5bd1), EConversationDebugInfo::Executing);
                // That's close enough. One more step, and I'll end you. 
                Templar.AI.Say(LocText("INFO_TPL_1442_LASTWARN_13_01"));
                DC(int64(0x90ed9b8996fb5bd1), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e445c), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_SC = 2;
                DC(int64(0x1e953c06636e445c), EConversationDebugInfo::Done);
                DC(int64(0x90ed9b8996fb5bd2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x90ed9b8996fb5bd2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */