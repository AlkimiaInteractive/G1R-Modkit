#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_SPECKI_1401 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_SPECKI_1401";
        }
        
        
        class UTopic_Hero__OC_IE_SPECKI_1401 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_SPECKI_1401";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSpecki() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD19_239() const property
            {
                return GetCharacter(n"OC_GRD_GUARD19_239");
            }
        }
        
        
        class UChoiceSpecki222280 : UTopic_Hero__OC_IE_SPECKI_1401
        {
            default DebugId = int64(0xb53b4d83fef99594);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb53b4d83fef99593), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb53b4d83fef99593), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSpecki225346 : UTopic_Hero__OC_IE_SPECKI_1401
        {
            default DebugId = int64(0xd2072dbbf3a17937);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceSpecki225346);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_GRD_GUARD19_239", n"FP_PLAYINSTRUMENT_GUARD", 200.0f, int64(0xd2072dbbf3a17937));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Specki, 700.0f));
                    DB(int64(0xfce45cf0240a51b), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb56890), G1R.PlaceholderCondition == 6);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Specki, 700.0f))
                    return false;
                
                if (G1R.Ambient_InExtremo.IsValid() && !G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30))
                    return false;
                
                if (G1R.PlaceholderCondition != 6)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2072dbbf3a17936), EConversationDebugInfo::Executing);
                // Quit horsing around, and get the key!
                Specki.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104757_3902"));
                DC(int64(0xd2072dbbf3a17936), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSpecki225363 : UTopic_Hero__OC_IE_SPECKI_1401
        {
            default DebugId = int64(0xd2072dbbf3a1793b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceSpecki225363);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Specki, 700.0f));
                    DB(int64(0x86f1b996d548867b), GameTime.CurrentClockTime.IsBetween(FClockTime(20, 30), FClockTime(0, 00)));
                    DB(int64(0xfce45cf0240a51c), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb56891), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Specki, 700.0f))
                    return false;
                
                if (!GameTime.CurrentClockTime.IsBetween(FClockTime(20, 30), FClockTime(0, 00)))
                    return false;
                
                if (G1R.Ambient_InExtremo.IsValid() && !G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30))
                    return false;
                
                if (G1R.PlaceholderCondition != 5)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2072dbbf3a1793a), EConversationDebugInfo::Executing);
                // Oh God don’t stop!
                Specki.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104835_292"));
                DC(int64(0xd2072dbbf3a1793a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */