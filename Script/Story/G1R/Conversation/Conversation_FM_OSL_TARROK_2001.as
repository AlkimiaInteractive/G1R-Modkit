#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_FM_OSL_TARROK_2001 : UConversationCharacterSettings
        {
            default ForCharacter = n"FM_OSL_TARROK_2001";
        }
        
        
        class UTopic_Hero__FM_OSL_TARROK_2001 : UG1RDialogTopic
        {
            default ForCharacter = n"FM_OSL_TARROK_2001";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTarrok() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceFreemineorcEveryulumulu : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8314b3119f43a100);
            default Caption = LocText("INFO_FREEMINEORC_EVERYULUMULU_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTarrok100029);
            default Rules.HideIfKnows(UChoiceFreemineorcEveryulumulu);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8314b3119f43a101), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning());
                    DB(int64(0x8314b3119f43a102), Hero != nullptr && Hero.HasItem(UItAt_Firelizard_05, 1, 0));
                    DB(int64(0x8314b3119f43a103), Hero != nullptr && Hero.HasItem(UItAt_Shadow_05, 1, 0));
                    DB(int64(0x8314b3119f43a104), Hero != nullptr && Hero.HasItem(UItAt_Swampshark_04, 1, 0));
                    DB(int64(0x8314b3119f43a105), Hero != nullptr && Hero.HasItem(UItAt_Troll_03, 1, 0));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Firelizard_05, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Shadow_05, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Swampshark_04, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Troll_03, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a106), EConversationDebugInfo::Executing);
                // You won't believe it, but I found everything. Here.
                Hero.AI.Say(LocText("INFO_FREEMINEORC_EVERYULUMULU_15_01"));
                DC(int64(0x8314b3119f43a106), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a107), EConversationDebugInfo::Executing);
                
                // Let me see. 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_EVERYULUMULU_17_02"));
                DC(int64(0x8314b3119f43a107), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a108), EConversationDebugInfo::Executing);
                // ... Hmm. You speak true. And you crushed all these ...
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_EVERYULUMULU_17_03"));
                DC(int64(0x8314b3119f43a108), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d7c), EConversationDebugInfo::Executing);
                
                // Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_202657"));
                DC(int64(0x6c841adcd2f98d7c), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d7d), EConversationDebugInfo::Executing);
                
                // Then you are deserving of the Ulu-Mulu. I need time. You ...
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_202700"));
                DC(int64(0x6c841adcd2f98d7d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Materials);
                DC(int64(0x8314b3119f43a10a), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItAt_Troll_03, 1, 0);
                DC(int64(0x8314b3119f43a10a), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a10b), EConversationDebugInfo::Executing);
                Hero.RemoveAllItemsFromInventory(UItAt_Shadow_05);
                DC(int64(0x8314b3119f43a10b), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a10c), EConversationDebugInfo::Executing);
                Hero.RemoveAllItemsFromInventory(UItAt_Swampshark_04);
                DC(int64(0x8314b3119f43a10c), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a10f), EConversationDebugInfo::Executing);
                Hero.RemoveAllItemsFromInventory(UItAt_Firelizard_05);
                DC(int64(0x8314b3119f43a10f), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a110), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.SucceedQuest();
                DC(int64(0x8314b3119f43a110), EConversationDebugInfo::Done);
                DC(int64(0x5ee9cba37bb98854), EConversationDebugInfo::Executing);
                Tarrok.ExchangeDailyRoutineToClass(UDailyRoutine_FM_OSL_Tarrok_2001_Anvil);
                DC(int64(0x5ee9cba37bb98854), EConversationDebugInfo::Done);
                DC(int64(0x5ee9cba37bb98856), EConversationDebugInfo::Executing);
                Tarrok.RefuseToTalk(30);
                DC(int64(0x5ee9cba37bb98856), EConversationDebugInfo::Done);
                DC(int64(0xca5d271bb5ea16dc), EConversationDebugInfo::Executing);
                G1R.HasULUMULU = 1;
                DC(int64(0xca5d271bb5ea16dc), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a113), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8314b3119f43a113), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFreemineorcExit : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8314b3119f43a083);
            default Caption = LocText("INFO_FREEMINEORC_EXIT_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb404c0f5ae7ae5d6), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.IsRunning());
                    DB(int64(0x192d18d4e64d1c3d), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.HasSucceeded());
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.IsRunning())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a086), EConversationDebugInfo::Executing);
                // I'll leave you be.
                Hero.AI.Say(LocText("INFO_FREEMINEORC_EXIT_15_01"));
                DC(int64(0x8314b3119f43a086), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a087), EConversationDebugInfo::Executing);
                
                // Mmm ... 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_EXIT_17_02"));
                DC(int64(0x8314b3119f43a087), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a08a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8314b3119f43a08a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFreemineorcIntro : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8314b3119f43a08b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceFreemineorcIntro);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x16cf94fd2d479abb), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a08c), EConversationDebugInfo::Executing);
                // Well done, morra. You found me.
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_INTRO_17_01"));
                DC(int64(0x8314b3119f43a08c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Meet);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_OSL_TARROK, Document::UDocumentSegment_Glossary_FM_OSL_TARROK_Introduction);
                DC(int64(0x2a9130fe4312826b), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK.SucceedQuest();
                DC(int64(0x2a9130fe4312826b), EConversationDebugInfo::Done);
                DB(int64(0x82931599855105a5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0x82931599855105b6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x82931599855105a9), EConversationDebugInfo::Executing);
                    // Will you kill me now, like you killed the blue ones? 
                    Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_174238_2083"));
                    DC(int64(0x82931599855105a9), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x82931599855105b8), EConversationDebugInfo::Executing);
                    // Will you make me work the mines again? 
                    Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_174610_1924"));
                    DC(int64(0x82931599855105b8), EConversationDebugInfo::Done);
                    DC(int64(0x6c841adcd2f98d50), EConversationDebugInfo::Executing);
                    // If yes, then I will not come. I am done serving. 
                    Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_200450"));
                    DC(int64(0x6c841adcd2f98d50), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x82931599855105ad), EConversationDebugInfo::Executing);
                    // You are with the swamp people, are you not? 
                    Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_174240_2238"));
                    DC(int64(0x82931599855105ad), EConversationDebugInfo::Done);
                    DC(int64(0x6c841adcd2f98d51), EConversationDebugInfo::Executing);
                    // Are you here to kill me?
                    Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_200533"));
                    DC(int64(0x6c841adcd2f98d51), EConversationDebugInfo::Done);
                }
                DC(int64(0x6c841adcd2f98d58), EConversationDebugInfo::Executing);
                // Relax. I'm not your enemy. 
                Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_200602"));
                DC(int64(0x6c841adcd2f98d58), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d59), EConversationDebugInfo::Executing);
                
                // (low questioning growl)
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_200614"));
                DC(int64(0x6c841adcd2f98d59), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFreemineorcLookingulumulu : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8314b3119f43a0f8);
            default Caption = LocText("INFO_FREEMINEORC_LOOKINGULUMULU_15_01");
            default PriorityRank = 5;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTarrok100029);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xef0d4b2c8353b7b8), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a0fd), EConversationDebugInfo::Executing);
                
                // I'm still on it. 
                Hero.AI.Say(LocText("INFO_FREEMINEORC_LOOKINGULUMULU_15_01"));
                DC(int64(0x8314b3119f43a0fd), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a0fe), EConversationDebugInfo::Executing);
                
                // Then I will wait here. Don't die. 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_LOOKINGULUMULU_17_02"));
                DC(int64(0x8314b3119f43a0fe), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a0ff), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8314b3119f43a0ff), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFreemineorcSucheulumulu : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8314b3119f43a0b0);
            default Caption = LocText("TEXT_WIP_GEVDOTI_20240704_200041_3750");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFreemineorcIntro);
            default Rules.HideIfKnows(UChoiceFreemineorcSucheulumulu);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d72a998a4e8175c), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a0b1), EConversationDebugInfo::Executing);
                // You must be Tarrok. "Kurg kuzûk yor mukh."
                Hero.AI.Say(LocText("INFO_FREEMINEORC_SUCHEULUMULU_15_01"));
                DC(int64(0x8314b3119f43a0b1), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d74), EConversationDebugInfo::Executing);
                
                // What did you say?
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201628"));
                DC(int64(0x6c841adcd2f98d74), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d77), EConversationDebugInfo::Executing);
                
                // Well, something like that. Ur-Shak sends his regards.
                Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201735"));
                DC(int64(0x6c841adcd2f98d77), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a0b2), EConversationDebugInfo::Executing);
                
                // Ur-Shak. My blood bonded. But ... how does the morra ...
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_SUCHEULUMULU_17_02"));
                DC(int64(0x8314b3119f43a0b2), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a0b3), EConversationDebugInfo::Executing);
                
                // Long story. The short version is that I need you to help ...
                Hero.AI.Say(LocText("INFO_FREEMINEORC_SUCHEULUMULU_15_03"));
                DC(int64(0x8314b3119f43a0b3), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d78), EConversationDebugInfo::Executing);
                
                // ... Why? 
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_202012"));
                DC(int64(0x6c841adcd2f98d78), EConversationDebugInfo::Done);
                DC(int64(0x82931599855105ed), EConversationDebugInfo::Executing);
                
                // I don't have the time to explain everything.
                Hero.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_185353_2785"));
                DC(int64(0x82931599855105ed), EConversationDebugInfo::Done);
                DC(int64(0x8293159985510618), EConversationDebugInfo::Executing);
                // But it's Ur-Shak who told me about the Ulu-Mulu, and he ...
                Hero.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_185447"));
                DC(int64(0x8293159985510618), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d79), EConversationDebugInfo::Executing);
                // Will you help me or not? 
                Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_202122"));
                DC(int64(0x6c841adcd2f98d79), EConversationDebugInfo::Done);
                DC(int64(0x829315998551061a), EConversationDebugInfo::Executing);
                
                // Mmm ... 
                Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_185513"));
                DC(int64(0x829315998551061a), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d7a), EConversationDebugInfo::Executing);
                // Very well. I don't like your foglike words, but I trust ...
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_202327"));
                DC(int64(0x6c841adcd2f98d7a), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d7b), EConversationDebugInfo::Executing);
                // I will help you. 
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_202343"));
                DC(int64(0x6c841adcd2f98d7b), EConversationDebugInfo::Done);
                DC(int64(0x82931599855105f1), EConversationDebugInfo::Executing);
                
                // Because the Sleeper - "Krushak" - is about to wake up. 
                Hero.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_185353_3286"));
                DC(int64(0x82931599855105f1), EConversationDebugInfo::Done);
                DC(int64(0x829315998551061b), EConversationDebugInfo::Executing);
                // And that will be unpleasant for all of us. 
                Hero.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_185543"));
                DC(int64(0x829315998551061b), EConversationDebugInfo::Done);
                DC(int64(0x829315998551061e), EConversationDebugInfo::Executing);
                
                // (amused grunt) Yes ... Ur-Shak sent you. Now I'm sure.
                Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_185637"));
                DC(int64(0x829315998551061e), EConversationDebugInfo::Done);
                DC(int64(0x829315998551061f), EConversationDebugInfo::Executing);
                // I will speak "cho khal" to you. I don't know if Krushak ...
                Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_185758"));
                DC(int64(0x829315998551061f), EConversationDebugInfo::Done);
                DC(int64(0x8293159985510629), EConversationDebugInfo::Executing);
                // But Ur-Shak has my blood, and my trust. And so I will ...
                Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_191850"));
                DC(int64(0x8293159985510629), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFreemineorcWaspassiert : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8314b3119f43a08d);
            default Caption = LocText("INFO_FREEMINEORC_WASPASSIERT_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFreemineorcIntro);
            default Rules.HideIfKnows(UChoiceFreemineorcWaspassiert);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x192d18d4e64d1c3c), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.HasSucceeded());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a08e), EConversationDebugInfo::Executing);
                
                // What are you doing here? 
                Hero.AI.Say(LocText("INFO_FREEMINEORC_WASPASSIERT_15_01"));
                DC(int64(0x8314b3119f43a08e), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a08f), EConversationDebugInfo::Executing);
                
                // Why must the morra ask? He knows the answer already. 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_WASPASSIERT_17_02"));
                DC(int64(0x8314b3119f43a08f), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d5a), EConversationDebugInfo::Executing);
                
                // You're a slave. 
                Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_200718"));
                DC(int64(0x6c841adcd2f98d5a), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a090), EConversationDebugInfo::Executing);
                
                // Yes ... slave. For many, many winters. 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_WASPASSIERT_17_03"));
                DC(int64(0x8314b3119f43a090), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d5b), EConversationDebugInfo::Executing);
                // But maybe I deserve it. When the red morra came, I could ...
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_200733"));
                DC(int64(0x6c841adcd2f98d5b), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a091), EConversationDebugInfo::Executing);
                // Instead, I ran. 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_WASPASSIERT_17_04"));
                DC(int64(0x8314b3119f43a091), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFreemineorcWastun : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8314b3119f43a093);
            default Caption = LocText("INFO_FREEMINEORC_WASTUN_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFreemineorcWaspassiert);
            default Rules.HideIfKnows(UChoiceFreemineorcWastun);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_FREEMINEORC_SUCHEULUMULU_17_02"), int64(0x8314b3119f43a093));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a094), EConversationDebugInfo::Executing);
                
                // The raid is over. You don't have to stay here.
                Hero.AI.Say(LocText("INFO_FREEMINEORC_WASTUN_15_01"));
                DC(int64(0x8314b3119f43a094), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a095), EConversationDebugInfo::Executing);
                
                // I told you, I have no spirit to fight on. The blue morra ...
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_WASTUN_17_02"));
                DC(int64(0x8314b3119f43a095), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d5c), EConversationDebugInfo::Executing);
                // My zarr left me long ago. 
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_200928"));
                DC(int64(0x6c841adcd2f98d5c), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Tarrok_101854,
                    UTopic_Tarrok_95190,
                    UTopic_Tarrok_95387
                );
            }
        }
        
        
        class UTopic_Tarrok_101854 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x6c841adcd2f98d5d);
            default Caption = LocText("TEXT_WIP_GEVDOTI_20240704_201011_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Tarrok_101854);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6c841adcd2f98d5e), EConversationDebugInfo::Executing);
                // "Zarr?"
                Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201011_2083"));
                DC(int64(0x6c841adcd2f98d5e), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d61), EConversationDebugInfo::Executing);
                
                // Yes ... life. Change. Death. Bâlyar's power that fills ...
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201025"));
                DC(int64(0x6c841adcd2f98d61), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d62), EConversationDebugInfo::Executing);
                
                // ... Not sure I follow. 
                Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201100"));
                DC(int64(0x6c841adcd2f98d62), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d63), EConversationDebugInfo::Executing);
                
                // Yes. Because you morra refuse to see it. 
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201114"));
                DC(int64(0x6c841adcd2f98d63), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d60), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6c841adcd2f98d60), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Tarrok_95190 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x8293159985510643);
            default Caption = LocText("TEXT_WIP_PSCRXAL_20240430_194342_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Tarrok_95190);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8293159985510644), EConversationDebugInfo::Executing);
                // I could help you get out of here.
                Hero.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_194342_3984"));
                DC(int64(0x8293159985510644), EConversationDebugInfo::Done);
                DC(int64(0x82931599855106c5), EConversationDebugInfo::Executing);
                
                // No. I have made my peace. Now leave me be. 
                Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_200653"));
                DC(int64(0x82931599855106c5), EConversationDebugInfo::Done);
                DB(int64(0x829315998551065e), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning());
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning())
                {
                    DC(int64(0x8293159985510675), EConversationDebugInfo::Executing);
                    // Afraid I can't do that. I need your help to build an ...
                    Hero.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_195211_1609"));
                    DC(int64(0x8293159985510675), EConversationDebugInfo::Done);
                    DC(int64(0x82931599855106c4), EConversationDebugInfo::Executing);
                    
                    // ... An Ulu-Mulu?
                    Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_200623"));
                    DC(int64(0x82931599855106c4), EConversationDebugInfo::Done);
                    DC(int64(0x6c841adcd2f98d65), EConversationDebugInfo::Executing);
                    
                    // It's important.
                    Hero.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201351"));
                    DC(int64(0x6c841adcd2f98d65), EConversationDebugInfo::Done);
                    DC(int64(0x82931599855106cd), EConversationDebugInfo::Executing);
                    
                    // Hmm ... no. I don't know you. Now go. 
                    Tarrok.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_204932"));
                    DC(int64(0x82931599855106cd), EConversationDebugInfo::Done);
                    DC(int64(0x6c841adcd2f98d73), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x6c841adcd2f98d73), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x82931599855106c0), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x82931599855106c0), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Tarrok_95387 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x829315998551069c);
            default Caption = LocText("TEXT_WIP_PSCRXAL_20240430_200250_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Tarrok_95387);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x829315998551069d), EConversationDebugInfo::Executing);
                // I'll ... leave you to it, then.
                Hero.AI.Say(LocText("TEXT_WIP_PSCRXAL_20240430_200250_3569"));
                DC(int64(0x829315998551069d), EConversationDebugInfo::Done);
                DC(int64(0x6c841adcd2f98d64), EConversationDebugInfo::Executing);
                
                // Mmm ... 
                Tarrok.AI.Say(LocText("TEXT_WIP_GEVDOTI_20240704_201137"));
                DC(int64(0x6c841adcd2f98d64), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTarrok100029 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x3d72a998a4e81723);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFreemineorcSucheulumulu);
            default Rules.HideIfKnows(UChoiceTarrok100029);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8314b3119f43a0c5), EConversationDebugInfo::Executing);
                // But an Ulu-Mulu isn't easy to make. 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_GIVEPOTION_17_02"));
                DC(int64(0x8314b3119f43a0c5), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a0c7), EConversationDebugInfo::Executing);
                
                // Yes, Ur-Shak told me what I need. 
                Hero.AI.Say(LocText("INFO_FREEMINEORC_GIVEPOTION_15_04"));
                DC(int64(0x8314b3119f43a0c7), EConversationDebugInfo::Done);
                DC(int64(0x8314b3119f43a0c8), EConversationDebugInfo::Executing);
                
                // So? Do you have it? 
                Tarrok.AI.Say(LocText("INFO_FREEMINEORC_GIVEPOTION_17_05"));
                DC(int64(0x8314b3119f43a0c8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_OSL_TARROK, Document::UDocumentSegment_Glossary_FM_OSL_TARROK_Ulumulu);
                DC(int64(0x2a9130fe431282ca), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.StartQuest();
                DC(int64(0x2a9130fe431282ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTarrok102103 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0xe07a0d6a003959b);
            default Caption = LocText("TEXT_WIP_HEVDOTI_20240705_225105");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTarrok100029);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xef0d4b2c8353b7ba), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.HasSucceeded());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe07a0d6a0039599), EConversationDebugInfo::Executing);
                // Remind me - what exactly do I need?
                Hero.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_225105"));
                DC(int64(0xe07a0d6a0039599), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a003959a), EConversationDebugInfo::Executing);
                
                // You forgot? 
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_225105_1924"));
                DC(int64(0xe07a0d6a003959a), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a003959d), EConversationDebugInfo::Executing);
                // You will need the horn of a great shadowbeast, the tusk ...
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_225250"));
                DC(int64(0xe07a0d6a003959d), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a003959e), EConversationDebugInfo::Executing);
                
                // Right. That was it. 
                Hero.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_225251"));
                DC(int64(0xe07a0d6a003959e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTarrok229186 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x228fa76e3c5d6ec);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTarrok99686);
            
            default Rules.RequireCharacterCloseToWaypoint(n"FM_OSL_TARROK_2001", n"FP_FM_Tarrok2", 500.0f, int64(0x228fa76e3c5d6ec));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ee9cba37bb98866), EConversationDebugInfo::Executing);
                
                // Thank you, morra. Let zarr be spilled. 
                Tarrok.AI.Say(LocText("TEXT_WIP_OOPRNOF_20240627_162424_2238"));
                DC(int64(0x5ee9cba37bb98866), EConversationDebugInfo::Done);
                DC(int64(0x5ee9cba37bb9886e), EConversationDebugInfo::Executing);
                Tarrok.AI.StartAttackingImmediately(Hero);
                DC(int64(0x5ee9cba37bb9886e), EConversationDebugInfo::Done);
                DC(int64(0x5ee9cba37bb98870), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5ee9cba37bb98870), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTarrok99686 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0x5ee9cba37bb9885a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default ForceSettings.RangeType = EConversationForceRangeType::DefaultRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFreemineorcEveryulumulu);
            default Rules.HideIfKnows(UChoiceTarrok99686);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_FM_Tarrok2", 150.0f, int64(0x5ee9cba37bb9885a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x16cf94fd2d479ac7), Tarrok != nullptr && !Tarrok.IsRefusingToTalkWith(Other));
                    DB(int64(0x16cf94fd2d479aca), Tarrok != nullptr && Tarrok.HasAssignedDailyRoutine(UDailyRoutine_FM_OSL_Tarrok_2001_Fight));
                }
                
                if (Tarrok != nullptr && Tarrok.IsRefusingToTalkWith(Other))
                    return false;
                
                if (Tarrok != nullptr && !Tarrok.HasAssignedDailyRoutine(UDailyRoutine_FM_OSL_Tarrok_2001_Fight))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ee9cba37bb98858), EConversationDebugInfo::Executing);
                // Here. You have earned it ... wear it with the honor that ...
                Tarrok.AI.Say(LocText("TEXT_WIP_OOPRNOF_20240627_161641_41"));
                DC(int64(0x5ee9cba37bb98858), EConversationDebugInfo::Done);
                DC(int64(0x5ee9cba37bb9885e), EConversationDebugInfo::Executing);
                
                // So that's it? I wear this and the orcs won't attack me?
                Hero.AI.Say(LocText("TEXT_WIP_OOPRNOF_20240627_161828"));
                DC(int64(0x5ee9cba37bb9885e), EConversationDebugInfo::Done);
                DC(int64(0x5ee9cba37bb9885f), EConversationDebugInfo::Executing);
                
                // Soon. One thing is still missing ... zarr.
                Tarrok.AI.Say(LocText("TEXT_WIP_OOPRNOF_20240627_161839"));
                DC(int64(0x5ee9cba37bb9885f), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a0039587), EConversationDebugInfo::Executing);
                
                // What was that?
                Hero.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224256"), ForceCameraPreset = n"TWO SHOT FULL");
                DC(int64(0xe07a0d6a0039587), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Zarr);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_OSL_TARROK, Document::UDocumentSegment_Glossary_FM_OSL_TARROK_Fight);
                DC(int64(0x228fa76e3c5d6f7), EConversationDebugInfo::Executing);
                RequestCameraReverseShot();
                DC(int64(0x228fa76e3c5d6f7), EConversationDebugInfo::Done);
                DC(int64(0x3a0d721bda56b967), EConversationDebugInfo::Executing);
                Tarrok.AddItemToInventory(UItMw_2H_Staff_Ulumulu, 1);
                DC(int64(0x3a0d721bda56b967), EConversationDebugInfo::Done);
                DC(int64(0x3a0d721bda56b969), EConversationDebugInfo::Executing);
                Tarrok.AI.EquipBestWeapon();
                DC(int64(0x3a0d721bda56b969), EConversationDebugInfo::Done);
                DC(int64(0x3a0d721bda56b96b), EConversationDebugInfo::Executing);
                Tarrok.AI.DrawCombatWeapon();
                DC(int64(0x3a0d721bda56b96b), EConversationDebugInfo::Done);
                DC(int64(0x3a0d721bda56b96d), EConversationDebugInfo::Executing);
                Tarrok.RemoveImmortality();
                DC(int64(0x3a0d721bda56b96d), EConversationDebugInfo::Done);
                DC(int64(0x83b76a86908d2ef), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_ZARR.StartQuest();
                DC(int64(0x83b76a86908d2ef), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a0039588), EConversationDebugInfo::Executing);
                // No Ulu-Mulu is whole without zarr. Zarr is life. Zarr is ...
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224301"));
                DC(int64(0xe07a0d6a0039588), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a0039589), EConversationDebugInfo::Executing);
                // And nothing spills more zarr than an honorable fight - ...
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224317"));
                DC(int64(0xe07a0d6a0039589), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a003958a), EConversationDebugInfo::Executing);
                
                // Wait a minute, what are you-
                Hero.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224449"));
                DC(int64(0xe07a0d6a003958a), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a003958b), EConversationDebugInfo::Executing);
                
                // I told you. When the morra put me in chains, they also ...
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224509"));
                DC(int64(0xe07a0d6a003958b), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a003958c), EConversationDebugInfo::Executing);
                // I cannot go back to the ordôkh like this ... tired, ...
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224550"));
                DC(int64(0xe07a0d6a003958c), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a003958d), EConversationDebugInfo::Executing);
                // If I win, the Ulu-Mulu is mine, and I can return to my ...
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224702"));
                DC(int64(0xe07a0d6a003958d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Tarrok_101836,
                    UTopic_Tarrok_101856,
                    UTopic_Tarrok_107518
                );
            }
        }
        
        
        class UTopic_Tarrok_101836 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0xe07a0d6a003958f);
            default Caption = LocText("TEXT_WIP_HEVDOTI_20240705_224746_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Tarrok_101836);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe07a0d6a0039590), EConversationDebugInfo::Executing);
                // I'm not doing this.
                Hero.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224746_41"));
                DC(int64(0xe07a0d6a0039590), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a0039597), EConversationDebugInfo::Executing);
                
                // The choice is not yours. 
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224838"));
                DC(int64(0xe07a0d6a0039597), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Tarrok_101856 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0xe07a0d6a0039593);
            default Caption = LocText("TEXT_WIP_HEVDOTI_20240705_224746_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Tarrok_101856);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe07a0d6a0039594), EConversationDebugInfo::Executing);
                
                // All right. If you want this.
                Hero.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224746_2238"));
                DC(int64(0xe07a0d6a0039594), EConversationDebugInfo::Done);
                DC(int64(0xe07a0d6a0039598), EConversationDebugInfo::Executing);
                
                // You understand. 
                Tarrok.AI.Say(LocText("TEXT_WIP_HEVDOTI_20240705_224858"));
                DC(int64(0xe07a0d6a0039598), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Tarrok_107518 : UTopic_Hero__FM_OSL_TARROK_2001
        {
            default DebugId = int64(0xa90dd50e79c9b47c);
            default Caption = LocText("TEXT_WIP_HQOQKNE_20240830_210348_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Tarrok_107518);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa90dd50e79c9b47d), EConversationDebugInfo::Executing);
                
                // There has to be another way.
                Hero.AI.Say(LocText("TEXT_WIP_HQOQKNE_20240830_210348_41"));
                DC(int64(0xa90dd50e79c9b47d), EConversationDebugInfo::Done);
                DC(int64(0xa90dd50e79c9b480), EConversationDebugInfo::Executing);
                
                // Maybe for a morra, but not for an orc. Without the zarr, ...
                Tarrok.AI.Say(LocText("TEXT_WIP_HQOQKNE_20240830_210416"));
                DC(int64(0xa90dd50e79c9b480), EConversationDebugInfo::Done);
                DC(int64(0xa90dd50e79c9b47f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa90dd50e79c9b47f), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */