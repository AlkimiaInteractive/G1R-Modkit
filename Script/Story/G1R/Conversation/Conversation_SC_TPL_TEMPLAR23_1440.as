#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR23_1440 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR23_1440";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR23_1440 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR23_1440";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar23() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTemplar23125996 : UTopic_Hero__SC_TPL_TEMPLAR23_1440
        {
            default DebugId = int64(0x5dcd7126285f605);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceTemplar23125996);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_DDCKZPD_20241106_161910"), int64(0x5dcd7126285f605));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5dcd7126285f604), EConversationDebugInfo::Executing);
                // Not now. I ... I need to think. 
                Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161931_3984"));
                DC(int64(0x5dcd7126285f604), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTemplar23218091 : UTopic_Hero__SC_TPL_TEMPLAR23_1440
        {
            default DebugId = int64(0x9c3ac3fd89c9fd13);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceTemplar23218091);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c3ac3fd89c9fd12), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c3ac3fd89c9fd12), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTemplar23218107 : UTopic_Hero__SC_TPL_TEMPLAR23_1440
        {
            default DebugId = int64(0x9c3ac3fd89c9fd17);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTemplar23218107);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284523), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c3ac3fd89c9fd16), EConversationDebugInfo::Executing);
                // Sleeper... Oh Sleeper...
                Templar23.AI.Say(LocText("TEXT_WIP_FLYAYYJ_20241001_130238_2083"));
                DC(int64(0x9c3ac3fd89c9fd16), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5ea), EConversationDebugInfo::Executing);
                
                // What's the matter? 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161614"));
                DC(int64(0x5dcd7126285f5ea), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5eb), EConversationDebugInfo::Executing);
                
                // Who- 
                Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161620"));
                DC(int64(0x5dcd7126285f5eb), EConversationDebugInfo::Done);
                DB(int64(0x5dcd7126285f5ed), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0x5dcd7126285f5f4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x5dcd7126285f5ef), EConversationDebugInfo::Executing);
                    // Oh. You're that Shadow. 
                    Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161657_3436"));
                    DC(int64(0x5dcd7126285f5ef), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x5dcd7126285f5f6), EConversationDebugInfo::Executing);
                    // Oh. You're that bandit. 
                    Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161712_686"));
                    DC(int64(0x5dcd7126285f5f6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x5dcd7126285f5f1), EConversationDebugInfo::Executing);
                    // Oh. You're that novice. 
                    Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161702_3286"));
                    DC(int64(0x5dcd7126285f5f1), EConversationDebugInfo::Done);
                }
                DC(int64(0x5dcd7126285f5fb), EConversationDebugInfo::Executing);
                // The Old Mine ... it's been flooded. It killed four of ...
                Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161809_2386"));
                DC(int64(0x5dcd7126285f5fb), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f601), EConversationDebugInfo::Executing);
                // But I don't have time to talk about this now. I need to ...
                Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161852"));
                DC(int64(0x5dcd7126285f601), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f602), EConversationDebugInfo::Executing);
                // Sleeper, what is happening to us ... 
                Templar23.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_161910"));
                DC(int64(0x5dcd7126285f602), EConversationDebugInfo::Done);
                DC(int64(0x212779523cbfecf), EConversationDebugInfo::Executing);
                Templar23.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar23_1440_BackToCamp);
                DC(int64(0x212779523cbfecf), EConversationDebugInfo::Done);
                DB(int64(0xb4a225815539a384), Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && Quest::OldMine_OMCHAPTER2_STORAGESHED.IsRunning());
                
                if (Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && Quest::OldMine_OMCHAPTER2_STORAGESHED.IsRunning())
                {
                    DC(int64(0xb4a225815539a38e), EConversationDebugInfo::Executing);
                    Quest::OldMine_OMCHAPTER2_STORAGESHED.FailQuest();
                    DC(int64(0xb4a225815539a38e), EConversationDebugInfo::Done);
                }
                DC(int64(0xb4a225815539a38f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4a225815539a38f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */