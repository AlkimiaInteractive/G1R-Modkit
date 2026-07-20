#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR11_1415 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR11_1415";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR11_1415 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR11_1415";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceTpl1415TorwacheExit : UTopic_Hero__SC_TPL_TEMPLAR11_1415
        {
            default DebugId = int64(0x198414611cbf8194);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x198414611cbf8195), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x198414611cbf8195), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1415TorwacheFirst : UTopic_Hero__SC_TPL_TEMPLAR11_1415
        {
            default DebugId = int64(0x198414611cbf8196);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTpl1415TorwacheFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9ef4c79171674443), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x9ef4c79171674444), Templar != nullptr && Templar.IsAtPreferredLocation(100.0f));
                    DB(int64(0xa488e15a3a3dea4a), Hero != nullptr && !Hero.HasEverEnteredArea(GameplayTag::Area_SwampCamp));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Templar != nullptr && !Templar.IsAtPreferredLocation(100.0f))
                    return false;
                
                if (Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_SwampCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x198414611cbf8198), EConversationDebugInfo::Executing);
                // Greetings, stranger!
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_13_00"));
                DC(int64(0x198414611cbf8198), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf8199), EConversationDebugInfo::Executing);
                // You're about to enter holy ground - this is the ...
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_13_01"));
                DC(int64(0x198414611cbf8199), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf819a), EConversationDebugInfo::Executing);
                // What brings you here?
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_13_02"));
                DC(int64(0x198414611cbf819a), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceTpl1415TorwacheFirstJustlooking,
                    UChoiceTpl1415TorwacheFirstJoin
                );
            }
        }
        
        
        class UChoiceTpl1415TorwacheFirstJustlooking : UTopic_Hero__SC_TPL_TEMPLAR11_1415
        {
            default DebugId = int64(0xe8603e87342bfbfb);
            default Caption = LocText("DIA_TPL_1415_TORWACHE_FIRST_JUSTLOOKING_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x198414611cbf819d), EConversationDebugInfo::Executing);
                // I'm new to the Colony. I just wanted to take a look at ...
                Hero.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_JUSTLOOKING_15_00"));
                DC(int64(0x198414611cbf819d), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf819e), EConversationDebugInfo::Executing);
                
                // I see. Well, anybody is welcome here. 
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_JUSTLOOKING_13_01"));
                DC(int64(0x198414611cbf819e), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf819f), EConversationDebugInfo::Executing);
                // As long as they respect our rules. Some areas are off ...
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_JUSTLOOKING_13_02"));
                DC(int64(0x198414611cbf819f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1415TorwacheFirstJoin : UTopic_Hero__SC_TPL_TEMPLAR11_1415
        {
            default DebugId = int64(0xe8603e87342bfc00);
            default Caption = LocText("DIA_TPL_1415_TORWACHE_FIRST_JOIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc0be0c879a967f7d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x198414611cbf81a2), EConversationDebugInfo::Executing);
                
                // I heard you're looking for new recruits. I want to join ...
                Hero.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_JOIN_15_00"));
                DC(int64(0x198414611cbf81a2), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf81a3), EConversationDebugInfo::Executing);
                
                // A seeker ... I see. Then be welcome. The Brotherhood has ...
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_JOIN_13_01"));
                DC(int64(0x198414611cbf81a3), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf81a4), EConversationDebugInfo::Executing);
                // Oh, and a word of advice: if you're truly serious about ...
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_JOIN_13_02"));
                DC(int64(0x198414611cbf81a4), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf81a5), EConversationDebugInfo::Executing);
                // However, do NOT speak to him directly - that's a ...
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_FIRST_JOIN_13_04"));
                DC(int64(0x198414611cbf81a5), EConversationDebugInfo::Done);
                DC(int64(0xfe6cb0372ac11c4), EConversationDebugInfo::Executing);
                
                // How is that supposed to work?
                Hero.AI.Say(LocText("TEXT_WIP_ZTYHSLC_20240226_192149"));
                DC(int64(0xfe6cb0372ac11c4), EConversationDebugInfo::Done);
                DC(int64(0xfe6cb0372ac11c5), EConversationDebugInfo::Executing);
                
                // You'll figure it out.
                Templar.AI.Say(LocText("TEXT_WIP_ZTYHSLC_20240226_192157"));
                DC(int64(0xfe6cb0372ac11c5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1415TorwacheSit : UTopic_Hero__SC_TPL_TEMPLAR11_1415
        {
            default DebugId = int64(0x198414611cbf81a6);
            default Caption = LocText("DIA_TPL_1415_TORWACHE_SIT_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x198414611cbf81a7), EConversationDebugInfo::Executing);
                
                // What's the situation in the camp?
                Hero.AI.Say(LocText("DIA_TPL_1415_TORWACHE_SIT_15_00"));
                DC(int64(0x198414611cbf81a7), EConversationDebugInfo::Done);
                DC(int64(0x198414611cbf81a8), EConversationDebugInfo::Executing);
                
                // All quiet. Go on in.
                Templar.AI.Say(LocText("DIA_TPL_1415_TORWACHE_SIT_13_01"));
                DC(int64(0x198414611cbf81a8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1415TorwacheTempleraufnahme : UTopic_Hero__SC_TPL_TEMPLAR11_1415
        {
            default DebugId = int64(0x198414611cbf81a9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceTpl1415TorwacheTempleraufnahme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc0be0c879a967f86), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xc0be0c879a967f87), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    DB(int64(0xc0be0c879a967f88), Hero != nullptr && Hero.IsCloseToCharacter(Templar, 1000.0f));
                    DB(int64(0xc0be0c879a967f89), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xc0be0c879a967f8a), Hero != nullptr && Hero.IsCloseToCharacter(Templar, 1000.0f));
                    DB(int64(0xc0be0c879a967f8b), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded() && Hero != nullptr && Hero.IsCloseToCharacter(Templar, 1000.0f))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Hero != nullptr && Hero.IsCloseToCharacter(Templar, 1000.0f) && Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe32f83ca0e7fdf8b), EConversationDebugInfo::Executing);
                // Brother, it's good to see you! I heard about what ...
                Templar.AI.Say(LocText("TPL_1415_TORWACHE_IMPORTANT_INFO_13_01"));
                DC(int64(0xe32f83ca0e7fdf8b), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */