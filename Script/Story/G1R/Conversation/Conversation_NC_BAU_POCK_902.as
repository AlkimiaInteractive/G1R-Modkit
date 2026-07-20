#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_POCK_902 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_POCK_902";
        }
        
        
        class UTopic_Hero__NC_BAU_POCK_902 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_POCK_902";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetPock() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoicePock79334 : UTopic_Hero__NC_BAU_POCK_902
        {
            default DebugId = int64(0xc937a22c9f012085);
            default Caption = LocText("TEXT_DDIAZ_20240206_145703");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePockHello);
            default Rules.HideIfKnows(UChoicePock79334);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc7da5a4b7839c91b), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc937a22c9f012083), EConversationDebugInfo::Executing);
                // Have you seen Bran?
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_145703"));
                DC(int64(0xc937a22c9f012083), EConversationDebugInfo::Done);
                DC(int64(0xc937a22c9f012084), EConversationDebugInfo::Executing);
                
                // Still ain't showed up, has he? Nah, not a clue. 
                Pock.AI.Say(LocText("TEXT_DDIAZ_20240206_145703_2785"));
                DC(int64(0xc937a22c9f012084), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe159c), EConversationDebugInfo::Executing);
                // Wouldn't be surprised if he's pushing daisies by now ... 
                Pock.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_183626"));
                DC(int64(0x9abbd37ababe159c), EConversationDebugInfo::Done);
                DC(int64(0xc937a22c9f012088), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_150731"));
                DC(int64(0xc937a22c9f012088), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe159d), EConversationDebugInfo::Executing);
                
                // Cause that bloke drank like a swampshark. No idea how he ...
                Pock.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_184303"));
                DC(int64(0x9abbd37ababe159d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePockExit : UTopic_Hero__NC_BAU_POCK_902
        {
            default DebugId = int64(0xd31bd2e5dab0fa57);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd31bd2e5dab0fa59), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd31bd2e5dab0fa59), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePockForgotall : UTopic_Hero__NC_BAU_POCK_902
        {
            default DebugId = int64(0xd31bd2e5dab0fa7c);
            default Caption = LocText("DIA_POCK_FORGOTALL_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x26b0b4f48ab51ab4), G1R.Pock_Forget_Time.IsValid() && G1R.Pock_Forget_Time.IsMoreThanXMinutesAgo(30));
                }
                
                return G1R.Pock_Forget_Time.IsValid() && G1R.Pock_Forget_Time.IsMoreThanXMinutesAgo(30);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd31bd2e5dab0fa7e), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("DIA_POCK_FORGOTALL_15_00"));
                DC(int64(0xd31bd2e5dab0fa7e), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa7f), EConversationDebugInfo::Executing);
                
                // Ah, a fresh face ... welcome to the Colony, lad.
                Pock.AI.Say(LocText("DIA_POCK_FORGOTALL_04_01"));
                DC(int64(0xd31bd2e5dab0fa7f), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa80), EConversationDebugInfo::Executing);
                
                // Wait. We already spoke.
                Hero.AI.Say(LocText("DIA_POCK_FORGOTALL_15_02"));
                DC(int64(0xd31bd2e5dab0fa80), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa81), EConversationDebugInfo::Executing);
                
                // What? No, no, we didn't. I ain't never seen you before.
                Pock.AI.Say(LocText("DIA_POCK_FORGOTALL_04_03"));
                DC(int64(0xd31bd2e5dab0fa81), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa82), EConversationDebugInfo::Executing);
                
                // Um ... all right.
                Hero.AI.Say(LocText("DIA_POCK_FORGOTALL_15_04"));
                DC(int64(0xd31bd2e5dab0fa82), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_POCK, Document::UDocumentSegment_Glossary_NC_BAU_POCK_Dementia);
            }
        }
        
        
        class UChoicePockHello : UTopic_Hero__NC_BAU_POCK_902
        {
            default DebugId = int64(0xd31bd2e5dab0fa6b);
            default Caption = LocText("DIA_POCK_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoicePockHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd31bd2e5dab0fa6c), G1R.Pock_ForgetAll == 0);
                }
                
                return G1R.Pock_ForgetAll == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd31bd2e5dab0fa6d), EConversationDebugInfo::Executing);
                // Hey, I'm new here.
                Hero.AI.Say(LocText("DIA_POCK_HELLO_15_00"));
                DC(int64(0xd31bd2e5dab0fa6d), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa6e), EConversationDebugInfo::Executing);
                
                // Ahh ... welcome, lad, welcome. Nice to see a new face ...
                Pock.AI.Say(LocText("DIA_POCK_HELLO_04_01"));
                DC(int64(0xd31bd2e5dab0fa6e), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa6f), EConversationDebugInfo::Executing);
                
                // Been here long?
                Hero.AI.Say(LocText("DIA_POCK_HELLO_15_02"));
                DC(int64(0xd31bd2e5dab0fa6f), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa70), EConversationDebugInfo::Executing);
                
                // Oh, yes, lad, very long. I was one of the first. 
                Pock.AI.Say(LocText("DIA_POCK_HELLO_04_03"));
                DC(int64(0xd31bd2e5dab0fa70), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_POCK, Document::UDocumentSegment_Glossary_NC_BAU_POCK_Introduction);
                DC(int64(0x26b0b4f48ab51aa5), EConversationDebugInfo::Executing);
                G1R.Pock_Forget_Time = FInGameTime::Now();
                DC(int64(0x26b0b4f48ab51aa5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePockKnowmuch : UTopic_Hero__NC_BAU_POCK_902
        {
            default DebugId = int64(0xd31bd2e5dab0fa71);
            default Caption = LocText("DIA_POCK_KNOWMUCH_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePockHello);
            default Rules.HideIfKnows(UChoicePockKnowmuch);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x26b0b4f48ab51ab2), G1R.Pock_Forget_Time.IsValid() && G1R.Pock_Forget_Time.IsLessThanXMinutesAgo(30));
                }
                
                return G1R.Pock_Forget_Time.IsValid() && G1R.Pock_Forget_Time.IsLessThanXMinutesAgo(30);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd31bd2e5dab0fa73), EConversationDebugInfo::Executing);
                // You must have a pretty good idea how things work around ...
                Hero.AI.Say(LocText("DIA_POCK_KNOWMUCH_15_00"));
                DC(int64(0xd31bd2e5dab0fa73), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa74), EConversationDebugInfo::Executing);
                
                // Well, depends. I'm just a lowly rice picker ...
                Pock.AI.Say(LocText("DIA_POCK_KNOWMUCH_04_01"));
                DC(int64(0xd31bd2e5dab0fa74), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa75), EConversationDebugInfo::Executing);
                // Then again, that's probably why I even made it to this ...
                Pock.AI.Say(LocText("DIA_POCK_KNOWMUCH_04_02"));
                DC(int64(0xd31bd2e5dab0fa75), EConversationDebugInfo::Done);
                DC(int64(0xd048c01df7f1e4f7), EConversationDebugInfo::Executing);
                // No fights with the warders, no schemin' over that bloody ...
                Pock.AI.Say(LocText("TEXT_WIP_ESVMXID_20241011_144811"));
                DC(int64(0xd048c01df7f1e4f7), EConversationDebugInfo::Done);
                DC(int64(0xd048c01df7f1e4f8), EConversationDebugInfo::Executing);
                // Could be worse, y'know?
                Pock.AI.Say(LocText("TEXT_WIP_ESVMXID_20241011_144916"));
                DC(int64(0xd048c01df7f1e4f8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePockWasser : UTopic_Hero__NC_BAU_POCK_902
        {
            default DebugId = int64(0xd31bd2e5dab0fa5a);
            default Caption = LocText("INFO_POCK_WASSER_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe9d2afc3c1b4560d), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223c), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0xa086f46286fe223d), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                    DB(int64(0x3fa7e33579bb6a80), Pock != nullptr && !Pock.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                    DB(int64(0xe9d2afc3c1b4560e), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223b), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0x3fa7e33579bb6a81), Pock != nullptr && !Pock.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                }
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0) && Pock != nullptr && !Pock.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Pock != nullptr && !Pock.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd31bd2e5dab0fa5c), EConversationDebugInfo::Executing);
                
                // Lefty sends me. I've got water for you.
                Hero.AI.Say(LocText("INFO_POCK_WASSER_15_00"));
                DC(int64(0xd31bd2e5dab0fa5c), EConversationDebugInfo::Done);
                DB(int64(0xd31bd2e5dab0fa5e), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0))
                {
                    DC(int64(0x61a39c21bde6d1b3), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Pock, UItFo_Potion_Water_01, 1);
                    DC(int64(0x61a39c21bde6d1b3), EConversationDebugInfo::Done);
                    DB(int64(0xd31bd2e5dab0fa61), Pock != nullptr && Pock.IsSitting());
                    
                    if (Pock != nullptr && Pock.IsSitting())
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c5c2), EConversationDebugInfo::Executing);
                        Pock.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c5c2), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c5c0), EConversationDebugInfo::Executing);
                        Pock.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c5c0), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Executing);
                    G1R.Peasants_have_water += 1;
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Done);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Executing);
                    Pock.StoreStoryEventInMemory(n"GivenWater_Daily", Hero);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Done);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Executing);
                    Pock.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Done);
                    DC(int64(0xd31bd2e5dab0fa65), EConversationDebugInfo::Executing);
                    // Ahh, Innos must have sent you! I was parched ... 
                    Pock.AI.Say(LocText("INFO_POCK_WASSER_04_01"));
                    DC(int64(0xd31bd2e5dab0fa65), EConversationDebugInfo::Done);
                    DB(int64(0xd31bd2e5dab0fa68), G1R.Peasants_have_water >= G1R.DurstigeBauern);
                    
                    if (G1R.Peasants_have_water >= G1R.DurstigeBauern)
                    {
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.SucceedQuest();
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_pock_wasser_exit_1");
                    }
                    else
                    {
                        
                        Other.Remember(n"choice_pock_wasser_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xd31bd2e5dab0fa6a), EConversationDebugInfo::Executing);
                    // Ah, but you ain't got none, lad. But it's fine, I'll ask ...
                    Pock.AI.Say(LocText("INFO_POCK_WASSER_NOWATER_04_00"));
                    DC(int64(0xd31bd2e5dab0fa6a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_pock_wasser_exit_3");
                }
            }
        }
        
        
        class UChoicePockWhyjail : UTopic_Hero__NC_BAU_POCK_902
        {
            default DebugId = int64(0xd31bd2e5dab0fa76);
            default Caption = LocText("DIA_POCK_WHYJAIL_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePockHello);
            default Rules.HideIfKnows(UChoicePockWhyjail);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x26b0b4f48ab51ab3), G1R.Pock_Forget_Time.IsValid() && G1R.Pock_Forget_Time.IsLessThanXMinutesAgo(30));
                }
                
                return G1R.Pock_Forget_Time.IsValid() && G1R.Pock_Forget_Time.IsLessThanXMinutesAgo(30);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd31bd2e5dab0fa78), EConversationDebugInfo::Executing);
                // Why did they throw you in here?
                Hero.AI.Say(LocText("DIA_POCK_WHYJAIL_15_00"));
                DC(int64(0xd31bd2e5dab0fa78), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa79), EConversationDebugInfo::Executing);
                
                // The tithe, lad. The tithe. Had a cursed harvest and not ...
                Pock.AI.Say(LocText("DIA_POCK_WHYJAIL_04_01"));
                DC(int64(0xd31bd2e5dab0fa79), EConversationDebugInfo::Done);
                DC(int64(0xd048c01df7f1e4fc), EConversationDebugInfo::Executing);
                // The bastard knew what he was doin', o'course. Anyway, I ...
                Pock.AI.Say(LocText("TEXT_WIP_ESVMXID_20241011_150025"));
                DC(int64(0xd048c01df7f1e4fc), EConversationDebugInfo::Done);
                DC(int64(0xd31bd2e5dab0fa7b), EConversationDebugInfo::Executing);
                // But yeah, that's how it goes. The strong eat the weak. 
                Pock.AI.Say(LocText("DIA_POCK_WHYJAIL_04_03"));
                DC(int64(0xd31bd2e5dab0fa7b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_POCK, Document::UDocumentSegment_Glossary_NC_BAU_POCK_Reason);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */