#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR24_1441 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR24_1441";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR24_1441 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR24_1441";
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
        
        
        class UChoiceTpl1441Attack : UTopic_Hero__SC_TPL_TEMPLAR24_1441
        {
            default DebugId = int64(0x1c2ecf1e7326fdda);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_SC_TEMPLE_ENTRANCE", 100.0f, int64(0x1c2ecf1e7326fdda));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c2ecf1e7326fddb), G1R.GuardPassageWarning_SC == 2);
                    DB(int64(0x1c2ecf1e7326fddc), G1R.SwampCampTemple_Permision == 0);
                    DB(int64(0x1c2ecf1e7326fdde), Templar != nullptr && Templar.IsAtPreferredLocation(300.0f));
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
                DC(int64(0x1e953c06636e3d2d), EConversationDebugInfo::Executing);
                Templar.AI.StartAttackingImmediately(Hero);
                DC(int64(0x1e953c06636e3d2d), EConversationDebugInfo::Done);
                DC(int64(0x1c2ecf1e7326fde4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1c2ecf1e7326fde4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1441Firstwarn : UTopic_Hero__SC_TPL_TEMPLAR24_1441
        {
            default DebugId = int64(0x1c2ecf1e7326fdc4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c2ecf1e7326fdc5), G1R.GuardPassageWarning_SC == 0);
                    DB(int64(0x1c2ecf1e7326fdc6), G1R.SwampCampTemple_Permision == 0);
                    DB(int64(0x1c2ecf1e7326fdc7), Templar != nullptr && Templar.IsAtPreferredLocation(200.0f));
                }
                
                if (G1R.GuardPassageWarning_SC != 0)
                    return false;
                
                if (G1R.SwampCampTemple_Permision != 0)
                    return false;
                
                if (Templar != nullptr && !Templar.IsAtPreferredLocation(200.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c2ecf1e7326fdc8), EConversationDebugInfo::Executing);
                // Halt! Only those with a guru's permission may climb ...
                Templar.AI.Say(LocText("INFO_TPL_1441_FIRSTWARN_13_01"));
                DC(int64(0x1c2ecf1e7326fdc8), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e4457), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_SC = 1;
                DC(int64(0x1e953c06636e4457), EConversationDebugInfo::Done);
                DB(int64(0x1c2ecf1e7326fdca), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_RWAGUXL_20240314_153447")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_RWAGUXL_20240314_153447")))
                {
                    Subdialog(
                        UChoiceTpl1441FirstwarnConditionYberion,
                        UChoiceTpl1441FirstwarnConditionLester
                    );
                }
                else
                {
                    DC(int64(0x1c2ecf1e7326fdd3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1c2ecf1e7326fdd3), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceTpl1441FirstwarnConditionYberion : UTopic_Hero__SC_TPL_TEMPLAR24_1441
        {
            default DebugId = int64(0xe8603e87342bfc40);
            default Caption = LocText("INFO_TPL_1441_FIRSTWARN_CONDITION_YBERION_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceTpl1441FirstwarnConditionYberion);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_RWAGUXL_20240314_153447"), int64(0xe8603e87342bfc40));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c2ecf1e7326fdce), EConversationDebugInfo::Executing);
                // Y'Berion himself gave his permission.
                Hero.AI.Say(LocText("INFO_TPL_1441_FIRSTWARN_CONDITION_YBERION_15_01"));
                DC(int64(0x1c2ecf1e7326fdce), EConversationDebugInfo::Done);
                DC(int64(0x1c2ecf1e7326fdcf), EConversationDebugInfo::Executing);
                
                // Liars' tongues live dangerously. I'm in a good mood ...
                Templar.AI.Say(LocText("INFO_TPL_1441_FIRSTWARN_CONDITION_YBERION_13_02"));
                DC(int64(0x1c2ecf1e7326fdcf), EConversationDebugInfo::Done);
                DC(int64(0x8dac6e9f52279545), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x8dac6e9f52279545), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1441FirstwarnConditionLester : UTopic_Hero__SC_TPL_TEMPLAR24_1441
        {
            default DebugId = int64(0xe8603e87342bfc46);
            default Caption = LocText("INFO_TPL_1441_FIRSTWARN_CONDITION_LESTER_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c2ecf1e7326fdd1), EConversationDebugInfo::Executing);
                // Cor Kalom sends me. I have something for Master ...
                Hero.AI.Say(LocText("INFO_TPL_1441_FIRSTWARN_CONDITION_LESTER_15_01"));
                DC(int64(0x1c2ecf1e7326fdd1), EConversationDebugInfo::Done);
                DC(int64(0x1c2ecf1e7326fdd2), EConversationDebugInfo::Executing);
                
                // Cor Kalom ... hm. Fine, then. Go on in.
                Templar.AI.Say(LocText("INFO_TPL_1441_FIRSTWARN_CONDITION_LESTER_13_02"));
                DC(int64(0x1c2ecf1e7326fdd2), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e4454), EConversationDebugInfo::Executing);
                G1R.SwampCampTemple_Permision = 1;
                DC(int64(0x1e953c06636e4454), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e4455), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1e953c06636e4455), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1441Lastwarn : UTopic_Hero__SC_TPL_TEMPLAR24_1441
        {
            default DebugId = int64(0x1c2ecf1e7326fdd4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_SC_TEMPLE_ENTRANCE", 250.0f, int64(0x1c2ecf1e7326fdd4));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c2ecf1e7326fdd5), G1R.GuardPassageWarning_SC == 1);
                    DB(int64(0x1c2ecf1e7326fdd7), Templar != nullptr && Templar.IsAtPreferredLocation(300.0f));
                    DB(int64(0x1e953c06636e4458), G1R.SwampCampTemple_Permision == 0);
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
                DC(int64(0x1c2ecf1e7326fdd8), EConversationDebugInfo::Executing);
                // One more step and you'll meet your maker.
                Templar.AI.Say(LocText("INFO_TPL_1441_LASTWARN_13_01"));
                DC(int64(0x1c2ecf1e7326fdd8), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e445a), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_SC = 2;
                DC(int64(0x1e953c06636e445a), EConversationDebugInfo::Done);
                DC(int64(0x1c2ecf1e7326fdd9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1c2ecf1e7326fdd9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */