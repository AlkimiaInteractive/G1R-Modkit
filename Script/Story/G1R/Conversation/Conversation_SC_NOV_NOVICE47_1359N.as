#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_NOVICE47_1359N : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_NOVICE47_1359N";
        }
        
        
        class UTopic_Hero__SC_NOV_NOVICE47_1359N : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_NOVICE47_1359N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNovice47() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetSC_NOV_NOVICE46_1358N() const property
            {
                return GetCharacter(n"SC_NOV_NOVICE46_1358N");
            }
        }
        
        
        class UChoiceNovice47142242 : UTopic_Hero__SC_NOV_NOVICE47_1359N
        {
            default DebugId = int64(0x4ffc4ad7e38850b0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ffc4ad7e38850af), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4ffc4ad7e38850af), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice47142258 : UTopic_Hero__SC_NOV_NOVICE47_1359N
        {
            default DebugId = int64(0x4ffc4ad7e38850b4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceNovice47142258);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ffc4ad7e38850b3), EConversationDebugInfo::Executing);
                // Well, well, who have we got here? Don't you know this is ...
                Novice47.AI.Say(LocText("TEXT_WIP_GNPRNBE_20250116_171402_2785"));
                DC(int64(0x4ffc4ad7e38850b3), EConversationDebugInfo::Done);
                DC(int64(0x4ffc4ad7e38850b6), EConversationDebugInfo::Executing);
                
                // This is not the place nor the time for this, all right? ...
                Hero.AI.Say(LocText("TEXT_WIP_GNPRNBE_20250116_171430"));
                DC(int64(0x4ffc4ad7e38850b6), EConversationDebugInfo::Done);
                DC(int64(0x4ffc4ad7e38850b7), EConversationDebugInfo::Executing);
                
                // What are you even- Are you scattering ashes? ... Wait. ...
                Novice47.AI.Say(LocText("TEXT_WIP_GNPRNBE_20250116_171445"));
                DC(int64(0x4ffc4ad7e38850b7), EConversationDebugInfo::Done);
                DC(int64(0x4ffc4ad7e38850b8), EConversationDebugInfo::Executing);
                
                // Leave it or I'll be dumping your dead body in a ...
                Hero.AI.Say(LocText("TEXT_WIP_GNPRNBE_20250116_171500"));
                DC(int64(0x4ffc4ad7e38850b8), EConversationDebugInfo::Done);
                DC(int64(0x4ffc4ad7e38850b9), EConversationDebugInfo::Executing);
                
                // You talk like a madman. There's no subduing us - for the ...
                Novice47.AI.Say(LocText("TEXT_WIP_GNPRNBE_20250116_171512"));
                DC(int64(0x4ffc4ad7e38850b9), EConversationDebugInfo::Done);
                DC(int64(0x4ffc4ad7e38850bb), EConversationDebugInfo::Executing);
                Novice47.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Regular);
                DC(int64(0x4ffc4ad7e38850bb), EConversationDebugInfo::Done);
                DC(int64(0x4ffc4ad7e38850bd), EConversationDebugInfo::Executing);
                if (ensure(IsValid(SC_NOV_NOVICE46_1358N)) && ensure(IsValid(SC_NOV_NOVICE46_1358N.AI))) { SC_NOV_NOVICE46_1358N.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Regular); }
                DC(int64(0x4ffc4ad7e38850bd), EConversationDebugInfo::Done);
                DC(int64(0x4ffc4ad7e38850be), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4ffc4ad7e38850be), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */