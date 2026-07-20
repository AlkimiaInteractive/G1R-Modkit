#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_VLK_GARP_587 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_VLK_GARP_587";
        }
        
        
        class UTopic_Hero__OM_VLK_GARP_587 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_VLK_GARP_587";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGarp() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceVlk587GarpExit : UTopic_Hero__OM_VLK_GARP_587
        {
            default DebugId = int64(0xc2aae95836674996);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc2aae95836674997), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc2aae95836674997), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVlk587GarpOrk : UTopic_Hero__OM_VLK_GARP_587
        {
            default DebugId = int64(0xc2aae95836674998);
            default Caption = LocText("VLK_587_GARP_ORK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceVlk587GarpOrk);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc2aae95836674999), EConversationDebugInfo::Executing);
                // What's that ork doing here?
                Hero.AI.Say(LocText("VLK_587_GARP_ORK_INFO_15_01"));
                DC(int64(0xc2aae95836674999), EConversationDebugInfo::Done);
                DC(int64(0xc2aae9583667499a), EConversationDebugInfo::Executing);
                
                // That one? The warders caught him ... he's been workin' ...
                Garp.AI.Say(LocText("VLK_587_GARP_ORK_INFO_01_02"));
                DC(int64(0xc2aae9583667499a), EConversationDebugInfo::Done);
                DC(int64(0xc2aae9583667499b), EConversationDebugInfo::Executing);
                
                // He's not even chained up. Why doesn't he just flee?
                Hero.AI.Say(LocText("VLK_587_GARP_ORK_INFO_15_03"));
                DC(int64(0xc2aae9583667499b), EConversationDebugInfo::Done);
                DC(int64(0xc2aae9583667499c), EConversationDebugInfo::Executing);
                
                // He tried once - the warders beat him up so badly he ...
                Garp.AI.Say(LocText("VLK_587_GARP_ORK_INFO_01_04"));
                DC(int64(0xc2aae9583667499c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_GARP, Document::UDocumentSegment_Glossary_OM_VLK_GARP_Introduction);
                DC(int64(0x15325efd7871b488), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x15325efd7871b488), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */