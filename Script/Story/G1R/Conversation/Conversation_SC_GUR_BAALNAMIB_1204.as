#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_GUR_BAALNAMIB_1204 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_GUR_BAALNAMIB_1204";
        }
        
        
        class UTopic_Hero__SC_GUR_BAALNAMIB_1204 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_BAALNAMIB_1204";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalNamib() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UChoiceBaalnamib146019 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xc2bbabf13f180c40);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalnamib146019);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bc6), BaalNamib != nullptr && BaalNamib.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru));
                    DB(int64(0xc2bbabf13f180bc7), Hero != nullptr && Hero.IsCloseToCharacter(BaalNamib, 800.0f));
                }
                
                if (BaalNamib != nullptr && !BaalNamib.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalNamib, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc2bbabf13f180c3c), EConversationDebugInfo::Executing);
                // You've done enough harm.
                BaalNamib.AI.Say(LocText("TEXT_WIP_HVXGRO_20250129_153015_3719"));
                DC(int64(0xc2bbabf13f180c3c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamib157249 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xed4abbb5972f506b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalnamib157249);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(BaalNamib, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalNamib, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f5067), EConversationDebugInfo::Executing);
                // What a strange week this has been ...
                BaalNamib.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_094311_2785"));
                DC(int64(0xed4abbb5972f5067), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamib157265 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xed4abbb5972f5072);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalnamib157265);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(BaalNamib, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalNamib, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f506e), EConversationDebugInfo::Executing);
                // Y'Berion himself said it: the Sleeper isn't who we ...
                BaalNamib.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_094314_3286"));
                DC(int64(0xed4abbb5972f506e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamib220561 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x737069758ce836f);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_154755");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ELVUYVI_20260210_123601"), int64(0x737069758ce836f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x737069758ce83b5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce8368), EConversationDebugInfo::Executing);
                
                // About those tattoos ... Can I get one?
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_154755"));
                DC(int64(0x737069758ce8368), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce8369), EConversationDebugInfo::Executing);
                
                // That would confirm your belonging to our community.
                BaalNamib.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_154755_686"));
                DC(int64(0x737069758ce8369), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce8371), EConversationDebugInfo::Executing);
                // And it'll help you open your mind to the Sleeper.
                BaalNamib.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_155344"));
                DC(int64(0x737069758ce8371), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Tattoo);
                Subdialog(
                    UBaalNamib_220573,
                    UBaalNamib_220593
                );
            }
        }
        
        
        class UBaalNamib_220573 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x737069758ce8373);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_155400_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce8374), EConversationDebugInfo::Executing);
                // Let me think about it ...
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_155400_3984"));
                DC(int64(0x737069758ce8374), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce8380), EConversationDebugInfo::Executing);
                
                // May the Sleeper illuminate your mind.
                BaalNamib.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_155409"));
                DC(int64(0x737069758ce8380), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalNamib_220593 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x737069758ce8377);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_155400_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UBaalNamib_220593);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce8378), EConversationDebugInfo::Executing);
                
                // Go on.
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_155400_3569"));
                DC(int64(0x737069758ce8378), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce8393), EConversationDebugInfo::Executing);
                
                // I would need ink for the tattoo. So you'll have to make ...
                BaalNamib.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_155515"));
                DC(int64(0x737069758ce8393), EConversationDebugInfo::Done);
                DC(int64(0x3d224b3d732a3b26), EConversationDebugInfo::Executing);
                
                // Make some ink?
                Hero.AI.Say(LocText("TEXT_WIP_ELVUYVI_20260210_123612"));
                DC(int64(0x3d224b3d732a3b26), EConversationDebugInfo::Done);
                DC(int64(0x3d224b3d732a3b25), EConversationDebugInfo::Executing);
                
                // That's what I said. Use the lab. All you need is ...
                BaalNamib.AI.Say(LocText("TEXT_WIP_ELVUYVI_20260210_123601"));
                DC(int64(0x3d224b3d732a3b25), EConversationDebugInfo::Done);
                DC(int64(0x3d224b3d732a3b27), EConversationDebugInfo::Executing);
                // Here's the recipe.
                BaalNamib.AI.Say(LocText("TEXT_WIP_ELVUYVI_20260210_123640"));
                DC(int64(0x3d224b3d732a3b27), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Ink);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                BaalNamib.AddItemToInventory(UItWr_Scroll_Ink, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce839a), EConversationDebugInfo::Executing);
                BaalNamib.AI.GiveItemTo(Hero, UItWr_Scroll_Ink, 1);
                DC(int64(0x737069758ce839a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamib220684 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x737069758ce83b1);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_155620");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UBaalNamib_220593);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ELVUYVI_20260210_123854"), int64(0x737069758ce83b1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x85232c1a2648917f), Hero != nullptr && Hero.HasItem(UItMi_Alchemy_Ink, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Alchemy_Ink, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce83aa), EConversationDebugInfo::Executing);
                // I have ink.
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_155620"));
                DC(int64(0x737069758ce83aa), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce83ab), EConversationDebugInfo::Executing);
                
                // Very good. Whenever you're ready.
                BaalNamib.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_155620_1769"));
                DC(int64(0x737069758ce83ab), EConversationDebugInfo::Done);
                Subdialog(
                    UBaalNamib_221023,
                    UBaalNamib_221043
                );
            }
        }
        
        
        class UBaalNamib_221023 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x3d224b3d732a3b35);
            default Caption = LocText("TEXT_WIP_ELVUYVI_20260210_123830_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UBaalNamib_221023);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d224b3d732a3b36), EConversationDebugInfo::Executing);
                // I'm ready for my tattoo.
                Hero.AI.Say(LocText("TEXT_WIP_ELVUYVI_20260210_123830_41"));
                DC(int64(0x3d224b3d732a3b36), EConversationDebugInfo::Done);
                DC(int64(0x3d224b3d732a3b42), EConversationDebugInfo::Executing);
                
                // Then we shall begin.
                BaalNamib.AI.Say(LocText("TEXT_WIP_ELVUYVI_20260210_123854"));
                DC(int64(0x3d224b3d732a3b42), EConversationDebugInfo::Done);
                DC(int64(0x9250688d0636db56), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMi_Alchemy_Ink, 1, 0);
                DC(int64(0x9250688d0636db56), EConversationDebugInfo::Done);
                DC(int64(0x85232c1a26489181), EConversationDebugInfo::Executing);
                G1R.TriggerTattooCinematic();
                DC(int64(0x85232c1a26489181), EConversationDebugInfo::Done);
                DC(int64(0x9250688d0636db5b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9250688d0636db5b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UBaalNamib_221043 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x3d224b3d732a3b39);
            default Caption = LocText("TEXT_WIP_ELVUYVI_20260210_123830_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d224b3d732a3b3a), EConversationDebugInfo::Executing);
                // Later...
                Hero.AI.Say(LocText("TEXT_WIP_ELVUYVI_20260210_123830_2238"));
                DC(int64(0x3d224b3d732a3b3a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamib694960 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x9250688d0636db9d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalnamib694960);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ELVUYVI_20260210_123854"), int64(0x9250688d0636db9d));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9250688d0636db98), EConversationDebugInfo::Executing);
                
                // That's it. Done. May the Sleeper speak to you.
                BaalNamib.AI.Say(LocText("TEXT_WIP_ELVUYVI_20260210_123906"));
                DC(int64(0x9250688d0636db98), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamibExit : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xda1224dac32ab710);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5dcd7126285f525), EConversationDebugInfo::Executing);
                
                // I should go. 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_132338"));
                DC(int64(0x5dcd7126285f525), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f526), EConversationDebugInfo::Executing);
                
                // Hmm. 
                BaalNamib.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_132403"));
                DC(int64(0x5dcd7126285f526), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab711), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xda1224dac32ab711), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalnamibFirsttalk : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xda1224dac32ab726);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBaalnamibFirsttalk);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xda1224dac32ab728), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                    DB(int64(0x9c75ce727d90214e), Hero != nullptr && Hero.HasSaid(LocText("DIA_LESTER_SHOW_15_02")));
                    DB(int64(0x646f6c8d1ce49635), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasSaid(LocText("DIA_LESTER_SHOW_15_02")))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda1224dac32ab729), EConversationDebugInfo::Executing);
                // So, the Sleeper sent you a vision. I hope you understand ...
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_FIRSTTALK_02_00"));
                DC(int64(0xda1224dac32ab729), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab72a), EConversationDebugInfo::Executing);
                // Tell me, stranger: is it truly your wish to join the ...
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_FIRSTTALK_02_01"));
                DC(int64(0xda1224dac32ab72a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Introduction);
                Subdialog(
                    UChoiceBaalnamibFirsttalkMute,
                    UChoiceBaalnamibFirsttalkSleeper
                );
            }
        }
        
        
        class UChoiceBaalnamibFirsttalkMute : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xe8603e87342bf274);
            default Caption = LocText("TEXT_WIP_MGUWYAK_20241108_021808_494");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBaalnamibFirsttalkMute);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda1224dac32ab72d), EConversationDebugInfo::Executing);
                // ...
                Hero.AI.Say(LocText("DIA_BAALNAMIB_FIRSTTALK_MUTE_15_00"));
                DC(int64(0xda1224dac32ab72d), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab72e), EConversationDebugInfo::Executing);
                
                // Well?
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_FIRSTTALK_MUTE_02_01"));
                DC(int64(0xda1224dac32ab72e), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab72f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xda1224dac32ab72f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamibFirsttalkSleeper : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xe8603e87342bf279);
            default Caption = LocText("DIA_BAALNAMIB_FIRSTTALK_SLEEPER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBaalnamibFirsttalkSleeper);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda1224dac32ab731), EConversationDebugInfo::Executing);
                // Yes. I wish to follow the path of the Sleeper.
                Hero.AI.Say(LocText("DIA_BAALNAMIB_FIRSTTALK_SLEEPER_15_00"));
                DC(int64(0xda1224dac32ab731), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab732), EConversationDebugInfo::Executing);
                
                // Very well - then go find Cor Kalom, and tell him Baal ...
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_FIRSTTALK_SLEEPER_02_01"));
                DC(int64(0xda1224dac32ab732), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_NamibImpressed);
                DC(int64(0x1a34e2931ab9dbca), EConversationDebugInfo::Executing);
                G1R.Kalom_Counter += 1;
                DC(int64(0x1a34e2931ab9dbca), EConversationDebugInfo::Done);
                DC(int64(0x177474618b93f9cb), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM.StartQuest();
                DC(int64(0x177474618b93f9cb), EConversationDebugInfo::Done);
                DC(int64(0x7e5d602938fe6b65), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_NAMIB.SucceedQuest();
                DC(int64(0x7e5d602938fe6b65), EConversationDebugInfo::Done);
                DB(int64(0x11437211dc44a227), Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning())
                {
                    DC(int64(0x11437211dc44a24d), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.SucceedQuest();
                    DC(int64(0x11437211dc44a24d), EConversationDebugInfo::Done);
                }
                DB(int64(0x1a34e2931ab9dbcc), G1R.Kalom_Counter >= 2);
                DB(int64(0x1547dbe6d32bec7b), G1R.CaineVanished == 0);
                
                if (G1R.Kalom_Counter >= 2 && G1R.CaineVanished == 0)
                {
                    DC(int64(0x1a34e2931ab9dbce), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Caine_1301_Dead); }
                    DC(int64(0x1a34e2931ab9dbce), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82d6), EConversationDebugInfo::Executing);
                    G1R.ActivateStoryDataLayer("FindingCaine");
                    DC(int64(0x608d6fba46cd82d6), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82d8), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnFindingCaine");
                    DC(int64(0x608d6fba46cd82d8), EConversationDebugInfo::Done);
                    DC(int64(0x1547dbe6d32bec74), EConversationDebugInfo::Executing);
                    G1R.CaineVanished = 1;
                    DC(int64(0x1547dbe6d32bec74), EConversationDebugInfo::Done);
                    DC(int64(0x28003880c3e01fa3), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.NPCState.RemoveFromWorld(); }
                    DC(int64(0x28003880c3e01fa3), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaalnamibNotalk : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xda1224dac32ab712);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("DIA_BAALNAMIB_FIRSTTALK_02_00"), int64(0xda1224dac32ab712));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xda1224dac32ab713), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xda1224dac32ab715), BaalNamib != nullptr && !BaalNamib.IsFriendlyTowards(Hero));
                    DB(int64(0x9e8ab53bf21a6594), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (BaalNamib != nullptr && BaalNamib.IsFriendlyTowards(Hero))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Introduction);
                DB(int64(0x14efdc7c8b96dbf0), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Ignore);
                }
                Subdialog(
                    UChoiceBaalnamibNotalkImp,
                    UChoiceBaalnamibNotalkSleeper,
                    UChoiceBaalnamibNotalkHi,
                    UBaalNamib_77638
                );
            }
        }
        
        
        class UChoiceBaalnamibNotalkImp : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xe8603e87342bf25f);
            default Caption = LocText("DIA_BAALNAMIB_NOTALK_IMP_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda1224dac32ab718), EConversationDebugInfo::Executing);
                // How's it going, old man?
                Hero.AI.Say(LocText("DIA_BAALNAMIB_NOTALK_IMP_15_00"));
                DC(int64(0xda1224dac32ab718), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab719), EConversationDebugInfo::Executing);
                
                // (disappointed sigh)
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_NOTALK_IMP_02_01"));
                DC(int64(0xda1224dac32ab719), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3150), EConversationDebugInfo::Executing);
                G1R.BaalNamib_Sacrilege = 1;
                DC(int64(0x1e953c06636e3150), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab71b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xda1224dac32ab71b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamibNotalkSleeper : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xe8603e87342bf265);
            default Caption = LocText("DIA_BAALNAMIB_NOTALK_SLEEPER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda1224dac32ab71d), EConversationDebugInfo::Executing);
                // The Sleeper be with you!
                Hero.AI.Say(LocText("DIA_BAALNAMIB_NOTALK_SLEEPER_15_00"));
                DC(int64(0xda1224dac32ab71d), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab71e), EConversationDebugInfo::Executing);
                
                // (disappointed, disgruntled sigh)
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_NOTALK_SLEEPER_02_01"));
                DC(int64(0xda1224dac32ab71e), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3157), EConversationDebugInfo::Executing);
                G1R.BaalNamib_Sacrilege = 1;
                DC(int64(0x1e953c06636e3157), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab720), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xda1224dac32ab720), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalnamibNotalkHi : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xe8603e87342bf26b);
            default Caption = LocText("DIA_BAALNAMIB_NOTALK_HI_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda1224dac32ab722), EConversationDebugInfo::Executing);
                // Hey, I'm new here.
                Hero.AI.Say(LocText("DIA_BAALNAMIB_NOTALK_HI_15_00"));
                DC(int64(0xda1224dac32ab722), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab723), EConversationDebugInfo::Executing);
                
                // (disappointed sigh)
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_NOTALK_HI_02_01"));
                DC(int64(0xda1224dac32ab723), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e315e), EConversationDebugInfo::Executing);
                G1R.BaalNamib_Sacrilege = 1;
                DC(int64(0x1e953c06636e315e), EConversationDebugInfo::Done);
                DC(int64(0xda1224dac32ab725), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xda1224dac32ab725), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalNamib_77638 : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0x553ad2d8c1802882);
            default Caption = LocText("TEXT_WIP_DDCKZPD_20241106_132338");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x553ad2d8c1802883), EConversationDebugInfo::Executing);
                // I should go. 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_132338"));
                DC(int64(0x553ad2d8c1802883), EConversationDebugInfo::Done);
                DC(int64(0x553ad2d8c1802887), EConversationDebugInfo::Executing);
                
                // (disappointed sigh)
                BaalNamib.AI.Say(LocText("DIA_BAALNAMIB_NOTALK_HI_02_01"));
                DC(int64(0x553ad2d8c1802887), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3165), EConversationDebugInfo::Executing);
                G1R.BaalNamib_Sacrilege = 1;
                DC(int64(0x1e953c06636e3165), EConversationDebugInfo::Done);
                DC(int64(0x553ad2d8c1802889), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x553ad2d8c1802889), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGur1204BaalnamibArmor : UTopic_Hero__SC_GUR_BAALNAMIB_1204
        {
            default DebugId = int64(0xda1224dac32ab734);
            default Caption = LocText("GUR_1204_BAALNAMIB_ARMOR_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xce91ff81929e946d), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda1224dac32ab737), EConversationDebugInfo::Executing);
                // I need a better armor.
                Hero.AI.Say(LocText("GUR_1204_BAALNAMIB_ARMOR_INFO_15_01"));
                DC(int64(0xda1224dac32ab737), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Armor);
                DB(int64(0x3e9d2f5631dc476f), BaalNamib != nullptr && BaalNamib.IsAngryTowards(Hero));
                
                if (BaalNamib != nullptr && BaalNamib.IsAngryTowards(Hero))
                {
                    DC(int64(0x3e9d2f5631dc4763), EConversationDebugInfo::Executing);
                    // No. Meditate on your actions and come back later.
                    BaalNamib.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_153427_491"));
                    DC(int64(0x3e9d2f5631dc4763), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1204_baalnamib_armor_exit_1");
                    DC(int64(0x3e9d2f5631dc477d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3e9d2f5631dc477d), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DB(int64(0x3e9d2f5631dc472a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DB(int64(0xdbe736123a912f04), Hero != nullptr && Hero.Inventory.HasEquippedItem(UNov_Armor));
                        DB(int64(0xda1224dac32ab739), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION.HasSucceeded());
                        DB(int64(0xdbe736123a912ee8), Hero != nullptr && Hero.HasItem(UNov_Armor_Top_M_01, 1, 0));
                        
                        if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UNov_Armor))
                        {
                            
                        }
                        else if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION.HasSucceeded() && Hero != nullptr && Hero.HasItem(UNov_Armor_Top_M_01, 1, 0))
                        {
                            DC(int64(0xda1224dac32ab73a), EConversationDebugInfo::Executing);
                            // Many do. But you are not yet ready for the heavy robes ...
                            BaalNamib.AI.Say(LocText("GUR_1204_BAALNAMIB_ARMOR_INFO_02_02"));
                            DC(int64(0xda1224dac32ab73a), EConversationDebugInfo::Done);
                        }
                        else
                        {
                            DC(int64(0xda1224dac32ab73c), EConversationDebugInfo::Executing);
                            // Sorry brother, I cant help you with that robes.
                            BaalNamib.AI.Say(LocText("GUR_1204_BAALNAMIB_ARMOR_INFO_02_03"));
                            DC(int64(0xda1224dac32ab73c), EConversationDebugInfo::Done);
                            DC(int64(0x3e9d2f5631dc4734), EConversationDebugInfo::Executing);
                            // Ahh.. Equip with a novice robes and come back when you ...
                            BaalNamib.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_152527"));
                            DC(int64(0x3e9d2f5631dc4734), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_gur_1204_baalnamib_armor_exit_3");
                            DC(int64(0x3e9d2f5631dc4735), EConversationDebugInfo::Executing);
                            EndConversation();
                            DC(int64(0x3e9d2f5631dc4735), EConversationDebugInfo::Done);
                            return;
                        }
                        DC(int64(0xda1224dac32ab73d), EConversationDebugInfo::Executing);
                        // Very well. This armor protects your body as well as the ...
                        BaalNamib.AI.Say(LocText("GUR_1204_BAALNAMIB_ARMOR_INFO_02_04"));
                        DC(int64(0xda1224dac32ab73d), EConversationDebugInfo::Done);
                        DC(int64(0x1e953c06636e3171), EConversationDebugInfo::Executing);
                        BaalNamib.AI.StartCustomizingArmorWith(Hero);
                        DC(int64(0x1e953c06636e3171), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gur_1204_baalnamib_armor_exit_2");
                    }
                    else
                    {
                        DC(int64(0x3e9d2f5631dc472e), EConversationDebugInfo::Executing);
                        // Sorry stranger, I can't help you.
                        BaalNamib.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_152356"));
                        DC(int64(0x3e9d2f5631dc472e), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gur_1204_baalnamib_armor_exit_4");
                    }
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */