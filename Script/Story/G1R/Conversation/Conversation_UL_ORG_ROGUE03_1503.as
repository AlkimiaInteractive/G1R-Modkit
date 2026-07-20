#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_ORG_ROGUE03_1503 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_ORG_ROGUE03_1503";
        }
        
        
        class UTopic_Hero__UL_ORG_ROGUE03_1503 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_ROGUE03_1503";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRogue03() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetUL_ORG_ROGUE04_1504() const property
            {
                return GetCharacter(n"UL_ORG_ROGUE04_1504");
            }
        }
        
        
        class UChoiceRogue03122077 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440bda2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceRogue03122077);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440bda1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xca36b7793440bda1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue03122093 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440bda6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"ASSAULT_ROGUE_03", 700.0f, int64(0xca36b7793440bda6));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_YJSDKDL_20241212_114050_3346"), int64(0xca36b7793440bda6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440bdab), G1R.Rogue03_ScaredPool.IsValid() && G1R.Rogue03_ScaredPool.IsAtLeastXMinutesAgo(700));
                }
                
                return G1R.Rogue03_ScaredPool.IsValid() && G1R.Rogue03_ScaredPool.IsAtLeastXMinutesAgo(700);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xca36b7793440bdae), G1R.Rogue03_Afraid == 0);
                DB(int64(0xca36b7793440bdaf), G1R.Rogue03_Afraid == 1);
                DB(int64(0xca36b7793440bdb0), G1R.Rogue03_Afraid == 2);
                
                if (G1R.Rogue03_Afraid == 0)
                {
                    DC(int64(0xca36b7793440bdb2), EConversationDebugInfo::Executing);
                    // You again! Down for another fight? I'm already getting ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_103935_1924"));
                    DC(int64(0xca36b7793440bdb2), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b632486), EConversationDebugInfo::Executing);
                    
                    // Look, just let me through. 
                    Hero.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_151140"));
                    DC(int64(0x51d6a9817b632486), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b632487), EConversationDebugInfo::Executing);
                    
                    // Shame. All right, then. You know where to find me. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_151147"));
                    DC(int64(0x51d6a9817b632487), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Afraid += 1;
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Done);
                }
                else if (G1R.Rogue03_Afraid == 1)
                {
                    DC(int64(0xca36b7793440bdb4), EConversationDebugInfo::Executing);
                    // If it ain't my knuckle-throwing friend. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_103941_2785"));
                    DC(int64(0xca36b7793440bdb4), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b632488), EConversationDebugInfo::Executing);
                    // You look busy. Go on through - stay alive, will you?
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_151249"));
                    DC(int64(0x51d6a9817b632488), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Afraid += 1;
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Done);
                }
                else if (G1R.Rogue03_Afraid == 2)
                {
                    DC(int64(0xca36b7793440bdb8), EConversationDebugInfo::Executing);
                    // If it ain't my knuckle-throwing friend. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_103941_2785"));
                    DC(int64(0xca36b7793440bdb8), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b632489), EConversationDebugInfo::Executing);
                    // You look busy. Go on through - stay alive, will you?
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_151249"));
                    DC(int64(0x51d6a9817b632489), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Afraid += 1;
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xca36b7793440bdbd), EConversationDebugInfo::Executing);
                    // Ah, you again. Go on through. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_103957_3286"));
                    DC(int64(0xca36b7793440bdbd), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Afraid = 0;
                    DC(int64(0xca36b7793440bdc3), EConversationDebugInfo::Done);
                }
                DC(int64(0xca36b7793440bdf1), EConversationDebugInfo::Executing);
                G1R.Rogue03_ScaredPool = FInGameTime::Now();
                DC(int64(0xca36b7793440bdf1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRogue03122249_0 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440bdfd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceRogue03122249);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"ASSAULT_ROGUE_03", 700.0f, int64(0xca36b7793440bdfd));
            default Rules.HideIfKnows(UChoiceRogue03122249_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440be00), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440bdfc), EConversationDebugInfo::Executing);
                // One of us? Go on through.
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_104908_2386"));
                DC(int64(0xca36b7793440bdfc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRogue03122249_1 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRogue03122249_0);
            default Rules.HideIfKnows(UChoiceRogue03122249_1);
            default DebugId = int64(0xca36b7793440bdfd);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51d6a9817b632460), EConversationDebugInfo::Executing);
                
                // Who-
                Hero.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_142814"));
                DC(int64(0x51d6a9817b632460), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRogue03122249 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRogue03122249_1);
            default Rules.HideIfKnows(UChoiceRogue03122249);
            default DebugId = int64(0xca36b7793440bdfd);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51d6a9817b632461), EConversationDebugInfo::Executing);
                
                // Just go on through. 
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_142816"));
                DC(int64(0x51d6a9817b632461), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRogue03122270 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be04);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceRogue03122270);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440be07), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xca36b7793440be08), G1R.Rogue03_Warning == 0);
                    DB(int64(0xca36b7793440be09), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f));
                    DB(int64(0xca36b7793440be0a), Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue03));
                    DB(int64(0xca36b7793440be0b), G1R.Rogue03_Permission != 1);
                    DB(int64(0xca36b7793440be07), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xca36b7793440be08), G1R.Rogue03_Warning == 0);
                    DB(int64(0xca36b7793440be09), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f));
                    DB(int64(0xca36b7793440be0b), G1R.Rogue03_Permission != 1);
                    DB(int64(0x75862b9098d7919a), Hero != nullptr && !Hero.WasDefeatedBy(UL_ORG_ROGUE04_1504));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R.Rogue03_Warning == 0 && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f) && Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue03) && G1R.Rogue03_Permission != 1)
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R.Rogue03_Warning == 0 && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f) && G1R.Rogue03_Permission != 1 && Hero != nullptr && !Hero.WasDefeatedBy(UL_ORG_ROGUE04_1504))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be03), EConversationDebugInfo::Executing);
                // (sigh) Here we fucking go again.
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_105232_1609"));
                DC(int64(0xca36b7793440be03), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632463), EConversationDebugInfo::Executing);
                // Stop right there blah, blah, blah, you're on New Camp ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_142947"));
                DC(int64(0x51d6a9817b632463), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632464), EConversationDebugInfo::Executing);
                // Your ore please. This is a waylay. 
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143117"));
                DC(int64(0x51d6a9817b632464), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Rogue03_133895,
                    UTopic_Rogue03_133915,
                    UTopic_Rogue03_122284,
                    UTopic_Rogue03_122304,
                    UTopic_Rogue03_122326
                );
            }
        }
        
        
        class UTopic_Rogue03_133895 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0x51d6a9817b632465);
            default Caption = LocText("TEXT_WIP_GPMSWZD_20241217_143205_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rogue03_133895);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51d6a9817b632466), EConversationDebugInfo::Executing);
                // You don't sound like you're enjoying this. 
                Hero.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143205_41"));
                DC(int64(0x51d6a9817b632466), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b63246f), EConversationDebugInfo::Executing);
                
                // Ain't you a scholar of the fucking soul. 
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143250"));
                DC(int64(0x51d6a9817b63246f), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632470), EConversationDebugInfo::Executing);
                // No, I'm NOT enjoying this. I'd much rather be down at ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143300"));
                DC(int64(0x51d6a9817b632470), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632471), EConversationDebugInfo::Executing);
                // But, alas, Lares thinks I haven't been "pulling my ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143422"));
                DC(int64(0x51d6a9817b632471), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632472), EConversationDebugInfo::Executing);
                // Like yourself. 
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143512"));
                DC(int64(0x51d6a9817b632472), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632468), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x51d6a9817b632468), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue03_133915 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0x51d6a9817b632469);
            default Caption = LocText("TEXT_WIP_GPMSWZD_20241217_143212_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rogue03_133915);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_RHHWUEL_20241204_150914_2083"), int64(0x51d6a9817b632469));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x51d6a9817b63246a), EConversationDebugInfo::Executing);
                // Great. Another one. 
                Hero.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143212_2083"));
                DC(int64(0x51d6a9817b63246a), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632473), EConversationDebugInfo::Executing);
                
                // What's that supposed to mean? 
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143709"));
                DC(int64(0x51d6a9817b632473), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632475), EConversationDebugInfo::Executing);
                
                // I already ran into your friend down at Cavalorn's hut. 
                Hero.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143716"));
                DC(int64(0x51d6a9817b632475), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632476), EConversationDebugInfo::Executing);
                
                // You mean Harlo, and he ISN'T my friend. 
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143738"));
                DC(int64(0x51d6a9817b632476), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632477), EConversationDebugInfo::Executing);
                // I'm telling you, that guy is one hell of a strange ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_143751"));
                DC(int64(0x51d6a9817b632477), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632478), EConversationDebugInfo::Executing);
                // I think his mum dropped him on his head one too many ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_144131"));
                DC(int64(0x51d6a9817b632478), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b63246c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x51d6a9817b63246c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue03_122284 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be0f);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_105951");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be1f), EConversationDebugInfo::Executing);
                // I'm not giving you anything.
                Hero.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_105951"));
                DC(int64(0xca36b7793440be1f), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be20), EConversationDebugInfo::Executing);
                
                // Had to do it the hard way, didn't you? All right. At ...
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110000"));
                DC(int64(0xca36b7793440be20), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be25), EConversationDebugInfo::Executing);
                Rogue03.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xca36b7793440be25), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be27), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE04_1504)) && ensure(IsValid(UL_ORG_ROGUE04_1504.AI))) { UL_ORG_ROGUE04_1504.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0xca36b7793440be27), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be29), EConversationDebugInfo::Executing);
                G1R.Rogue03_Robbed = FInGameTime::Now();
                DC(int64(0xca36b7793440be29), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be2b), EConversationDebugInfo::Executing);
                G1R.Rogue03_Permission = 2;
                DC(int64(0xca36b7793440be2b), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a446), EConversationDebugInfo::Executing);
                Rogue03.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0x6fb7a2362f4a446), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a448), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE04_1504))) { UL_ORG_ROGUE04_1504.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                DC(int64(0x6fb7a2362f4a448), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue03_122304 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be13);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_105617_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440be1c), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be14), EConversationDebugInfo::Executing);
                // All right. Take it. 
                Hero.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_105617_1769"));
                DC(int64(0xca36b7793440be14), EConversationDebugInfo::Done);
                DB(int64(0xca36b7793440be2d), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 25, 0));
                DB(int64(0xca36b7793440be2e), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 25, 0))
                {
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue03, UItMi_Orenugget);
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be36), EConversationDebugInfo::Executing);
                    // That's all you got? Man ... robbing you feels like ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110519_2995"));
                    DC(int64(0xca36b7793440be36), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b63247e), EConversationDebugInfo::Executing);
                    // Then again, I could never stand those yapping mongrels ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_145817"));
                    DC(int64(0x51d6a9817b63247e), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be37), EConversationDebugInfo::Executing);
                    // I'll take that. Now hop along, will ya? 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110532"));
                    DC(int64(0xca36b7793440be37), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be43), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440be43), EConversationDebugInfo::Done);
                    return;
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                {
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue03, UItMi_Orenugget);
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be39), EConversationDebugInfo::Executing);
                    // Let's see. Hm, yeah, guess that'll do. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110558_3750"));
                    DC(int64(0xca36b7793440be39), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3a), EConversationDebugInfo::Executing);
                    // (yawns) Move along then. I'm already bored of your face, ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110603"));
                    DC(int64(0xca36b7793440be3a), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b63247a), EConversationDebugInfo::Executing);
                    // Good luck and all.
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_145335"));
                    DC(int64(0x51d6a9817b63247a), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be44), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440be44), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue03, UItMi_Orenugget);
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3c), EConversationDebugInfo::Executing);
                    // Let's see. Hm, yeah, guess that'll do. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110558_3750"));
                    DC(int64(0xca36b7793440be3c), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b63247b), EConversationDebugInfo::Executing);
                    // (yawns) Move along then. I'm already bored of your face, ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110603"));
                    DC(int64(0x51d6a9817b63247b), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b63247c), EConversationDebugInfo::Executing);
                    // Good luck and all.
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_145335"));
                    DC(int64(0x51d6a9817b63247c), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be45), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440be45), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Rogue03_122326 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be17);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_105735_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440be1c), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be18), EConversationDebugInfo::Executing);
                // I don't have anything. Check if you want.
                Hero.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_105735_491"));
                DC(int64(0xca36b7793440be18), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be46), EConversationDebugInfo::Executing);
                
                // You know, I might just do that. 
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110803"));
                DC(int64(0xca36b7793440be46), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be48), EConversationDebugInfo::Executing);
                Rogue03.AI.GotoCharacter(Hero, 100.0f);
                DC(int64(0xca36b7793440be48), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be4a), EConversationDebugInfo::Executing);
                // Well, would you look at that. You told the truth. All ...
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110839_1340"));
                DC(int64(0xca36b7793440be4a), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632479), EConversationDebugInfo::Executing);
                // Next time, you better have something on you, else I'll ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_145013"));
                DC(int64(0x51d6a9817b632479), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be4c), EConversationDebugInfo::Executing);
                G1R.Rogue03_Warning = 1;
                DC(int64(0xca36b7793440be4c), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be4e), EConversationDebugInfo::Executing);
                G1R.Rogue03_Robbed = FInGameTime::Now();
                DC(int64(0xca36b7793440be4e), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be4f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xca36b7793440be4f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue03122562 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be52);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440be07), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xca36b7793440be09), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f));
                    DB(int64(0xca36b7793440be0a), Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue03));
                    DB(int64(0xca36b7793440be56), G1R.Rogue03_Robbed.IsValid() && G1R.Rogue03_Robbed.IsAtLeastXDaysAgo(1));
                    DB(int64(0xca36b7793440be07), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xca36b7793440be09), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f));
                    DB(int64(0xca36b7793440be56), G1R.Rogue03_Robbed.IsValid() && G1R.Rogue03_Robbed.IsAtLeastXDaysAgo(1));
                    DB(int64(0x75862b9098d79198), Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE04_1504));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f) && Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue03) && G1R.Rogue03_Robbed.IsValid() && G1R.Rogue03_Robbed.IsAtLeastXDaysAgo(1))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_03", 700.0f) && G1R.Rogue03_Robbed.IsValid() && G1R.Rogue03_Robbed.IsAtLeastXDaysAgo(1) && Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE04_1504))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be51), EConversationDebugInfo::Executing);
                // You again? Gods, are you into this or something? Well ...
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_111051_3719"));
                DC(int64(0xca36b7793440be51), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Rogue03_122574,
                    UTopic_Rogue03_122594,
                    UTopic_Rogue03_122620
                );
            }
        }
        
        
        class UTopic_Rogue03_122574 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be58);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_111455_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be59), EConversationDebugInfo::Executing);
                // I told you, I'm not giving you anything.
                Hero.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_111455_3902"));
                DC(int64(0xca36b7793440be59), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be67), EConversationDebugInfo::Executing);
                
                // Right, you were that stubborn bastard. Guess I'll have ...
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_112151"));
                DC(int64(0xca36b7793440be67), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be69), EConversationDebugInfo::Executing);
                G1R.Rogue03_Robbed = FInGameTime::Now();
                DC(int64(0xca36b7793440be69), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be73), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE04_1504)) && ensure(IsValid(UL_ORG_ROGUE04_1504.AI))) { UL_ORG_ROGUE04_1504.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0xca36b7793440be73), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be75), EConversationDebugInfo::Executing);
                Rogue03.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xca36b7793440be75), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be77), EConversationDebugInfo::Executing);
                G1R.Rogue03_Permission = 2;
                DC(int64(0xca36b7793440be77), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a44a), EConversationDebugInfo::Executing);
                Rogue03.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0x6fb7a2362f4a44a), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a44c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE04_1504))) { UL_ORG_ROGUE04_1504.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                DC(int64(0x6fb7a2362f4a44c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue03_122594 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be5c);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_111455_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440be1c), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be5d), EConversationDebugInfo::Executing);
                // Fine, take it.
                Hero.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_111455_292"));
                DC(int64(0xca36b7793440be5d), EConversationDebugInfo::Done);
                DB(int64(0xca36b7793440be79), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 15, 0));
                DB(int64(0xca36b7793440be7a), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 15, 0))
                {
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue03, UItMi_Orenugget);
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be82), EConversationDebugInfo::Executing);
                    // That's all? Man, I wouldn't want to be in your shoes. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_112627_1037"));
                    DC(int64(0xca36b7793440be82), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be89), EConversationDebugInfo::Executing);
                    // Anyway, guess it'll have to do. Move along. I got clouds ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_112927"));
                    DC(int64(0xca36b7793440be89), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be90), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440be90), EConversationDebugInfo::Done);
                    return;
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                {
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue03, UItMi_Orenugget);
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be84), EConversationDebugInfo::Executing);
                    // That's it? Okay, I guess that'll do. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_112632_2332"));
                    DC(int64(0xca36b7793440be84), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be88), EConversationDebugInfo::Executing);
                    // Now move along. I got clouds to count. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_112755"));
                    DC(int64(0xca36b7793440be88), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be91), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440be91), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue03, UItMi_Orenugget);
                    DC(int64(0xca36b7793440be30), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be86), EConversationDebugInfo::Executing);
                    // That's it? Okay, I guess that'll do. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_112632_2332"));
                    DC(int64(0xca36b7793440be86), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be87), EConversationDebugInfo::Executing);
                    // Now move along. I got clouds to count. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_112755"));
                    DC(int64(0xca36b7793440be87), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440be3e), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be92), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440be92), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Rogue03_122620 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440be62);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_111506_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca36b7793440be1c), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440be63), EConversationDebugInfo::Executing);
                // I don't have anything on me.
                Hero.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_111506_94"));
                DC(int64(0xca36b7793440be63), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440be93), EConversationDebugInfo::Executing);
                
                // We'll see about that. 
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_113032"));
                DC(int64(0xca36b7793440be93), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be96c), EConversationDebugInfo::Executing);
                Rogue03.AI.GotoCharacter(Hero, 100.0f);
                DC(int64(0x9c3ddd4d955be96c), EConversationDebugInfo::Done);
                DB(int64(0xca36b7793440be97), G1R.Rogue03_Warning == 1);
                
                if (G1R.Rogue03_Warning == 1)
                {
                    DC(int64(0xca36b7793440be99), EConversationDebugInfo::Executing);
                    // And he's telling the truth ... again. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_113148_3511"));
                    DC(int64(0xca36b7793440be99), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440be9a), EConversationDebugInfo::Executing);
                    // I let you off the hook before, but I'm afraid I can't do ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_113453"));
                    DC(int64(0xca36b7793440be9a), EConversationDebugInfo::Done);
                    DC(int64(0x51d6a9817b63247f), EConversationDebugInfo::Executing);
                    // Hold still, will you? Makes it easier for the two of us. 
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_150433"));
                    DC(int64(0x51d6a9817b63247f), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beae), EConversationDebugInfo::Executing);
                    Rogue03.AI.StartAttackingImmediatelyLootOnly(Hero);
                    DC(int64(0xca36b7793440beae), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beb0), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(UL_ORG_ROGUE04_1504)) && ensure(IsValid(UL_ORG_ROGUE04_1504.AI))) { UL_ORG_ROGUE04_1504.AI.StartAttackingImmediatelyLootOnly(Hero); }
                    DC(int64(0xca36b7793440beb0), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beb2), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440beb2), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beb4), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Warning = 0;
                    DC(int64(0xca36b7793440beb4), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beb6), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Permission = 2;
                    DC(int64(0xca36b7793440beb6), EConversationDebugInfo::Done);
                    DC(int64(0x6fb7a2362f4a44e), EConversationDebugInfo::Executing);
                    Rogue03.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                    DC(int64(0x6fb7a2362f4a44e), EConversationDebugInfo::Done);
                    DC(int64(0x6fb7a2362f4a450), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(UL_ORG_ROGUE04_1504))) { UL_ORG_ROGUE04_1504.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                    DC(int64(0x6fb7a2362f4a450), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beb7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440beb7), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xca36b7793440bea6), EConversationDebugInfo::Executing);
                    // Well, would you look at that. You told the truth. All ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_110839_1340"));
                    DC(int64(0xca36b7793440bea6), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440bea7), EConversationDebugInfo::Executing);
                    // Next time, you better have something on you, else I'll ...
                    Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_145013"));
                    DC(int64(0xca36b7793440bea7), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0bb), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Warning = 1;
                    DC(int64(0xcd3b8403a7fdc0bb), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beab), EConversationDebugInfo::Executing);
                    G1R.Rogue03_Robbed = FInGameTime::Now();
                    DC(int64(0xca36b7793440beab), EConversationDebugInfo::Done);
                    DC(int64(0xca36b7793440beac), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xca36b7793440beac), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceRogue03123027 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440beba);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && Hero.WasDefeatedBy(UL_ORG_ROGUE04_1504));
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && Hero.WasDefeatedBy(Rogue03));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.WasDefeatedBy(UL_ORG_ROGUE04_1504))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.WasDefeatedBy(Rogue03))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440beb9), EConversationDebugInfo::Executing);
                // Here we go. See it as an act of compassion - the next ...
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_113924_1246"));
                DC(int64(0xca36b7793440beb9), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632480), EConversationDebugInfo::Executing);
                // If you ever come here again, bring some ore. And now get ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_150740"));
                DC(int64(0x51d6a9817b632480), EConversationDebugInfo::Done);
                DC(int64(0xc650c95da6d348db), EConversationDebugInfo::Executing);
                G1R.Rogue03_Permission = 0;
                DC(int64(0xc650c95da6d348db), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440bec0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xca36b7793440bec0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue03123063 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440bec3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceRogue03123063);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && Hero.HasRecentlyDefeated(Rogue03));
                    DB(int64(0x75862b9098d79196), Hero != nullptr && Hero.HasRecentlyDefeated(UL_ORG_ROGUE04_1504));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue03))
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE04_1504))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440bec2), EConversationDebugInfo::Executing);
                // I ... you ... you beat me.
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_114050_3346"));
                DC(int64(0xca36b7793440bec2), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632481), EConversationDebugInfo::Executing);
                
                // Will you let me through now?
                Hero.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_150822"));
                DC(int64(0x51d6a9817b632481), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632482), EConversationDebugInfo::Executing);
                
                // Are you joking? Of course I will!
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_150924"));
                DC(int64(0x51d6a9817b632482), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632483), EConversationDebugInfo::Executing);
                // This was the most fun I've had in years. We should do ...
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_150933"));
                DC(int64(0x51d6a9817b632483), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632484), EConversationDebugInfo::Executing);
                // (exhales in pleasure) What a beautiful day. 
                Rogue03.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_151013"));
                DC(int64(0x51d6a9817b632484), EConversationDebugInfo::Done);
                DC(int64(0x51d6a9817b632485), EConversationDebugInfo::Executing);
                
                // Um. Okay. 
                Hero.AI.Say(LocText("TEXT_WIP_GPMSWZD_20241217_151057"));
                DC(int64(0x51d6a9817b632485), EConversationDebugInfo::Done);
                DC(int64(0xb9cddcabed289784), EConversationDebugInfo::Executing);
                Rogue03.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Rogue03_1503_Beaten);
                DC(int64(0xb9cddcabed289784), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440beca), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE04_1504))) { UL_ORG_ROGUE04_1504.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Rogue04_1504_Beaten); }
                DC(int64(0xca36b7793440beca), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440becc), EConversationDebugInfo::Executing);
                G1R.Rogue03_Permission = 1;
                DC(int64(0xca36b7793440becc), EConversationDebugInfo::Done);
                DC(int64(0xca36b7793440becd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xca36b7793440becd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue03123099 : UTopic_Hero__UL_ORG_ROGUE03_1503
        {
            default DebugId = int64(0xca36b7793440bed0);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceRogue03123099);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_YJSDKDL_20241212_114050_3346"), int64(0xca36b7793440bed0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e53924048a86ff7), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x1e53924048a86ff8), G1R.Rogue03_Permission != 1);
                    DB(int64(0x1e53924048a86ff9), G1R.Rogue03_Robbed.IsValid() && G1R.Rogue03_Robbed.IsTimeInThePast());
                    DB(int64(0x1e53924048a86fff), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.Rogue03_Permission == 1)
                    return false;
                
                if (G1R.Rogue03_Robbed.IsValid() && !G1R.Rogue03_Robbed.IsTimeInThePast())
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca36b7793440becf), EConversationDebugInfo::Executing);
                // What? I said move along. 
                Rogue03.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_114400_3528"));
                DC(int64(0xca36b7793440becf), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */