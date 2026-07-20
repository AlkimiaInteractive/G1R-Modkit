#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_VLK_MUD_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_VLK_MUD_SLEEPER";
        }
        
        
        class UTopic_Hero__ST_VLK_MUD_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"ST_VLK_MUD_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMud() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMINECRAWLER_QUEEN_PH2_SLEEPER() const property
            {
                return GetCharacter(n"MINECRAWLER_QUEEN_PH2_SLEEPER");
            }
        }
        
        
        class UChoiceMud216366 : UTopic_Hero__ST_VLK_MUD_SLEEPER
        {
            default DebugId = int64(0xb62d255de57f50f1);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb62d255de57f50f0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb62d255de57f50f0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Mud_MudGuide01 : UTopic_Hero__ST_VLK_MUD_SLEEPER
        {
            default DebugId = int64(0x391fb0307ccf7062);
            default Caption = LocText("TEXT_WIP_PALRZBB_20260123_213203");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Mud_MudGuide01);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x391fb0307ccf7061), EConversationDebugInfo::Executing);
                // You can't catch me, try to catch me if you can...you ...
                SayViaGlobalVoice(LocText("ST_VLK_MUD_SLEEPER"), LocText("TEXT_WIP_PALRZBB_20260123_213203"));
                DC(int64(0x391fb0307ccf7061), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Mud_MudGuide02 : UTopic_Hero__ST_VLK_MUD_SLEEPER
        {
            default DebugId = int64(0x391fb0307ccf706a);
            default Caption = LocText("TEXT_WIP_PALRZBB_20260123_213201");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Mud_MudGuide02);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x391fb0307ccf7069), EConversationDebugInfo::Executing);
                // No friends, no one there, no one cares... You are all ...
                SayViaGlobalVoice(LocText("ST_VLK_MUD_SLEEPER"), LocText("TEXT_WIP_PALRZBB_20260123_213201"));
                DC(int64(0x391fb0307ccf7069), EConversationDebugInfo::Done);
                DC(int64(0x56f01b002abcbe82), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_ST_VLK_Mud_Sleeper_Teleport);
                DC(int64(0x56f01b002abcbe82), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Mud_MudGuide03 : UTopic_Hero__ST_VLK_MUD_SLEEPER
        {
            default DebugId = int64(0x391fb0307ccf706e);
            default Caption = LocText("TEXT_WIP_PALRZBB_20260123_213202");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Mud_MudGuide03);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x391fb0307ccf706d), EConversationDebugInfo::Executing);
                // I'm right behind you... You can't hide... I'll get ...
                SayViaGlobalVoice(LocText("ST_VLK_MUD_SLEEPER"), LocText("TEXT_WIP_PALRZBB_20260123_213202"));
                DC(int64(0x391fb0307ccf706d), EConversationDebugInfo::Done);
                DC(int64(0x391fb0307ccf7087), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_ST_VLK_Mud_Sleeper_Cheer);
                DC(int64(0x391fb0307ccf7087), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Mud_MudGuide04 : UTopic_Hero__ST_VLK_MUD_SLEEPER
        {
            default DebugId = int64(0x391fb0307ccf707a);
            default Caption = LocText("TEXT_WIP_PALRZBB_20260123_213159");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Mud_MudGuide04);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56f01b002abcbe84), Mud != nullptr && !Mud.CanSenseAnyAliveCharacterOfKind(MINECRAWLER_QUEEN_PH2_SLEEPER, 5000.0f));
                    DB(int64(0x1e9b247b0e1b8d3c), IsCharacterInWorld(MINECRAWLER_QUEEN_PH2_SLEEPER));
                }
                
                if (Mud != nullptr && Mud.CanSenseAnyAliveCharacterOfKind(MINECRAWLER_QUEEN_PH2_SLEEPER, 5000.0f))
                    return false;
                
                if (!IsCharacterInWorld(MINECRAWLER_QUEEN_PH2_SLEEPER))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x391fb0307ccf7079), EConversationDebugInfo::Executing);
                // Hey, are you blind? I can see you!
                SayViaGlobalVoice(LocText("ST_VLK_MUD_SLEEPER"), LocText("TEXT_WIP_PALRZBB_20260123_213159"));
                DC(int64(0x391fb0307ccf7079), EConversationDebugInfo::Done);
                DC(int64(0x56f01b002abcbe86), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_ST_VLK_Mud_Sleeper_Teleport02);
                DC(int64(0x56f01b002abcbe86), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Mud_MudGuide05 : UTopic_Hero__ST_VLK_MUD_SLEEPER
        {
            default DebugId = int64(0x391fb0307ccf7076);
            default Caption = LocText("TEXT_WIP_PALRZBB_20260123_213412");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Mud_MudGuide05);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x391fb0307ccf7075), EConversationDebugInfo::Executing);
                // The days are dark, no more light. Surrender... Give ...
                SayViaGlobalVoice(LocText("ST_VLK_MUD_SLEEPER"), LocText("TEXT_WIP_PALRZBB_20260123_213412"));
                DC(int64(0x391fb0307ccf7075), EConversationDebugInfo::Done);
                DC(int64(0x56f01b002abcbe8e), EConversationDebugInfo::Executing);
                Mud.AI.StartAttackingImmediately(Hero);
                DC(int64(0x56f01b002abcbe8e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Mud_MudGuide06 : UTopic_Hero__ST_VLK_MUD_SLEEPER
        {
            default DebugId = int64(0x391fb0307ccf7072);
            default Caption = LocText("TEXT_WIP_RQHNQN_20260123_182314");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Mud_MudGuide06);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x391fb0307ccf7071), EConversationDebugInfo::Executing);
                // Wait for me... I'm coming for you!
                SayViaGlobalVoice(LocText("ST_VLK_MUD_SLEEPER"), LocText("TEXT_WIP_RQHNQN_20260123_182314"));
                DC(int64(0x391fb0307ccf7071), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */