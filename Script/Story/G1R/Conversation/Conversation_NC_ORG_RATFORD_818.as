#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_RATFORD_818 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_RATFORD_818";
        }
        
        
        class UTopic_Hero__NC_ORG_RATFORD_818 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_RATFORD_818";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRatford() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceOrg818RatfordExit : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1b9);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1ba), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x82f15ea2aa6ae1ba), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg818RatfordMorelocations : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1cf);
            default Caption = LocText("ORG_818_RATFORD_MORELOCATIONS_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg818RatfordWhydangerous);
            default Rules.HideIfKnows(UChoiceOrg818RatfordMorelocations);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1d0), EConversationDebugInfo::Executing);
                // Tell me more about the regions of the Colony.
                Hero.AI.Say(LocText("ORG_818_RATFORD_MORELOCATIONS_15_00"));
                DC(int64(0x82f15ea2aa6ae1d0), EConversationDebugInfo::Done);
                DC(int64(0xc737f845657a8140), EConversationDebugInfo::Executing);
                
                // I look like a guide to you or what? But fine, you seem ...
                Ratford.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_161141"));
                DC(int64(0xc737f845657a8140), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1d1), EConversationDebugInfo::Executing);
                // First things first, if you wanna travel, get yourself a ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_MORELOCATIONS_07_01"));
                DC(int64(0x82f15ea2aa6ae1d1), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1d2), EConversationDebugInfo::Executing);
                // There's plenty of those in the Colony, and they often ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_MORELOCATIONS_07_02"));
                DC(int64(0x82f15ea2aa6ae1d2), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1d3), EConversationDebugInfo::Executing);
                // Also, do yourself a favor and avoid the old ruins - ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_MORELOCATIONS_07_03"));
                DC(int64(0x82f15ea2aa6ae1d3), EConversationDebugInfo::Done);
                DC(int64(0xc737f845657a8151), EConversationDebugInfo::Executing);
                
                // There's orcs in here? 
                Hero.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_161608"));
                DC(int64(0xc737f845657a8151), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1d4), EConversationDebugInfo::Executing);
                
                // Yeah, though they mostly stick to their enclave. Anyway, ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_MORELOCATIONS_07_04"));
                DC(int64(0x82f15ea2aa6ae1d4), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1d5), EConversationDebugInfo::Executing);
                // Oh, and last but not least: stay the hell out of the ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_MORELOCATIONS_07_05"));
                DC(int64(0x82f15ea2aa6ae1d5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg818RatfordThanks : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1e1);
            default Caption = LocText("ORG_818_RATFORD_THANKS_15_00");
            default PriorityRank = 4;
            
            default Rules.HideIfKnows(UChoiceOrg818RatfordThanks);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1e2), EConversationDebugInfo::Executing);
                
                // Thanks for the advice.
                Hero.AI.Say(LocText("ORG_818_RATFORD_THANKS_15_00"));
                DC(int64(0x82f15ea2aa6ae1e2), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1e3), EConversationDebugInfo::Executing);
                
                // Sure you do. But don't go around thinkin' everyone's ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_THANKS_07_01"));
                DC(int64(0x82f15ea2aa6ae1e3), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1e4), EConversationDebugInfo::Executing);
                // There ain't much to loot from a freshie like you, but ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_THANKS_07_02"));
                DC(int64(0x82f15ea2aa6ae1e4), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1e5), EConversationDebugInfo::Executing);
                
                // I'll keep that in mind. 
                Hero.AI.Say(LocText("ORG_818_RATFORD_THANKS_15_04"));
                DC(int64(0x82f15ea2aa6ae1e5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg818RatfordWhatgame : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1bf);
            default Caption = LocText("ORG_818_RATFORD_WHATGAME_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg818RatfordWhatgame);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1c0), EConversationDebugInfo::Executing);
                // What game do you hunt?
                Hero.AI.Say(LocText("ORG_818_RATFORD_WHATGAME_15_00"));
                DC(int64(0x82f15ea2aa6ae1c0), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1c1), EConversationDebugInfo::Executing);
                
                // Mostly scavengers. Got a lot of meat on them, these ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WHATGAME_07_01"));
                DC(int64(0x82f15ea2aa6ae1c1), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1c2), EConversationDebugInfo::Executing);
                
                // How's that?
                Hero.AI.Say(LocText("ORG_818_RATFORD_WHATGAME_15_02"));
                DC(int64(0x82f15ea2aa6ae1c2), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1c3), EConversationDebugInfo::Executing);
                
                // Ask me mate Drax here. He's better at explainin' that ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WHATGAME_07_03"));
                DC(int64(0x82f15ea2aa6ae1c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg818RatfordWhydangerous : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1c4);
            default Caption = LocText("ORG_818_RATFORD_WHYDANGEROUS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg818RatfordWhydangerous);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1c5), EConversationDebugInfo::Executing);
                
                // What's so dangerous about your hunting grounds? 
                Hero.AI.Say(LocText("ORG_818_RATFORD_WHYDANGEROUS_15_00"));
                DC(int64(0x82f15ea2aa6ae1c5), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1c6), EConversationDebugInfo::Executing);
                
                // Green through and through, eh? Not all the regions in ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WHYDANGEROUS_07_01"));
                DC(int64(0x82f15ea2aa6ae1c6), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1c7), EConversationDebugInfo::Executing);
                // The main roads between the camps are mostly safe, but ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WHYDANGEROUS_07_02"));
                DC(int64(0x82f15ea2aa6ae1c7), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1c8), EConversationDebugInfo::Executing);
                // And yeah, that's exactly what you are right now. At ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WHYDANGEROUS_07_03"));
                DC(int64(0x82f15ea2aa6ae1c8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_RATFORD, Document::UDocumentSegment_Glossary_NC_ORG_RATFORD_Advice);
            }
        }
        
        
        class UChoiceOrg818RatfordWoequipment : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1c9);
            default Caption = LocText("ORG_818_RATFORD_WOEQUIPMENT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg818RatfordWhydangerous);
            default Rules.HideIfKnows(UChoiceOrg818RatfordWoequipment);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1cb), EConversationDebugInfo::Executing);
                // Where do I find better gear? 
                Hero.AI.Say(LocText("ORG_818_RATFORD_WOEQUIPMENT_15_00"));
                DC(int64(0x82f15ea2aa6ae1cb), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1cc), EConversationDebugInfo::Executing);
                
                // Well, the nearest spot is the Old Camp. Just gotta ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WOEQUIPMENT_07_01"));
                DC(int64(0x82f15ea2aa6ae1cc), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1cd), EConversationDebugInfo::Executing);
                // That said, you'll get much better deals at our camp, the ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WOEQUIPMENT_07_02"));
                DC(int64(0x82f15ea2aa6ae1cd), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1ce), EConversationDebugInfo::Executing);
                // If you make it to the Old Camp, ask for Mordrag. He's ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WOEQUIPMENT_07_03"));
                DC(int64(0x82f15ea2aa6ae1ce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg818RatfordWokarte : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1d6);
            default Caption = LocText("ORG_818_RATFORD_WOKARTE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg818RatfordWhydangerous);
            default Rules.HideIfKnows(UChoiceOrg818RatfordWokarte);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1d7), EConversationDebugInfo::Executing);
                
                // Where can I find a map?
                Hero.AI.Say(LocText("ORG_818_RATFORD_WOKARTE_15_00"));
                DC(int64(0x82f15ea2aa6ae1d7), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1d8), EConversationDebugInfo::Executing);
                
                // Ask around in the Old Camp. I think they got a mapmaker. 
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WOKARTE_07_01"));
                DC(int64(0x82f15ea2aa6ae1d8), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1d9), EConversationDebugInfo::Executing);
                // Hey, maybe you can even nick one of his pieces while ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WOKARTE_07_02"));
                DC(int64(0x82f15ea2aa6ae1d9), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceOrg818RatfordWokarteStehlen,
                    UChoiceOrg818RatfordWokarteKaufen
                );
            }
        }
        
        
        class UChoiceOrg818RatfordWokarteStehlen : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0xe8603e87342bcaad);
            default Caption = LocText("ORG_818_RATFORD_WOKARTE_STEHLEN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1dc), EConversationDebugInfo::Executing);
                // I'll bring as many as I can carry.
                Hero.AI.Say(LocText("ORG_818_RATFORD_WOKARTE_STEHLEN_15_00"));
                DC(int64(0x82f15ea2aa6ae1dc), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1dd), EConversationDebugInfo::Executing);
                
                // Ha, you're my sorta bastard. You should think about ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WOKARTE_STEHLEN_07_01"));
                DC(int64(0x82f15ea2aa6ae1dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg818RatfordWokarteKaufen : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0xe8603e87342bcab1);
            default Caption = LocText("ORG_818_RATFORD_WOKARTE_KAUFEN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1df), EConversationDebugInfo::Executing);
                
                // Can't I just buy one?
                Hero.AI.Say(LocText("ORG_818_RATFORD_WOKARTE_KAUFEN_15_00"));
                DC(int64(0x82f15ea2aa6ae1df), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1e0), EConversationDebugInfo::Executing);
                
                // Sure you can. If you're THAT sorta bloke ... 
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WOKARTE_KAUFEN_07_01"));
                DC(int64(0x82f15ea2aa6ae1e0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg818RatfordWrongway : UTopic_Hero__NC_ORG_RATFORD_818
        {
            default DebugId = int64(0x82f15ea2aa6ae1bb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceOrg818RatfordWrongway);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82f15ea2aa6ae1bc), EConversationDebugInfo::Executing);
                // Oy, you there!
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WRONGWAY_07_00"));
                DC(int64(0x82f15ea2aa6ae1bc), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1bd), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("ORG_818_RATFORD_WRONGWAY_15_01"));
                DC(int64(0x82f15ea2aa6ae1bd), EConversationDebugInfo::Done);
                DC(int64(0x82f15ea2aa6ae1be), EConversationDebugInfo::Executing);
                
                // You're a freshie, ain't you? I wanna warn you. If you ...
                Ratford.AI.Say(LocText("ORG_818_RATFORD_WRONGWAY_07_02"));
                DC(int64(0x82f15ea2aa6ae1be), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_RATFORD, Document::UDocumentSegment_Glossary_NC_ORG_RATFORD_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */