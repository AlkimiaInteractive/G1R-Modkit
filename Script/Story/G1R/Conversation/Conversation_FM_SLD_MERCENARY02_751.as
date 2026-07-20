#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_FM_SLD_MERCENARY02_751 : UConversationCharacterSettings
        {
            default ForCharacter = n"FM_SLD_MERCENARY02_751";
        }
        
        
        class UTopic_Hero__FM_SLD_MERCENARY02_751 : UG1RDialogTopic
        {
            default ForCharacter = n"FM_SLD_MERCENARY02_751";
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
        
        
        class UChoiceSld751SoeldnerExit1 : UTopic_Hero__FM_SLD_MERCENARY02_751
        {
            default DebugId = int64(0xf67e76a652d912f1);
            default Caption = LocText("DIA_SLD_751_SOELDNER_EXIT_1_INFO_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceSld751SoeldnerExit1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67e76a652d912f2), EConversationDebugInfo::Executing);
                // See you around.
                Hero.AI.Say(LocText("DIA_SLD_751_SOELDNER_EXIT_1_INFO_15_01"));
                DC(int64(0xf67e76a652d912f2), EConversationDebugInfo::Done);
                DC(int64(0xf67e76a652d912f3), EConversationDebugInfo::Executing);
                
                // Mm.
                Mercenary.AI.Say(LocText("DIA_SLD_751_SOELDNER_EXIT_1_INFO_01_02"));
                DC(int64(0xf67e76a652d912f3), EConversationDebugInfo::Done);
                DC(int64(0xf67e76a652d912f4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf67e76a652d912f4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld751SoeldnerExit2 : UTopic_Hero__FM_SLD_MERCENARY02_751
        {
            default DebugId = int64(0xf67e76a652d912f5);
            default Caption = LocText("DIA_SLD_751_SOELDNER_EXIT_2_INFO_15_01");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld751SoeldnerExit1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67e76a652d912f6), EConversationDebugInfo::Executing);
                // I got to go.
                Hero.AI.Say(LocText("DIA_SLD_751_SOELDNER_EXIT_2_INFO_15_01"));
                DC(int64(0xf67e76a652d912f6), EConversationDebugInfo::Done);
                DC(int64(0xf67e76a652d912f7), EConversationDebugInfo::Executing);
                
                // Do that.
                Mercenary.AI.Say(LocText("DIA_SLD_751_SOELDNER_EXIT_2_INFO_01_02"));
                DC(int64(0xf67e76a652d912f7), EConversationDebugInfo::Done);
                DC(int64(0xf67e76a652d912f8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf67e76a652d912f8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld751SoeldnerInmine : UTopic_Hero__FM_SLD_MERCENARY02_751
        {
            default DebugId = int64(0xf67e76a652d912fc);
            default Caption = LocText("DIA_SLD_751_SOELDNER_INMINE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld751SoeldnerInmine);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67e76a652d912fd), EConversationDebugInfo::Executing);
                // I wanna take a look at the mine. 
                Hero.AI.Say(LocText("DIA_SLD_751_SOELDNER_INMINE_INFO_15_01"));
                DC(int64(0xf67e76a652d912fd), EConversationDebugInfo::Done);
                DC(int64(0xf67e76a652d912fe), EConversationDebugInfo::Executing);
                
                // Then look at your pleasure - it's right here. If you're ...
                Mercenary.AI.Say(LocText("DIA_SLD_751_SOELDNER_INMINE_INFO_01_02"));
                DC(int64(0xf67e76a652d912fe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld751SoeldnerIntro : UTopic_Hero__FM_SLD_MERCENARY02_751
        {
            default DebugId = int64(0xf67e76a652d912ee);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceSld751SoeldnerIntro);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf67e76a652d912ef), Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 300.0f));
                }
                
                return Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 300.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67e76a652d912f0), EConversationDebugInfo::Executing);
                // Ah, a fresh face. Don't stir up any trouble, or you'll ...
                Mercenary.AI.Say(LocText("DIA_SLD_751_SOELDNER_INTRO_INFO_01_01"));
                DC(int64(0xf67e76a652d912f0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld751SoeldnerUmsehen : UTopic_Hero__FM_SLD_MERCENARY02_751
        {
            default DebugId = int64(0xf67e76a652d912f9);
            default Caption = LocText("DIA_SLD_751_SOELDNER_UMSEHEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld751SoeldnerUmsehen);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67e76a652d912fa), EConversationDebugInfo::Executing);
                
                // I just want to take a look around.
                Hero.AI.Say(LocText("DIA_SLD_751_SOELDNER_UMSEHEN_INFO_15_01"));
                DC(int64(0xf67e76a652d912fa), EConversationDebugInfo::Done);
                DC(int64(0xf67e76a652d912fb), EConversationDebugInfo::Executing);
                
                // Do that. Just don't stick your nose anywhere it doesn't ...
                Mercenary.AI.Say(LocText("DIA_SLD_751_SOELDNER_UMSEHEN_INFO_01_02"));
                DC(int64(0xf67e76a652d912fb), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */