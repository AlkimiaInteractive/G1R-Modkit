#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_UNICORN : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_UNICORN";
        }
        
        
        class UTopic_Hero__OC_IE_UNICORN : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_UNICORN";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUnicorn() const property
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
        
        
        class UChoiceUnicorn225200 : UTopic_Hero__OC_IE_UNICORN
        {
            default DebugId = int64(0xd2072dbbf3a17917);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceUnicorn225200);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_GRD_GUARD19_239", n"FP_PLAYINSTRUMENT_GUARD", 200.0f, int64(0xd2072dbbf3a17917));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Unicorn, 700.0f));
                    DB(int64(0xfce45cf0240a51b), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb56892), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Unicorn, 700.0f))
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
                DC(int64(0xd2072dbbf3a17916), EConversationDebugInfo::Executing);
                // Hey, nobody said anything about torture!
                Unicorn.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_103920_3286"));
                DC(int64(0xd2072dbbf3a17916), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUnicorn225217 : UTopic_Hero__OC_IE_UNICORN
        {
            default DebugId = int64(0xd2072dbbf3a1791b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceUnicorn225217);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Unicorn, 700.0f));
                    DB(int64(0x86f1b996d548867b), GameTime.CurrentClockTime.IsBetween(FClockTime(20, 30), FClockTime(0, 00)));
                    DB(int64(0xfce45cf0240a51c), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb56893), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Unicorn, 700.0f))
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
                DC(int64(0xd2072dbbf3a1791a), EConversationDebugInfo::Executing);
                // Yeah, great song!
                Unicorn.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_103950_2386"));
                DC(int64(0xd2072dbbf3a1791a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUnicorn431622 : UTopic_Hero__OC_IE_UNICORN
        {
            default DebugId = int64(0xc4b408d4de6d072f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4b408d4de6d0732), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc4b408d4de6d0732), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */