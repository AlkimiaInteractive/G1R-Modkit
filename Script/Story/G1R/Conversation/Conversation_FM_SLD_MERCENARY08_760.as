#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_FM_SLD_MERCENARY08_760 : UConversationCharacterSettings
        {
            default ForCharacter = n"FM_SLD_MERCENARY08_760";
        }
        
        
        class UTopic_Hero__FM_SLD_MERCENARY08_760 : UG1RDialogTopic
        {
            default ForCharacter = n"FM_SLD_MERCENARY08_760";
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
        
        
        class UChoiceSld760SoeldnerExit1 : UTopic_Hero__FM_SLD_MERCENARY08_760
        {
            default DebugId = int64(0x648b86aceeb9945);
            default Caption = LocText("DIA_SLD_760_SOELDNER_EXIT_1_INFO_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceSld760SoeldnerExit1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x648b86aceeb9946), EConversationDebugInfo::Executing);
                // I'll be going.
                Hero.AI.Say(LocText("DIA_SLD_760_SOELDNER_EXIT_1_INFO_15_01"));
                DC(int64(0x648b86aceeb9946), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb9947), EConversationDebugInfo::Executing);
                
                // Yeah, yeah.
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_EXIT_1_INFO_13_02"));
                DC(int64(0x648b86aceeb9947), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb9948), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x648b86aceeb9948), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld760SoeldnerExit2 : UTopic_Hero__FM_SLD_MERCENARY08_760
        {
            default DebugId = int64(0x648b86aceeb9949);
            default Caption = LocText("DIA_SLD_760_SOELDNER_EXIT_2_INFO_15_01");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld760SoeldnerExit1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x648b86aceeb994a), EConversationDebugInfo::Executing);
                // I got to go.
                Hero.AI.Say(LocText("DIA_SLD_760_SOELDNER_EXIT_2_INFO_15_01"));
                DC(int64(0x648b86aceeb994a), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb994b), EConversationDebugInfo::Executing);
                
                // I ain't stoppin' you ... 
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_EXIT_2_INFO_13_02"));
                DC(int64(0x648b86aceeb994b), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb994c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x648b86aceeb994c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld760SoeldnerInmine : UTopic_Hero__FM_SLD_MERCENARY08_760
        {
            default DebugId = int64(0x648b86aceeb9950);
            default Caption = LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld760SoeldnerInmine);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x648b86aceeb9951), EConversationDebugInfo::Executing);
                // I want into the mine.
                Hero.AI.Say(LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_15_01"));
                DC(int64(0x648b86aceeb9951), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb9952), EConversationDebugInfo::Executing);
                
                // Not unless Okyl says so.
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_13_02"));
                DC(int64(0x648b86aceeb9952), EConversationDebugInfo::Done);
                DB(int64(0x648b86aceeb9954), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02")))
                {
                    DC(int64(0x648b86aceeb9955), EConversationDebugInfo::Executing);
                    // Who is this Okyl?
                    Hero.AI.Say(LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_15_03"));
                    DC(int64(0x648b86aceeb9955), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x648b86aceeb9956), EConversationDebugInfo::Executing);
                    // Okyl ... isn't that the guy with the big axe and the ...
                    Hero.AI.Say(LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_15_08"));
                    DC(int64(0x648b86aceeb9956), EConversationDebugInfo::Done);
                }
                DC(int64(0x648b86aceeb9957), EConversationDebugInfo::Executing);
                // That's the one. Tough bastard, he is. Maybe the toughest ...
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_13_04"));
                DC(int64(0x648b86aceeb9957), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb9958), EConversationDebugInfo::Executing);
                // He snuck into the Old Camp castle once, and snatched a ...
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_13_05"));
                DC(int64(0x648b86aceeb9958), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb9959), EConversationDebugInfo::Executing);
                // If you talk to him, show him some respect. 
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_INMINE_INFO_13_06"));
                DC(int64(0x648b86aceeb9959), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld760SoeldnerIntro : UTopic_Hero__FM_SLD_MERCENARY08_760
        {
            default DebugId = int64(0x648b86aceeb9942);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceSld760SoeldnerIntro);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x648b86aceeb9943), Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 300.0f));
                }
                
                return Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 300.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x648b86aceeb9944), EConversationDebugInfo::Executing);
                // Oy, what are you doin' lurkin' around here? Four words, ...
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_INTRO_INFO_13_01"));
                DC(int64(0x648b86aceeb9944), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld760SoeldnerUmsehen : UTopic_Hero__FM_SLD_MERCENARY08_760
        {
            default DebugId = int64(0x648b86aceeb994d);
            default Caption = LocText("DIA_SLD_760_SOELDNER_UMSEHEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld760SoeldnerUmsehen);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x648b86aceeb994e), EConversationDebugInfo::Executing);
                
                // I'm just looking around.
                Hero.AI.Say(LocText("DIA_SLD_760_SOELDNER_UMSEHEN_INFO_15_01"));
                DC(int64(0x648b86aceeb994e), EConversationDebugInfo::Done);
                DC(int64(0x648b86aceeb994f), EConversationDebugInfo::Executing);
                
                // Then leave those fingers where they belong, if you wanna ...
                Mercenary.AI.Say(LocText("DIA_SLD_760_SOELDNER_UMSEHEN_INFO_13_02"));
                DC(int64(0x648b86aceeb994f), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */