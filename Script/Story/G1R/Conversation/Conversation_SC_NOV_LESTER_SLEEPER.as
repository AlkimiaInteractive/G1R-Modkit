#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_LESTER_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_LESTER_SLEEPER";
        }
        
        
        class UTopic_Hero__SC_NOV_LESTER_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_LESTER_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetLester() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceLester161325 : UTopic_Hero__SC_NOV_LESTER_SLEEPER
        {
            default DebugId = int64(0x5f9a802f14489b5f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLester161325);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f9a802f14489b5e), EConversationDebugInfo::Executing);
                // You just HAVE to show up everywhere, huh?
                Lester.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_090517_2083"), ForceCameraPreset = n"TWO SHOT EXTRA WIDE");
                DC(int64(0x5f9a802f14489b5e), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e3108), EConversationDebugInfo::Executing);
                // It could've been so good - but then you had to keep on ...
                Lester.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_091444"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM 500");
                DC(int64(0xeacbec300a6e3108), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e3109), EConversationDebugInfo::Executing);
                // And you went too far. It's over. For good.
                Lester.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_091450"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xeacbec300a6e3109), EConversationDebugInfo::Done);
                DC(int64(0x98820f68baec244f), EConversationDebugInfo::Executing);
                Lester.SetRelationshipTowards(Hero, ERelationship::Enemy);
                DC(int64(0x98820f68baec244f), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */