#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_ORRY_254 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_ORRY_254";
        }
        
        
        class UTopic_OC_STT_DIEGO__OC_GRD_ORRY_254 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_ORRY_254";
            default WithCharacter = n"OC_STT_DIEGO";
            
            AGothicCharacterState GetOrry() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
        }
        
        
        class UTopic_Hero__OC_GRD_ORRY_254 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_ORRY_254";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetOrry() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
        }
        
        
        class UChoiceOrry105679 : UTopic_OC_STT_DIEGO__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa6782d202c632544);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceOrry105679);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6782d202c63255d), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa6782d202c63253f), EConversationDebugInfo::Executing);
                // Headin' back?
                Orry.AI.Say(LocText("TEXT_WIP_YNIYVHG_20241018_131553_41"));
                DC(int64(0xa6782d202c63253f), EConversationDebugInfo::Done);
                DC(int64(0xa6782d202c632547), EConversationDebugInfo::Executing);
                
                // Yeah.
                Diego.AI.Say(LocText("TEXT_WIP_YNIYVHG_20241018_131605"));
                DC(int64(0xa6782d202c632547), EConversationDebugInfo::Done);
                DC(int64(0xa6782d202c632548), EConversationDebugInfo::Executing);
                
                // Travel safe.
                Orry.AI.Say(LocText("TEXT_WIP_YNIYVHG_20241018_131608"));
                DC(int64(0xa6782d202c632548), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrry106370 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xd1de52aad05588c);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceOrry106370);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd1de52aad055894), Hero != nullptr && Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItKe_AbandonedMine_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1de52aad055887), EConversationDebugInfo::Executing);
                // Piss off!
                Orry.AI.Say(LocText("TEXT_WIP_QACNPYL_20241023_115106_41"));
                DC(int64(0xd1de52aad055887), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrry322291 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e6f15);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_151106");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrry84444);
            default Rules.HideIfKnows(UChoiceOrry322291);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QGRCRRE_20240903_155330_3286"), int64(0x626b7fdd392e6f15));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2ef80b71b5a9b13), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392e6f10), EConversationDebugInfo::Executing);
                
                // I don't have time for this. Let me in, or I'll make you.
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_151106"));
                DC(int64(0x626b7fdd392e6f10), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392e6f11), EConversationDebugInfo::Executing);
                
                // Big words. Sure you wanna go down that route?
                Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_151106_2083"));
                DC(int64(0x626b7fdd392e6f11), EConversationDebugInfo::Done);
                DC(int64(0xd96d67c034aaf55), EConversationDebugInfo::Executing);
                
                // Let's get this over with.
                Hero.AI.Say(LocText("TEXT_WIP_XUYSPUL_20240925_140734"));
                DC(int64(0xd96d67c034aaf55), EConversationDebugInfo::Done);
                DC(int64(0xd96d67c034aaf56), EConversationDebugInfo::Executing);
                
                // Shame. I was just startin' to like you ...
                Orry.AI.Say(LocText("TEXT_WIP_XUYSPUL_20240925_140743"));
                DC(int64(0xd96d67c034aaf56), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392e6f2b), EConversationDebugInfo::Executing);
                Orry.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x626b7fdd392e6f2b), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392e6f32), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x626b7fdd392e6f32), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrry323306 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e6f3e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceOrry323306);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd96d67c034aaf6c), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                    DB(int64(0xd96d67c034aaf71), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_XUYSPUL_20240925_140743")));
                    DB(int64(0xd96d67c034aaf72), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x15a7fd7cded127c0), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x626b7fdd392e6f41), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                    DB(int64(0xa46e7634d49bce70), Hero != nullptr && Hero.HasDefeated(Orry));
                    DB(int64(0xa46e7634d49bce7a), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x15a7fd7cded127c1), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0xa46e7634d49bce73), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                    DB(int64(0xa46e7634d49bce78), Orry != nullptr && Orry.HasDefeated(Hero));
                    DB(int64(0xa46e7634d49bce79), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x15a7fd7cded127c2), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_XUYSPUL_20240925_140743")) && Hero != nullptr && Hero.IsInConversation() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return true;
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0) && Hero != nullptr && Hero.HasDefeated(Orry) && Hero != nullptr && Hero.IsInConversation() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return true;
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0) && Orry != nullptr && Orry.HasDefeated(Hero) && Hero != nullptr && Hero.IsInConversation() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392e6f3a), EConversationDebugInfo::Executing);
                // Are you serious?
                Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_155330_3286"));
                DC(int64(0x626b7fdd392e6f3a), EConversationDebugInfo::Done);
                DB(int64(0x626b7fdd392e7004), Hero != nullptr && Hero.HasDefeated(Orry));
                
                if (Hero != nullptr && Hero.HasDefeated(Orry))
                {
                    DC(int64(0x626b7fdd392e700c), EConversationDebugInfo::Executing);
                    // Whatever. Here. Take the fuckin' key and leave me alone.
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_161641_2386"));
                    DC(int64(0x626b7fdd392e700c), EConversationDebugInfo::Done);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                    Orry.AddItemToInventory(UItKe_AbandonedMine_01, 1);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                    DC(int64(0x626b7fdd392e7014), EConversationDebugInfo::Executing);
                    Orry.AI.GiveItemTo(Hero, UItKe_AbandonedMine_01, 1);
                    DC(int64(0x626b7fdd392e7014), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_323306_exit_1");
                    DC(int64(0x626b7fdd392e7025), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x626b7fdd392e7025), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x626b7fdd392e701f), EConversationDebugInfo::Executing);
                    // You really didn't think that'd work, did you?
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_165443_3984"));
                    DC(int64(0x626b7fdd392e701f), EConversationDebugInfo::Done);
                    DC(int64(0x626b7fdd392e701e), EConversationDebugInfo::Executing);
                    
                    // I REALLY need to get into that mine.
                    Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_165443"));
                    DC(int64(0x626b7fdd392e701e), EConversationDebugInfo::Done);
                    DC(int64(0x626b7fdd392e707b), EConversationDebugInfo::Executing);
                    
                    // And I REALLY don't give a shit. 
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_172913"));
                    DC(int64(0x626b7fdd392e707b), EConversationDebugInfo::Done);
                    DC(int64(0x626b7fdd392e702b), EConversationDebugInfo::Executing);
                    // How's this: four hundred nuggs and we'll forget about ...
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_165940"));
                    DC(int64(0x626b7fdd392e702b), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Orry_325783,
                        UTopic_Orry_325803
                    );
                }
            }
        }
        
        
        class UTopic_Orry_325783 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e7082);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_173124_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Orry_325783);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392e7083), EConversationDebugInfo::Executing);
                // Fine.
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173124_1769"));
                DC(int64(0x626b7fdd392e7083), EConversationDebugInfo::Done);
                DB(int64(0x626b7fdd392e702e), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 400, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 400, 0))
                {
                    DC(int64(0xa46e7634d49bce90), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Orry, UItMi_Orenugget, 400);
                    DC(int64(0xa46e7634d49bce90), EConversationDebugInfo::Done);
                    DC(int64(0x626b7fdd392e704d), EConversationDebugInfo::Executing);
                    // Looks good.
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_170706"));
                    DC(int64(0x626b7fdd392e704d), EConversationDebugInfo::Done);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                    Orry.AddItemToInventory(UItKe_AbandonedMine_01, 1);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                    DC(int64(0xa46e7634d49bcef7), EConversationDebugInfo::Executing);
                    Orry.AI.GiveItemTo(Hero, UItKe_AbandonedMine_01, 1);
                    DC(int64(0xa46e7634d49bcef7), EConversationDebugInfo::Done);
                    DC(int64(0x626b7fdd392e70ce), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x626b7fdd392e70ce), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x626b7fdd392e7054), EConversationDebugInfo::Executing);
                    // That's not four hundred. No nuggs, no entry.
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_170905"));
                    DC(int64(0x626b7fdd392e7054), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Orry_325803 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e7086);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_173124_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Orry_325803);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392e7087), EConversationDebugInfo::Executing);
                // No.
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173124_2995"));
                DC(int64(0x626b7fdd392e7087), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392e7099), EConversationDebugInfo::Executing);
                
                // Well, then. Your choice.
                Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173304"));
                DC(int64(0x626b7fdd392e7099), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrry325545 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e7064);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_171954");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Orry_325783);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Orry_325783);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Orry_325958);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QGRCRRE_20240903_170706"), int64(0x626b7fdd392e7064));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd96d67c034aaf8f), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392e705c), EConversationDebugInfo::Executing);
                
                // I got your four hundred nuggs.
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_171954"));
                DC(int64(0x626b7fdd392e705c), EConversationDebugInfo::Done);
                DB(int64(0xa46e7634d49bcecf), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 400, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 400, 0))
                {
                    DC(int64(0xa46e7634d49bcee7), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Orry, UItMi_Orenugget, 400);
                    DC(int64(0xa46e7634d49bcee7), EConversationDebugInfo::Done);
                    DC(int64(0xa46e7634d49bcf05), EConversationDebugInfo::Executing);
                    // Looks good.
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_170706"));
                    DC(int64(0xa46e7634d49bcf05), EConversationDebugInfo::Done);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                    Orry.AddItemToInventory(UItKe_AbandonedMine_01, 1);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                    DC(int64(0xa46e7634d49bcf0d), EConversationDebugInfo::Executing);
                    Orry.AI.GiveItemTo(Hero, UItKe_AbandonedMine_01, 1);
                    DC(int64(0xa46e7634d49bcf0d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_325545_exit_1");
                    DC(int64(0xa46e7634d49bcf14), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa46e7634d49bcf14), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xa46e7634d49bcedb), EConversationDebugInfo::Executing);
                    // That's not four hundred. No nuggs, no entry.
                    Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_170905"));
                    DC(int64(0xa46e7634d49bcedb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_325545_exit_2");
                }
            }
        }
        
        
        class UChoiceOrry325898 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e70a5);
            default Caption = LocText("GVL_G1R_VOICE01_HERO_PLAYERCONVERSATIONREQUESTHEYWAITASECOND_3");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Orry_325803);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QGRCRRE_20240903_173603_2316"), int64(0x626b7fdd392e70a5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd96d67c034aaf90), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49538fb90606e97e), EConversationDebugInfo::Executing);
                // Hold on.
                Hero.AI.Say(LocText("GVL_G1R_VOICE01_HERO_PLAYERCONVERSATIONREQUESTHEYWAITASECOND_3"));
                DC(int64(0x49538fb90606e97e), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392e70a0), EConversationDebugInfo::Executing);
                
                // What do you want?
                Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173509_3750"));
                DC(int64(0x626b7fdd392e70a0), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Orry_325938,
                    UTopic_Orry_325958
                );
            }
        }
        
        
        class UTopic_Orry_325938 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e70a8);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_173603_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392e70a9), EConversationDebugInfo::Executing);
                // Nothing.
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173603_1340"));
                DC(int64(0x626b7fdd392e70a9), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392e70b4), EConversationDebugInfo::Executing);
                
                // (sighs)
                Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173618"));
                DC(int64(0x626b7fdd392e70b4), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392e70b9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x626b7fdd392e70b9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Orry_325958 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x626b7fdd392e70ac);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_173603_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Orry_325958);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x626b7fdd392e70ad), EConversationDebugInfo::Executing);
                // I changed my mind.
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173603_2316"));
                DC(int64(0x626b7fdd392e70ad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrry84444 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xf2a42eb10820c6fc);
            default Caption = LocText("TEXT_WIP_MPTVPFF_20240313_124515");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceOrry84444);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QGRCRRE_20240903_155330_3286"), int64(0xf2a42eb10820c6fc));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c700), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2a42eb10820c6fa), EConversationDebugInfo::Executing);
                // Do you know how to get into the old mine back there?
                Hero.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_124515"));
                DC(int64(0xf2a42eb10820c6fa), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c6fb), EConversationDebugInfo::Executing);
                
                // Again? What's the matter with you lot? That place's ...
                Orry.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_124515_41"));
                DC(int64(0xf2a42eb10820c6fb), EConversationDebugInfo::Done);
                DC(int64(0xe97381e4c9b1f10f), EConversationDebugInfo::Executing);
                // Wait a bloody minute. I know you. You're that freshie ...
                Orry.AI.Say(LocText("TEXT_WIP_FSZXZLE_20240829_185237"));
                DC(int64(0xe97381e4c9b1f10f), EConversationDebugInfo::Done);
                DB(int64(0xf0139c8274805ac6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                DB(int64(0xf0139c8274805acf), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0xf0139c8274805ad1), EConversationDebugInfo::Executing);
                    // I see you're with those rice-eatin' cutthroats now. ...
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_152400_41"));
                    DC(int64(0xf0139c8274805ad1), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805ad8), EConversationDebugInfo::Executing);
                    // Especially after that convoy raid you guys pulled off ...
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_152741"));
                    DC(int64(0xf0139c8274805ad8), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805ad5), EConversationDebugInfo::Executing);
                    
                    // Don't worry, I'm not here to fight. 
                    Hero.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_152717"));
                    DC(int64(0xf0139c8274805ad5), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805ad9), EConversationDebugInfo::Executing);
                    
                    // Good to hear. Still, mine's off limits.
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_152830"));
                    DC(int64(0xf0139c8274805ad9), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_84444_exit_1");
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0xf0139c8274805adb), EConversationDebugInfo::Executing);
                    // Jackal told me you managed to get into the Shadows. 
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_152927_2238"));
                    DC(int64(0xf0139c8274805adb), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805ae0), EConversationDebugInfo::Executing);
                    // Not bad - can't think of anyone who made it this quick. 
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_153449"));
                    DC(int64(0xf0139c8274805ae0), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805ae1), EConversationDebugInfo::Executing);
                    // Still, mine's off limits.
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_153503"));
                    DC(int64(0xf0139c8274805ae1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_84444_exit_2");
                }
                else
                {
                    DC(int64(0xf0139c8274805ae3), EConversationDebugInfo::Executing);
                    // I see you joined up with the Loons. You really believe ...
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_153513_1924"));
                    DC(int64(0xf0139c8274805ae3), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805ae9), EConversationDebugInfo::Executing);
                    // That "the Sleeper" will spring you out of here?
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_153535"));
                    DC(int64(0xf0139c8274805ae9), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805aea), EConversationDebugInfo::Executing);
                    
                    // We'll see. 
                    Hero.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_153603"));
                    DC(int64(0xf0139c8274805aea), EConversationDebugInfo::Done);
                    DC(int64(0xf0139c8274805aeb), EConversationDebugInfo::Executing);
                    
                    // Good to hear. Still, mine's off limits.
                    Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_153605"));
                    DC(int64(0xf0139c8274805aeb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_84444_exit_2");
                }
            }
        }
        
        
        class UChoiceOrry85241 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xf2a42eb10820c722);
            default Caption = LocText("TEXT_WIP_MPTVPFF_20240313_131556_2238");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrry84444);
            default Rules.HideIfKnows(UChoiceOrry85241);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QGRCRRE_20240903_155330_3286"), int64(0xf2a42eb10820c722));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c720), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                    DB(int64(0xf2ef80b71b5a9aff), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && !Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItKe_AbandonedMine_01, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2a42eb10820c70c), EConversationDebugInfo::Executing);
                // It's official business. I'm investigating something for ...
                Hero.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_131556_2238"));
                DC(int64(0xf2a42eb10820c70c), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c72a), EConversationDebugInfo::Executing);
                
                // Investigatin', eh? Fine, then.
                Orry.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_144132"));
                DC(int64(0xf2a42eb10820c72a), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Orry.AddItemToInventory(UItKe_AbandonedMine_01, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c72c), EConversationDebugInfo::Executing);
                Orry.AI.GiveItemTo(Hero, UItKe_AbandonedMine_01, 1);
                DC(int64(0xf2a42eb10820c72c), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c738), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf2a42eb10820c738), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrry85244 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xf2a42eb10820c724);
            default Caption = LocText("TEXT_WIP_MPTVPFF_20240313_131556_2785");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrry84444);
            default Rules.HideIfKnows(UChoiceOrry85244);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8603ca974799ef77), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2a42eb10820c710), EConversationDebugInfo::Executing);
                // You said "what's the matter with you lot." Did anyone ...
                Hero.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_131556_2785"));
                DC(int64(0xf2a42eb10820c710), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c713), EConversationDebugInfo::Executing);
                
                // Yeah, one of 'em cultists. A novice. Looked like he'd ...
                Orry.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_141221"));
                DC(int64(0xf2a42eb10820c713), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f3f), EConversationDebugInfo::Executing);
                
                // What did he say?
                Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_003300"));
                DC(int64(0xac160bfd93ad0f3f), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f40), EConversationDebugInfo::Executing);
                
                // Just that "the Sleeper called to him" or some twaddle ...
                Orry.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_003307"));
                DC(int64(0xac160bfd93ad0f40), EConversationDebugInfo::Done);
                DC(int64(0xf0139c8274805aed), EConversationDebugInfo::Executing);
                // But, hey, that stays between us, all right? If more ...
                Orry.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_155030"));
                DC(int64(0xf0139c8274805aed), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f43), EConversationDebugInfo::Executing);
                
                // He's still in there?
                Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_003742"));
                DC(int64(0xac160bfd93ad0f43), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f42), EConversationDebugInfo::Executing);
                
                // Unless he snuck out while I was takin' a piss, yeah. 
                Orry.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_003501"));
                DC(int64(0xac160bfd93ad0f42), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrry85247 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xf2a42eb10820c726);
            default Caption = LocText("TEXT_WIP_MPTVPFF_20240313_143034_3436");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrry84444);
            default Rules.HideIfKnows(UChoiceOrry85247);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QGRCRRE_20240903_155330_3286"), int64(0xf2a42eb10820c726));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c71e), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                    DB(int64(0xf2ef80b71b5a9b04), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Joint_03, 1, 0))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItKe_AbandonedMine_01, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2a42eb10820c715), EConversationDebugInfo::Executing);
                
                // Will a roll of swampweed do?
                Hero.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_143034_3436"));
                DC(int64(0xf2a42eb10820c715), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f3d), EConversationDebugInfo::Executing);
                
                // No. 
                Orry.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_002916"));
                DC(int64(0xac160bfd93ad0f3d), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f3e), EConversationDebugInfo::Executing);
                
                // This one's laced with dreamjuice, though. The crawler ...
                Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_002939"));
                DC(int64(0xac160bfd93ad0f3e), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c718), EConversationDebugInfo::Executing);
                
                // Hmm ... heard about that. All right, deal.
                Orry.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_143103"));
                DC(int64(0xf2a42eb10820c718), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c72e), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Orry, UItMi_Joint_03, 1);
                DC(int64(0xf2a42eb10820c72e), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c72c), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItKe_AbandonedMine_01, 1);
                DC(int64(0xf2a42eb10820c72c), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c738), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf2a42eb10820c738), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrry85250 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xf2a42eb10820c728);
            default Caption = LocText("TEXT_WIP_MPTVPFF_20240313_143134_3286");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrry84444);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QGRCRRE_20240903_155330_3286"), int64(0xf2a42eb10820c728));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2ef80b71b5a9b09), Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_AbandonedMine_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2a42eb10820c71a), EConversationDebugInfo::Executing);
                // Are a handful of nuggs a good enough reason? 
                Hero.AI.Say(LocText("TEXT_WIP_MPTVPFF_20240313_143134_3286"));
                DC(int64(0xf2a42eb10820c71a), EConversationDebugInfo::Done);
                DC(int64(0xe97381e4c9b1f10e), EConversationDebugInfo::Executing);
                
                // Make it two hundred and we're in business. 
                Orry.AI.Say(LocText("TEXT_WIP_FSZXZLE_20240829_184505"));
                DC(int64(0xe97381e4c9b1f10e), EConversationDebugInfo::Done);
                DB(int64(0xf2a42eb10820c730), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 200, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 200, 0))
                {
                    Subdialog(
                        UTopic_Orry_109306,
                        UTopic_Orry_109326
                    );
                }
            }
        }
        
        
        class UTopic_Orry_109306 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x5cc417ef3d9f37fc);
            default Caption = LocText("TEXT_WIP_XUYSPUL_20240925_121536_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Orry_109306);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5cc417ef3d9f37fd), EConversationDebugInfo::Executing);
                // Here you go. 
                Hero.AI.Say(LocText("TEXT_WIP_XUYSPUL_20240925_121536_41"));
                DC(int64(0x5cc417ef3d9f37fd), EConversationDebugInfo::Done);
                DC(int64(0x5cc417ef3d9f3808), EConversationDebugInfo::Executing);
                
                // It can be so simple.
                Orry.AI.Say(LocText("TEXT_WIP_XUYSPUL_20240925_121547"));
                DC(int64(0x5cc417ef3d9f3808), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c735), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Orry, UItMi_Orenugget, 200);
                DC(int64(0xf2a42eb10820c735), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c72c), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItKe_AbandonedMine_01, 1);
                DC(int64(0xf2a42eb10820c72c), EConversationDebugInfo::Done);
                DC(int64(0xf2a42eb10820c738), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf2a42eb10820c738), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Orry_109326 : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0x5cc417ef3d9f3800);
            default Caption = LocText("TEXT_WIP_QGRCRRE_20240903_173124_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5cc417ef3d9f3801), EConversationDebugInfo::Executing);
                // No.
                Hero.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173124_2995"));
                DC(int64(0x5cc417ef3d9f3801), EConversationDebugInfo::Done);
                DC(int64(0x5cc417ef3d9f3816), EConversationDebugInfo::Executing);
                
                // Well, then. Your choice.
                Orry.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_173304"));
                DC(int64(0x5cc417ef3d9f3816), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrryGuardgate : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa488a0413aa983bd);
            default Caption = LocText("DIA_ORRY_GUARDGATE_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceOrryGuardgate);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa488a0413aa983be), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983bf), EConversationDebugInfo::Executing);
                
                // What's your job? 
                Hero.AI.Say(LocText("DIA_ORRY_GUARDGATE_15_00"));
                DC(int64(0xa488a0413aa983bf), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983c0), EConversationDebugInfo::Executing);
                
                // Keepin' out the unwanted guests from the exchange zone. ...
                Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_06_01"));
                DC(int64(0xa488a0413aa983c0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_ORRY, Document::UDocumentSegment_Glossary_OC_GRD_ORRY_Introduction);
                DB(int64(0x35a78e9a06abba30), G1R.Diego_Welcome.IsValid() && G1R.Diego_Welcome.IsLessThanXDaysAgo(1));
                
                if (G1R.Diego_Welcome.IsValid() && G1R.Diego_Welcome.IsLessThanXDaysAgo(1))
                {
                    DC(int64(0xa488a0413aa983c1), EConversationDebugInfo::Executing);
                    // You're the freshie they tossed in this mornin', ain't ...
                    Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_06_02"));
                    DC(int64(0xa488a0413aa983c1), EConversationDebugInfo::Done);
                    DC(int64(0xa488a0413aa983c2), EConversationDebugInfo::Executing);
                    
                    // Guess I am.
                    Hero.AI.Say(LocText("DIA_ORRY_GUARDGATE_15_03"));
                    DC(int64(0xa488a0413aa983c2), EConversationDebugInfo::Done);
                    DC(int64(0xa488a0413aa983c3), EConversationDebugInfo::Executing);
                    
                    // Then here's some friendly advice for you: watch out for ...
                    Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_06_04"));
                    DC(int64(0xa488a0413aa983c3), EConversationDebugInfo::Done);
                }
                DC(int64(0xa488a0413aa983c4), EConversationDebugInfo::Executing);
                // I'm with the Old Camp ... like all of us here at the ...
                Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_06_05"));
                DC(int64(0xa488a0413aa983c4), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983c5), EConversationDebugInfo::Executing);
                // Diego already gave you the rundown?
                Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_06_06"));
                DC(int64(0xa488a0413aa983c5), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceOrryGuardgateNo,
                    UChoiceOrryGuardgateYes
                );
            }
        }
        
        
        class UChoiceOrryGuardgateNo : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xe8603e87342bd689);
            default Caption = LocText("DIA_ORRY_GUARDGATE_NO_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983c8), EConversationDebugInfo::Executing);
                // No.
                Hero.AI.Say(LocText("DIA_ORRY_GUARDGATE_NO_15_00"));
                DC(int64(0xa488a0413aa983c8), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983c9), EConversationDebugInfo::Executing);
                
                // Then go talk to him. He takes care of the freshies. 
                Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_NO_06_01"));
                DC(int64(0xa488a0413aa983c9), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983ca), EConversationDebugInfo::Executing);
                // He knows everyone and everythin', and if you ask nice, ...
                Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_NO_06_02"));
                DC(int64(0xa488a0413aa983ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrryGuardgateYes : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xe8603e87342bd68e);
            default Caption = LocText("DIA_ORRY_GUARDGATE_YES_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983cc), EConversationDebugInfo::Executing);
                
                // He has.
                Hero.AI.Say(LocText("DIA_ORRY_GUARDGATE_YES_15_00"));
                DC(int64(0xa488a0413aa983cc), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983cd), EConversationDebugInfo::Executing);
                
                // Good. Then I guess he filled you in. 
                Orry.AI.Say(LocText("DIA_ORRY_GUARDGATE_YES_06_01"));
                DC(int64(0xa488a0413aa983cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrryNewcamp : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa488a0413aa983ce);
            default Caption = LocText("DIA_ORRY_NEWCAMP_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrryGuardgate);
            default Rules.HideIfKnows(UChoiceOrryNewcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa488a0413aa983be), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983cf), EConversationDebugInfo::Executing);
                
                // What's so bad about this "New Camp"?
                Hero.AI.Say(LocText("DIA_ORRY_NEWCAMP_15_00"));
                DC(int64(0xa488a0413aa983cf), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983d0), EConversationDebugInfo::Executing);
                
                // It's chaos, that's what. It's every man out for himself ...
                Orry.AI.Say(LocText("DIA_ORRY_NEWCAMP_06_01"));
                DC(int64(0xa488a0413aa983d0), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983d1), EConversationDebugInfo::Executing);
                // Since we control the Exchange Zone, the New Campers also ...
                Orry.AI.Say(LocText("DIA_ORRY_NEWCAMP_06_02"));
                DC(int64(0xa488a0413aa983d1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrryOldcamp : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa488a0413aa983d2);
            default Caption = LocText("DIA_ORRY_OLDCAMP_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrryShore);
            default Rules.HideIfKnows(UChoiceOrryOldcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa488a0413aa983be), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983d3), EConversationDebugInfo::Executing);
                
                // Any advice you can give me about the Old Camp?
                Hero.AI.Say(LocText("DIA_ORRY_OLDCAMP_15_00"));
                DC(int64(0xa488a0413aa983d3), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983d4), EConversationDebugInfo::Executing);
                
                // Well, don't piss off the ore barons, that's a good ...
                Orry.AI.Say(LocText("DIA_ORRY_OLDCAMP_06_01"));
                DC(int64(0xa488a0413aa983d4), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983d5), EConversationDebugInfo::Executing);
                // At the end of the day, just think hard about who you're ...
                Orry.AI.Say(LocText("DIA_ORRY_OLDCAMP_06_02"));
                DC(int64(0xa488a0413aa983d5), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465a3), EConversationDebugInfo::Executing);
                // If you want any respect round here, you gotta be a ...
                Orry.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_144100"));
                DC(int64(0x468f6c0cda6465a3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrryPreexit : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa488a0413aa983b8);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xd65cfdd291e4711), G1R != nullptr && !G1R.HasReachedChapter(2));
                DB(int64(0xd65cfdd291e472f), Hero != nullptr && Hero.HasItem(UItKe_AbandonedMine_01, 1, 0));
                DB(int64(0xd65cfdd291e4737), G1R != nullptr && G1R.IsInChapter(2));
                DB(int64(0xd65cfdd291e4739), Hero != nullptr && Hero.HasDefeated(Orry));
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                {
                    DC(int64(0xd65cfdd291e4721), EConversationDebugInfo::Executing);
                    // Make sure you get to the camp safely.
                    Orry.AI.Say(LocText("DIA_ORRY_PREEXIT_06_00"));
                    DC(int64(0xd65cfdd291e4721), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_preexit_exit_1");
                    DC(int64(0xd65cfdd291e4728), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd65cfdd291e4728), EConversationDebugInfo::Done);
                    return;
                }
                else if (Hero != nullptr && Hero.HasItem(UItKe_AbandonedMine_01, 1, 0) && G1R != nullptr && G1R.IsInChapter(2) && Hero != nullptr && Hero.HasDefeated(Orry))
                {
                    DC(int64(0xd65cfdd291e473b), EConversationDebugInfo::Executing);
                    // Piss off!
                    Orry.AI.Say(LocText("TEXT_WIP_QACNPYL_20241023_115106_41"));
                    DC(int64(0xd65cfdd291e473b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_preexit_exit_2");
                    DC(int64(0xd65cfdd291e4743), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd65cfdd291e4743), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xd65cfdd291e4717), EConversationDebugInfo::Executing);
                    // Travel safe.
                    Orry.AI.Say(LocText("TEXT_WIP_YNIYVHG_20241018_131608"));
                    DC(int64(0xd65cfdd291e4717), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orry_preexit_exit_3");
                    DC(int64(0xa488a0413aa983ba), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa488a0413aa983ba), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceOrryShore : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa488a0413aa983d6);
            default Caption = LocText("DIA_ORRY_SHORE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrryGuardgate);
            default Rules.HideIfKnows(UChoiceOrryShore);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa488a0413aa983be), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983d7), EConversationDebugInfo::Executing);
                // A couple of guys beat me up when I got out of the water. ...
                Hero.AI.Say(LocText("DIA_ORRY_SHORE_15_00"));
                DC(int64(0xa488a0413aa983d7), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983d8), EConversationDebugInfo::Executing);
                
                // Yeah, fate of every freshie. They call it "the ...
                Orry.AI.Say(LocText("DIA_ORRY_SHORE_06_01"));
                DC(int64(0xa488a0413aa983d8), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983d9), EConversationDebugInfo::Executing);
                
                // Are all of you Old Campers this friendly?
                Hero.AI.Say(LocText("DIA_ORRY_SHORE_15_02"));
                DC(int64(0xa488a0413aa983d9), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983da), EConversationDebugInfo::Executing);
                
                // There's bastards, I'll give you that. But just pay your ...
                Orry.AI.Say(LocText("DIA_ORRY_SHORE_06_03"));
                DC(int64(0xa488a0413aa983da), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrryWaffe : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa488a0413aa983e1);
            default Caption = LocText("DIA_ORRY_WAFFE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrryGuardgate);
            default Rules.HideIfKnows(UChoiceOrryWaffe);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa488a0413aa983be), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983e2), EConversationDebugInfo::Executing);
                
                // Any idea where I can find a weapon?
                Hero.AI.Say(LocText("DIA_ORRY_WAFFE_15_00"));
                DC(int64(0xa488a0413aa983e2), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983e3), EConversationDebugInfo::Executing);
                
                // Hmm ... maybe try the abandoned mine farther down the ...
                Orry.AI.Say(LocText("DIA_ORRY_WAFFE_06_01"));
                DC(int64(0xa488a0413aa983e3), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983e4), EConversationDebugInfo::Executing);
                // Don't settle for the first pickaxe you can find, though ...
                Orry.AI.Say(LocText("DIA_ORRY_WAFFE_06_02"));
                DC(int64(0xa488a0413aa983e4), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983e5), EConversationDebugInfo::Executing);
                // Use them as a last resort.
                Orry.AI.Say(LocText("DIA_ORRY_WAFFE_06_03"));
                DC(int64(0xa488a0413aa983e5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_ORRY, Document::UDocumentSegment_Glossary_OC_GRD_ORRY_Weapon);
            }
        }
        
        
        class UChoiceOrryWoman : UTopic_Hero__OC_GRD_ORRY_254
        {
            default DebugId = int64(0xa488a0413aa983db);
            default Caption = LocText("DIA_ORRY_WOMAN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrryGuardgate);
            default Rules.HideIfKnows(UChoiceOrryWoman);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa488a0413aa983be), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa488a0413aa983dc), EConversationDebugInfo::Executing);
                // I saw a woman come in with the goods before they threw ...
                Hero.AI.Say(LocText("DIA_ORRY_WOMAN_15_00"));
                DC(int64(0xa488a0413aa983dc), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983dd), EConversationDebugInfo::Executing);
                
                // Let's put it this way: the ore barons get what they ask ...
                Orry.AI.Say(LocText("DIA_ORRY_WOMAN_06_01"));
                DC(int64(0xa488a0413aa983dd), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983de), EConversationDebugInfo::Executing);
                
                // So the king trades women for ore?
                Hero.AI.Say(LocText("DIA_ORRY_WOMAN_15_02"));
                DC(int64(0xa488a0413aa983de), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983df), EConversationDebugInfo::Executing);
                
                // Well, they're all convicts just like us, but yeah, he ...
                Orry.AI.Say(LocText("DIA_ORRY_WOMAN_06_03"));
                DC(int64(0xa488a0413aa983df), EConversationDebugInfo::Done);
                DC(int64(0xa488a0413aa983e0), EConversationDebugInfo::Executing);
                // It ain't as bad as it looks, though. The girls have an ...
                Orry.AI.Say(LocText("DIA_ORRY_WOMAN_06_04"));
                DC(int64(0xa488a0413aa983e0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_ORRY, Document::UDocumentSegment_Glossary_OC_GRD_ORRY_Velaya);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */