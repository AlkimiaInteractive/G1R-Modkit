#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_GRD_GUARD05_264 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_GRD_GUARD05_264";
        }
        
        
        class UTopic_Hero__OM_GRD_GUARD05_264 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_GRD_GUARD05_264";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd264Exit : UTopic_Hero__OM_GRD_GUARD05_264
        {
            default DebugId = int64(0x914b7036514a5ef8);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x914b7036514a5ef9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x914b7036514a5ef9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd264GardistGardeaufnahme : UTopic_Hero__OM_GRD_GUARD05_264
        {
            default DebugId = int64(0x914b7036514a5efa);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd260DrakeGardeaufnahme);
            default Rules.HideIfKnows(UChoiceGrd264GardistGardeaufnahme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x914b7036514a5efb), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                    DB(int64(0x914b7036514a5efc), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xae34c5512d5ef91d), Guard != nullptr && !Guard.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Guard05_264_Collapsed));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Guard != nullptr && Guard.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Guard05_264_Collapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x914b7036514a5efd), EConversationDebugInfo::Executing);
                // Hey, good job with that crawler nest. We could use ...
                Guard.AI.Say(LocText("GRD_264_GARDIST_GARDEAUFNAHME_INFO_07_01"));
                DC(int64(0x914b7036514a5efd), EConversationDebugInfo::Done);
                DC(int64(0x914b7036514a5efe), EConversationDebugInfo::Executing);
                // I don't think this alone is gonna cut it for Thorus, but ...
                Guard.AI.Say(LocText("GRD_264_GARDIST_GARDEAUFNAHME_INFO_07_02"));
                DC(int64(0x914b7036514a5efe), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c343234ed), EConversationDebugInfo::Executing);
                
                // Okay. 
                Hero.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_162639"));
                DC(int64(0x9d1cf82c343234ed), EConversationDebugInfo::Done);
                DC(int64(0x15325efd7871b487), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x15325efd7871b487), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */