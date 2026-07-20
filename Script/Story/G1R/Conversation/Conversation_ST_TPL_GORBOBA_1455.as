#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_TPL_GORBOBA_1455 : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_TPL_GORBOBA_1455";
        }
        
        
        class UTopic_Hero__ST_TPL_GORBOBA_1455 : UG1RDialogTopic
        {
            default ForCharacter = n"ST_TPL_GORBOBA_1455";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorBoba() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTpl1455Gorboba : UTopic_Hero__ST_TPL_GORBOBA_1455
        {
            default DebugId = int64(0xb04f9c4dedf392e2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceTpl1455Gorboba);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb04f9c4dedf392e3), EConversationDebugInfo::Executing);
                // Be gone! You're not welcome here.
                GorBoba.AI.Say(LocText("INFO_TPL_1455_GORBOBA_08_01"));
                DC(int64(0xb04f9c4dedf392e3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1455Gorboba1 : UTopic_Hero__ST_TPL_GORBOBA_1455
        {
            default DebugId = int64(0xb04f9c4dedf392e4);
            default Caption = LocText("INFO_TPL_1455_GORBOBA1_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1455Gorboba);
            default Rules.HideIfKnows(UChoiceTpl1455Gorboba1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb04f9c4dedf392e6), EConversationDebugInfo::Executing);
                
                // Oh no. I better go, then.
                Hero.AI.Say(LocText("INFO_TPL_1455_GORBOBA1_15_01"));
                DC(int64(0xb04f9c4dedf392e6), EConversationDebugInfo::Done);
                DC(int64(0xb04f9c4dedf392e7), EConversationDebugInfo::Executing);
                
                // Ever the jester ... you will not stop us, imposter.
                GorBoba.AI.Say(LocText("INFO_TPL_1455_GORBOBA1_08_02"));
                DC(int64(0xb04f9c4dedf392e7), EConversationDebugInfo::Done);
                DC(int64(0xb04f9c4dedf392e8), EConversationDebugInfo::Executing);
                // The Sleeper granted Master Kalom and us a fraction of ...
                GorBoba.AI.Say(LocText("INFO_TPL_1455_GORBOBA1_08_03"));
                DC(int64(0xb04f9c4dedf392e8), EConversationDebugInfo::Done);
                DC(int64(0xb04f9c4dedf392e9), EConversationDebugInfo::Executing);
                
                // I'll take my chances.
                Hero.AI.Say(LocText("INFO_TPL_1455_GORBOBA1_15_04"));
                DC(int64(0xb04f9c4dedf392e9), EConversationDebugInfo::Done);
                DC(int64(0xb04f9c4dedf392ea), EConversationDebugInfo::Executing);
                
                // Prepare to meet your maker.
                GorBoba.AI.Say(LocText("INFO_TPL_1455_GORBOBA1_08_05"));
                DC(int64(0xb04f9c4dedf392ea), EConversationDebugInfo::Done);
                DC(int64(0xb04f9c4dedf392ec), EConversationDebugInfo::Executing);
                GorBoba.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0xb04f9c4dedf392ec), EConversationDebugInfo::Done);
                DC(int64(0x5522a99535844054), EConversationDebugInfo::Executing);
                GorBoba.AI.StartAttackingImmediately(Hero);
                DC(int64(0x5522a99535844054), EConversationDebugInfo::Done);
                DC(int64(0xb04f9c4dedf392ed), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb04f9c4dedf392ed), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */