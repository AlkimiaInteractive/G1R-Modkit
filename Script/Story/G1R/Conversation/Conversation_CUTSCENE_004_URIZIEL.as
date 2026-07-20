#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_004_URIZIEL : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_004_URIZIEL";
        }
        
        
        class UTopic_Hero__CUTSCENE_004_URIZIEL : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_004_URIZIEL";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCutsceneUriziel() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNefarius() const property
            {
                return GetCharacter(n"NC_KDW_NEFARIUS_603");
            }
            
            AGothicCharacterState GetRogue04() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE04_807");
            }
            
            AGothicCharacterState GetRogue() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE15_825");
            }
        }
        
        
        class UChoiceUriziel425867 : UTopic_Hero__CUTSCENE_004_URIZIEL
        {
            default DebugId = int64(0xe41a9f7a6e873a1b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUriziel425883);
            default Rules.HideIfKnows(UChoiceUriziel425867);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe41a9f7a6e873a1a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe41a9f7a6e873a1a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUriziel425883 : UTopic_Hero__CUTSCENE_004_URIZIEL
        {
            default DebugId = int64(0xe41a9f7a6e873a1f);
            default Caption = LocText("TEXT_WIP_GMPJZWK_20250121_020240_778");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUriziel425883);
            
            default ExtraCharactersToInvite.Add(n"NC_ORG_ROGUE15_825");
            default ExtraCharactersToInvite.Add(n"NC_ORG_ROGUE04_807");
            default ExtraCharactersToInvite.Add(n"NC_KDW_NEFARIUS_603");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe41a9f7a6e873a1d), EConversationDebugInfo::Executing);
                // Ha!...
                Hero.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_020157_3286"));
                DC(int64(0xe41a9f7a6e873a1d), EConversationDebugInfo::Done);
                DC(int64(0xe41a9f7a6e87bb67), EConversationDebugInfo::Executing);
                
                // What?
                Rogue.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_024338"));
                DC(int64(0xe41a9f7a6e87bb67), EConversationDebugInfo::Done);
                DC(int64(0xe41a9f7a6e87bb68), EConversationDebugInfo::Executing);
                
                // Oh!
                Rogue04.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_024359"));
                DC(int64(0xe41a9f7a6e87bb68), EConversationDebugInfo::Done);
                DC(int64(0xf1b56889ce263849), EConversationDebugInfo::Executing);
                
                // What is happening here?
                Nefarius.AI.Say(LocText("TEXT_WIP_IEIRYVC_20250206_194615"));
                DC(int64(0xf1b56889ce263849), EConversationDebugInfo::Done);
                DC(int64(0xe41a9f7a6e87bb6a), EConversationDebugInfo::Executing);
                
                // Mmmhjaaa!
                Hero.AI.Say(LocText("TEXT_WIP_GMPJZWK_20250121_024459"));
                DC(int64(0xe41a9f7a6e87bb6a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */