#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_FM_SFB_SWINEY_1037 : UConversationCharacterSettings
        {
            default ForCharacter = n"FM_SFB_SWINEY_1037";
        }
        
        
        class UTopic_Hero__FM_SFB_SWINEY_1037 : UG1RDialogTopic
        {
            default ForCharacter = n"FM_SFB_SWINEY_1037";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSwiney() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceSwineyExit : UTopic_Hero__FM_SFB_SWINEY_1037
        {
            default DebugId = int64(0xd1ad0bf6278ba89a);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1ad0bf6278ba89b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd1ad0bf6278ba89b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSwineyHello : UTopic_Hero__FM_SFB_SWINEY_1037
        {
            default DebugId = int64(0xd1ad0bf6278ba89c);
            default Caption = LocText("INFO_SWINEY_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSwineyHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1ad0bf6278ba89d), EConversationDebugInfo::Executing);
                // Who are you?
                Hero.AI.Say(LocText("INFO_SWINEY_HELLO_15_00"));
                DC(int64(0xd1ad0bf6278ba89d), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba89e), EConversationDebugInfo::Executing);
                
                // Me? Just the best foreman this bloody Colony has ever ...
                Swiney.AI.Say(LocText("INFO_SWINEY_HELLO_09_01"));
                DC(int64(0xd1ad0bf6278ba89e), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba89f), EConversationDebugInfo::Executing);
                // I'm the guy who makes sure our boys ain't gettin' killed ...
                Swiney.AI.Say(LocText("INFO_SWINEY_HELLO_09_02"));
                DC(int64(0xd1ad0bf6278ba89f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SFB_SWINEY, Document::UDocumentSegment_Glossary_FM_SFB_SWINEY_Introduction);
            }
        }
        
        
        class UChoiceSwineyPerm : UTopic_Hero__FM_SFB_SWINEY_1037
        {
            default DebugId = int64(0xd1ad0bf6278ba8b5);
            default Caption = LocText("INFO_SWINEY_PERM_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSwineySchuerfer);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1ad0bf6278ba8b6), EConversationDebugInfo::Executing);
                // How much ore have you mined so far?
                Hero.AI.Say(LocText("INFO_SWINEY_PERM_15_00"));
                DC(int64(0xd1ad0bf6278ba8b6), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8b7), EConversationDebugInfo::Executing);
                
                // The mages say we're gettin' close, let's leave it at ...
                Swiney.AI.Say(LocText("INFO_SWINEY_PERM_09_01"));
                DC(int64(0xd1ad0bf6278ba8b7), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8b8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd1ad0bf6278ba8b8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSwineySchuerfer : UTopic_Hero__FM_SFB_SWINEY_1037
        {
            default DebugId = int64(0xd1ad0bf6278ba8a0);
            default Caption = LocText("INFO_SWINEY_SCHUERFER_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSwineyHello);
            default Rules.HideIfKnows(UChoiceSwineySchuerfer);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1ad0bf6278ba8a1), EConversationDebugInfo::Executing);
                // I want to become a digger.
                Hero.AI.Say(LocText("INFO_SWINEY_SCHUERFER_15_00"));
                DC(int64(0xd1ad0bf6278ba8a1), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8a2), EConversationDebugInfo::Executing);
                
                // You say that like it's some kind of honor. This ain't ...
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_09_01"));
                DC(int64(0xd1ad0bf6278ba8a2), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8a3), EConversationDebugInfo::Executing);
                // We don't do this for riches and joy - we do this so the ...
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_09_02"));
                DC(int64(0xd1ad0bf6278ba8a3), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8a4), EConversationDebugInfo::Executing);
                // That's it. That, and fifty nuggets a moon. 
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_09_03"));
                DC(int64(0xd1ad0bf6278ba8a4), EConversationDebugInfo::Done);
                DC(int64(0xe4eb73a5fe14698a), EConversationDebugInfo::Executing);
                // You ever worked a vein?
                Swiney.AI.Say(LocText("TEXT_WIP_OHRMFHC_20240405_094649"));
                DC(int64(0xe4eb73a5fe14698a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SFB_SWINEY, Document::UDocumentSegment_Glossary_FM_SFB_SWINEY_Scraper);
                Subdialog(
                    UChoiceSwineySchuerferNein,
                    UChoiceSwineySchuerferJa
                );
            }
        }
        
        
        class UChoiceSwineySchuerferNein : UTopic_Hero__FM_SFB_SWINEY_1037
        {
            default DebugId = int64(0xe8603e87342bc0c0);
            default Caption = LocText("INFO_SWINEY_SCHUERFER_NEIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1ad0bf6278ba8a9), EConversationDebugInfo::Executing);
                // No.
                Hero.AI.Say(LocText("INFO_SWINEY_SCHUERFER_NEIN_15_00"));
                DC(int64(0xd1ad0bf6278ba8a9), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8aa), EConversationDebugInfo::Executing);
                
                // O'course not ... dammit, why do I always have to play ...
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_NEIN_09_01"));
                DC(int64(0xd1ad0bf6278ba8aa), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8ab), EConversationDebugInfo::Executing);
                // If a chunk of ore comes loose and you ain't wearin' ...
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_NEIN_09_02"));
                DC(int64(0xd1ad0bf6278ba8ab), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8ac), EConversationDebugInfo::Executing);
                // Next, find yourself a pickaxe - there oughta be one ...
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_NEIN_09_03"));
                DC(int64(0xd1ad0bf6278ba8ac), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8ad), EConversationDebugInfo::Executing);
                // You'll figure out the rest. 
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_NEIN_09_04"));
                DC(int64(0xd1ad0bf6278ba8ad), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SFB_SWINEY, Document::UDocumentSegment_Glossary_FM_SFB_SWINEY_NotInterested);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Swiney.AddItemToInventory(USfb_Armor_L, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8af), EConversationDebugInfo::Executing);
                Swiney.AI.GiveItemTo(Hero, USfb_Armor_L, 1);
                DC(int64(0xd1ad0bf6278ba8af), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSwineySchuerferJa : UTopic_Hero__FM_SFB_SWINEY_1037
        {
            default DebugId = int64(0xe8603e87342bc0c9);
            default Caption = LocText("INFO_SWINEY_SCHUERFER_JA_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1ad0bf6278ba8b1), EConversationDebugInfo::Executing);
                // Yes.
                Hero.AI.Say(LocText("INFO_SWINEY_SCHUERFER_JA_15_00"));
                DC(int64(0xd1ad0bf6278ba8b1), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8b2), EConversationDebugInfo::Executing);
                
                // Color me impressed. Here, take these pants and boots, ...
                Swiney.AI.Say(LocText("INFO_SWINEY_SCHUERFER_JA_09_01"));
                DC(int64(0xd1ad0bf6278ba8b2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SFB_SWINEY, Document::UDocumentSegment_Glossary_FM_SFB_SWINEY_Interested);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Swiney.AddItemToInventory(USfb_Armor_L, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xd1ad0bf6278ba8b4), EConversationDebugInfo::Executing);
                Swiney.AI.GiveItemTo(Hero, USfb_Armor_L, 1);
                DC(int64(0xd1ad0bf6278ba8b4), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */