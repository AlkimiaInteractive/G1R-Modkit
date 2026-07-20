#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_005_EXTRO : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_005_EXTRO";
        }
        
        
        class UTopic_Hero__CUTSCENE_005_EXTRO : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_005_EXTRO";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCutsceneExtro() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceExtro186129 : UTopic_Hero__CUTSCENE_005_EXTRO
        {
            default DebugId = int64(0xecc21ca6dddf48af);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceExtro186149);
            default Rules.HideIfKnows(UChoiceExtro186129);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xecc21ca6dddf48ae), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xecc21ca6dddf48ae), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceExtro186149 : UTopic_Hero__CUTSCENE_005_EXTRO
        {
            default DebugId = int64(0xecc21ca6dddf48b4);
            default Caption = LocText("TEXT_WIP_SPAROVK_20250130_105822_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceExtro186149);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xecc21ca6dddf48b2), EConversationDebugInfo::Executing);
                // Banishing the Sleeper had its price.
                Hero.AI.Say(LocText("TEXT_WIP_SPAROVK_20250130_105822_41"));
                DC(int64(0xecc21ca6dddf48b2), EConversationDebugInfo::Done);
                DC(int64(0xecc21ca6dddf48b6), EConversationDebugInfo::Executing);
                // While all the other convicts rushed out into their ...
                Hero.AI.Say(LocText("TEXT_WIP_SPAROVK_20250130_110126"));
                DC(int64(0xecc21ca6dddf48b6), EConversationDebugInfo::Done);
                DC(int64(0xecc21ca6dddf48b7), EConversationDebugInfo::Executing);
                // I tried to get out ... but it was too late. 
                Hero.AI.Say(LocText("TEXT_WIP_SPAROVK_20250130_110503"));
                DC(int64(0xecc21ca6dddf48b7), EConversationDebugInfo::Done);
                DC(int64(0xecc21ca6dddf48b8), EConversationDebugInfo::Executing);
                // And so my story found its end.
                Hero.AI.Say(LocText("TEXT_WIP_SPAROVK_20250130_110535"));
                DC(int64(0xecc21ca6dddf48b8), EConversationDebugInfo::Done);
                DC(int64(0xecc21ca6dddf48b9), EConversationDebugInfo::Executing);
                // Or did it?
                Hero.AI.Say(LocText("TEXT_WIP_SPAROVK_20250130_110611"));
                DC(int64(0xecc21ca6dddf48b9), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */