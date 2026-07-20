#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_LUTTER : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_LUTTER";
        }
        
        
        class UTopic_Hero__OC_IE_LUTTER : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_LUTTER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetLutter() const property
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
        
        
        class UChoiceLutter225272 : UTopic_Hero__OC_IE_LUTTER
        {
            default DebugId = int64(0xd2072dbbf3a17927);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLutter225272);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_GRD_GUARD19_239", n"FP_PLAYINSTRUMENT_GUARD", 200.0f, int64(0xd2072dbbf3a17927));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Lutter, 700.0f));
                    DB(int64(0xfce45cf0240a51b), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb5688e), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Lutter, 700.0f))
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
                DC(int64(0xd2072dbbf3a17926), EConversationDebugInfo::Executing);
                // It’s not completely awful, although… yeah. Yeah, it is ...
                Lutter.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104205_1769"));
                DC(int64(0xd2072dbbf3a17926), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLutter225289 : UTopic_Hero__OC_IE_LUTTER
        {
            default DebugId = int64(0xd2072dbbf3a1792b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLutter225289);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_GRD_GUARD19_239", n"FP_PLAYINSTRUMENT_GUARD", 200.0f, int64(0xd2072dbbf3a1792b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(Lutter, 700.0f));
                    DB(int64(0xfce45cf0240a51b), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb5688f), G1R.PlaceholderCondition == 6);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Lutter, 700.0f))
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
                DC(int64(0xd2072dbbf3a1792a), EConversationDebugInfo::Executing);
                // You could join us if we weren’t already complete - and ...
                Lutter.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104227_2995"));
                DC(int64(0xd2072dbbf3a1792a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLutter431622 : UTopic_Hero__OC_IE_LUTTER
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