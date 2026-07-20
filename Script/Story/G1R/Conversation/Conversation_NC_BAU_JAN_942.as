#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_JAN_942 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_JAN_942";
        }
        
        
        class UTopic_Hero__NC_BAU_JAN_942 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_JAN_942";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJan() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceJan144050 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xe931d3b5212ac987);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe931d3b5212ac986), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe931d3b5212ac986), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan144066 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xe931d3b5212ac98b);
            default Caption = LocText("TEXT_WIP_WROXZYD_20250121_144617_41");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJan150796);
            default Rules.HideIfKnows(UChoiceJan144066);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe931d3b5212ac989), EConversationDebugInfo::Executing);
                // Why are you out here? Alone?
                Hero.AI.Say(LocText("TEXT_WIP_WROXZYD_20250121_144617_41"));
                DC(int64(0xe931d3b5212ac989), EConversationDebugInfo::Done);
                DC(int64(0xe931d3b5212ac98a), EConversationDebugInfo::Executing);
                
                // For the silence - way too much noise in the Camp. 
                Jan.AI.Say(LocText("TEXT_WIP_WROXZYD_20250121_144617_2083"));
                DC(int64(0xe931d3b5212ac98a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJan147258 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca2d);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_154227");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJan150796);
            default Rules.HideIfKnows(UChoiceJan147258);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca2b), EConversationDebugInfo::Executing);
                
                // What are YOU doing here? 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_154227"));
                DC(int64(0xc25b49d590c2ca2b), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa4a), EConversationDebugInfo::Executing);
                
                // (sighs) Why? Are you trying to make friends?
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_144856"));
                DC(int64(0x71e415cce33baa4a), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa4b), EConversationDebugInfo::Executing);
                
                // Just curious. 
                Hero.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_145058"));
                DC(int64(0x71e415cce33baa4b), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa4c), EConversationDebugInfo::Executing);
                
                // There's a saying about that. Something with cats. 
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_145113"));
                DC(int64(0x71e415cce33baa4c), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca2c), EConversationDebugInfo::Executing);
                // But to answer your question, I'm resting. Nothing better ...
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_154227_41"));
                DC(int64(0xc25b49d590c2ca2c), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be660c), EConversationDebugInfo::Executing);
                
                // You're a fighter? 
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_084041"));
                DC(int64(0xe8bf4288a0be660c), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be660e), EConversationDebugInfo::Executing);
                
                // Masterfully deduced. Yes, I am - one of the best in the ...
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_084121"));
                DC(int64(0xe8bf4288a0be660e), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be660f), EConversationDebugInfo::Executing);
                // Not a great friend of weapons, though ... they're for ...
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_084129"));
                DC(int64(0xe8bf4288a0be660f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJan147901 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca38);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_155010");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_084121"), int64(0xc25b49d590c2ca38));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_DUZEPXD_20250131_155202"), int64(0xc25b49d590c2ca38));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca36), EConversationDebugInfo::Executing);
                
                // Can you show me some tricks? For boxing? 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155010"));
                DC(int64(0xc25b49d590c2ca36), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_JAN, Document::UDocumentSegment_Glossary_NC_BAU_JAN_Teacher);
                DB(int64(0xc25b49d590c2ca3c), Hero.GetLevelAttribute() >= 5);
                
                if (Hero.GetLevelAttribute() >= 5)
                {
                    DC(int64(0xc25b49d590c2ca3f), EConversationDebugInfo::Executing);
                    // Hmm ... why not. But only if you do something for me ...
                    Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155202"));
                    DC(int64(0xc25b49d590c2ca3f), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Jan_148274,
                        UTopic_Jan_148294
                    );
                }
                else
                {
                    DC(int64(0xc25b49d590c2ca3d), EConversationDebugInfo::Executing);
                    // You're too green, I can see that from a mile away. Get ...
                    Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155130"));
                    DC(int64(0xc25b49d590c2ca3d), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Jan_148274 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca44);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_155444_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Jan_148274);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca45), EConversationDebugInfo::Executing);
                // What do you need? 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155444_2386"));
                DC(int64(0xc25b49d590c2ca45), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Jan_148294 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca48);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_155444_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Jan_148294);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca49), EConversationDebugInfo::Executing);
                // I don't have the time for that. 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155444_1609"));
                DC(int64(0xc25b49d590c2ca49), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca4c), EConversationDebugInfo::Executing);
                
                // Then I don't have the time to teach you. 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155524"));
                DC(int64(0xc25b49d590c2ca4c), EConversationDebugInfo::Done);
                DC(int64(0xd6eca3de9c718011), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd6eca3de9c718011), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan148424 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca51);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_155625");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_DUZEPXD_20250131_155202"), int64(0xc25b49d590c2ca51));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_DUZEPXD_20250131_155845"), int64(0xc25b49d590c2ca51));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca4f), EConversationDebugInfo::Executing);
                // About that favor you asked from me ... 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155625"));
                DC(int64(0xc25b49d590c2ca4f), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca50), EConversationDebugInfo::Executing);
                
                // I'm listening?
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155625_3569"));
                DC(int64(0xc25b49d590c2ca50), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Jan_148468,
                    UTopic_Jan_148488
                );
            }
        }
        
        
        class UTopic_Jan_148468 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca54);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_155657_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Jan_148468);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca55), EConversationDebugInfo::Executing);
                // I can make time. What do you need? 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155657_443"));
                DC(int64(0xc25b49d590c2ca55), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Jan_148488 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca58);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_155657_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca59), EConversationDebugInfo::Executing);
                // Forget about it.
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155657_491"));
                DC(int64(0xc25b49d590c2ca59), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca5c), EConversationDebugInfo::Executing);
                
                // Make up your fucking mind, will you? 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155722"));
                DC(int64(0xc25b49d590c2ca5c), EConversationDebugInfo::Done);
                DC(int64(0xd6eca3de9c71801a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd6eca3de9c71801a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan148610 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca5f);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Jan_148274);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Jan_148468);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca61), EConversationDebugInfo::Executing);
                // All right. I told you I'm the best boxer in the Colony, ...
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155845"));
                DC(int64(0xc25b49d590c2ca61), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca63), EConversationDebugInfo::Executing);
                
                // Yeah, I got that. 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155859"));
                DC(int64(0xc25b49d590c2ca63), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca64), EConversationDebugInfo::Executing);
                
                // Good. Yesterday I crushed a rock. With my bare hands. 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155907"));
                DC(int64(0xc25b49d590c2ca64), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa4d), EConversationDebugInfo::Executing);
                
                // ... And?
                Hero.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_145903"));
                DC(int64(0x71e415cce33baa4d), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa4e), EConversationDebugInfo::Executing);
                
                // And I think I might have broken a knuckle. 
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_145908"));
                DC(int64(0x71e415cce33baa4e), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca65), EConversationDebugInfo::Executing);
                // It'll heal on its own, but I know the Water Mages have ...
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_155937"));
                DC(int64(0xc25b49d590c2ca65), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca66), EConversationDebugInfo::Executing);
                // Bring me some of that. Then I'll teach you. 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160041"));
                DC(int64(0xc25b49d590c2ca66), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca68), EConversationDebugInfo::Executing);
                
                // All right. I'll see what I can do. 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160230"));
                DC(int64(0xc25b49d590c2ca68), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa4f), EConversationDebugInfo::Executing);
                
                // You know where to find me. 
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_150101"));
                DC(int64(0x71e415cce33baa4f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIGHTER, Document::UDocumentSegment_CH1_FIGHTER_Start);
                DC(int64(0x57bec776ab9a0d20), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_FIGHTER.StartQuest();
                DC(int64(0x57bec776ab9a0d20), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJan149144 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xe8bf4288a0be6684);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceJan149144);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_Story_WaitHeroFightJan", 150.0f, int64(0xe8bf4288a0be6684));
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_WAIT_FIGHT_JAN", 100.0f, int64(0xe8bf4288a0be6684));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x57bec776ab9a0d37), G1R.Jan_Training == 0);
                }
                
                return G1R.Jan_Training == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe8bf4288a0be6681), EConversationDebugInfo::Executing);
                // Here we are. 
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090123_2238"));
                DC(int64(0xe8bf4288a0be6681), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be669b), EConversationDebugInfo::Executing);
                // Remember, fists only. Draw steel and we're done. 
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090322"));
                DC(int64(0xe8bf4288a0be669b), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be669c), EConversationDebugInfo::Executing);
                // Now let's dance. 
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090331"));
                DC(int64(0xe8bf4288a0be669c), EConversationDebugInfo::Done);
                DC(int64(0x57bec776ab9a0d3d), EConversationDebugInfo::Executing);
                Jan.AI.StartTrainingFightWithFists(Hero);
                DC(int64(0x57bec776ab9a0d3d), EConversationDebugInfo::Done);
                DC(int64(0x78298577ec631435), EConversationDebugInfo::Executing);
                Hero.Inventory.UnequipWeapons();
                DC(int64(0x78298577ec631435), EConversationDebugInfo::Done);
                DC(int64(0x78298577ec63144f), EConversationDebugInfo::Executing);
                G1R.Jan_Training = 1;
                DC(int64(0x78298577ec63144f), EConversationDebugInfo::Done);
                DC(int64(0x1abb8b94ed4e955a), EConversationDebugInfo::Executing);
                Jan.MakeUnlootable();
                DC(int64(0x1abb8b94ed4e955a), EConversationDebugInfo::Done);
                DC(int64(0xd9a78473bcef2000), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipMeleeWeaponOfClass(UHumanFist_NoWeapon);
                DC(int64(0xd9a78473bcef2000), EConversationDebugInfo::Done);
                DC(int64(0xd9a78473bcef2002), EConversationDebugInfo::Executing);
                Hero.AI.DrawMeleeWeapon();
                DC(int64(0xd9a78473bcef2002), EConversationDebugInfo::Done);
                DC(int64(0x57bec776ab9a0d42), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57bec776ab9a0d42), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan149182 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xe8bf4288a0be66a9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_090610_3286"), int64(0xe8bf4288a0be66a9));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xea5a1841f61dd96c), G1R.Jan_Training >= 1);
                    DB(int64(0xea5a1841f61dd971), Jan != nullptr && Jan.HasRecentlyDefeated(Hero));
                    DB(int64(0x9a6f0744df3baa94), Hero != nullptr && !Hero.HasDefeated(Jan));
                }
                
                if (G1R.Jan_Training < 1)
                    return false;
                
                if (Jan != nullptr && !Jan.HasRecentlyDefeated(Hero))
                    return false;
                
                if (Hero != nullptr && Hero.HasDefeated(Jan))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe8bf4288a0be66a6), EConversationDebugInfo::Executing);
                // You okay? Hope I didn't break anything.
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090420_2785"));
                DC(int64(0xe8bf4288a0be66a6), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be66b3), EConversationDebugInfo::Executing);
                // You're not there yet. Let me know when you're ready for ...
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090505"));
                DC(int64(0xe8bf4288a0be66b3), EConversationDebugInfo::Done);
                DC(int64(0x57bec776ab9a0d7b), EConversationDebugInfo::Executing);
                G1R.Jan_Training = 0;
                DC(int64(0x57bec776ab9a0d7b), EConversationDebugInfo::Done);
                DC(int64(0x57bec776ab9a0d80), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57bec776ab9a0d80), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan149313 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xe8bf4288a0be66b8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceJan149313);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xea5a1841f61dd909), G1R.Jan_Training >= 1);
                    DB(int64(0xea5a1841f61dd91e), Hero != nullptr && Hero.HasRecentlyDefeated(Jan));
                }
                
                if (G1R.Jan_Training < 1)
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Jan))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe8bf4288a0be66b5), EConversationDebugInfo::Executing);
                // Well. That wasn't complete shit. 
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090610_3286"));
                DC(int64(0xe8bf4288a0be66b5), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be66ba), EConversationDebugInfo::Executing);
                // Next time I won't hold back.
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090742"));
                DC(int64(0xe8bf4288a0be66ba), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be66bb), EConversationDebugInfo::Executing);
                // Anyway. If you still want to learn some more tricks, let ...
                Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090746"));
                DC(int64(0xe8bf4288a0be66bb), EConversationDebugInfo::Done);
                DC(int64(0x57bec776ab9a0d8a), EConversationDebugInfo::Executing);
                G1R.Jan_Training = 0;
                DC(int64(0x57bec776ab9a0d8a), EConversationDebugInfo::Done);
                DC(int64(0x57bec776ab9a0d8f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57bec776ab9a0d8f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan149334 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xe8bf4288a0be66c0);
            default Caption = LocText("TEXT_WIP_XAOYHKE_20250203_090754");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_Fists_Master);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_090610_3286"), int64(0xe8bf4288a0be66c0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x57bec776ab9a0d9a), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Master));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe8bf4288a0be66bc), EConversationDebugInfo::Executing);
                // Show me some more tricks. 
                Hero.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_090754"));
                DC(int64(0xe8bf4288a0be66bc), EConversationDebugInfo::Done);
                DB(int64(0xe8bf4288a0be66c3), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_Fists_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_Fists_Master))
                {
                    DC(int64(0xe8bf4288a0be66ca), EConversationDebugInfo::Executing);
                    // All right. This one is about stance. 
                    Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_091509"));
                    DC(int64(0xe8bf4288a0be66ca), EConversationDebugInfo::Done);
                    DC(int64(0x71e415cce33baa55), EConversationDebugInfo::Executing);
                    // You remember how I told you to never lose your footing? ...
                    Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_152121"));
                    DC(int64(0x71e415cce33baa55), EConversationDebugInfo::Done);
                    DC(int64(0xecb4b9ea9e47877c), EConversationDebugInfo::Executing);
                    // You have to stay agile at all times. Move and dodge like ...
                    Jan.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_141952"));
                    DC(int64(0xecb4b9ea9e47877c), EConversationDebugInfo::Done);
                    DC(int64(0x71e415cce33baa56), EConversationDebugInfo::Executing);
                    // Go and practice that. 
                    Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_153106"));
                    DC(int64(0x71e415cce33baa56), EConversationDebugInfo::Done);
                    DC(int64(0xe8bf4288a0be66d1), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Melee_Fists_Master);
                    DC(int64(0xe8bf4288a0be66d1), EConversationDebugInfo::Done);
                    DC(int64(0xfb1ff76127beb043), EConversationDebugInfo::Executing);
                    Jan.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Jan_942_Start);
                    DC(int64(0xfb1ff76127beb043), EConversationDebugInfo::Done);
                    DC(int64(0x1abb8b94ed4e9558), EConversationDebugInfo::Executing);
                    Jan.MakeLootable();
                    DC(int64(0x1abb8b94ed4e9558), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jan_149334_exit_1");
                    DC(int64(0xe8bf4288a0be66d6), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xe8bf4288a0be66d6), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xe8bf4288a0be66c6), EConversationDebugInfo::Executing);
                    // I will - WHEN you're ready. Still your mind and open it ...
                    Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_091336"));
                    DC(int64(0xe8bf4288a0be66c6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jan_149334_exit_2");
                }
            }
        }
        
        
        class UChoiceJan149410 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca6c);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_160443");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xea5a1841f61dd9dc), Quest::ValleyOfMines_FIGHTER != nullptr && Quest::ValleyOfMines_FIGHTER.IsRunning());
                }
                
                return Quest::ValleyOfMines_FIGHTER != nullptr && Quest::ValleyOfMines_FIGHTER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca6a), EConversationDebugInfo::Executing);
                // About that remedy ... 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160443"));
                DC(int64(0xc25b49d590c2ca6a), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca6b), EConversationDebugInfo::Executing);
                
                // Do you always stretch things out like that? Spit it out, ...
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160443_731"));
                DC(int64(0xc25b49d590c2ca6b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Jan_149448,
                    UTopic_Jan_149468
                );
            }
        }
        
        
        class UTopic_Jan_149448 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca6f);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_160547_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Jan_149448);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xea5a1841f61dd9d6), Hero != nullptr && Hero.HasItem(UItMs_Remedy, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMs_Remedy, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca70), EConversationDebugInfo::Executing);
                // I found it. 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160547_3719"));
                DC(int64(0xc25b49d590c2ca70), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa50), EConversationDebugInfo::Executing);
                
                // Show me. 
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_150608"));
                DC(int64(0x71e415cce33baa50), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIGHTER, Document::UDocumentSegment_CH1_FIGHTER_Completed);
                DC(int64(0xc25b49d590c2ca79), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Jan, UItMs_Remedy, 1);
                DC(int64(0xc25b49d590c2ca79), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca7a), EConversationDebugInfo::Executing);
                // Well, well. Didn't think you could do it. 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160654"));
                DC(int64(0xc25b49d590c2ca7a), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca7c), EConversationDebugInfo::Executing);
                // All right, then - you held your end of the bargain, I'll ...
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160713"));
                DC(int64(0xc25b49d590c2ca7c), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca7e), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING.SucceedQuest();
                DC(int64(0xc25b49d590c2ca7e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Jan_149468 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca73);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_160547_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca74), EConversationDebugInfo::Executing);
                // I'm still looking.
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160547_3902"));
                DC(int64(0xc25b49d590c2ca74), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2ca77), EConversationDebugInfo::Executing);
                
                // And you came here just to tell me that? Strange man. 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_160609"));
                DC(int64(0xc25b49d590c2ca77), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJan149709 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2ca81);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_163043");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_Fists_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x57bec776ab9a0d2d), Quest::ValleyOfMines_FIGHTER != nullptr && Quest::ValleyOfMines_FIGHTER.HasSucceeded());
                    DB(int64(0x57bec776ab9a0d5c), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Trained));
                    DB(int64(0x9a6f0744df3baa92), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Master));
                }
                
                if (Quest::ValleyOfMines_FIGHTER != nullptr && !Quest::ValleyOfMines_FIGHTER.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2ca7f), EConversationDebugInfo::Executing);
                
                // Let's train. 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_163043"));
                DC(int64(0xc25b49d590c2ca7f), EConversationDebugInfo::Done);
                DB(int64(0xc25b49d590c2ca96), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_Fists_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_Fists_Trained))
                {
                    DC(int64(0xc25b49d590c2caa0), EConversationDebugInfo::Executing);
                    // All right. What's a boxer's most important weapon? 
                    Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_163358_2332"));
                    DC(int64(0xc25b49d590c2caa0), EConversationDebugInfo::Done);
                    DC(int64(0x71e415cce33baa51), EConversationDebugInfo::Executing);
                    
                    // His fists? 
                    Hero.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_150839"));
                    DC(int64(0x71e415cce33baa51), EConversationDebugInfo::Done);
                    DC(int64(0x71e415cce33baa52), EConversationDebugInfo::Executing);
                    
                    // No. His eyes. They are what tells you where to strike ...
                    Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_150842"));
                    DC(int64(0x71e415cce33baa52), EConversationDebugInfo::Done);
                    DC(int64(0xecb4b9ea9e478779), EConversationDebugInfo::Executing);
                    // When it's time to trade blows, strike hard and fast. No ...
                    Jan.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_141054"));
                    DC(int64(0xecb4b9ea9e478779), EConversationDebugInfo::Done);
                    DC(int64(0xecb4b9ea9e47877a), EConversationDebugInfo::Executing);
                    // If you get a strike in, don't let up. Hit again, and ...
                    Jan.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_141218"));
                    DC(int64(0xecb4b9ea9e47877a), EConversationDebugInfo::Done);
                    DC(int64(0xecb4b9ea9e47877b), EConversationDebugInfo::Executing);
                    // That's it. 
                    Jan.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_141309"));
                    DC(int64(0xecb4b9ea9e47877b), EConversationDebugInfo::Done);
                    DC(int64(0xc25b49d590c2cab4), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Melee_Fists_Trained);
                    DC(int64(0xc25b49d590c2cab4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jan_149709_exit_1");
                    DC(int64(0xc25b49d590c2cab7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc25b49d590c2cab7), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc25b49d590c2ca98), EConversationDebugInfo::Executing);
                    // Hmm ... no, you aren't ready. Your spirit has to be ...
                    Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_163248_1037"));
                    DC(int64(0xc25b49d590c2ca98), EConversationDebugInfo::Done);
                    DC(int64(0xe8bf4288a0be661e), EConversationDebugInfo::Executing);
                    // Come back when it is. 
                    Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_085051"));
                    DC(int64(0xe8bf4288a0be661e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jan_149709_exit_2");
                }
            }
        }
        
        
        class UChoiceJan149916 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2cac0);
            default Caption = LocText("TEXT_WIP_ZNZVQKH_20250205_151059");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceJan149916);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x57bec776ab9a0d68), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Trained));
                    DB(int64(0x16e0efa6d8d84cd4), Quest::ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING != nullptr && Quest::ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Trained))
                    return false;
                
                if (Quest::ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING != nullptr && !Quest::ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x71e415cce33baa53), EConversationDebugInfo::Executing);
                // Can you show me some more tricks? 
                Hero.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_151059"));
                DC(int64(0x71e415cce33baa53), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2cabd), EConversationDebugInfo::Executing);
                
                // Ha. Developed a taste, did you? 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_163703_3334"));
                DC(int64(0xc25b49d590c2cabd), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2cac5), EConversationDebugInfo::Executing);
                // I can, but there's no lesson like practice. 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_163825"));
                DC(int64(0xc25b49d590c2cac5), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2cac7), EConversationDebugInfo::Executing);
                // So, here's the deal. Fight me. If you win, I'll show you ...
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_164005"));
                DC(int64(0xc25b49d590c2cac7), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa54), EConversationDebugInfo::Executing);
                // At least I'll try. 
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_151247"));
                DC(int64(0x71e415cce33baa54), EConversationDebugInfo::Done);
                DC(int64(0xc25b49d590c2cac8), EConversationDebugInfo::Executing);
                // Let me know when you're ready. 
                Jan.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_164040"));
                DC(int64(0xc25b49d590c2cac8), EConversationDebugInfo::Done);
                DC(int64(0x78298577ec631437), EConversationDebugInfo::Executing);
                Jan.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Jan_942_TrainFight);
                DC(int64(0x78298577ec631437), EConversationDebugInfo::Done);
                DC(int64(0x78298577ec631446), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x78298577ec631446), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan150298 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0xc25b49d590c2cadb);
            default Caption = LocText("TEXT_WIP_DUZEPXD_20250131_164246");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_WAIT_FIGHT_JAN", 200.0f, int64(0xc25b49d590c2cadb));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_DUZEPXD_20250131_164040"), int64(0xc25b49d590c2cadb));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_XAOYHKE_20250203_090610_3286"), int64(0xc25b49d590c2cadb));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x57bec776ab9a0d73), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Trained));
                    DB(int64(0x78298577ec63144d), G1R.Jan_Training == 0);
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_Fists_Trained))
                    return false;
                
                if (G1R.Jan_Training != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc25b49d590c2cad7), EConversationDebugInfo::Executing);
                // Let's fight. 
                Hero.AI.Say(LocText("TEXT_WIP_DUZEPXD_20250131_164246"), ForceCameraPreset = n"Jan Fight BirdEye");
                DC(int64(0xc25b49d590c2cad7), EConversationDebugInfo::Done);
                DB(int64(0xe8bf4288a0be6665), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_Story_WaitHeroFightJan", 500.0f));
                
                if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_Story_WaitHeroFightJan", 500.0f))
                {
                    
                }
                else
                {
                    DC(int64(0xe8bf4288a0be6669), EConversationDebugInfo::Executing);
                    // Music to my ears. Follow me. 
                    Jan.AI.Say(LocText("TEXT_WIP_XAOYHKE_20250203_085949_2083"));
                    DC(int64(0xe8bf4288a0be6669), EConversationDebugInfo::Done);
                }
                DC(int64(0x78298577ec6314a0), EConversationDebugInfo::Executing);
                Hero.AI.GotoWaypoint(n"WP_NC_Story_WaitHeroFightJan");
                DC(int64(0x78298577ec6314a0), EConversationDebugInfo::Done);
                DC(int64(0x78298577ec6314b4), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(Jan);
                DC(int64(0x78298577ec6314b4), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be667b), EConversationDebugInfo::Executing);
                G1R.Jan_Training = 1;
                DC(int64(0xe8bf4288a0be667b), EConversationDebugInfo::Done);
                DC(int64(0x78298577ec631451), EConversationDebugInfo::Executing);
                Jan.AI.StartTrainingFightWithFists(Hero);
                DC(int64(0x78298577ec631451), EConversationDebugInfo::Done);
                DC(int64(0x78298577ec631453), EConversationDebugInfo::Executing);
                Hero.Inventory.UnequipWeapons();
                DC(int64(0x78298577ec631453), EConversationDebugInfo::Done);
                DC(int64(0xfb1ff76127beb075), EConversationDebugInfo::Executing);
                Jan.Character.Heal();
                DC(int64(0xfb1ff76127beb075), EConversationDebugInfo::Done);
                DC(int64(0x1abb8b94ed4e9554), EConversationDebugInfo::Executing);
                Jan.MakeUnlootable();
                DC(int64(0x1abb8b94ed4e9554), EConversationDebugInfo::Done);
                DC(int64(0xd9a78473bcef1ffe), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipMeleeWeaponOfClass(UHumanFist_NoWeapon);
                DC(int64(0xd9a78473bcef1ffe), EConversationDebugInfo::Done);
                DC(int64(0xd9a78473bcef2008), EConversationDebugInfo::Executing);
                Hero.AI.DrawMeleeWeapon();
                DC(int64(0xd9a78473bcef2008), EConversationDebugInfo::Done);
                DC(int64(0xe8bf4288a0be6688), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe8bf4288a0be6688), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJan150796 : UTopic_Hero__NC_BAU_JAN_942
        {
            default DebugId = int64(0x71e415cce33baa42);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceJan150796);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6c4519adbe1dd423), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x71e415cce33baa3d), EConversationDebugInfo::Executing);
                // Who are you? What do you want?
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_144553_41"));
                DC(int64(0x71e415cce33baa3d), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa48), EConversationDebugInfo::Executing);
                
                // Just passing through. 
                Hero.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_144647"));
                DC(int64(0x71e415cce33baa48), EConversationDebugInfo::Done);
                DC(int64(0x71e415cce33baa49), EConversationDebugInfo::Executing);
                
                // Then don't get on my nerves. 
                Jan.AI.Say(LocText("TEXT_WIP_ZNZVQKH_20250205_144651"));
                DC(int64(0x71e415cce33baa49), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_JAN, Document::UDocumentSegment_Glossary_NC_BAU_JAN_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */