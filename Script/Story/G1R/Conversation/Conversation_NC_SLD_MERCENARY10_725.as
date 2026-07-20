#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_MERCENARY10_725 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_MERCENARY10_725";
        }
        
        
        class UTopic_Hero__NC_SLD_MERCENARY10_725 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_MERCENARY10_725";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMercenary10() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMercenary10105993 : UTopic_Hero__NC_SLD_MERCENARY10_725
        {
            default DebugId = int64(0x753266f72e54b376);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b375), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x753266f72e54b375), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMercenary10106009 : UTopic_Hero__NC_SLD_MERCENARY10_725
        {
            default DebugId = int64(0x753266f72e54b37a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMercenary10106009);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x753266f72e54b380), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_ORE_CAVE", 200.0f));
                    DB(int64(0xaea48441f0990779), Mercenary10 != nullptr && !Mercenary10.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Mercenary10_725_Rest));
                    DB(int64(0x753266f72e54b37e), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xaea48441f099077a), Mercenary10 != nullptr && !Mercenary10.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Mercenary10_725_Rest));
                }
                
                if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_ORE_CAVE", 200.0f) && Mercenary10 != nullptr && !Mercenary10.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Mercenary10_725_Rest))
                    return true;
                
                if (Hero != nullptr && Hero.IsInConversation() && Mercenary10 != nullptr && !Mercenary10.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Mercenary10_725_Rest))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b379), EConversationDebugInfo::Executing);
                // Let me guess: you wanna take a peek at the ore pile? 
                Mercenary10.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_115537_443"));
                DC(int64(0x753266f72e54b379), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee0112), EConversationDebugInfo::Executing);
                
                // And if I did? 
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_152136"));
                DC(int64(0x45f83621a0ee0112), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee0113), EConversationDebugInfo::Executing);
                
                // Then I'd tell you to piss right off. No one gets in here ...
                Mercenary10.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_152140"));
                DC(int64(0x45f83621a0ee0113), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b381), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x753266f72e54b381), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMercenary10106115 : UTopic_Hero__NC_SLD_MERCENARY10_725
        {
            default DebugId = int64(0x753266f72e54b384);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMercenary10106115);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_ORE_CAVE", 100.0f, int64(0x753266f72e54b384));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_UIXCDZL_20240801_115537_443"), int64(0x753266f72e54b384));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xaea48441f099077b), Mercenary10 != nullptr && !Mercenary10.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Mercenary10_725_Rest));
                }
                
                return Mercenary10 != nullptr && !Mercenary10.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Mercenary10_725_Rest);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b383), EConversationDebugInfo::Executing);
                // You asked for it.
                Mercenary10.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_115715_491"));
                DC(int64(0x753266f72e54b383), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b38a), EConversationDebugInfo::Executing);
                Mercenary10.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x753266f72e54b38a), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b38b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x753266f72e54b38b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */