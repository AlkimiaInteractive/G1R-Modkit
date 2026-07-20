#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR27_1444N : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR27_1444N";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR27_1444N : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR27_1444N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar27() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetTemplar26() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR26_1443N");
            }
        }
        
        
        class UChoiceTemplar27139179 : UTopic_Hero__SC_TPL_TEMPLAR27_1444N
        {
            default DebugId = int64(0x7669f54d5550b13d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7669f54d5550b13c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7669f54d5550b13c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTemplar27139195 : UTopic_Hero__SC_TPL_TEMPLAR27_1444N
        {
            default DebugId = int64(0x7669f54d5550b141);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceTemplar27139195);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ENPRNBE_20250114_114847_2083"), int64(0x7669f54d5550b141));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ENPRNBE_20250114_140859"), int64(0x7669f54d5550b141));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7669f54d5550b145), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7669f54d5550b147), EConversationDebugInfo::Executing);
                // Hey, wait a second. You can't just saunter out of here!
                Templar27.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_141458"));
                DC(int64(0x7669f54d5550b147), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2c7), EConversationDebugInfo::Executing);
                
                // Just stretching our legs. Kalom's orders.
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_141834"));
                DC(int64(0x464d7f73ef6cd2c7), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2c9), EConversationDebugInfo::Executing);
                
                // I don't believe a single word you say. 
                Templar27.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_142237"));
                DC(int64(0x464d7f73ef6cd2c9), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2cb), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Templar26)) && ensure(IsValid(Templar26.AI))) { Templar26.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x464d7f73ef6cd2cb), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2ce), EConversationDebugInfo::Executing);
                Templar27.AI.StartAttackingImmediately(Hero);
                DC(int64(0x464d7f73ef6cd2ce), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2cc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x464d7f73ef6cd2cc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTemplar27152983 : UTopic_Hero__SC_TPL_TEMPLAR27_1444N
        {
            default DebugId = int64(0xb8469cae0ce9bfc4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceTemplar27152983);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb8469cae0ce9bfb4), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                    DB(int64(0xb8469cae0ce9bfb5), Hero != nullptr && Hero.IsCloseToCharacter(Templar27, 700.0f));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && !Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Templar27, 700.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb8469cae0ce9bfc3), EConversationDebugInfo::Executing);
                // What are YOU doing here?
                Templar27.AI.Say(LocText("TEXT_WIP_JNXNLPG_20250211_152425_3286"));
                DC(int64(0xb8469cae0ce9bfc3), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */