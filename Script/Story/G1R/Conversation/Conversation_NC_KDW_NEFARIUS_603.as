#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_KDW_NEFARIUS_603 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_KDW_NEFARIUS_603";
        }
        
        
        class UTopic_Hero__NC_KDW_NEFARIUS_603 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_NEFARIUS_603";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNefarius() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNefarius109431 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d157e4);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNefariusOcnews);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16ae446d64d157e8), EConversationDebugInfo::Executing);
                // Though ... hm. 
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_162759"));
                DC(int64(0x16ae446d64d157e8), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d157e9), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_162811"));
                DC(int64(0x16ae446d64d157e9), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be694), EConversationDebugInfo::Executing);
                
                // Oh, I was just thinking, perhaps we could ... how to put ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_133818"));
                DC(int64(0x68699c4b426be694), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be695), EConversationDebugInfo::Executing);
                
                // How so? 
                Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_133915"));
                DC(int64(0x68699c4b426be695), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d157ea), EConversationDebugInfo::Executing);
                
                // There's an ancient temple in the tundra. A temple of ...
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_162842"));
                DC(int64(0x16ae446d64d157ea), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be696), EConversationDebugInfo::Executing);
                
                // You want to take a look at that temple.
                Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_134219"));
                DC(int64(0x68699c4b426be696), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d157eb), EConversationDebugInfo::Executing);
                
                // I want YOU to do it. Whatever knowledge or relics our ...
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_162935"));
                DC(int64(0x16ae446d64d157eb), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Nefarius_114809,
                    UTopic_Nefarius_109454,
                    UTopic_Nefarius_110939,
                    UTopic_Nefarius_110431,
                    UTopic_Nefarius_109651,
                    UTopic_Nefarius_109671
                );
            }
        }
        
        
        class UTopic_Nefarius_114809 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x68699c4b426be6fb);
            default Caption = LocText("TEXT_WIP_QKWAAOH_20241122_121728_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nefarius_114809);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe65243e8874b3305), EConversationDebugInfo::Executing);
                // How dangerous is that place?
                Hero.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_121728_2238"));
                DC(int64(0xe65243e8874b3305), EConversationDebugInfo::Done);
                DC(int64(0xe65243e8874b3314), EConversationDebugInfo::Executing);
                
                // The temple itself should be safe, though even that may ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_122447"));
                DC(int64(0xe65243e8874b3314), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be70c), EConversationDebugInfo::Executing);
                // The journey there, however ... well. The wolves up in ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_141327"));
                DC(int64(0x68699c4b426be70c), EConversationDebugInfo::Done);
                DC(int64(0xda22ce8192a5e769), EConversationDebugInfo::Executing);
                // This much is certain: it won't be a stroll in the park.
                Nefarius.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_001943"));
                DC(int64(0xda22ce8192a5e769), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be70d), EConversationDebugInfo::Executing);
                // But I've heard the stories about you. I'm certain you ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_141356"));
                DC(int64(0x68699c4b426be70d), EConversationDebugInfo::Done);
                DC(int64(0xe65243e8874b3307), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe65243e8874b3307), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Nefarius_109454 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d157ef);
            default Caption = LocText("TEXT_WIP_OKWAAOH_20241120_165839_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nefarius_109454);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16ae446d64d157f0), EConversationDebugInfo::Executing);
                // What can you tell me about this temple? 
                Hero.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_165839_2083"));
                DC(int64(0x16ae446d64d157f0), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d157f9), EConversationDebugInfo::Executing);
                
                // Where do I start? It's been here for a few centuries.
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_170614"));
                DC(int64(0x16ae446d64d157f9), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be697), EConversationDebugInfo::Executing);
                // When the barrier spell misfired, Corristo and his mages ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_135424"));
                DC(int64(0x68699c4b426be697), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be698), EConversationDebugInfo::Executing);
                // That's why they stayed with Gomez instead and only went ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_135537"));
                DC(int64(0x68699c4b426be698), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be699), EConversationDebugInfo::Executing);
                // A fatal decision, as we now know ... 
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_135604"));
                DC(int64(0x68699c4b426be699), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0eca1), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6bc5c4e4efe0eca1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Nefarius_110939 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x6bc5c4e4efe0ec73);
            default Caption = LocText("TEXT_WIP_RPNNHIJ_20241121_115945_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nefarius_110939);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_OKWAAOH_20241120_170614"), int64(0x6bc5c4e4efe0ec73));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6bc5c4e4efe0ec74), EConversationDebugInfo::Executing);
                // If the temple's abandoned, why haven't you gone there ...
                Hero.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_115945_686"));
                DC(int64(0x6bc5c4e4efe0ec74), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ec83), EConversationDebugInfo::Executing);
                
                // I told you, because we had an agreement with Corristo. ...
                Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_120010"));
                DC(int64(0x6bc5c4e4efe0ec83), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ec84), EConversationDebugInfo::Executing);
                // But now that this terrible tragedy has occurred ... ...
                Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_120012"));
                DC(int64(0x6bc5c4e4efe0ec84), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ec76), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6bc5c4e4efe0ec76), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Nefarius_110431 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x6bc5c4e4efe0ebe2);
            default Caption = LocText("TEXT_WIP_RPNNHIJ_20241121_110747_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nefarius_110431);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6bc5c4e4efe0ebe3), EConversationDebugInfo::Executing);
                // What exactly would I be looking for? 
                Hero.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_110747_1924"));
                DC(int64(0x6bc5c4e4efe0ebe3), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ebe8), EConversationDebugInfo::Executing);
                
                // Anything related to magic. Scrolls, tomes, trinkets ... ...
                Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_110832"));
                DC(int64(0x6bc5c4e4efe0ebe8), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ebe9), EConversationDebugInfo::Executing);
                // Knowledge is what matters to me.
                Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_110907"));
                DC(int64(0x6bc5c4e4efe0ebe9), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ebe5), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6bc5c4e4efe0ebe5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Nefarius_109651 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d15818);
            default Caption = LocText("TEXT_WIP_QKWAAOH_20241122_121728_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nefarius_109651);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe65243e8874b3301), EConversationDebugInfo::Executing);
                // I'll help you. How do I find this temple? 
                Hero.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_121728_41"));
                DC(int64(0xe65243e8874b3301), EConversationDebugInfo::Done);
                DC(int64(0xe65243e8874b330c), EConversationDebugInfo::Executing);
                
                // Like I said, it's somewhere in the northern tundra.
                Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_121752"));
                DC(int64(0xe65243e8874b330c), EConversationDebugInfo::Done);
                DC(int64(0xe65243e8874b330d), EConversationDebugInfo::Executing);
                // Take the mountain pass by the Old Mine and continue ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_121822"));
                DC(int64(0xe65243e8874b330d), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be70e), EConversationDebugInfo::Executing);
                
                // "Somewhere in the tundra" isn't a very helpful ...
                Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_141613"));
                DC(int64(0x68699c4b426be70e), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be70f), EConversationDebugInfo::Executing);
                
                // I know, and I would give you a map if I had one. ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_141624"));
                DC(int64(0x68699c4b426be70f), EConversationDebugInfo::Done);
                DC(int64(0xe65243e8874b330f), EConversationDebugInfo::Executing);
                // And no, the irony isn't lost on me. 
                Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_122244"));
                DC(int64(0xe65243e8874b330f), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d1582d), EConversationDebugInfo::Executing);
                // So ... thank you. You've done a lot for us already, and-
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171626"));
                DC(int64(0x16ae446d64d1582d), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be6b2), EConversationDebugInfo::Executing);
                
                // It's okay. Just let me get to it. 
                Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_140640"));
                DC(int64(0x68699c4b426be6b2), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ebec), EConversationDebugInfo::Executing);
                
                // A man of deeds. Very well. 
                Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_111408"));
                DC(int64(0x6bc5c4e4efe0ebec), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_INNOSAMULET, Document::UDocumentSegment_CH4_INNOSAMULET_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_INNOSAMULET, Document::UDocumentSegment_CH4_INNOSAMULET_Location);
                DC(int64(0xae0de090fc56153a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_INNOS_AMULET.StartQuest();
                DC(int64(0xae0de090fc56153a), EConversationDebugInfo::Done);
                DC(int64(0x9a6f0744df3baabf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9a6f0744df3baabf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Nefarius_109671 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d1581e);
            default Caption = LocText("TEXT_WIP_OKWAAOH_20241120_171337_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nefarius_109671);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16ae446d64d1581f), EConversationDebugInfo::Executing);
                // I don't have time for this.
                Hero.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171337_686"));
                DC(int64(0x16ae446d64d1581f), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d1582e), EConversationDebugInfo::Executing);
                
                // Ah ... A shame. This knowledge could truly help us. The ...
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171656"));
                DC(int64(0x16ae446d64d1582e), EConversationDebugInfo::Done);
                DC(int64(0x9a6f0744df3baad8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9a6f0744df3baad8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNefarius109728 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d1583b);
            default Caption = LocText("TEXT_WIP_OKWAAOH_20241120_171829");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Nefarius_109671);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_RPNNHIJ_20241121_111408"), int64(0x16ae446d64d1583b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb5ca9bf6786ff1e9), Quest::NewCamp_NCCHAPTER4_INNOS_AMULET != nullptr && !Quest::NewCamp_NCCHAPTER4_INNOS_AMULET.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER4_INNOS_AMULET != nullptr && !Quest::NewCamp_NCCHAPTER4_INNOS_AMULET.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16ae446d64d15837), EConversationDebugInfo::Executing);
                // About that temple you mentioned ...
                Hero.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171829"));
                DC(int64(0x16ae446d64d15837), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d15838), EConversationDebugInfo::Executing);
                
                // Yes? Did you change your mind? 
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171829_2386"));
                DC(int64(0x16ae446d64d15838), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Nefarius_109814,
                    UTopic_Nefarius_109834
                );
            }
        }
        
        
        class UTopic_Nefarius_109814 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d1583e);
            default Caption = LocText("TEXT_WIP_QKWAAOH_20241122_121728_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nefarius_109814);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16ae446d64d1583f), EConversationDebugInfo::Executing);
                // I'll help you. How do I find this temple? 
                Hero.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_121728_41"));
                DC(int64(0x16ae446d64d1583f), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d1584f), EConversationDebugInfo::Executing);
                
                // Like I said, it's somewhere in the northern tundra.
                Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_121752"));
                DC(int64(0x16ae446d64d1584f), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be720), EConversationDebugInfo::Executing);
                // Take the mountain pass by the Old Mine and continue ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_121822"));
                DC(int64(0x68699c4b426be720), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be72d), EConversationDebugInfo::Executing);
                
                // "Somewhere in the tundra" isn't a very helpful ...
                Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_141613"));
                DC(int64(0x68699c4b426be72d), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be72e), EConversationDebugInfo::Executing);
                
                // I know, and I would give you a map if I had one. ...
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_141624"));
                DC(int64(0x68699c4b426be72e), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be72f), EConversationDebugInfo::Executing);
                // And no, the irony isn't lost on me. 
                Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_122244"));
                DC(int64(0x68699c4b426be72f), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be730), EConversationDebugInfo::Executing);
                // So ... thank you. You've done a lot for us already, and-
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171626"));
                DC(int64(0x68699c4b426be730), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be6b3), EConversationDebugInfo::Executing);
                
                // It's okay. Just let me get to it. 
                Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_140640"));
                DC(int64(0x68699c4b426be6b3), EConversationDebugInfo::Done);
                DC(int64(0x6bc5c4e4efe0ebee), EConversationDebugInfo::Executing);
                
                // A man of deeds. Very well. 
                Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_111408"));
                DC(int64(0x6bc5c4e4efe0ebee), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_INNOSAMULET, Document::UDocumentSegment_CH4_INNOSAMULET_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_INNOSAMULET, Document::UDocumentSegment_CH4_INNOSAMULET_Location);
                DC(int64(0xae0de090fc56153a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_INNOS_AMULET.StartQuest();
                DC(int64(0xae0de090fc56153a), EConversationDebugInfo::Done);
                DC(int64(0x9a6f0744df3baaba), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9a6f0744df3baaba), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Nefarius_109834 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d15842);
            default Caption = LocText("TEXT_WIP_OKWAAOH_20241120_171337_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16ae446d64d15843), EConversationDebugInfo::Executing);
                // I don't have time for this.
                Hero.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171337_686"));
                DC(int64(0x16ae446d64d15843), EConversationDebugInfo::Done);
                DC(int64(0x16ae446d64d15850), EConversationDebugInfo::Executing);
                
                // Ah ... A shame. This knowledge could truly help us. The ...
                Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_171656"));
                DC(int64(0x16ae446d64d15850), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNefarius109883 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x16ae446d64d1585d);
            default Caption = LocText("TEXT_WIP_OKWAAOH_20241120_172357");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Nefarius_109651);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Nefarius_109814);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x77b1f5e77849fa14), Quest::NewCamp_NCCHAPTER4_INNOS_AMULET != nullptr && Quest::NewCamp_NCCHAPTER4_INNOS_AMULET.IsRunning());
                    DB(int64(0xa8978f10c70e7be4), Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_Tundra_InnosTemple_LowerChamber));
                }
                
                if (Quest::NewCamp_NCCHAPTER4_INNOS_AMULET != nullptr && !Quest::NewCamp_NCCHAPTER4_INNOS_AMULET.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasEverEnteredArea(GameplayTag::Area_Tundra_InnosTemple_LowerChamber))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16ae446d64d15859), EConversationDebugInfo::Executing);
                
                // I went to that temple. 
                Hero.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_172357"));
                DC(int64(0x16ae446d64d15859), EConversationDebugInfo::Done);
                DC(int64(0x68699c4b426be731), EConversationDebugInfo::Executing);
                
                // And?
                Nefarius.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_142110"));
                DC(int64(0x68699c4b426be731), EConversationDebugInfo::Done);
                DB(int64(0x6bc5c4e4efe0ebf2), Hero != nullptr && Hero.HasItem(UItMs_Book_Innos, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Book_Innos, 1, 0))
                {
                    DC(int64(0x596fd07ba33975ad), EConversationDebugInfo::Executing);
                    // Here, look at this. 
                    Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_142200"));
                    DC(int64(0x596fd07ba33975ad), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_INNOSAMULET, Document::UDocumentSegment_CH4_INNOSAMULET_Completed);
                    DB(int64(0x123f53d08c63c959), Nefarius != nullptr && Nefarius.IsSitting());
                    
                    if (Nefarius != nullptr && Nefarius.IsSitting())
                    {
                        DC(int64(0x123f53d08c63ca0b), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Nefarius, UItMs_Book_Innos, 1);
                        DC(int64(0x123f53d08c63ca0b), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63ca3d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x123f53d08c63ca3d), EConversationDebugInfo::Done);
                        DC(int64(0x596fd07ba33975c5), EConversationDebugInfo::Executing);
                        Nefarius.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBookSeated);
                        DC(int64(0x596fd07ba33975c5), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x123f53d08c63ca0b), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Nefarius, UItMs_Book_Innos, 1);
                        DC(int64(0x123f53d08c63ca0b), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63ca3d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x123f53d08c63ca3d), EConversationDebugInfo::Done);
                        DC(int64(0x596fd07ba33975c5), EConversationDebugInfo::Executing);
                        Nefarius.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBook);
                        DC(int64(0x596fd07ba33975c5), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x6bc5c4e4efe0ec1d), EConversationDebugInfo::Executing);
                    // What is this? Oh ... interesting. "Gifts of the Gods." ...
                    Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_112234_3286"));
                    DC(int64(0x6bc5c4e4efe0ec1d), EConversationDebugInfo::Done);
                    DC(int64(0x6bc5c4e4efe0ec22), EConversationDebugInfo::Executing);
                    // This is a treatise on the godly artifacts. It could be ...
                    Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_112303"));
                    DC(int64(0x6bc5c4e4efe0ec22), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231629529), EConversationDebugInfo::Executing);
                    // Did you find anything else?
                    Nefarius.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_142547"));
                    DC(int64(0x81b634f231629529), EConversationDebugInfo::Done);
                    DB(int64(0x16ae446d64d15860), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Innos, 1, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItAt_Amulet_Innos, 1, 0))
                    {
                        DC(int64(0x16ae446d64d15863), EConversationDebugInfo::Executing);
                        // Yeah. This. 
                        Hero.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_172527"));
                        DC(int64(0x16ae446d64d15863), EConversationDebugInfo::Done);
                        DC(int64(0x6bc5c4e4efe0ec46), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Nefarius, UItAt_Amulet_Innos, 1);
                        DC(int64(0x6bc5c4e4efe0ec46), EConversationDebugInfo::Done);
                        DC(int64(0x16ae446d64d15864), EConversationDebugInfo::Executing);
                        // Fascinating... this is- Now, wait a moment ...
                        Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_172527_491"));
                        DC(int64(0x16ae446d64d15864), EConversationDebugInfo::Done);
                        DC(int64(0x6bc5c4e4efe0ec6e), EConversationDebugInfo::Executing);
                        // Imbued with HIS aura ... the wearer will receive the ...
                        Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_114958"));
                        DC(int64(0x6bc5c4e4efe0ec6e), EConversationDebugInfo::Done);
                        DC(int64(0xacbc70112bd6e195), EConversationDebugInfo::Executing);
                        // This is one of the godly artifacts. They are ancient - ...
                        Nefarius.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_102401"));
                        DC(int64(0xacbc70112bd6e195), EConversationDebugInfo::Done);
                        DC(int64(0xacbc70112bd6e196), EConversationDebugInfo::Executing);
                        // "Innos's Grace" might not be the most powerful of the ...
                        Nefarius.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_102504"));
                        DC(int64(0xacbc70112bd6e196), EConversationDebugInfo::Done);
                        DC(int64(0xacbc70112bd6e194), EConversationDebugInfo::Executing);
                        // Wear it while keeping in mind that Innos is bestowing ...
                        Nefarius.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_102248"));
                        DC(int64(0xacbc70112bd6e194), EConversationDebugInfo::Done);
                        DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                        Nefarius.AddItemToInventory(UItAt_Amulet_Innos, 1);
                        DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                        DC(int64(0x6bc5c4e4efe0ec46), EConversationDebugInfo::Executing);
                        Nefarius.AI.GiveItemTo(Hero, UItAt_Amulet_Innos, 1);
                        DC(int64(0x6bc5c4e4efe0ec46), EConversationDebugInfo::Done);
                        DC(int64(0xe45ba7b3e6f81be), EConversationDebugInfo::Executing);
                        Hero.GiveExperience(G1R.XP_NC_INNOSAMULET_AMULET);
                        DC(int64(0xe45ba7b3e6f81be), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x68699c4b426be733), EConversationDebugInfo::Executing);
                    // That's all I found.
                    Hero.AI.Say(LocText("TEXT_WIP_QIYYDND_20241125_142439"));
                    DC(int64(0x68699c4b426be733), EConversationDebugInfo::Done);
                    DC(int64(0x16ae446d64d15869), EConversationDebugInfo::Executing);
                    
                    // I see. Thank you, this is more than I hoped for. 
                    Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_173502_2995"));
                    DC(int64(0x16ae446d64d15869), EConversationDebugInfo::Done);
                    DC(int64(0x16ae446d64d15870), EConversationDebugInfo::Executing);
                    // It would have been a shame had this fallen into the ...
                    Nefarius.AI.Say(LocText("TEXT_WIP_OKWAAOH_20241120_173616"));
                    DC(int64(0x16ae446d64d15870), EConversationDebugInfo::Done);
                    DC(int64(0x6bc5c4e4efe0ec27), EConversationDebugInfo::Executing);
                    // Now, give me a moment, if you will. I need to study this ...
                    Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_112452"));
                    DC(int64(0x6bc5c4e4efe0ec27), EConversationDebugInfo::Done);
                    DC(int64(0xae0de090fc561548), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE.SucceedQuest();
                    DC(int64(0xae0de090fc561548), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_nefarius_109883_exit_1");
                    DC(int64(0x16ae446d64d15871), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x16ae446d64d15871), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6bc5c4e4efe0ebf6), EConversationDebugInfo::Executing);
                    // I didn't find anything. No books or scrolls.
                    Hero.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_112029_2785"));
                    DC(int64(0x6bc5c4e4efe0ebf6), EConversationDebugInfo::Done);
                    DC(int64(0x6bc5c4e4efe0ebf5), EConversationDebugInfo::Executing);
                    
                    // What? But ... no, that's impossible. The Fire Mages kept ...
                    Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_112029"));
                    DC(int64(0x6bc5c4e4efe0ebf5), EConversationDebugInfo::Done);
                    DC(int64(0x6bc5c4e4efe0ebf9), EConversationDebugInfo::Executing);
                    // Search more thoroughly. The books can't just have ...
                    Nefarius.AI.Say(LocText("TEXT_WIP_RPNNHIJ_20241121_112058"));
                    DC(int64(0x6bc5c4e4efe0ebf9), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_nefarius_109883_exit_2");
                }
            }
        }
        
        
        class UChoiceNefarius111161 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x140e0a4e18d9d02f);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xaf0a2086a409b189), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                {
                    DC(int64(0xaf0a2086a409b18a), EConversationDebugInfo::Executing);
                    // Oh, one more thing.
                    Nefarius.AI.Say(LocText("INFO_NEFARIUS_OCNEWS_04_03"));
                    DC(int64(0xaf0a2086a409b18a), EConversationDebugInfo::Done);
                    DC(int64(0xaf0a2086a409b18b), EConversationDebugInfo::Executing);
                    // You risked a lot to help us. 
                    Nefarius.AI.Say(LocText("INFO_NEFARIUS_OCNEWS_04_04"));
                    DC(int64(0xaf0a2086a409b18b), EConversationDebugInfo::Done);
                    DC(int64(0xaf0a2086a409b18c), EConversationDebugInfo::Executing);
                    // I believe you would be a worthy addition to our ranks. ...
                    Nefarius.AI.Say(LocText("INFO_NEFARIUS_OCNEWS_04_05"));
                    DC(int64(0xaf0a2086a409b18c), EConversationDebugInfo::Done);
                    DC(int64(0xaf0a2086a409b18d), EConversationDebugInfo::Executing);
                    // Bring it up with Saturas if you wish. And now hurry!
                    Nefarius.AI.Say(LocText("INFO_NEFARIUS_OCNEWS_04_06"));
                    DC(int64(0xaf0a2086a409b18d), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6239a3e65976f0c3), EConversationDebugInfo::Executing);
                    // Now hurry!
                    Nefarius.AI.Say(LocText("TEXT_WIP_QKWAAOH_20241122_130618_2083"));
                    DC(int64(0x6239a3e65976f0c3), EConversationDebugInfo::Done);
                }
                DC(int64(0xaf0a2086a409b18e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaf0a2086a409b18e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNefarius114950 : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0x14197298145f729e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceNefarius114950);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Nefarius, 500.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Nefarius, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f7299), EConversationDebugInfo::Executing);
                // A new water mage, in this Colony. I didn't think I'd ...
                Nefarius.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_111239_2801"));
                DC(int64(0x14197298145f7299), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNefariusExit : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0xaf0a2086a409b16a);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf0a2086a409b16b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaf0a2086a409b16b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNefariusHallo : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0xaf0a2086a409b16c);
            default Caption = LocText("INFO_NEFARIUS_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceNefariusHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf0a2086a409b16d), EConversationDebugInfo::Executing);
                // Who are you?
                Hero.AI.Say(LocText("INFO_NEFARIUS_HALLO_15_00"));
                DC(int64(0xaf0a2086a409b16d), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b16e), EConversationDebugInfo::Executing);
                
                // Me? I'm Nefarius. Mage of the Circle of Water.
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_HALLO_04_01"));
                DC(int64(0xaf0a2086a409b16e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_NEFARIUS, Document::UDocumentSegment_Glossary_NC_KDW_NEFARIUS_Introduction);
            }
        }
        
        
        class UChoiceNefariusNowready : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0xaf0a2086a409b179);
            default Caption = LocText("INFO_NEFARIUS_NOWREADY_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNefariusWannamage);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xaf0a2086a409b17a), G1R.FMTaken == 0);
                    DB(int64(0xaf0a2086a409b17b), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                if (G1R.FMTaken != 0)
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf0a2086a409b17c), EConversationDebugInfo::Executing);
                // Am I ready to join the Circle of Water?
                Hero.AI.Say(LocText("INFO_NEFARIUS_NOWREADY_15_00"));
                DC(int64(0xaf0a2086a409b17c), EConversationDebugInfo::Done);
                DB(int64(0xaf0a2086a409b17e), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                {
                    DC(int64(0xaf0a2086a409b17f), EConversationDebugInfo::Executing);
                    // As I said, join Lee's mercenaries first. Then we shall ...
                    Nefarius.AI.Say(LocText("INFO_NEFARIUS_NOWREADY_04_01"));
                    DC(int64(0xaf0a2086a409b17f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_nefarius_nowready_exit_1");
                }
                else
                {
                    DC(int64(0xaf0a2086a409b180), EConversationDebugInfo::Executing);
                    // I see you joined Lee's mercenaries. Very good.
                    Nefarius.AI.Say(LocText("INFO_NEFARIUS_NOWREADY_04_02"));
                    DC(int64(0xaf0a2086a409b180), EConversationDebugInfo::Done);
                    DC(int64(0xaf0a2086a409b181), EConversationDebugInfo::Executing);
                    // Time will tell the rest.
                    Nefarius.AI.Say(LocText("INFO_NEFARIUS_NOWREADY_04_03"));
                    DC(int64(0xaf0a2086a409b181), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_nefarius_nowready_exit_2");
                }
            }
        }
        
        
        class UChoiceNefariusOcnews : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0xaf0a2086a409b182);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceNefariusOcnews);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xaf0a2086a409b183), G1R.FMTaken != 0);
                    DB(int64(0xd0b008001b34877), Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN.HasSucceeded());
                }
                
                if (G1R.FMTaken == 0)
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf0a2086a409b185), EConversationDebugInfo::Executing);
                // Hey, wait a moment. You just came back from the Old ...
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_OCNEWS_04_00"));
                DC(int64(0xaf0a2086a409b185), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b186), EConversationDebugInfo::Executing);
                
                // Gomez murdered them.
                Hero.AI.Say(LocText("INFO_NEFARIUS_OCNEWS_15_01"));
                DC(int64(0xaf0a2086a409b186), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b187), EConversationDebugInfo::Executing);
                
                // M-murdered? Oh, gods ... that rotten butcher. You have ...
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_OCNEWS_04_02"));
                DC(int64(0xaf0a2086a409b187), EConversationDebugInfo::Done);
                DB(int64(0x45b6742bd0336ca1), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                {
                    DC(int64(0x45b6742bd0336cc0), EConversationDebugInfo::Executing);
                    // I was on my way there. 
                    Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_142321"));
                    DC(int64(0x45b6742bd0336cc0), EConversationDebugInfo::Done);
                    DC(int64(0x45b6742bd0336cc1), EConversationDebugInfo::Executing);
                    
                    // Good. Oh, Adanos help us all ... 
                    Nefarius.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_142337"));
                    DC(int64(0x45b6742bd0336cc1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_nefarius_ocnews_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_nefarius_ocnews_exit_2");
                }
            }
        }
        
        
        class UChoiceNefariusWannamage : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0xaf0a2086a409b172);
            default Caption = LocText("INFO_NEFARIUS_WANNAMAGE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNefariusHallo);
            default Rules.HideIfKnows(UChoiceNefariusWannamage);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xba1cf7809d1dcc1c), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf0a2086a409b173), EConversationDebugInfo::Executing);
                // I want to become a Mage of the Circle of Water.
                Hero.AI.Say(LocText("INFO_NEFARIUS_WANNAMAGE_15_00"));
                DC(int64(0xaf0a2086a409b173), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b174), EConversationDebugInfo::Executing);
                
                // (laughs) I'm afraid it's not that simple.
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_WANNAMAGE_04_01"));
                DC(int64(0xaf0a2086a409b174), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b175), EConversationDebugInfo::Executing);
                // The only way for us to even consider to have someone ...
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_WANNAMAGE_04_02"));
                DC(int64(0xaf0a2086a409b175), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b176), EConversationDebugInfo::Executing);
                // Also, he must have served us for a while.
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_WANNAMAGE_04_03"));
                DC(int64(0xaf0a2086a409b176), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b177), EConversationDebugInfo::Executing);
                // In other words, if you are truly serious about it, join ...
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_WANNAMAGE_04_04"));
                DC(int64(0xaf0a2086a409b177), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b178), EConversationDebugInfo::Executing);
                // Who knows, maybe one day, you'll get the chance to do ...
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_WANNAMAGE_04_05"));
                DC(int64(0xaf0a2086a409b178), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNefariusWosaturas : UTopic_Hero__NC_KDW_NEFARIUS_603
        {
            default DebugId = int64(0xaf0a2086a409b16f);
            default Caption = LocText("INFO_NEFARIUS_WOSATURAS_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceNefariusWosaturas);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf0a2086a409b170), EConversationDebugInfo::Executing);
                
                // Where can I find Saturas?
                Hero.AI.Say(LocText("INFO_NEFARIUS_WOSATURAS_15_00"));
                DC(int64(0xaf0a2086a409b170), EConversationDebugInfo::Done);
                DC(int64(0xaf0a2086a409b171), EConversationDebugInfo::Executing);
                
                // He's usually in his cave, studying. Look for the big, ...
                Nefarius.AI.Say(LocText("INFO_NEFARIUS_WOSATURAS_04_01"));
                DC(int64(0xaf0a2086a409b171), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_NEFARIUS, Document::UDocumentSegment_Glossary_NC_KDW_NEFARIUS_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */