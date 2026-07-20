#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_FLEX : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_FLEX";
        }
        
        
        class UTopic_Hero__OC_IE_FLEX : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_FLEX";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetFlex() const property
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
        
        
        class UChoiceFlex225236 : UTopic_Hero__OC_IE_FLEX
        {
            default DebugId = int64(0xd2072dbbf3a1791f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceFlex225236);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_GRD_GUARD19_239", n"FP_PLAYINSTRUMENT_GUARD", 200.0f, int64(0xd2072dbbf3a1791f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Flex, 700.0f));
                    DB(int64(0xfce45cf0240a51b), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb5688c), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Flex, 700.0f))
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
                DC(int64(0xd2072dbbf3a1791e), EConversationDebugInfo::Executing);
                // Is this really necessary?
                Flex.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104045_1609"));
                DC(int64(0xd2072dbbf3a1791e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFlex225252 : UTopic_Hero__OC_IE_FLEX
        {
            default DebugId = int64(0xd2072dbbf3a17923);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceFlex225252);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Flex, 700.0f));
                    DB(int64(0x86f1b996d548867b), GameTime.CurrentClockTime.IsBetween(FClockTime(20, 30), FClockTime(0, 00)));
                    DB(int64(0xfce45cf0240a51c), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb5688d), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Flex, 700.0f))
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
                DC(int64(0xd2072dbbf3a17922), EConversationDebugInfo::Executing);
                // Sounds familiar…
                Flex.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104054_2801"));
                DC(int64(0xd2072dbbf3a17922), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFlex431622 : UTopic_Hero__OC_IE_FLEX
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