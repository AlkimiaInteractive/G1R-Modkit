#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_PEASANT19_929 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_PEASANT19_929";
        }
        
        
        class UTopic_NC_BAU_MALON_930__NC_BAU_PEASANT19_929 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_PEASANT19_929";
            default WithCharacter = n"NC_BAU_MALON_930";
            
            AGothicCharacterState GetPeasant19() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMalon() const property
            {
                return GetCharacter(n"NC_BAU_MALON_930");
            }
        }
        
        
        class UTopic_Hero__NC_BAU_PEASANT19_929 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_PEASANT19_929";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetPeasant19() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMalon() const property
            {
                return GetCharacter(n"NC_BAU_MALON_930");
            }
        }
        
        
        class UChoicePeasant19146563_0 : UTopic_NC_BAU_MALON_930__NC_BAU_PEASANT19_929
        {
            default DebugId = int64(0x36d532d724ac188e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoicePeasant19146563);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac188e));
            default Rules.HideIfKnows(UChoicePeasant19146563_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), Peasant19 != nullptr && Peasant19.HasAssignedDailyRoutine(UDailyRoutine_NC_BAU_Peasant19_929_FMRaid));
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Peasant19, 700.0f));
                }
                
                if (Peasant19 != nullptr && !Peasant19.HasAssignedDailyRoutine(UDailyRoutine_NC_BAU_Peasant19_929_FMRaid))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Peasant19, 700.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x36d532d724ac188d), EConversationDebugInfo::Executing);
                // Word is they came through some secret mountain path and ...
                Peasant19.AI.Say(LocText("TEXT_WIP_JTMZBQ_20250130_085534_491"));
                DC(int64(0x36d532d724ac188d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePeasant19146563_1 : UTopic_NC_BAU_MALON_930__NC_BAU_PEASANT19_929
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePeasant19146563_0);
            default Rules.HideIfKnows(UChoicePeasant19146563_1);
            default DebugId = int64(0x36d532d724ac188e);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcaef1729d0841237), EConversationDebugInfo::Executing);
                
                // Oh, Innos ..
                Malon.AI.Say(LocText("TEXT_WIP_JTMZBQ_20250130_085720"));
                DC(int64(0xcaef1729d0841237), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePeasant19146563 : UTopic_NC_BAU_MALON_930__NC_BAU_PEASANT19_929
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePeasant19146563_1);
            default Rules.HideIfKnows(UChoicePeasant19146563);
            default DebugId = int64(0x36d532d724ac188e);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x36d532d724ac1896), EConversationDebugInfo::Executing);
                
                // Lee will handle it. He always does.
                Peasant19.AI.Say(LocText("TEXT_WIP_JTMZBQ_20250130_085743"));
                DC(int64(0x36d532d724ac1896), EConversationDebugInfo::Done);
                DC(int64(0x36d532d724ac18ab), EConversationDebugInfo::Executing);
                Peasant19.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Peasant19_929_Start);
                DC(int64(0x36d532d724ac18ab), EConversationDebugInfo::Done);
                DC(int64(0x36d532d724ac18ad), EConversationDebugInfo::Executing);
                Malon.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Malon_930_Start);
                DC(int64(0x36d532d724ac18ad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePeasant1981330 : UTopic_Hero__NC_BAU_PEASANT19_929
        {
            default DebugId = int64(0x9243ca153656a057);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoicePeasant1981330);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9243ca153656a056), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9243ca153656a056), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePeasant1981346 : UTopic_Hero__NC_BAU_PEASANT19_929
        {
            default DebugId = int64(0x9243ca153656a05b);
            default Caption = LocText("TEXT_WIP_XJSKLDM_20240215_135455_2238");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoicePeasant1981346);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9243ca153656a05e), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9243ca153656a059), EConversationDebugInfo::Executing);
                // I'm looking for your foreman, Bran. Have you seen him?
                Hero.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_135455_2238"));
                DC(int64(0x9243ca153656a059), EConversationDebugInfo::Done);
                DC(int64(0x9243ca153656a05a), EConversationDebugInfo::Executing);
                
                // Bran? Nah, not since some days ago. Guess it's true, ...
                Peasant19.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_135455_1924"));
                DC(int64(0x9243ca153656a05a), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35cf), EConversationDebugInfo::Executing);
                
                // Probably. Anything you can tell me?
                Hero.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_180658"));
                DC(int64(0x7485c7d9d76d35cf), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35d0), EConversationDebugInfo::Executing);
                
                // Hmm ... afraid not. Didn't like the bloke much, and he ...
                Peasant19.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_180733"));
                DC(int64(0x7485c7d9d76d35d0), EConversationDebugInfo::Done);
                DC(int64(0x7485c7d9d76d35d1), EConversationDebugInfo::Executing);
                // Bran goes to the tavern every night. 
                Peasant19.AI.Say(LocText("TEXT_WIP_AGHDBGC_20240306_180803"));
                DC(int64(0x7485c7d9d76d35d1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_BranDrunk);
                DC(int64(0x9243ca153656a05f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9243ca153656a05f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */