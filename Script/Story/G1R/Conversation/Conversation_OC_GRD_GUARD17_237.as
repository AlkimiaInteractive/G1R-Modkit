#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_GUARD17_237 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_GUARD17_237";
        }
        
        
        class UTopic_Hero__OC_GRD_GUARD17_237 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_GUARD17_237";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd237Attack : UTopic_Hero__OC_GRD_GUARD17_237
        {
            default DebugId = int64(0x527130d677382a9f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_OC_OldCampConnection", 100.0f, int64(0x527130d677382a9f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x527130d677382aa0), G1R.GuardOrcLandWarning_OC == 2);
                    DB(int64(0x527130d677382aa1), G1R.Guard_Permission_Orc_Land == 0);
                    DB(int64(0x527130d677382aa3), Guard != nullptr && Guard.IsAtPreferredLocation(500.0f));
                }
                
                if (G1R.GuardOrcLandWarning_OC != 2)
                    return false;
                
                if (G1R.Guard_Permission_Orc_Land != 0)
                    return false;
                
                if (Guard != nullptr && !Guard.IsAtPreferredLocation(500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped Guard.AI.FullStop()");
                DC(int64(0x53399ab8ff6a838), EConversationDebugInfo::Executing);
                Guard.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x53399ab8ff6a838), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382aa8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x527130d677382aa8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd237Firstwarn : UTopic_Hero__OC_GRD_GUARD17_237
        {
            default DebugId = int64(0x527130d677382a82);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x527130d677382a83), G1R.GuardOrcLandWarning_OC == 0);
                    DB(int64(0x527130d677382a84), G1R.Guard_Permission_Orc_Land == 0);
                    DB(int64(0x527130d677382a85), Guard != nullptr && !Guard.IsFriendlyTowards(Hero));
                    DB(int64(0x527130d677382a86), Guard != nullptr && Guard.IsAtPreferredLocation(500.0f));
                    DB(int64(0xa488e15a3a3dea49), Hero != nullptr && !Hero.HasEverEnteredArea(GameplayTag::Area_OrcTerritory));
                }
                
                if (G1R.GuardOrcLandWarning_OC != 0)
                    return false;
                
                if (G1R.Guard_Permission_Orc_Land != 0)
                    return false;
                
                if (Guard != nullptr && Guard.IsFriendlyTowards(Hero))
                    return false;
                
                if (Guard != nullptr && !Guard.IsAtPreferredLocation(500.0f))
                    return false;
                
                if (Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OrcTerritory))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x527130d677382a87), EConversationDebugInfo::Executing);
                // Better turn back, mate. That's orc territory past this ...
                Guard.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_07_01"));
                DC(int64(0x527130d677382a87), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382a88), EConversationDebugInfo::Executing);
                
                // I guess that means it's dangerous?
                Hero.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_15_02"));
                DC(int64(0x527130d677382a88), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382a89), EConversationDebugInfo::Executing);
                
                // Let's put it this way: if you're dead set on goin' in ...
                Guard.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_07_03"));
                DC(int64(0x527130d677382a89), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrd237FirstwarnInfoNo,
                    UChoiceGrd237FirstwarnInfoYes,
                    UChoiceGrd237FirstwarnInfoRetreat
                );
            }
        }
        
        
        class UChoiceGrd237FirstwarnInfoNo : UTopic_Hero__OC_GRD_GUARD17_237
        {
            default DebugId = int64(0xe8603e87342bd58c);
            default Caption = LocText("INFO_GRD_237_FIRSTWARN_15_08");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x527130d677382a8c), EConversationDebugInfo::Executing);
                // Sounds unpleasant.
                Hero.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_15_08"));
                DC(int64(0x527130d677382a8c), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382a8d), EConversationDebugInfo::Executing);
                
                // It is. Like I said, head back. 
                Guard.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_07_09"));
                DC(int64(0x527130d677382a8d), EConversationDebugInfo::Done);
                DC(int64(0x53399ab8ff6a83f), EConversationDebugInfo::Executing);
                G1R.GuardOrcLandWarning_OC = 1;
                DC(int64(0x53399ab8ff6a83f), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382a8e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x527130d677382a8e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd237FirstwarnInfoYes : UTopic_Hero__OC_GRD_GUARD17_237
        {
            default DebugId = int64(0xe8603e87342bd591);
            default Caption = LocText("INFO_GRD_237_FIRSTWARN_15_06");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeada0788f2322fea), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaed7427261b439e5), EConversationDebugInfo::Executing);
                // Okay. Here's all my ore.
                Hero.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_15_06"));
                DC(int64(0xaed7427261b439e5), EConversationDebugInfo::Done);
                DC(int64(0xaed7427261b439e6), EConversationDebugInfo::Executing);
                
                // Are you serious? Well then. No complaints from me. 
                Guard.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_07_07"));
                DC(int64(0xaed7427261b439e6), EConversationDebugInfo::Done);
                DC(int64(0x53399ab8ff6a846), EConversationDebugInfo::Executing);
                Hero.AI.GiveAllOfItemTo(Guard, UItMi_Orenugget);
                DC(int64(0x53399ab8ff6a846), EConversationDebugInfo::Done);
                DC(int64(0x53399ab8ff6a848), EConversationDebugInfo::Executing);
                G1R.Guard_Permission_Orc_Land = 1;
                DC(int64(0x53399ab8ff6a848), EConversationDebugInfo::Done);
                DC(int64(0xaed7427261b439e9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaed7427261b439e9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd237FirstwarnInfoRetreat : UTopic_Hero__OC_GRD_GUARD17_237
        {
            default DebugId = int64(0xe8603e87342bd597);
            default Caption = LocText("INFO_GRD_237_FIRSTWARN_15_04");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x527130d677382a95), EConversationDebugInfo::Executing);
                // I better head back then. 
                Hero.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_15_04"));
                DC(int64(0x527130d677382a95), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382a96), EConversationDebugInfo::Executing);
                
                // Good choice. 
                Guard.AI.Say(LocText("INFO_GRD_237_FIRSTWARN_07_05"));
                DC(int64(0x527130d677382a96), EConversationDebugInfo::Done);
                DC(int64(0x53399ab8ff6a851), EConversationDebugInfo::Executing);
                G1R.GuardOrcLandWarning_OC = 1;
                DC(int64(0x53399ab8ff6a851), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382a97), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x527130d677382a97), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd237Lastwarn : UTopic_Hero__OC_GRD_GUARD17_237
        {
            default DebugId = int64(0x527130d677382a98);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_OC_OldCampConnection", 150.0f, int64(0x527130d677382a98));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x527130d677382a99), G1R.GuardOrcLandWarning_OC == 1);
                    DB(int64(0x527130d677382a9a), G1R.Guard_Permission_Orc_Land == 0);
                    DB(int64(0x527130d677382a9c), Guard != nullptr && Guard.IsAtPreferredLocation(500.0f));
                }
                
                if (G1R.GuardOrcLandWarning_OC != 1)
                    return false;
                
                if (G1R.Guard_Permission_Orc_Land != 0)
                    return false;
                
                if (Guard != nullptr && !Guard.IsAtPreferredLocation(500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x527130d677382a9d), EConversationDebugInfo::Executing);
                // Are you deaf? One more step, and you're fodder for the ...
                Guard.AI.Say(LocText("INFO_GRD_237_LASTWARN_07_01"));
                DC(int64(0x527130d677382a9d), EConversationDebugInfo::Done);
                DC(int64(0x53399ab8ff6a85c), EConversationDebugInfo::Executing);
                G1R.GuardOrcLandWarning_OC = 2;
                DC(int64(0x53399ab8ff6a85c), EConversationDebugInfo::Done);
                DC(int64(0x527130d677382a9e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x527130d677382a9e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */