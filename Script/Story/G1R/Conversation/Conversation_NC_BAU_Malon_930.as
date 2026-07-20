#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_MALON_930 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_MALON_930";
        }
        
        
        class UTopic_Hero__NC_BAU_MALON_930 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_MALON_930";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMalon() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMalon630287 : UTopic_Hero__NC_BAU_MALON_930
        {
            default DebugId = int64(0xdd0b4bf39c0c483c);
            default Caption = LocText("STT_300_ALBERTO_BUY_INFO_15_01");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd0b4bf39c0c483a), EConversationDebugInfo::Executing);
                // Do you trade?
                Hero.AI.Say(LocText("STT_300_ALBERTO_BUY_INFO_15_01"));
                DC(int64(0xdd0b4bf39c0c483a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_MALON, Document::UDocumentSegment_Glossary_NC_BAU_MALON_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_MALON, Document::UDocumentSegment_Glossary_NC_BAU_MALON_Trader);
                DB(int64(0xdd0b4bf39c0c4846), Malon != nullptr && Malon.IsAngryTowards(Hero));
                
                if (Malon != nullptr && Malon.IsAngryTowards(Hero))
                {
                    DC(int64(0xdd0b4bf39c0c4847), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Malon.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_114058_1037"));
                    DC(int64(0xdd0b4bf39c0c4847), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_malon_630287_exit_1");
                }
                else
                {
                    DC(int64(0xdd0b4bf39c0c4849), EConversationDebugInfo::Executing);
                    // Take your pick.
                    Malon.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_114045_94"));
                    DC(int64(0xdd0b4bf39c0c4849), EConversationDebugInfo::Done);
                    DC(int64(0xdd0b4bf39c0c4856), EConversationDebugInfo::Executing);
                    Malon.AI.StartTradingWith(Hero);
                    DC(int64(0xdd0b4bf39c0c4856), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_malon_630287_exit_2");
                }
            }
        }
        
        
        class UChoicePeasant2081484 : UTopic_Hero__NC_BAU_MALON_930
        {
            default DebugId = int64(0x9243ca153656a061);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoicePeasant2081484);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9243ca153656a060), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9243ca153656a060), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePeasant2081500 : UTopic_Hero__NC_BAU_MALON_930
        {
            default DebugId = int64(0x9243ca153656a065);
            default Caption = LocText("TEXT_WIP_XJSKLDM_20240215_140207_3436");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoicePeasant2081500);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9243ca153656a068), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9243ca153656a063), EConversationDebugInfo::Executing);
                // I'm looking for Bran. Any ideas where he might have ...
                Hero.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_140207_3436"));
                DC(int64(0x9243ca153656a063), EConversationDebugInfo::Done);
                DC(int64(0x9243ca153656a064), EConversationDebugInfo::Executing);
                
                // Why would I tell you?
                Malon.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_140207_3286"));
                DC(int64(0x9243ca153656a064), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_MALON, Document::UDocumentSegment_Glossary_NC_BAU_MALON_Introduction);
                Subdialog(
                    UPeasant20_84521,
                    UPeasant20_89400
                );
            }
        }
        
        
        class UPeasant20_84521 : UTopic_Hero__NC_BAU_MALON_930
        {
            default DebugId = int64(0x7485c7d9d76d35d3);
            default Caption = LocText("TEXT_WIP_AGHDBGC_20240306_181024_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UPeasant20_84521);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7485c7d9d76d35d4), EConversationDebugInfo::Executing);
                // How about you get to keep your teeth?
                Hero.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181024_3436"));
                DC(int64(0x7485c7d9d76d35d4), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35db), EConversationDebugInfo::Executing);
                
                // So you're just another bully. Fine, then. Let's settle ...
                Malon.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181052"));
                DC(int64(0x7485c7d9d76d35db), EConversationDebugInfo::Done);
                DC(int64(0x36f542dcf94cee01), EConversationDebugInfo::Executing);
                Malon.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x36f542dcf94cee01), EConversationDebugInfo::Done);
                DC(int64(0x36f542dcf94cee02), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x36f542dcf94cee02), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UPeasant20_89400 : UTopic_Hero__NC_BAU_MALON_930
        {
            default DebugId = int64(0xf5cfc80fce8045a0);
            default Caption = LocText("TEXT_WIP_KVXAWSC_20240412_095210_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UPeasant20_89400);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf5cfc80fce8045a1), EConversationDebugInfo::Executing);
                // Because I'm asking you nicely?
                Hero.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_095210_41"));
                DC(int64(0xf5cfc80fce8045a1), EConversationDebugInfo::Done);
                DC(int64(0xf5cfc80fce8045a4), EConversationDebugInfo::Executing);
                
                // Look at that, common courtesy in the Colony ... didn't ...
                Malon.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_095238"));
                DC(int64(0xf5cfc80fce8045a4), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35e8), EConversationDebugInfo::Executing);
                // A few nights ago, I saw Bran sneak out of the camp. 
                Malon.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181425_1609"));
                DC(int64(0x7485c7d9d76d35e8), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35e9), EConversationDebugInfo::Executing);
                // He was headed for the cave by the pond - the one Jacko ...
                Malon.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181455"));
                DC(int64(0x7485c7d9d76d35e9), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35ea), EConversationDebugInfo::Executing);
                // Anything else? I got rice to pick. 
                Malon.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181514"));
                DC(int64(0x7485c7d9d76d35ea), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DRUGMONOPOL, Document::UDocumentSegment_CH1_DRUGMONOPOL_SecretCave);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_WeedCave);
                DC(int64(0x8d453fe08e1feb2b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND.SucceedQuest();
                DC(int64(0x8d453fe08e1feb2b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePeasant2081817 : UTopic_Hero__NC_BAU_MALON_930
        {
            default DebugId = int64(0x9243ca153656a075);
            default Caption = LocText("TEXT_WIP_XJSKLDM_20240215_140727_2386");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePeasant2088449);
            default Rules.HideIfKnows(UChoicePeasant2081817);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9243ca153656a07b), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9243ca153656a06d), EConversationDebugInfo::Executing);
                // Where exactly is that cave?
                Hero.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_140727_2386"));
                DC(int64(0x9243ca153656a06d), EConversationDebugInfo::Done);
                DC(int64(0x9243ca153656a074), EConversationDebugInfo::Executing);
                
                // Just outside the camp, by the pond with the bloodflies. 
                Malon.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_140755"));
                DC(int64(0x9243ca153656a074), EConversationDebugInfo::Done);
                DC(int64(0x3fad8d97598fa3da), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3fad8d97598fa3da), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePeasant2088449 : UTopic_Hero__NC_BAU_MALON_930
        {
            default DebugId = int64(0x9abbd37ababe158e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoicePeasant2088449);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36f542dcf94cee05), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x36f542dcf94cee06), Malon != nullptr && Malon.WasDefeatedBy(Hero));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Malon != nullptr && !Malon.WasDefeatedBy(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9abbd37ababe158c), EConversationDebugInfo::Executing);
                // So, about Bran ... 
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_173947"));
                DC(int64(0x9abbd37ababe158c), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe158d), EConversationDebugInfo::Executing);
                
                // Yeah, yeah, okay. You win. 
                Malon.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_173947_2785"));
                DC(int64(0x9abbd37ababe158d), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35e8), EConversationDebugInfo::Executing);
                // A few nights ago, I saw Bran sneak out of the camp. 
                Malon.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181425_1609"));
                DC(int64(0x7485c7d9d76d35e8), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35e9), EConversationDebugInfo::Executing);
                // He was headed for the cave by the pond - the one Jacko ...
                Malon.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181455"));
                DC(int64(0x7485c7d9d76d35e9), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35ea), EConversationDebugInfo::Executing);
                // Anything else? I got rice to pick. 
                Malon.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_181514"));
                DC(int64(0x7485c7d9d76d35ea), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_MALON, Document::UDocumentSegment_Glossary_NC_BAU_MALON_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_WeedCave);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */