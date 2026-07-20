#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OG_TPL_GORNAZAR_1446 : UConversationCharacterSettings
        {
            default ForCharacter = n"OG_TPL_GORNAZAR_1446";
        }
        
        
        class UTopic_Hero__OG_TPL_GORNAZAR_1446 : UG1RDialogTopic
        {
            default ForCharacter = n"OG_TPL_GORNAZAR_1446";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaZar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGornazar115156 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b283c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceGornazar115156);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b283b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6512580bb1b283b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornazar115172 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b2840);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_111603_2785");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceGornazar115172);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x44a98a06cee0e712), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b283e), EConversationDebugInfo::Executing);
                // That's an interesting sword you're carrying.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111603_2785"));
                DC(int64(0xf6512580bb1b283e), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b283f), EConversationDebugInfo::Executing);
                
                // Indeed. Darrion's newest work. Won't find another like ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111603_3436"));
                DC(int64(0xf6512580bb1b283f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OG_TPL_GORNAZAR, Document::UDocumentSegment_Glossary_OG_TPL_GORNAZAR_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_FindTemplar);
                DC(int64(0xae41e45eb9ebb088), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD.SucceedQuest();
                DC(int64(0xae41e45eb9ebb088), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_GorNaZar_115177,
                    UTopic_GorNaZar_115197,
                    UTopic_GorNaZar_115232,
                    UTopic_GorNaZar_115252,
                    UTopic_GorNaZar_115385,
                    UTopic_GorNaZar_115405,
                    UTopic_GorNaZar_115436
                );
            }
        }
        
        
        class UTopic_GorNaZar_115177 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b2843);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_111721_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_GorNaZar_115177);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b2844), EConversationDebugInfo::Executing);
                // For now?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111721_686"));
                DC(int64(0xf6512580bb1b2844), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b284b), EConversationDebugInfo::Executing);
                
                // There are other smiths in the Colony. Someone will copy ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111726"));
                DC(int64(0xf6512580bb1b284b), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b284c), EConversationDebugInfo::Executing);
                // But this one ... this one's the original.
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111737"));
                DC(int64(0xf6512580bb1b284c), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2846), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf6512580bb1b2846), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_GorNaZar_115197 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b2847);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_111721_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_GorNaZar_115197);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b2848), EConversationDebugInfo::Executing);
                // Mind if I take a closer look?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111721_3984"));
                DC(int64(0xf6512580bb1b2848), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b284d), EConversationDebugInfo::Executing);
                
                // I think not. This blade was forged for my hand alone.
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111753"));
                DC(int64(0xf6512580bb1b284d), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b284a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf6512580bb1b284a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_GorNaZar_115232 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b284e);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_111802_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_GorNaZar_115232);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PTPTBXD_20241202_111753"), int64(0xf6512580bb1b284e));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b284f), EConversationDebugInfo::Executing);
                // Maybe we could work something out?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111802_1609"));
                DC(int64(0xf6512580bb1b284f), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2856), EConversationDebugInfo::Executing);
                
                // Not for all the ore in the mines. Now move along. The ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111824"));
                DC(int64(0xf6512580bb1b2856), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2851), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf6512580bb1b2851), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_GorNaZar_115252 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b2852);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_111804_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_GorNaZar_115252);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PTPTBXD_20241202_111824"), int64(0xf6512580bb1b2852));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b2853), EConversationDebugInfo::Executing);
                // What makes it so special?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111804_3569"));
                DC(int64(0xf6512580bb1b2853), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2857), EConversationDebugInfo::Executing);
                
                // The balance, the weight ... Darrion understands what a ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111847"));
                DC(int64(0xf6512580bb1b2857), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2858), EConversationDebugInfo::Executing);
                // Not like those dull-minded castle smiths, hammering out ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111858"));
                DC(int64(0xf6512580bb1b2858), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2855), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf6512580bb1b2855), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_GorNaZar_115385 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b2876);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_112847_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_GorNaZar_115385);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b2877), EConversationDebugInfo::Executing);
                // Darrion made it for you?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_112847_3750"));
                DC(int64(0xf6512580bb1b2877), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b287e), EConversationDebugInfo::Executing);
                
                // Yes. Though if you're thinking of asking him to make ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_112856"));
                DC(int64(0xf6512580bb1b287e), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2879), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf6512580bb1b2879), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_GorNaZar_115405 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b287a);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_112850_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_GorNaZar_115405);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b287b), EConversationDebugInfo::Executing);
                // I'll leave you to your guard duty then.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_112850_731"));
                DC(int64(0xf6512580bb1b287b), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b287f), EConversationDebugInfo::Executing);
                
                // If you're so interested, speak with Darrion about ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_112928"));
                DC(int64(0xf6512580bb1b287f), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2880), EConversationDebugInfo::Executing);
                // It'll cost you, but there's nothing like knowing your ...
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_112929"));
                DC(int64(0xf6512580bb1b2880), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_GorNaZar);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_AskDarrion);
                DC(int64(0xae41e45eb9ebb08a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.StartQuest();
                DC(int64(0xae41e45eb9ebb08a), EConversationDebugInfo::Done);
                DC(int64(0xc1a6dbb695197353), EConversationDebugInfo::Executing);
                GorNaZar.ExchangeDailyRoutineToClass(UDailyRoutine_OG_TPL_GorNaZar_1446_Start);
                DC(int64(0xc1a6dbb695197353), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2889), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6512580bb1b2889), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_GorNaZar_115436 : UTopic_Hero__OG_TPL_GORNAZAR_1446
        {
            default DebugId = int64(0xf6512580bb1b2881);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_112938_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_GorNaZar_115436);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf6512580bb1b2882), EConversationDebugInfo::Executing);
                // I'll leave with that sword.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_112938_1340"));
                DC(int64(0xf6512580bb1b2882), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2885), EConversationDebugInfo::Executing);
                
                // That so? Very well, bring it.
                GorNaZar.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_112945"));
                DC(int64(0xf6512580bb1b2885), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_GorNaZar);
                DC(int64(0xf6512580bb1b2887), EConversationDebugInfo::Executing);
                GorNaZar.AI.StartAttackingImmediately(Hero);
                DC(int64(0xf6512580bb1b2887), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2888), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6512580bb1b2888), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */