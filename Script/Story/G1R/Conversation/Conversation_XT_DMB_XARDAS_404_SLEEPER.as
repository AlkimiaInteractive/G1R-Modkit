#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_XT_DMB_XARDAS_404_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"XT_DMB_XARDAS_404_SLEEPER";
        }
        
        
        class UTopic_Hero__XT_DMB_XARDAS_404_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"XT_DMB_XARDAS_404_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetXardas_404() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class USleeperXardasStun01 : UTopic_Hero__XT_DMB_XARDAS_404_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e316b);
            default Caption = LocText("TEXT_WIP_LKQRRTG_20250220_115337_1340");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(USleeperXardasStun01);
            
            default Rules.RequireCharacterCloseToWaypoint(n"XT_DMB_XARDAS_404_SLEEPER", n"QuickTeleport_SleeperDreamXardas", 200.0f, int64(0xeacbec300a6e316b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e316a), EConversationDebugInfo::Executing);
                // Even gods blink... seize your moment, little insect.
                SayViaGlobalVoice(LocText("XT_DMB_XARDAS_404_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_115337_1340"));
                DC(int64(0xeacbec300a6e316a), EConversationDebugInfo::Done);
                DC(int64(0x3c4f70c6ef9f2bbb), EConversationDebugInfo::Executing);
                Xardas_404.AI.WaitSeconds(30);
                DC(int64(0x3c4f70c6ef9f2bbb), EConversationDebugInfo::Done);
            }
        }
        
        
        class USleeperXardasStun02 : UTopic_Hero__XT_DMB_XARDAS_404_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e316f);
            default Caption = LocText("TEXT_WIP_LKQRRTG_20250220_115340_2316");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(USleeperXardasStun01);
            default Rules.HideIfKnows(USleeperXardasStun02);
            
            default Rules.RequireCharacterCloseToWaypoint(n"XT_DMB_XARDAS_404_SLEEPER", n"QuickTeleport_SleeperDreamXardas", 200.0f, int64(0xeacbec300a6e316f));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e316e), EConversationDebugInfo::Executing);
                // I have bargained with gods before... and will again.
                SayViaGlobalVoice(LocText("XT_DMB_XARDAS_404_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_115340_2316"));
                DC(int64(0xeacbec300a6e316e), EConversationDebugInfo::Done);
                DC(int64(0x3c4f70c6ef9f2bbd), EConversationDebugInfo::Executing);
                Xardas_404.AI.WaitSeconds(30);
                DC(int64(0x3c4f70c6ef9f2bbd), EConversationDebugInfo::Done);
            }
        }
        
        
        class USleeperXardasStun03 : UTopic_Hero__XT_DMB_XARDAS_404_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e3173);
            default Caption = LocText("TEXT_WIP_LKQRRTG_20250220_115342_153");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(USleeperXardasStun02);
            default Rules.HideIfKnows(USleeperXardasStun03);
            
            default Rules.RequireCharacterCloseToWaypoint(n"XT_DMB_XARDAS_404_SLEEPER", n"QuickTeleport_SleeperDreamXardas", 200.0f, int64(0xeacbec300a6e3173));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3172), EConversationDebugInfo::Executing);
                // Balance is a lie told by weak gods... true power ...
                SayViaGlobalVoice(LocText("XT_DMB_XARDAS_404_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_115342_153"));
                DC(int64(0xeacbec300a6e3172), EConversationDebugInfo::Done);
            }
        }
        
        
        class UXardasFirstDialogue : UTopic_Hero__XT_DMB_XARDAS_404_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e3117);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UXardasFirstDialogue);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3116), EConversationDebugInfo::Executing);
                // Ah, the puppet arrives...
                Xardas_404.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_092059_3436"));
                DC(int64(0xeacbec300a6e3116), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e3126), EConversationDebugInfo::Executing);
                // Every choice, every step... pieces in a game spanning ...
                Xardas_404.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_104720"));
                DC(int64(0xeacbec300a6e3126), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e3127), EConversationDebugInfo::Executing);
                // Did you think I guided you out of kindness? You are but ...
                Xardas_404.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_104724"));
                DC(int64(0xeacbec300a6e3127), EConversationDebugInfo::Done);
                DC(int64(0xee7be66843932dfe), EConversationDebugInfo::Executing);
                // I dont need you anymore!
                Xardas_404.AI.Say(LocText("TEXT_WIP_JJFVYDC_20250317_132859"));
                DC(int64(0xee7be66843932dfe), EConversationDebugInfo::Done);
                DC(int64(0x789696a318e0e8b4), EConversationDebugInfo::Executing);
                Xardas_404.SetRelationshipTowards(Hero, ERelationship::Enemy);
                DC(int64(0x789696a318e0e8b4), EConversationDebugInfo::Done);
                DC(int64(0x789696a318e0e8b5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x789696a318e0e8b5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */