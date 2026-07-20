#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_VANLANGE_1400 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_VANLANGE_1400";
        }
        
        
        class UTopic_Hero__OC_IE_VANLANGE_1400 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_VANLANGE_1400";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetVanLange() const property
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
        
        
        class UChoiceVanlange222236 : UTopic_Hero__OC_IE_VANLANGE_1400
        {
            default DebugId = int64(0xb53b4d83fef9958c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb53b4d83fef9958b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb53b4d83fef9958b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVanlange225308_0 : UTopic_Hero__OC_IE_VANLANGE_1400
        {
            default DebugId = int64(0xd2072dbbf3a1792f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceVanlange225308);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_GRD_GUARD19_239", n"FP_PLAYINSTRUMENT_GUARD", 200.0f, int64(0xd2072dbbf3a1792f));
            default Rules.HideIfKnows(UChoiceVanlange225308_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(VanLange, 700.0f));
                    DB(int64(0xfce45cf0240a51b), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb56894), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(VanLange, 700.0f))
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
                DC(int64(0xd2072dbbf3a1792e), EConversationDebugInfo::Executing);
                // You'll get there, don’t give up…
                VanLange.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104355_731"));
                DC(int64(0xd2072dbbf3a1792e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVanlange225308 : UTopic_Hero__OC_IE_VANLANGE_1400
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVanlange225308_0);
            default Rules.HideIfKnows(UChoiceVanlange225308);
            default DebugId = int64(0xd2072dbbf3a1792f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfce45cf0240a504), EConversationDebugInfo::Executing);
                G1R.Ambient_InExtremo = FInGameTime::Now();
                DC(int64(0xfce45cf0240a504), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVanlange225324_0 : UTopic_Hero__OC_IE_VANLANGE_1400
        {
            default DebugId = int64(0xd2072dbbf3a17933);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceVanlange225324);
            
            default Rules.HideIfKnows(UChoiceVanlange225324_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x86f1b996d548867a), Hero != nullptr && Hero.IsCloseToCharacter(VanLange, 700.0f));
                    DB(int64(0x86f1b996d548867b), GameTime.CurrentClockTime.IsBetween(FClockTime(20, 30), FClockTime(0, 00)));
                    DB(int64(0xfce45cf0240a51c), G1R.Ambient_InExtremo.IsValid() && G1R.Ambient_InExtremo.IsAtLeastXMinutesAgo(30));
                    DB(int64(0xe09f32caabb56895), G1R.PlaceholderCondition == 5);
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(VanLange, 700.0f))
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
                DC(int64(0xd2072dbbf3a17932), EConversationDebugInfo::Executing);
                // Finally, music is exactly what we need!
                VanLange.AI.Say(LocText("TEXT_WIP_MABMKKF_20260228_104402_3719"));
                DC(int64(0xd2072dbbf3a17932), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVanlange225324 : UTopic_Hero__OC_IE_VANLANGE_1400
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVanlange225324_0);
            default Rules.HideIfKnows(UChoiceVanlange225324);
            default DebugId = int64(0xd2072dbbf3a17933);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfce45cf0240a504), EConversationDebugInfo::Executing);
                G1R.Ambient_InExtremo = FInGameTime::Now();
                DC(int64(0xfce45cf0240a504), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */