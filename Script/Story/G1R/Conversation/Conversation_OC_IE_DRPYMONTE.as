#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_DRPYMONTE : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_DRPYMONTE";
        }
        
        
        class UTopic_Hero__OC_IE_DRPYMONTE : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_DRPYMONTE";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDrPymonte() const property
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
        
        
        class UChoiceDrpymonte225150 : UTopic_Hero__OC_IE_DRPYMONTE
        {
            default DebugId = int64(0xd2072dbbf3a1790b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrpymonte225150);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(DrPymonte, 700.0f));
                    DB(int64(0x86f1b996d548867b), GameTime.CurrentClockTime.IsBetween(FClockTime(20, 30), FClockTime(0, 00)));
                    DB(int64(0xe09f32caabb5688a), G1R.PlaceholderCondition == 6);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(DrPymonte, 700.0f))
                    return false;
                
                if (!GameTime.CurrentClockTime.IsBetween(FClockTime(20, 30), FClockTime(0, 00)))
                    return false;
                
                if (G1R.PlaceholderCondition != 6)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2072dbbf3a1790a), EConversationDebugInfo::Executing);
                // Pff, if you keep playing like that, they’ll keep you ...
                DrPymonte.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_103609_41"));
                DC(int64(0xd2072dbbf3a1790a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrpymonte225167 : UTopic_Hero__OC_IE_DRPYMONTE
        {
            default DebugId = int64(0xd2072dbbf3a1790f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrpymonte225167);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_GRD_GUARD19_239", n"FP_PLAYINSTRUMENT_GUARD", 200.0f, int64(0xd2072dbbf3a1790f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(DrPymonte, 700.0f));
                    DB(int64(0xe09f32caabb5688b), G1R.PlaceholderCondition == 6);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(DrPymonte, 700.0f))
                    return false;
                
                if (G1R.PlaceholderCondition != 6)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2072dbbf3a1790e), EConversationDebugInfo::Executing);
                // Not bad at all.
                DrPymonte.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_103717_2238"));
                DC(int64(0xd2072dbbf3a1790e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_DrPymonte_431622 : UTopic_Hero__OC_IE_DRPYMONTE
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