#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR26_1443N : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR26_1443N";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR26_1443N : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR26_1443N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar26() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetTemplar27() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR27_1444N");
            }
        }
        
        
        class UChoiceTemplar26139092 : UTopic_Hero__SC_TPL_TEMPLAR26_1443N
        {
            default DebugId = int64(0x7669f54d5550b12d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7669f54d5550b12c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7669f54d5550b12c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTemplar26139108 : UTopic_Hero__SC_TPL_TEMPLAR26_1443N
        {
            default DebugId = int64(0x7669f54d5550b131);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceTemplar26139108);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ENPRNBE_20250114_114847_2083"), int64(0x7669f54d5550b131));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ENPRNBE_20250114_142237"), int64(0x7669f54d5550b131));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7669f54d5550b135), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7669f54d5550b130), EConversationDebugInfo::Executing);
                // Hey, where are you going? No one leaves the camp. 
                Templar26.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_133343_2083"));
                DC(int64(0x7669f54d5550b130), EConversationDebugInfo::Done);
                DC(int64(0x7669f54d5550b137), EConversationDebugInfo::Executing);
                
                // These guys are fed up with your bullshit. Step aside, ...
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_140709"));
                DC(int64(0x7669f54d5550b137), EConversationDebugInfo::Done);
                DC(int64(0x7669f54d5550b138), EConversationDebugInfo::Executing);
                
                // You're as dumb as that ponytail suggests. Time for a ...
                Templar26.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_140859"));
                DC(int64(0x7669f54d5550b138), EConversationDebugInfo::Done);
                DC(int64(0x7669f54d5550b13a), EConversationDebugInfo::Executing);
                Templar26.AI.StartAttackingImmediately(Hero);
                DC(int64(0x7669f54d5550b13a), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2d0), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Templar27)) && ensure(IsValid(Templar27.AI))) { Templar27.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x464d7f73ef6cd2d0), EConversationDebugInfo::Done);
                DC(int64(0x7669f54d5550b13b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7669f54d5550b13b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */