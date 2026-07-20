#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_STT_COHSEL_337 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_STT_COHSEL_337";
        }
        
        
        class UTopic_Hero__UL_STT_COHSEL_337 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_STT_COHSEL_337";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCohsel() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceCohsel144094 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xe931d3b5212ac98f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe931d3b5212ac98e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe931d3b5212ac98e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCohsel144110 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xe931d3b5212ac993);
            default Caption = LocText("TEXT_WIP_WROXZYD_20250121_144703_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCohsel144110);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd28b7bedef41f412), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe931d3b5212ac991), EConversationDebugInfo::Executing);
                // What are you doing out here?
                Hero.AI.Say(LocText("TEXT_WIP_WROXZYD_20250121_144703_1924"));
                DC(int64(0xe931d3b5212ac991), EConversationDebugInfo::Done);
                DC(int64(0xe931d3b5212ac992), EConversationDebugInfo::Executing);
                
                // I gather rare plants and ingredients.
                Cohsel.AI.Say(LocText("TEXT_WIP_WROXZYD_20250121_144703_2785"));
                DC(int64(0xe931d3b5212ac992), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f407), EConversationDebugInfo::Executing);
                // Anything that could be useful to the mages.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_121951"));
                DC(int64(0xd28b7bedef41f407), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_COHSEL, Document::UDocumentSegment_Glossary_UL_STT_COHSEL_Introduction);
            }
        }
        
        
        class UChoiceCohsel149546 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f40a);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_122027");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCohsel144110);
            default Rules.HideIfKnows(UChoiceCohsel149546);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f408), EConversationDebugInfo::Executing);
                // Is that your wolf?
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122027"));
                DC(int64(0xd28b7bedef41f408), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f409), EConversationDebugInfo::Executing);
                
                // Well, I don't own him, but yeah, he's with me. His ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122027_41"));
                DC(int64(0xd28b7bedef41f409), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f410), EConversationDebugInfo::Executing);
                // I can't bring him into Camp, obviously - that wouldn't ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122100"));
                DC(int64(0xd28b7bedef41f410), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_COHSEL, Document::UDocumentSegment_Glossary_UL_STT_COHSEL_Pet);
            }
        }
        
        
        class UChoiceCohsel149562 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f40e);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_122033");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCohsel144110);
            default Rules.HideIfKnows(UChoiceCohsel149562);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f40c), EConversationDebugInfo::Executing);
                // Do you know anything about this area?
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122033"));
                DC(int64(0xd28b7bedef41f40c), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f40d), EConversationDebugInfo::Executing);
                
                // Things have changed a lot.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122033_2238"));
                DC(int64(0xd28b7bedef41f40d), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f41f), EConversationDebugInfo::Executing);
                // Ever since the Barrier, I mean. Nothing like it used to ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_123406"));
                DC(int64(0xd28b7bedef41f41f), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f420), EConversationDebugInfo::Executing);
                // Creatures have gotten more vile, nature is changing ... ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_123436"));
                DC(int64(0xd28b7bedef41f420), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCohsel149816 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f415);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_122242");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCohsel144110);
            default Rules.HideIfKnows(UChoiceCohsel149816);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f413), EConversationDebugInfo::Executing);
                
                // You work for the Mages?
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122242"));
                DC(int64(0xd28b7bedef41f413), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f414), EConversationDebugInfo::Executing);
                
                // Well, they tell me what they need, and if I find it, I ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122242_2785"));
                DC(int64(0xd28b7bedef41f414), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f422), EConversationDebugInfo::Executing);
                
                // Must be covering a lot of distance for that.
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124035"));
                DC(int64(0xd28b7bedef41f422), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f421), EConversationDebugInfo::Executing);
                
                // Yeah. That's why I tamed a scavenger.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124003"));
                DC(int64(0xd28b7bedef41f421), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f423), EConversationDebugInfo::Executing);
                
                // You ride a scavenger? I want that too!
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124137"));
                DC(int64(0xd28b7bedef41f423), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f424), EConversationDebugInfo::Executing);
                
                // No.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124155"));
                DC(int64(0xd28b7bedef41f424), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_COHSEL, Document::UDocumentSegment_Glossary_UL_STT_COHSEL_RideScavenger);
            }
        }
        
        
        class UChoiceCohsel149832 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f419);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_122826");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCohsel149832);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd28b7bedef41f41e), G1R != nullptr && G1R.HasReachedChapter(4));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f417), EConversationDebugInfo::Executing);
                // They killed the firemages.
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122826"));
                DC(int64(0xd28b7bedef41f417), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f418), EConversationDebugInfo::Executing);
                
                // What? Who? Gomez? The warders?
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122826_3436"));
                DC(int64(0xd28b7bedef41f418), EConversationDebugInfo::Done);
                DC(int64(0x5a73c0e9a739bb4a), EConversationDebugInfo::Executing);
                
                // Yes.
                Hero.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_222950"));
                DC(int64(0x5a73c0e9a739bb4a), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f41b), EConversationDebugInfo::Executing);
                
                // Hm. I don't think I'll ever go back to that Camp.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122943"));
                DC(int64(0xd28b7bedef41f41b), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f41c), EConversationDebugInfo::Executing);
                // Who knows what's going on there now ... Thanks.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_122947"));
                DC(int64(0xd28b7bedef41f41c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_COHSEL, Document::UDocumentSegment_Glossary_UL_STT_COHSEL_Introduction);
            }
        }
        
        
        class UChoiceCohsel150416 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f427);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_124211");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCohsel149816);
            default Rules.HideIfKnows(UChoiceCohsel150416);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_124003"), int64(0xd28b7bedef41f427));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f425), EConversationDebugInfo::Executing);
                // About the scavengers ...
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124211"));
                DC(int64(0xd28b7bedef41f425), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f426), EConversationDebugInfo::Executing);
                
                // Not a chance.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124211_686"));
                DC(int64(0xd28b7bedef41f426), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCohsel150497 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f42b);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_124341");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCohsel144110);
            default Rules.HideIfKnows(UChoiceCohsel150497);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_124211_686"), int64(0xd28b7bedef41f42b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f429), EConversationDebugInfo::Executing);
                
                // About the scavengers ...
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124341"));
                DC(int64(0xd28b7bedef41f429), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f42a), EConversationDebugInfo::Executing);
                
                // Drop it.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124341_3984"));
                DC(int64(0xd28b7bedef41f42a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCohsel150552 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f42f);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_124418");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCohsel144110);
            default Rules.HideIfKnows(UChoiceCohsel150552);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_124341_3984"), int64(0xd28b7bedef41f42f));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f42d), EConversationDebugInfo::Executing);
                
                // Hey, about the scavengers ...
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124418"));
                DC(int64(0xd28b7bedef41f42d), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f42e), EConversationDebugInfo::Executing);
                
                // You don't give up, do you?
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124418_3569"));
                DC(int64(0xd28b7bedef41f42e), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f431), EConversationDebugInfo::Executing);
                
                // Nope.
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124448"));
                DC(int64(0xd28b7bedef41f431), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f432), EConversationDebugInfo::Executing);
                
                // Well, all right - but you gotta earn it.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124452"));
                DC(int64(0xd28b7bedef41f432), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f433), EConversationDebugInfo::Executing);
                
                // Sure.
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124514"));
                DC(int64(0xd28b7bedef41f433), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f434), EConversationDebugInfo::Executing);
                
                // There's an algae that grows at the bottom of lakes. ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124523"));
                DC(int64(0xd28b7bedef41f434), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f435), EConversationDebugInfo::Executing);
                // The beasts here go mad about it. Scavengers, snappers - ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124549"));
                DC(int64(0xd28b7bedef41f435), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f436), EConversationDebugInfo::Executing);
                // You bring me ... five of them and I'll let you ride a ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_124621"));
                DC(int64(0xd28b7bedef41f436), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SCAVENGERRAIDER, Document::UDocumentSegment_CH1_SCAVENGERRAIDER_Start);
                DC(int64(0xc7a58614016b5bc8), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_SCAVENGERRAIDER.StartQuest();
                DC(int64(0xc7a58614016b5bc8), EConversationDebugInfo::Done);
                DC(int64(0x737095323e34f3d6), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE.StartQuest();
                DC(int64(0x737095323e34f3d6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCohsel150967 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f439);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_130215");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCohsel150967);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbcf0c089825e1aec), Hero != nullptr && Hero.HasItem(UItFo_Plants_Lobelia, 5, 0));
                    DB(int64(0xc7a58614016b5bc9), Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE != nullptr && Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Plants_Lobelia, 5, 0))
                    return false;
                
                if (Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE != nullptr && !Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f437), EConversationDebugInfo::Executing);
                // Here's the algae.
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_130215"));
                DC(int64(0xd28b7bedef41f437), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f438), EConversationDebugInfo::Executing);
                
                // Thanks.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_130215_443"));
                DC(int64(0xd28b7bedef41f438), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SCAVENGERRAIDER, Document::UDocumentSegment_CH1_SCAVENGERRAIDER_Material);
                DC(int64(0xd28b7bedef41f442), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Cohsel, UItFo_Plants_Lobelia, 5);
                DC(int64(0xd28b7bedef41f442), EConversationDebugInfo::Done);
                DC(int64(0x737095323e34f3d8), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE.SucceedQuest();
                DC(int64(0x737095323e34f3d8), EConversationDebugInfo::Done);
                DC(int64(0x737095323e34f3da), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL.StartQuest();
                DC(int64(0x737095323e34f3da), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef037599), EConversationDebugInfo::Executing);
                // Perfect! With this I'll be able to craft a whistle to ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135623_2238"));
                DC(int64(0x81ae9075ef037599), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef03759c), EConversationDebugInfo::Executing);
                
                // Great! When will it be ready?
                Hero.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135700"));
                DC(int64(0x81ae9075ef03759c), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef03759d), EConversationDebugInfo::Executing);
                
                // Not so fast. Even if it follows you, you'll need a ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135705"));
                DC(int64(0x81ae9075ef03759d), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef03759e), EConversationDebugInfo::Executing);
                // And I don't have the materials on hand.
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135711"));
                DC(int64(0x81ae9075ef03759e), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375a0), EConversationDebugInfo::Executing);
                
                // What do you need?
                Hero.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135719"));
                DC(int64(0x81ae9075ef0375a0), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375a1), EConversationDebugInfo::Executing);
                
                // I can make you a good set if you bring me... three wolf ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135725"));
                DC(int64(0x81ae9075ef0375a1), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375a2), EConversationDebugInfo::Executing);
                
                // I hope it's worth it.
                Hero.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135745"));
                DC(int64(0x81ae9075ef0375a2), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375a3), EConversationDebugInfo::Executing);
                
                // It will be.
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135751"));
                DC(int64(0x81ae9075ef0375a3), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cohsel_197379,
                    UTopic_Cohsel_197399,
                    UTopic_Cohsel_197421
                );
            }
        }
        
        
        class UTopic_Cohsel_197379 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0x81ae9075ef0375a5);
            default Caption = LocText("TEXT_WIP_XXAISVL_20250616_135806_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cohsel_197379);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81ae9075ef0375a6), EConversationDebugInfo::Executing);
                // Where can I find leather strips?
                Hero.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135806_1924"));
                DC(int64(0x81ae9075ef0375a6), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375ba), EConversationDebugInfo::Executing);
                
                // There's probably some in an abandoned area.
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135842"));
                DC(int64(0x81ae9075ef0375ba), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375bb), EConversationDebugInfo::Executing);
                // And if not, a blacksmith surely has some. They need them ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135848"));
                DC(int64(0x81ae9075ef0375bb), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375a8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x81ae9075ef0375a8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cohsel_197399 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0x81ae9075ef0375a9);
            default Caption = LocText("TEXT_WIP_XXAISVL_20250616_135806_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cohsel_197399);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81ae9075ef0375aa), EConversationDebugInfo::Executing);
                // And... where can I find wolves?
                Hero.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135806_3436"));
                DC(int64(0x81ae9075ef0375aa), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375bc), EConversationDebugInfo::Executing);
                
                // Open your eyes! You're in the colony! There're wild ...
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135911"));
                DC(int64(0x81ae9075ef0375bc), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375bd), EConversationDebugInfo::Executing);
                // Good thing Dandy keeps them in check.
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135919"));
                DC(int64(0x81ae9075ef0375bd), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375ac), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x81ae9075ef0375ac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cohsel_197421 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0x81ae9075ef0375af);
            default Caption = LocText("TEXT_WIP_XXAISVL_20250616_135809_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cohsel_197421);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81ae9075ef0375b0), EConversationDebugInfo::Executing);
                // On my way.
                Hero.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_135809_3286"));
                DC(int64(0x81ae9075ef0375b0), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef0375b7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x81ae9075ef0375b7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCohsel151225 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0xd28b7bedef41f446);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_133847");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_133728"), int64(0xd28b7bedef41f446));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc7a58614016b5be1), Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT != nullptr && Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT.IsRunning());
                }
                
                return Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT != nullptr && Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd28b7bedef41f449), EConversationDebugInfo::Executing);
                // Is the scavenger ready?
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_133847"));
                DC(int64(0xd28b7bedef41f449), EConversationDebugInfo::Done);
                DB(int64(0xc7a58614016b5be5), G1R.Scavenger_Preparation.IsValid() && G1R.Scavenger_Preparation.IsAtLeastXDaysAgo(1));
                
                if (G1R.Scavenger_Preparation.IsValid() && G1R.Scavenger_Preparation.IsAtLeastXDaysAgo(1))
                {
                    DC(int64(0xd28b7bedef41f44c), EConversationDebugInfo::Executing);
                    // Yep, all set.
                    Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_134854"));
                    DC(int64(0xd28b7bedef41f44c), EConversationDebugInfo::Done);
                    DC(int64(0xd28b7bedef41f44d), EConversationDebugInfo::Executing);
                    // Here, this'll let you call it.
                    Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_134936"));
                    DC(int64(0xd28b7bedef41f44d), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_COHSEL, Document::UDocumentSegment_Glossary_UL_STT_COHSEL_GotScavenger);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SCAVENGERRAIDER, Document::UDocumentSegment_CH1_SCAVENGERRAIDER_Success);
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                    Cohsel.AddItemToInventory(UItMs_ScavengerWhistle, 1);
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                    DC(int64(0xd28b7bedef41f44f), EConversationDebugInfo::Executing);
                    Cohsel.AI.GiveItemTo(Hero, UItMs_ScavengerWhistle, 1);
                    DC(int64(0xd28b7bedef41f44f), EConversationDebugInfo::Done);
                    DC(int64(0xd28b7bedef41f451), EConversationDebugInfo::Executing);
                    // If you call it, it'll come - if it can reach you, that ...
                    Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_134955_1340"));
                    DC(int64(0xd28b7bedef41f451), EConversationDebugInfo::Done);
                    DC(int64(0xd28b7bedef41f452), EConversationDebugInfo::Executing);
                    // Now that it's tamed, it's not as bold as a wild ...
                    Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_135024"));
                    DC(int64(0xd28b7bedef41f452), EConversationDebugInfo::Done);
                    DC(int64(0xd28b7bedef41f453), EConversationDebugInfo::Executing);
                    // So it'll run off if it feels threatened.
                    Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_135058"));
                    DC(int64(0xd28b7bedef41f453), EConversationDebugInfo::Done);
                    DC(int64(0x5a73c0e9a739bb4b), EConversationDebugInfo::Executing);
                    
                    // And when does it feel threatened?
                    Hero.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_223246"));
                    DC(int64(0x5a73c0e9a739bb4b), EConversationDebugInfo::Done);
                    DC(int64(0xd28b7bedef41f454), EConversationDebugInfo::Executing);
                    
                    // Well, you can't take it into caves. And other people ...
                    Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_135139"));
                    DC(int64(0xd28b7bedef41f454), EConversationDebugInfo::Done);
                    DC(int64(0xd28b7bedef41f455), EConversationDebugInfo::Executing);
                    
                    // Got it.
                    Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_135319"));
                    DC(int64(0xd28b7bedef41f455), EConversationDebugInfo::Done);
                    DC(int64(0xc7a58614016b5bcb), EConversationDebugInfo::Executing);
                    Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT.SucceedQuest();
                    DC(int64(0xc7a58614016b5bcb), EConversationDebugInfo::Done);
                    DC(int64(0xcb8843e9bc44e61d), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Riding);
                    DC(int64(0xcb8843e9bc44e61d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_cohsel_151225_exit_1");
                    DC(int64(0xd28b7bedef41f456), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd28b7bedef41f456), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc7a58614016b5be8), EConversationDebugInfo::Executing);
                    // We're not in a hurry, all right? It'll take a while - ...
                    Cohsel.AI.Say(LocText("TEXT_WIP_OVOGMVD_20250205_210912"));
                    DC(int64(0xc7a58614016b5be8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_cohsel_151225_exit_2");
                }
            }
        }
        
        
        class UChoiceCohsel197299 : UTopic_Hero__UL_STT_COHSEL_337
        {
            default DebugId = int64(0x81ae9075ef037560);
            default Caption = LocText("TEXT_WIP_XXAISVL_20250616_124841");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCohsel197299);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81ae9075ef0375bf), Hero != nullptr && Hero.HasItem(UItAt_Wolf_01, 3, 0));
                    DB(int64(0x81ae9075ef0375c2), Hero != nullptr && Hero.HasItem(UItMi_Smith_Leatherstraps, 2, 0));
                    DB(int64(0x737095323e34f3db), Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL != nullptr && Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Wolf_01, 3, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Smith_Leatherstraps, 2, 0))
                    return false;
                
                if (Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL != nullptr && !Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81ae9075ef03755c), EConversationDebugInfo::Executing);
                // Here are the materials for the saddle.
                Hero.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_124841"));
                DC(int64(0x81ae9075ef03755c), EConversationDebugInfo::Done);
                DC(int64(0x81ae9075ef03755d), EConversationDebugInfo::Executing);
                
                // Thanks.
                Cohsel.AI.Say(LocText("TEXT_WIP_XXAISVL_20250616_124841_41"));
                DC(int64(0x81ae9075ef03755d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SCAVENGERRAIDER, Document::UDocumentSegment_CH1_SCAVENGERRAIDER_Wait);
                DC(int64(0x81ae9075ef03756d), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Cohsel, UItAt_Wolf_01, 3);
                DC(int64(0x81ae9075ef03756d), EConversationDebugInfo::Done);
                DC(int64(0x1b4488402170652b), EConversationDebugInfo::Executing);
                Cohsel.AddItemToInventory(UItMi_Smith_Leatherstraps, 2);
                DC(int64(0x1b4488402170652b), EConversationDebugInfo::Done);
                DC(int64(0x1b4488402170652d), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMi_Smith_Leatherstraps, 2, 0);
                DC(int64(0x1b4488402170652d), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f43d), EConversationDebugInfo::Executing);
                // I promised you a scavenger and I keep my word.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_130245_491"));
                DC(int64(0xd28b7bedef41f43d), EConversationDebugInfo::Done);
                DC(int64(0xd28b7bedef41f443), EConversationDebugInfo::Executing);
                // Come back tomorrow, and it'll be ready.
                Cohsel.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_133728"));
                DC(int64(0xd28b7bedef41f443), EConversationDebugInfo::Done);
                DC(int64(0xc7a58614016b5bf0), EConversationDebugInfo::Executing);
                G1R.Scavenger_Preparation = FInGameTime::Now();
                DC(int64(0xc7a58614016b5bf0), EConversationDebugInfo::Done);
                DC(int64(0x737095323e34f3dd), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL.SucceedQuest();
                DC(int64(0x737095323e34f3dd), EConversationDebugInfo::Done);
                DC(int64(0x737095323e34f3df), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT.StartQuest();
                DC(int64(0x737095323e34f3df), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */