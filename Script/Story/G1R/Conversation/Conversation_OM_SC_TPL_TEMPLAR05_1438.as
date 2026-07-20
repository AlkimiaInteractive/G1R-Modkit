#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_SC_TPL_TEMPLAR05_1438 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_SC_TPL_TEMPLAR05_1438";
        }
        
        
        class UTopic_Hero__OM_SC_TPL_TEMPLAR05_1438 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_SC_TPL_TEMPLAR05_1438";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTpl1438TemplerEggsearch : UTopic_Hero__OM_SC_TPL_TEMPLAR05_1438
        {
            default DebugId = int64(0x18f65678fced07e8);
            default Caption = LocText("TPL_1438_TEMPLER_EGGSEARCH_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1438TemplerEggsearch);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GUR_1201_CORKALOM_NEST_INFO_10_02"), int64(0x18f65678fced07e8));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x18f65678fced07e9), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0xae34c5512d5ef921), Templar != nullptr && !Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Templar != nullptr && Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x18f65678fced07ea), EConversationDebugInfo::Executing);
                // There has to be a minecrawler nest somewhere in the ...
                Hero.AI.Say(LocText("TPL_1438_TEMPLER_EGGSEARCH_INFO_15_01"));
                DC(int64(0x18f65678fced07ea), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07eb), EConversationDebugInfo::Executing);
                
                // Not me, but Gor Na Vid, Gor Na Kosh, or Gor Na Bar ...
                Templar.AI.Say(LocText("TPL_1438_TEMPLER_EGGSEARCH_INFO_13_02"));
                DC(int64(0x18f65678fced07eb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_AvailableTemplars);
            }
        }
        
        
        class UChoiceTpl1438TemplerExit : UTopic_Hero__OM_SC_TPL_TEMPLAR05_1438
        {
            default DebugId = int64(0x18f65678fced07d6);
            default Caption = LocText("TPL_1438_TEMPLER_EXIT_INFO_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x18f65678fced07d7), EConversationDebugInfo::Executing);
                // Take care.
                Hero.AI.Say(LocText("TPL_1438_TEMPLER_EXIT_INFO_15_01"));
                DC(int64(0x18f65678fced07d7), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07d8), EConversationDebugInfo::Executing);
                
                // Sleeper awaken.
                Templar.AI.Say(LocText("TPL_1438_TEMPLER_EXIT_INFO_13_02"));
                DC(int64(0x18f65678fced07d8), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07d9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x18f65678fced07d9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1438TemplerInfo : UTopic_Hero__OM_SC_TPL_TEMPLAR05_1438
        {
            default DebugId = int64(0x18f65678fced07da);
            default Caption = LocText("TPL_1438_TEMPLER_INFO_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1438TemplerInfo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x18f65678fced07db), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted());
                    DB(int64(0xae34c5512d5ef91e), Templar != nullptr && !Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted())
                    return false;
                
                if (Templar != nullptr && Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x18f65678fced07dc), EConversationDebugInfo::Executing);
                // What are the templars doing down here?
                Hero.AI.Say(LocText("TPL_1438_TEMPLER_INFO_INFO_15_01"));
                DC(int64(0x18f65678fced07dc), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07dd), EConversationDebugInfo::Executing);
                
                // Huntin' crawlers. Best go back to camp, freshie, it's ...
                Templar.AI.Say(LocText("TPL_1438_TEMPLER_INFO_INFO_13_02"));
                DC(int64(0x18f65678fced07dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1438TemplerKalom : UTopic_Hero__OM_SC_TPL_TEMPLAR05_1438
        {
            default DebugId = int64(0x18f65678fced07e3);
            default Caption = LocText("TPL_1438_TEMPLER_KALOM_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1438TemplerWhy);
            default Rules.HideIfKnows(UChoiceTpl1438TemplerKalom);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GUR_1201_CORKALOM_FIRST_10_00"), int64(0x18f65678fced07e3));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef91e), Templar != nullptr && !Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed));
                    DB(int64(0xa0feb74f74e38bea), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xa0feb74f74e38c06), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                if (Templar != nullptr && Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x18f65678fced07e4), EConversationDebugInfo::Executing);
                
                // Who is Cor Kalom? 
                Hero.AI.Say(LocText("TPL_1438_TEMPLER_KALOM_INFO_15_01"));
                DC(int64(0x18f65678fced07e4), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07e5), EConversationDebugInfo::Executing);
                
                // You're a nosy one, ain't you? He's one of the most ...
                Templar.AI.Say(LocText("TPL_1438_TEMPLER_KALOM_INFO_13_02"));
                DC(int64(0x18f65678fced07e5), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07e6), EConversationDebugInfo::Executing);
                // Most of all, though, he's the only one who can brew the ...
                Templar.AI.Say(LocText("TPL_1438_TEMPLER_KALOM_INFO_13_03"));
                DC(int64(0x18f65678fced07e6), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07e7), EConversationDebugInfo::Executing);
                
                // I'll think about it.
                Hero.AI.Say(LocText("TPL_1438_TEMPLER_KALOM_INFO_15_04"));
                DC(int64(0x18f65678fced07e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1438TemplerWhy : UTopic_Hero__OM_SC_TPL_TEMPLAR05_1438
        {
            default DebugId = int64(0x18f65678fced07de);
            default Caption = LocText("TPL_1438_TEMPLER_WHY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1438TemplerInfo);
            default Rules.HideIfKnows(UChoiceTpl1438TemplerWhy);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef91e), Templar != nullptr && !Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed));
                }
                
                return Templar != nullptr && !Templar.HasAssignedDailyRoutine(UDailyRoutine_OM_SC_TPL_Templar05_1438_Collapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x18f65678fced07df), EConversationDebugInfo::Executing);
                // What do you hunt them for?
                Hero.AI.Say(LocText("TPL_1438_TEMPLER_WHY_INFO_15_01"));
                DC(int64(0x18f65678fced07df), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07e0), EConversationDebugInfo::Executing);
                
                // Their mandibles. That is, the ichor in them. 
                Templar.AI.Say(LocText("TPL_1438_TEMPLER_WHY_INFO_13_02"));
                DC(int64(0x18f65678fced07e0), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07e1), EConversationDebugInfo::Executing);
                
                // "Ichor?"
                Hero.AI.Say(LocText("TPL_1438_TEMPLER_WHY_INFO_15_03"));
                DC(int64(0x18f65678fced07e1), EConversationDebugInfo::Done);
                DC(int64(0x18f65678fced07e2), EConversationDebugInfo::Executing);
                
                // A poison, of sorts. One of our gurus, Cor Kalom, uses it ...
                Templar.AI.Say(LocText("TPL_1438_TEMPLER_WHY_INFO_13_04"));
                DC(int64(0x18f65678fced07e2), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */