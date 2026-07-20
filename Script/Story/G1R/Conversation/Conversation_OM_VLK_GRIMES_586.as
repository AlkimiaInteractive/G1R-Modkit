#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_VLK_GRIMES_586 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_VLK_GRIMES_586";
        }
        
        
        class UTopic_Hero__OM_VLK_GRIMES_586 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_VLK_GRIMES_586";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGrimes() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceVlk586GrimesExit : UTopic_Hero__OM_VLK_GRIMES_586
        {
            default DebugId = int64(0xe3b31781fac6eed6);
            default Caption = LocText("VLK_586_GRIMES_EXIT_INFO_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3b31781fac6eed7), EConversationDebugInfo::Executing);
                // I'll be going. Stay safe.
                Hero.AI.Say(LocText("VLK_586_GRIMES_EXIT_INFO_15_01"));
                DC(int64(0xe3b31781fac6eed7), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eed8), EConversationDebugInfo::Executing);
                
                // You too, lad. You too.
                Grimes.AI.Say(LocText("VLK_586_GRIMES_EXIT_INFO_04_02"));
                DC(int64(0xe3b31781fac6eed8), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eed9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe3b31781fac6eed9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVlk586GrimesFirst : UTopic_Hero__OM_VLK_GRIMES_586
        {
            default DebugId = int64(0xe3b31781fac6eee8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceVlk586GrimesFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef929), Grimes != nullptr && !Grimes.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Grimes_586_Collapsed));
                }
                
                return Grimes != nullptr && !Grimes.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Grimes_586_Collapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3b31781fac6eee9), EConversationDebugInfo::Executing);
                // Ahh ... a fresh face. Popped the blue yet, lad?
                Grimes.AI.Say(LocText("VLK_586_GRIMES_FIRST_INFO_04_02"));
                DC(int64(0xe3b31781fac6eee9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_GRIMES, Document::UDocumentSegment_Glossary_OM_VLK_GRIMES_Introduction);
            }
        }
        
        
        class UChoiceVlk586GrimesKnow : UTopic_Hero__OM_VLK_GRIMES_586
        {
            default DebugId = int64(0xe3b31781fac6eee0);
            default Caption = LocText("VLK_586_GRIMES_KNOW_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk586GrimesStory);
            default Rules.HideIfKnows(UChoiceVlk586GrimesKnow);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef929), Grimes != nullptr && !Grimes.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Grimes_586_Collapsed));
                }
                
                return Grimes != nullptr && !Grimes.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Grimes_586_Collapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3b31781fac6eee1), EConversationDebugInfo::Executing);
                // You must've seen some people trying to break out in the ...
                Hero.AI.Say(LocText("VLK_586_GRIMES_KNOW_INFO_15_01"));
                DC(int64(0xe3b31781fac6eee1), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eee2), EConversationDebugInfo::Executing);
                
                // Ahh, I know where this is going ... me dear lad, just ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_KNOW_INFO_04_02"));
                DC(int64(0xe3b31781fac6eee2), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eee3), EConversationDebugInfo::Executing);
                // We've all been there, dreamin' of the outside world ... ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_KNOW_INFO_04_03"));
                DC(int64(0xe3b31781fac6eee3), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eee4), EConversationDebugInfo::Executing);
                // Don't make the same mistake.
                Grimes.AI.Say(LocText("VLK_586_GRIMES_KNOW_INFO_04_04"));
                DC(int64(0xe3b31781fac6eee4), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eee5), EConversationDebugInfo::Executing);
                
                // I won't spend the rest of my life mining ore. 
                Hero.AI.Say(LocText("VLK_586_GRIMES_KNOW_INFO_15_05"));
                DC(int64(0xe3b31781fac6eee5), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eee6), EConversationDebugInfo::Executing);
                
                // Yeah, that's what I told meself too, yet now here I am. ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_KNOW_INFO_04_06"));
                DC(int64(0xe3b31781fac6eee6), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eee7), EConversationDebugInfo::Executing);
                // Even then, the barrier won't care. It kills all the ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_KNOW_INFO_04_07"));
                DC(int64(0xe3b31781fac6eee7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk586GrimesStory : UTopic_Hero__OM_VLK_GRIMES_586
        {
            default DebugId = int64(0xe3b31781fac6eeda);
            default Caption = LocText("VLK_586_GRIMES_STORY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk586GrimesFirst);
            default Rules.HideIfKnows(UChoiceVlk586GrimesStory);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef929), Grimes != nullptr && !Grimes.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Grimes_586_Collapsed));
                }
                
                return Grimes != nullptr && !Grimes.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Grimes_586_Collapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3b31781fac6eedb), EConversationDebugInfo::Executing);
                
                // "Popped the blue?"
                Hero.AI.Say(LocText("VLK_586_GRIMES_STORY_INFO_15_01"));
                DC(int64(0xe3b31781fac6eedb), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eedc), EConversationDebugInfo::Executing);
                
                // Mined your first nugget. Sorry, I've been here so long I ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_STORY_INFO_04_02"));
                DC(int64(0xe3b31781fac6eedc), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eedd), EConversationDebugInfo::Executing);
                // Ten years, it's been, can you believe it? Ten years, but ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_STORY_INFO_04_03"));
                DC(int64(0xe3b31781fac6eedd), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eede), EConversationDebugInfo::Executing);
                // The old mine by the exchange zone was better, though - ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_STORY_INFO_04_04"));
                DC(int64(0xe3b31781fac6eede), EConversationDebugInfo::Done);
                DC(int64(0xe3b31781fac6eedf), EConversationDebugInfo::Executing);
                // Ah, well, listen to me ramblin' ... guess I really AM a ...
                Grimes.AI.Say(LocText("VLK_586_GRIMES_STORY_INFO_04_05"));
                DC(int64(0xe3b31781fac6eedf), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */