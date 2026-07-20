#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_GRD_BRANDICK_261 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_GRD_BRANDICK_261";
        }
        
        
        class UTopic_Hero__OM_GRD_BRANDICK_261 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_GRD_BRANDICK_261";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBrandick() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd261BrandickAleph : UTopic_Hero__OM_GRD_BRANDICK_261
        {
            default DebugId = int64(0xb42181496be437a1);
            default Caption = LocText("GRD_261_BRANDICK_ALEPH_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd261BrandickAleph);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("VLK_585_ALEPH_GUARDS_INFO_05_02"), int64(0xb42181496be437a1));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb42181496be437a2), EConversationDebugInfo::Executing);
                // Did you know Aleph doesn't do anything all day if you're ...
                Hero.AI.Say(LocText("GRD_261_BRANDICK_ALEPH_INFO_15_01"));
                DC(int64(0xb42181496be437a2), EConversationDebugInfo::Done);
                DC(int64(0xb42181496be437a3), EConversationDebugInfo::Executing);
                
                // Ah-ha. Interesting.
                Brandick.AI.Say(LocText("GRD_261_BRANDICK_ALEPH_INFO_06_02"));
                DC(int64(0xb42181496be437a3), EConversationDebugInfo::Done);
                DC(int64(0xb42181496be437a4), EConversationDebugInfo::Executing);
                // You know what I hate even more than idlers? Snitches. ...
                Brandick.AI.Say(LocText("GRD_261_BRANDICK_ALEPH_INFO_06_03"));
                DC(int64(0xb42181496be437a4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_BRANDICK, Document::UDocumentSegment_Glossary_OM_GRD_BRANDICK_Introduction);
                DC(int64(0xb42181496be437a5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb42181496be437a5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd261BrandickExit : UTopic_Hero__OM_GRD_BRANDICK_261
        {
            default DebugId = int64(0xb42181496be4379f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb42181496be437a0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb42181496be437a0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */