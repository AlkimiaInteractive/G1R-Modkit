#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_003_FIREMAGES : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_003_FIREMAGES";
        }
        
        
        class UTopic_Hero__CUTSCENE_003_FIREMAGES : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_003_FIREMAGES";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCutsceneFiremages() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetCorristo() const property
            {
                return GetCharacter(n"OC_KDF_CORRISTO_402");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
        }
        
        
        class UChoiceFiremages283886 : UTopic_Hero__CUTSCENE_003_FIREMAGES
        {
            default DebugId = int64(0xe41a9f7a6e86b8dc);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFiremages283902);
            default Rules.HideIfKnows(UChoiceFiremages283886);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe41a9f7a6e86b8db), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe41a9f7a6e86b8db), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFiremages283902 : UTopic_Hero__CUTSCENE_003_FIREMAGES
        {
            default DebugId = int64(0xe41a9f7a6e86b8e0);
            default Caption = LocText("TEXT_WIP_GMPJZWK_20250121_014707_1");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceFiremages283902);
            
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            default ExtraCharactersToInvite.Add(n"OC_KDF_CORRISTO_402");
            default ExtraCharactersToInvite.Add(n"OC_EBR_GOMEZ_100");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe41a9f7a6e873a16), EConversationDebugInfo::Executing);
                // Oh, he is already back from Gomez
                Milten.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_015007"));
                DC(int64(0xe41a9f7a6e873a16), EConversationDebugInfo::Done);
                DC(int64(0xe41a9f7a6e873a17), EConversationDebugInfo::Executing);
                
                // Doesn't look like it went well.
                Hero.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_015033"));
                DC(int64(0xe41a9f7a6e873a17), EConversationDebugInfo::Done);
                DC(int64(0xdbe591605dc7b686), EConversationDebugInfo::Executing);
                
                // Let's hide here.
                Milten.AI.Say(LocText("TEXT_WIP_IEIRYVC_20250206_195908"));
                DC(int64(0xdbe591605dc7b686), EConversationDebugInfo::Done);
                DC(int64(0xe41a9f7a6e873a18), EConversationDebugInfo::Executing);
                
                // ... godless blackguards, the whole lot of them. 
                Corristo.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_015048"));
                DC(int64(0xe41a9f7a6e873a18), EConversationDebugInfo::Done);
                DC(int64(0xce05f2f51264296b), EConversationDebugInfo::Executing);
                // What!? What's going on here?
                Corristo.AI.Say(LocText("TEXT_WIP_LEIRYVC_20250209_020249"));
                DC(int64(0xce05f2f51264296b), EConversationDebugInfo::Done);
                DC(int64(0xce05f2f51264296c), EConversationDebugInfo::Executing);
                // No!
                Corristo.AI.Say(LocText("TEXT_WIP_LEIRYVC_20250209_020406"));
                DC(int64(0xce05f2f51264296c), EConversationDebugInfo::Done);
                DC(int64(0xce05f2f51264296d), EConversationDebugInfo::Executing);
                // (Effort sound to start casting a spell)
                Corristo.AI.Say(LocText("TEXT_WIP_LEIRYVC_20250209_020438"));
                DC(int64(0xce05f2f51264296d), EConversationDebugInfo::Done);
                DC(int64(0xce05f2f51264296e), EConversationDebugInfo::Executing);
                // Ahhhh
                Corristo.AI.Say(LocText("TEXT_WIP_LEIRYVC_20250209_020545"));
                DC(int64(0xce05f2f51264296e), EConversationDebugInfo::Done);
                DC(int64(0xe41a9f7a6e873a19), EConversationDebugInfo::Executing);
                
                // I'm done with your games. 
                Gomez.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_015157"));
                DC(int64(0xe41a9f7a6e873a19), EConversationDebugInfo::Done);
                DC(int64(0xce05f2f51264296f), EConversationDebugInfo::Executing);
                
                // Run! Get out of here!
                Milten.AI.Say(LocText("TEXT_WIP_LEIRYVC_20250209_020617"));
                DC(int64(0xce05f2f51264296f), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */