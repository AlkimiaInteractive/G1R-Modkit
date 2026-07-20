#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_BC_BAN_TORIK_864 : UConversationCharacterSettings
        {
            default ForCharacter = n"BC_BAN_TORIK_864";
        }
        
        
        class UTopic_Hero__BC_BAN_TORIK_864 : UG1RDialogTopic
        {
            default ForCharacter = n"BC_BAN_TORIK_864";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTorik() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTorik185897 : UTopic_Hero__BC_BAN_TORIK_864
        {
            default DebugId = int64(0x858d762670026d76);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x858d762670026d75), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x858d762670026d75), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTorik185917 : UTopic_Hero__BC_BAN_TORIK_864
        {
            default DebugId = int64(0x858d762670026d7b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTorik185917);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2c508d8e2d0cbab4), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x858d762670026d7a), EConversationDebugInfo::Executing);
                // Well, if that ain't a new face.
                Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_172755_2083"));
                DC(int64(0x858d762670026d7a), EConversationDebugInfo::Done);
                DC(int64(0x2c508d8e2d0cbab2), EConversationDebugInfo::Executing);
                
                // Hi.
                Hero.AI.Say(LocText("TEXT_WIP_GGQCOCC_20250327_181817"));
                DC(int64(0x2c508d8e2d0cbab2), EConversationDebugInfo::Done);
                DC(int64(0x858d762670026d81), EConversationDebugInfo::Executing);
                
                // Well, you're here so that's gotta mean you're all right, ...
                Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173046"));
                DC(int64(0x858d762670026d81), EConversationDebugInfo::Done);
                DC(int64(0x858d762670026d82), EConversationDebugInfo::Executing);
                // Torik's the name, I'm the bloke that takes care of the ...
                Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173049"));
                DC(int64(0x858d762670026d82), EConversationDebugInfo::Done);
                DC(int64(0x858d762670026db2), EConversationDebugInfo::Executing);
                // So, if you need somethin' ...
                Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173936"));
                DC(int64(0x858d762670026db2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_TORIK, Document::UDocumentSegment_Glossary_BC_BAN_TORIK_Introduction_Trader);
            }
        }
        
        
        class UChoiceTorik186016 : UTopic_Hero__BC_BAN_TORIK_864
        {
            default DebugId = int64(0x858d762670026d85);
            default Caption = LocText("TEXT_WIP_WJNZPVE_20250327_173147");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorik185917);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x858d762670026d83), EConversationDebugInfo::Executing);
                // Let's see what you have to offer, then.
                Hero.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173147"));
                DC(int64(0x858d762670026d83), EConversationDebugInfo::Done);
                DB(int64(0x858d762670026d9d), Torik != nullptr && Torik.IsAngryTowards(Hero));
                
                if (Torik != nullptr && Torik.IsAngryTowards(Hero))
                {
                    DC(int64(0x858d762670026da0), EConversationDebugInfo::Executing);
                    // Nothing, while you're goin' around causin' trouble. ...
                    Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173603"));
                    DC(int64(0x858d762670026da0), EConversationDebugInfo::Done);
                    DC(int64(0x858d762670026da2), EConversationDebugInfo::Executing);
                    // And now sod off.
                    Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173641"));
                    DC(int64(0x858d762670026da2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_torik_186016_exit_1");
                    DC(int64(0x858d762670026da3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x858d762670026da3), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x858d762670026da6), EConversationDebugInfo::Executing);
                    // Have a gander.
                    Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173747"));
                    DC(int64(0x858d762670026da6), EConversationDebugInfo::Done);
                    DC(int64(0x858d762670026daf), EConversationDebugInfo::Executing);
                    Torik.AI.StartTradingWith(Hero);
                    DC(int64(0x858d762670026daf), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_torik_186016_exit_2");
                }
            }
        }
        
        
        class UChoiceTorik186125 : UTopic_Hero__BC_BAN_TORIK_864
        {
            default DebugId = int64(0x858d762670026d95);
            default Caption = LocText("TEXT_WIP_WJNZPVE_20250327_173440");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTorik186125);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_WJNZPVE_20250327_172755_2083"), int64(0x858d762670026d95));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x858d762670026d93), EConversationDebugInfo::Executing);
                // Did you steal all that?
                Hero.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173440"));
                DC(int64(0x858d762670026d93), EConversationDebugInfo::Done);
                DC(int64(0x858d762670026d94), EConversationDebugInfo::Executing);
                
                // What? Nah, o' course not. They were ... gifts.
                Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173440_2386"));
                DC(int64(0x858d762670026d94), EConversationDebugInfo::Done);
                DC(int64(0x858d762670026d97), EConversationDebugInfo::Executing);
                // O' course we stole it, what'd you think! We gotta make a ...
                Torik.AI.Say(LocText("TEXT_WIP_WJNZPVE_20250327_173453"));
                DC(int64(0x858d762670026d97), EConversationDebugInfo::Done);
                DC(int64(0x2c508d8e2d0cbab7), EConversationDebugInfo::Executing);
                
                // And not a bad one, it seems.
                Hero.AI.Say(LocText("TEXT_WIP_GGQCOCC_20250327_182418"));
                DC(int64(0x2c508d8e2d0cbab7), EConversationDebugInfo::Done);
                DC(int64(0x2c508d8e2d0cbab8), EConversationDebugInfo::Executing);
                
                // You take what you can get. And if they ain't keepin' a ...
                Torik.AI.Say(LocText("TEXT_WIP_GGQCOCC_20250327_182431"));
                DC(int64(0x2c508d8e2d0cbab8), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */