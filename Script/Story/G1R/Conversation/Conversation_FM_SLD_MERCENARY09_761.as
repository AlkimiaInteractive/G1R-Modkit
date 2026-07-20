#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_FM_SLD_MERCENARY09_761 : UConversationCharacterSettings
        {
            default ForCharacter = n"FM_SLD_MERCENARY09_761";
        }
        
        
        class UTopic_Hero__FM_SLD_MERCENARY09_761 : UG1RDialogTopic
        {
            default ForCharacter = n"FM_SLD_MERCENARY09_761";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMercenary() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSld761SoeldnerBribe : UTopic_Hero__FM_SLD_MERCENARY09_761
        {
            default DebugId = int64(0x638d050eb544186);
            default Caption = LocText("DIA_SLD_761_SOELDNER_BRIBE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld761SoeldnerInmine);
            default Rules.HideIfKnows(UChoiceSld761SoeldnerBribe);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x638d050eb544187), EConversationDebugInfo::Executing);
                // Is there any way I can convince you to let me into the ...
                Hero.AI.Say(LocText("DIA_SLD_761_SOELDNER_BRIBE_INFO_15_01"));
                DC(int64(0x638d050eb544187), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb544188), EConversationDebugInfo::Executing);
                
                // No, like I said, the mine is-
                Mercenary.AI.Say(LocText("DIA_SLD_761_SOELDNER_BRIBE_INFO_03_02"));
                DC(int64(0x638d050eb544188), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb544189), EConversationDebugInfo::Executing);
                // Hold on a minute, are you trying to bribe me? 
                Mercenary.AI.Say(LocText("DIA_SLD_761_SOELDNER_BRIBE_INFO_03_03"));
                DC(int64(0x638d050eb544189), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb54418a), EConversationDebugInfo::Executing);
                
                // No, of course not. I was just-
                Hero.AI.Say(LocText("DIA_SLD_761_SOELDNER_BRIBE_INFO_15_04"));
                DC(int64(0x638d050eb54418a), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb54418b), EConversationDebugInfo::Executing);
                // Um ... I better get going. 
                Hero.AI.Say(LocText("DIA_SLD_761_SOELDNER_BRIBE_INFO_15_05"));
                DC(int64(0x638d050eb54418b), EConversationDebugInfo::Done);
                DC(int64(0x1f5fd3f5fa7573a0), EConversationDebugInfo::Executing);
                
                // Good idea. 
                Mercenary.AI.Say(LocText("TEXT_WIP_FSVMXID_20241010_141433"));
                DC(int64(0x1f5fd3f5fa7573a0), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb54418c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x638d050eb54418c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld761SoeldnerExit1 : UTopic_Hero__FM_SLD_MERCENARY09_761
        {
            default DebugId = int64(0x638d050eb544178);
            default Caption = LocText("DIA_SLD_761_SOELDNER_EXIT_1_INFO_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceSld761SoeldnerExit1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x638d050eb544179), EConversationDebugInfo::Executing);
                // I have to go. 
                Hero.AI.Say(LocText("DIA_SLD_761_SOELDNER_EXIT_1_INFO_15_01"));
                DC(int64(0x638d050eb544179), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb54417a), EConversationDebugInfo::Executing);
                
                // I'm not stopping you. 
                Mercenary.AI.Say(LocText("DIA_SLD_761_SOELDNER_EXIT_1_INFO_03_02"));
                DC(int64(0x638d050eb54417a), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb54417b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x638d050eb54417b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld761SoeldnerExit2 : UTopic_Hero__FM_SLD_MERCENARY09_761
        {
            default DebugId = int64(0x638d050eb54417c);
            default Caption = LocText("DIA_SLD_761_SOELDNER_EXIT_2_INFO_15_01");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld761SoeldnerExit1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x638d050eb54417d), EConversationDebugInfo::Executing);
                // I'll be off.
                Hero.AI.Say(LocText("DIA_SLD_761_SOELDNER_EXIT_2_INFO_15_01"));
                DC(int64(0x638d050eb54417d), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb54417e), EConversationDebugInfo::Executing);
                
                // Okay.
                Mercenary.AI.Say(LocText("DIA_SLD_761_SOELDNER_EXIT_2_INFO_03_02"));
                DC(int64(0x638d050eb54417e), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb54417f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x638d050eb54417f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld761SoeldnerInmine : UTopic_Hero__FM_SLD_MERCENARY09_761
        {
            default DebugId = int64(0x638d050eb544183);
            default Caption = LocText("DIA_SLD_761_SOELDNER_INMINE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld761SoeldnerInmine);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x638d050eb544184), EConversationDebugInfo::Executing);
                // I wanted to take a look at the mine.
                Hero.AI.Say(LocText("DIA_SLD_761_SOELDNER_INMINE_INFO_15_01"));
                DC(int64(0x638d050eb544184), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb544185), EConversationDebugInfo::Executing);
                
                // You can see it's locked, can't you? Go away. Nothing for ...
                Mercenary.AI.Say(LocText("DIA_SLD_761_SOELDNER_INMINE_INFO_03_02"));
                DC(int64(0x638d050eb544185), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld761SoeldnerIntro : UTopic_Hero__FM_SLD_MERCENARY09_761
        {
            default DebugId = int64(0x638d050eb544175);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceSld761SoeldnerIntro);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x638d050eb544176), Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 300.0f));
                }
                
                return Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 300.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x638d050eb544177), EConversationDebugInfo::Executing);
                // What are you doing here?
                Mercenary.AI.Say(LocText("DIA_SLD_761_SOELDNER_INTRO_INFO_03_01"));
                DC(int64(0x638d050eb544177), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld761SoeldnerUmsehen : UTopic_Hero__FM_SLD_MERCENARY09_761
        {
            default DebugId = int64(0x638d050eb544180);
            default Caption = LocText("DIA_SLD_761_SOELDNER_UMSEHEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld761SoeldnerUmsehen);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x638d050eb544181), EConversationDebugInfo::Executing);
                
                // I'm just exploring the camp.
                Hero.AI.Say(LocText("DIA_SLD_761_SOELDNER_UMSEHEN_INFO_15_01"));
                DC(int64(0x638d050eb544181), EConversationDebugInfo::Done);
                DC(int64(0x638d050eb544182), EConversationDebugInfo::Executing);
                
                // Then you must've gotten lost. This is the Free Mine, and ...
                Mercenary.AI.Say(LocText("DIA_SLD_761_SOELDNER_UMSEHEN_INFO_03_02"));
                DC(int64(0x638d050eb544182), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */