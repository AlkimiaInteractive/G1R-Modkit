#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_XT_DMB_XARDAS_404 : UConversationCharacterSettings
        {
            default ForCharacter = n"XT_DMB_XARDAS_404";
        }
        
        
        class UTopic_Hero__XT_DMB_XARDAS_404 : UG1RDialogTopic
        {
            default ForCharacter = n"XT_DMB_XARDAS_404";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetXardas() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE22_837() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE22_837");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE23_838() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE23_838");
            }
            
            AGothicCharacterState GetWolf() const property
            {
                return GetCharacter(n"NC_ORG_WOLF_855");
            }
            
            AGothicCharacterState GetCord() const property
            {
                return GetCharacter(n"NC_SLD_CORD_709");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetLee() const property
            {
                return GetCharacter(n"NC_SLD_LEE_700");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY17_735() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY17_735");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY18_736() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY18_736");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRAZOR() const property
            {
                return GetCharacter(n"RAZOR");
            }
            
            AGothicCharacterState GetUrShak() const property
            {
                return GetCharacter(n"UL_OSL_URSHAK_2200");
            }
            
            AGothicCharacterState GetXardasDemon() const property
            {
                return GetCharacter(n"XT_XARDASDEMON");
            }
        }
        
        
        class UChoiceKdf404XardasSellmagicstuff : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2658);
            default Caption = LocText("KDF_404_XARDAS_SELLMAGICSTUFF_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_XARDAS_ACCEPT_14_03"), int64(0xa419a445a28a2658));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf5c217f1eb964060), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                    DB(int64(0xf5c217f1eb964061), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2659), EConversationDebugInfo::Executing);
                // Teach me Orcish. 
                Hero.AI.Say(LocText("KDF_404_XARDAS_SELLMAGICSTUFF_INFO_15_01"));
                DC(int64(0xa419a445a28a2659), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_TeachOrcish);
                DB(int64(0x8c67d89a4b03d537), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Orcish_Skilled));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Orcish_Skilled))
                {
                    DC(int64(0x3f54d6b55bfe842), EConversationDebugInfo::Executing);
                    // Very well - but we only have time for the basics. 
                    Xardas.AI.Say(LocText("TEXT_WIP_LGTRMXB_20240925_150723"));
                    DC(int64(0x3f54d6b55bfe842), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64a6), EConversationDebugInfo::Executing);
                    // You can read, can't you?
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145052"));
                    DC(int64(0xfd154210ca1e64a6), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64a8), EConversationDebugInfo::Executing);
                    
                    // I guess. 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145100"));
                    DC(int64(0xfd154210ca1e64a8), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64a9), EConversationDebugInfo::Executing);
                    
                    // Then you better guess right, because I don't have the ...
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145105"));
                    DC(int64(0xfd154210ca1e64a9), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64aa), EConversationDebugInfo::Executing);
                    // Here, take this and find some space to "clear your mind" ...
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145129"));
                    DC(int64(0xfd154210ca1e64aa), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64ab), EConversationDebugInfo::Executing);
                    // You have some tough hours ahead of you. 
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145148"));
                    DC(int64(0xfd154210ca1e64ab), EConversationDebugInfo::Done);
                    Print("Skipped Hero.AI.PlayAnimation(Read)");
                    DC(int64(0x8c67d89a4b03d527), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Orcish_Skilled);
                    DC(int64(0x8c67d89a4b03d527), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_404_xardas_sellmagicstuff_exit_1");
                }
                else
                {
                    DC(int64(0x8c67d89a4b03d540), EConversationDebugInfo::Executing);
                    // I will - ONCE you are actually ready to learn. Come back ...
                    Xardas.AI.Say(LocText("TEXT_WIP_ZQMJVWL_20250218_150446"));
                    DC(int64(0x8c67d89a4b03d540), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_404_xardas_sellmagicstuff_exit_2");
                }
            }
        }
        
        
        class UChoiceXardas104226 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xb59de03c42dbf9c2);
            default Caption = LocText("TEXT_WIP_IKFZPFD_20240730_200111");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasLoadsword01);
            default Rules.HideIfKnows(UChoiceXardas104226);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb59de03c42dbf9c5), Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_01, 1, 0));
                    DB(int64(0x3c023786a8c2e17f), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0xebb1d29f8b97330e), Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_05, 1, 0));
                    DB(int64(0xebb1d29f8b97331d), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0xebb1d29f8b97330e), Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_04, 1, 0));
                    DB(int64(0xebb1d29f8b97331d), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0xebb1d29f8b97330e), Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_02, 1, 0));
                    DB(int64(0xebb1d29f8b97331d), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0xebb1d29f8b97330e), Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_03, 1, 0));
                    DB(int64(0xebb1d29f8b97331d), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_01, 1, 0) && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted())
                    return true;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_05, 1, 0) && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted())
                    return true;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_04, 1, 0) && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted())
                    return true;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_02, 1, 0) && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted())
                    return true;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_03, 1, 0) && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7ae351d1e69a2925), EConversationDebugInfo::Executing);
                // I found a handful, but not all five of them. 
                Hero.AI.Say(LocText("TEXT_WIP_IKFZPFD_20240730_200111"));
                DC(int64(0x7ae351d1e69a2925), EConversationDebugInfo::Done);
                DC(int64(0xb59de03c42dbf9c9), EConversationDebugInfo::Executing);
                
                // Then go back to the temple and find them. They must be ...
                Xardas.AI.Say(LocText("TEXT_WIP_STVIVXK_20240724_164925"));
                DC(int64(0xb59de03c42dbf9c9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardas105605 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x9720fc4dba618388);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceXardas105605);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_ST_XARDAS", 500.0f, int64(0x9720fc4dba618388));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9720fc4dba6183f5), Quest::SleeperTemple_STCHAPTER6_SLEEPER != nullptr && Quest::SleeperTemple_STCHAPTER6_SLEEPER.HasBeenStarted());
                }
                
                return Quest::SleeperTemple_STCHAPTER6_SLEEPER != nullptr && Quest::SleeperTemple_STCHAPTER6_SLEEPER.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9720fc4dba618384), EConversationDebugInfo::Executing);
                // There ... there you are ...
                Xardas.AI.Say(LocText("TEXT_WIP_QIXCDZL_20240805_134720_2238"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x9720fc4dba618384), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH6_SLEEPER, Document::UDocumentSegment_CH6_SLEEPER_Xardas);
                Subdialog(
                    UTopic_Xardas_109649,
                    UTopic_Xardas_109669
                );
                DC(int64(0x9720fc4dba618397), EConversationDebugInfo::Executing);
                // Listen, there's no ... no time for questions. Kalom is ...
                Xardas.AI.Say(LocText("TEXT_WIP_QIXCDZL_20240805_134808"), Posture = GameplayTag::Posture_Standing_Forced_Wounded01);
                DC(int64(0x9720fc4dba618397), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Xardas_107662,
                    UTopic_Xardas_107682
                );
                DC(int64(0x3f54d6b55bfe84f), EConversationDebugInfo::Executing);
                // The barrier won't be a problem anymore. 
                Hero.AI.Say(LocText("TEXT_WIP_LGTRMXB_20240925_153541"));
                DC(int64(0x3f54d6b55bfe84f), EConversationDebugInfo::Done);
                DB(int64(0x5b9d68eaa654e640), Hero != nullptr && Hero.HasItem(UItAr_Rune_UrizielWaveOfDeath, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAr_Rune_UrizielWaveOfDeath, 1, 0))
                {
                    DC(int64(0x5b9d68eaa654e64c), EConversationDebugInfo::Executing);
                    // We have the Uriziel rune.
                    Hero.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_094003_1924"));
                    DC(int64(0x5b9d68eaa654e64c), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x5b9d68eaa654e653), EConversationDebugInfo::Executing);
                    // We have Uriziel.
                    Hero.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_094006_2785"));
                    DC(int64(0x5b9d68eaa654e653), EConversationDebugInfo::Done);
                }
                DC(int64(0x5b9d68eaa654e659), EConversationDebugInfo::Executing);
                // It's not the barrier I'm worried about it. It's the orc ...
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_094130"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e659), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e665), EConversationDebugInfo::Executing);
                // I've looked down there, and they're what's keeping the ...
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_094315"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e665), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e666), EConversationDebugInfo::Executing);
                // You have to destroy them before he ... he ... wakes ... ...
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_094423"), Posture = GameplayTag::Posture_Standing_Forced_Wounded03);
                DC(int64(0x5b9d68eaa654e666), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e667), EConversationDebugInfo::Executing);
                // I .. need to get out of here. 
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_094527"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e667), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e668), EConversationDebugInfo::Executing);
                // I ...
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_094545"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e668), EConversationDebugInfo::Done);
                DC(int64(0x9720fc4dba6183e9), EConversationDebugInfo::Executing);
                Xardas.AddItemToInventory(UItAr_Rune_TeleportToNecromancer, 1);
                DC(int64(0x9720fc4dba6183e9), EConversationDebugInfo::Done);
                DC(int64(0x746f33f55c1c8643), EConversationDebugInfo::Executing);
                Xardas.ExchangeDailyRoutineToClass(UDailyRoutine_XT_DMB_Xardas_404_Teleport);
                DC(int64(0x746f33f55c1c8643), EConversationDebugInfo::Done);
                DC(int64(0x746f33f55c1c8645), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER6_SLEEPER.StartQuest();
                DC(int64(0x746f33f55c1c8645), EConversationDebugInfo::Done);
                DC(int64(0x9720fc4dba6183ed), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9720fc4dba6183ed), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Xardas_109649 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x566cb0e83ac7d6af);
            default Caption = LocText("TEXT_WIP_QIXCDZL_20240805_134747");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_109649);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9720fc4dba61838d), EConversationDebugInfo::Executing);
                // Xardas?
                Hero.AI.Say(LocText("TEXT_WIP_QIXCDZL_20240805_134747"));
                DC(int64(0x9720fc4dba61838d), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e603), EConversationDebugInfo::Executing);
                
                // Glad your eyes are working better than mine. 
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_091823"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e603), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_109669 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x566cb0e83ac7d6b3);
            default Caption = LocText("TEXT_WIP_FGXCIAC_20240909_193417_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_109669);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x566cb0e83ac7d6b4), EConversationDebugInfo::Executing);
                
                // Is this some kind of trick? 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_193417_2238"));
                DC(int64(0x566cb0e83ac7d6b4), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d6db), EConversationDebugInfo::Executing);
                
                // Huh. Very per- ... perceptive. But no, I'm real, and I'm ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_193515"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x566cb0e83ac7d6db), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_107662 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x5b9d68eaa654e60a);
            default Caption = LocText("TEXT_WIP_KNHLFKC_20240830_091911_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_107662);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5b9d68eaa654e60b), EConversationDebugInfo::Executing);
                
                // Hold on a second. What are you doing down here, and what ...
                Hero.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_091911_41"));
                DC(int64(0x5b9d68eaa654e60b), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e635), EConversationDebugInfo::Executing);
                
                // Oh, what do you think, you fool? I was trying to ... ...
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_092616"), Posture = GameplayTag::Posture_Standing_Forced_Wounded02);
                DC(int64(0x5b9d68eaa654e635), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e636), EConversationDebugInfo::Executing);
                // But there's some kind of ... I don't know, some spell ...
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_092650"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e636), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e638), EConversationDebugInfo::Executing);
                
                // I don't feel anything. 
                Hero.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_093712"));
                DC(int64(0x5b9d68eaa654e638), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e637), EConversationDebugInfo::Executing);
                
                // Why, that's ... a joy to hear.
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_092720"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e637), EConversationDebugInfo::Done);
                DC(int64(0x5b9d68eaa654e639), EConversationDebugInfo::Executing);
                // Now enough of this. We are running out of ... time.
                Xardas.AI.Say(LocText("TEXT_WIP_KNHLFKC_20240830_093813"), Posture = GameplayTag::Posture_Standing_Wounded);
                DC(int64(0x5b9d68eaa654e639), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_SleeperTemple);
            }
        }
        
        
        class UTopic_Xardas_107682 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x5b9d68eaa654e60e);
            default Caption = LocText("TEXT_WIP_LGTRMXB_20240925_153541");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_107682);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceXardas108597 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x2fd8c43f58a17cc9);
            default Caption = LocText("TEXT_WIP_WRDAKHC_20240812_210632");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasLoadsword);
            default Rules.HideIfKnows(UChoiceXardas108597);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2fd8c43f58a17cc4), EConversationDebugInfo::Executing);
                // Did you say an "Avatar of Innos?" 
                Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_210632"));
                DC(int64(0x2fd8c43f58a17cc4), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cc5), EConversationDebugInfo::Executing);
                
                // I was worried you'd ask that. Just think of them as ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_210632_41"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x2fd8c43f58a17cc5), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cce), EConversationDebugInfo::Executing);
                // And no, I won't go into more detail. We have a job to ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_210751"));
                DC(int64(0x2fd8c43f58a17cce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardas158962 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xda9e7c5ad6680c45);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceXardas158962);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a26de), Hero != nullptr && Hero.Inventory.HasEquippedItem(UOre_Armor_H));
                    DB(int64(0xda9e7c5ad6680c72), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xa419a445a28a26df), Hero != nullptr && Hero.Inventory.HasEquippedItem(UOre_Armor_M));
                    DB(int64(0xda9e7c5ad6680c71), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UOre_Armor_H) && Hero != nullptr && Hero.IsInConversation())
                    return true;
                
                if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UOre_Armor_M) && Hero != nullptr && Hero.IsInConversation())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a26e4), EConversationDebugInfo::Executing);
                // Look at that. You found the armor. 
                Xardas.AI.Say(LocText("INFO_XARDAS_OREARMOR_14_01"));
                DC(int64(0xa419a445a28a26e4), EConversationDebugInfo::Done);
                DC(int64(0x3f54d6b55bfe843), EConversationDebugInfo::Executing);
                // How did you get it?
                Xardas.AI.Say(LocText("TEXT_WIP_LGTRMXB_20240925_151006"));
                DC(int64(0x3f54d6b55bfe843), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a26e6), EConversationDebugInfo::Executing);
                
                // Gomez didn't need it anymore.
                Hero.AI.Say(LocText("INFO_XARDAS_OREARMOR_15_03"));
                DC(int64(0xa419a445a28a26e6), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a26e7), EConversationDebugInfo::Executing);
                
                // Witty as usual. Fine by me. The armor will be a great ...
                Xardas.AI.Say(LocText("INFO_XARDAS_OREARMOR_14_04"));
                DC(int64(0xa419a445a28a26e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardas159421 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x8c67d89a4b03d508);
            default Caption = LocText("TEXT_WIP_ZQMJVWL_20250218_135708");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceXardas159421);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_XARDAS_ACCEPT_14_03"), int64(0x8c67d89a4b03d508));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9ad9619980d84570), G1R != nullptr && G1R.HasReachedChapter(4));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8c67d89a4b03d502), EConversationDebugInfo::Executing);
                
                // Why do you need me for all this? You're a powerful mage.
                Hero.AI.Say(LocText("TEXT_WIP_ZQMJVWL_20250218_135708"));
                DC(int64(0x8c67d89a4b03d502), EConversationDebugInfo::Done);
                DC(int64(0x8c67d89a4b03d503), EConversationDebugInfo::Executing);
                
                // I am indeed. Suffice it to say, the orcs know me quite ...
                Xardas.AI.Say(LocText("TEXT_WIP_ZQMJVWL_20250218_135708_41"));
                DC(int64(0x8c67d89a4b03d503), EConversationDebugInfo::Done);
                DC(int64(0x8c67d89a4b03d50a), EConversationDebugInfo::Executing);
                // They have developed their opinion of me, and it isn't ...
                Xardas.AI.Say(LocText("TEXT_WIP_ZQMJVWL_20250218_135737"));
                DC(int64(0x8c67d89a4b03d50a), EConversationDebugInfo::Done);
                DC(int64(0x8c67d89a4b03d50b), EConversationDebugInfo::Executing);
                
                //  I'm a fresh face. I've been hearing that a lot lately.
                Hero.AI.Say(LocText("TEXT_WIP_ZQMJVWL_20250218_135747"));
                DC(int64(0x8c67d89a4b03d50b), EConversationDebugInfo::Done);
                DC(int64(0x8c67d89a4b03d50c), EConversationDebugInfo::Executing);
                
                // (smiles) There's power in anonymity. 
                Xardas.AI.Say(LocText("TEXT_WIP_ZQMJVWL_20250218_135758"));
                DC(int64(0x8c67d89a4b03d50c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardas159448 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x8c67d89a4b03d517);
            default Caption = LocText("TEXT_WIP_ZQMJVWL_20250218_135821");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_XARDAS_ACCEPT_14_03"), int64(0x8c67d89a4b03d517));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9ad9619980d8456f), G1R != nullptr && G1R.HasReachedChapter(4));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8c67d89a4b03d511), EConversationDebugInfo::Executing);
                
                // I'm looking for magical knowledge. 
                Hero.AI.Say(LocText("TEXT_WIP_ZQMJVWL_20250218_135821"));
                DC(int64(0x8c67d89a4b03d511), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64ac), EConversationDebugInfo::Executing);
                
                // Which I suppose is your stilted way of saying you want ...
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145350"));
                DC(int64(0xfd154210ca1e64ac), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64ad), EConversationDebugInfo::Executing);
                // Fine, why not. But everything has its price. 
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145410"));
                DC(int64(0xfd154210ca1e64ad), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_Dealer);
                DC(int64(0xa419a445a28a265a), EConversationDebugInfo::Executing);
                Xardas.AI.StartTradingWith(Hero);
                DC(int64(0xa419a445a28a265a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardas160217 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x595cc98cbbea8ba3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardas_betterarmor_exit_1");
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardas_betterarmor_exit_2");
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardas_betterarmor_exit_3");
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardas_betterarmor_exit_4");
            default Rules.HideIfKnows(UChoiceXardas160217);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfd154210ca1e64c1), EConversationDebugInfo::Executing);
                // Hm. You're not the fighter type, it seems. In that case, ...
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150834"));
                DC(int64(0xfd154210ca1e64c1), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64c4), EConversationDebugInfo::Executing);
                
                // The sunken one in the lake? 
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151038"));
                DC(int64(0xfd154210ca1e64c4), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64c2), EConversationDebugInfo::Executing);
                
                // Yes. I left it when an earthquake devastated the area, ...
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150933"));
                DC(int64(0xfd154210ca1e64c2), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64c3), EConversationDebugInfo::Executing);
                // It should be useful, especially for a mage. 
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150959"));
                DC(int64(0xfd154210ca1e64c3), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64c5), EConversationDebugInfo::Executing);
                
                // I'll take a look. 
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151103"));
                DC(int64(0xfd154210ca1e64c5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_Robe);
                Print("Skipped Xardas.AddItemToInventory(UItKe_Sunkentower, 1)");
                Print("Skipped Xardas.AI.GiveItemTo(Hero, UItKe_Sunkentower, 1)");
            }
        }
        
        
        class UChoiceXardas160241 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x595cc98cbbea8b08);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardas_betterarmor_exit_5");
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardas_betterarmor_exit_6");
            default Rules.HideIfKnows(UChoiceXardas160241);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfd154210ca1e64ba), EConversationDebugInfo::Executing);
                // In that case, you won't like my answer. 
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150516"));
                DC(int64(0xfd154210ca1e64ba), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64bb), EConversationDebugInfo::Executing);
                
                // I'm listening ... 
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150524"));
                DC(int64(0xfd154210ca1e64bb), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64bc), EConversationDebugInfo::Executing);
                
                // Gomez. He has the most powerful armor in the Colony. ...
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150531"));
                DC(int64(0xfd154210ca1e64bc), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64bd), EConversationDebugInfo::Executing);
                // No idea where he found it ... probably digging through ...
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150644"));
                DC(int64(0xfd154210ca1e64bd), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64be), EConversationDebugInfo::Executing);
                // Anyway, you won't find better protection anywhere else. 
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150741"));
                DC(int64(0xfd154210ca1e64be), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64c0), EConversationDebugInfo::Executing);
                
                // But how do I-
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150759"));
                DC(int64(0xfd154210ca1e64c0), EConversationDebugInfo::Done);
                DC(int64(0xfd154210ca1e64bf), EConversationDebugInfo::Executing);
                
                // Not my problem. 
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150754"));
                DC(int64(0xfd154210ca1e64bf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_GOMEZ, Document::UDocumentSegment_Glossary_OC_EBR_GOMEZ_OreArmor);
            }
        }
        
        
        class UChoiceXardas160281 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x595cc98cbbea8b3f);
            default Caption = LocText("TEXT_WIP_KFZFBUC_20250219_105535");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardas160217);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardas160241);
            default Rules.HideIfKnows(UChoiceXardas160281);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x595cc98cbbea8b31), EConversationDebugInfo::Executing);
                // How about a different armor? 
                Hero.AI.Say(LocText("TEXT_WIP_KFZFBUC_20250219_105535"));
                DC(int64(0x595cc98cbbea8b31), EConversationDebugInfo::Done);
                DB(int64(0x595cc98cbbea8bd7), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_WLOOBMH_20250219_150959")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_WLOOBMH_20250219_150959")))
                {
                    DC(int64(0xfd154210ca1e64c6), EConversationDebugInfo::Executing);
                    // Something with plates? 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151148"));
                    DC(int64(0xfd154210ca1e64c6), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_GOMEZ, Document::UDocumentSegment_Glossary_OC_EBR_GOMEZ_OreArmor);
                    DB(int64(0xca895abc7867f5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0xca895abc7867cc), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    
                    if ((Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)) || (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    {
                        DC(int64(0xfd154210ca1e64c7), EConversationDebugInfo::Executing);
                        // What would you want with that? You're a mage. 
                        Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151155"));
                        DC(int64(0xfd154210ca1e64c7), EConversationDebugInfo::Done);
                        DC(int64(0xfd154210ca1e64c8), EConversationDebugInfo::Executing);
                        
                        // Can't hurt to have it. 
                        Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151205"));
                        DC(int64(0xfd154210ca1e64c8), EConversationDebugInfo::Done);
                        DC(int64(0xfd154210ca1e64c9), EConversationDebugInfo::Executing);
                        
                        // In that case, you won't like my answer. 
                        Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150516"));
                        DC(int64(0xfd154210ca1e64c9), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xfd154210ca1e64cb), EConversationDebugInfo::Executing);
                    // Gomez. He has the most powerful armor in the Colony. ...
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150531"));
                    DC(int64(0xfd154210ca1e64cb), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64cc), EConversationDebugInfo::Executing);
                    // No idea where he found it ... probably digging through ...
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150644"));
                    DC(int64(0xfd154210ca1e64cc), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64cd), EConversationDebugInfo::Executing);
                    // Anyway, you won't find better protection anywhere else. 
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150741"));
                    DC(int64(0xfd154210ca1e64cd), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64ce), EConversationDebugInfo::Executing);
                    
                    // But how do I-
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150759"));
                    DC(int64(0xfd154210ca1e64ce), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64cf), EConversationDebugInfo::Executing);
                    
                    // Not my problem. 
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150754"));
                    DC(int64(0xfd154210ca1e64cf), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_160281_exit_2");
                }
                else
                {
                    DC(int64(0xfd154210ca1e64d0), EConversationDebugInfo::Executing);
                    // Like ... a robe? 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151308"));
                    DC(int64(0xfd154210ca1e64d0), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_Robe);
                    DB(int64(0xca895abc786889), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xca895abc7868c2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    
                    if ((Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)) || (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    {
                        
                    }
                    else
                    {
                        DC(int64(0xfd154210ca1e64d1), EConversationDebugInfo::Executing);
                        // What would you want with that? You're a fighter. 
                        Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151315"));
                        DC(int64(0xfd154210ca1e64d1), EConversationDebugInfo::Done);
                        DC(int64(0xfd154210ca1e64d2), EConversationDebugInfo::Executing);
                        
                        // It can't hurt. 
                        Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151325"));
                        DC(int64(0xfd154210ca1e64d2), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x595cc98cbbea8bf2), EConversationDebugInfo::Executing);
                    // Well. Glad you have so much time to spare. It's not like ...
                    Xardas.AI.Say(LocText("INFO_XARDAS_BETTERARMOR_14_05"));
                    DC(int64(0x595cc98cbbea8bf2), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64d3), EConversationDebugInfo::Executing);
                    // Anyway. Try my old tower. 
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151351"));
                    DC(int64(0xfd154210ca1e64d3), EConversationDebugInfo::Done);
                    DC(int64(0x595cc98cbbea8bf3), EConversationDebugInfo::Executing);
                    
                    // The sunken one in the lake? 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151038"));
                    DC(int64(0x595cc98cbbea8bf3), EConversationDebugInfo::Done);
                    DC(int64(0x595cc98cbbea8c02), EConversationDebugInfo::Executing);
                    
                    // Yes. I left it when an earthquake devastated the area, ...
                    Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150933"));
                    DC(int64(0x595cc98cbbea8c02), EConversationDebugInfo::Done);
                    DC(int64(0xfd154210ca1e64d4), EConversationDebugInfo::Executing);
                    
                    // I'll take a look. 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151103"));
                    DC(int64(0xfd154210ca1e64d4), EConversationDebugInfo::Done);
                    Print("Skipped Xardas.AddItemToInventory(UItKe_Sunkentower, 1)");
                    Print("Skipped Xardas.AI.GiveItemTo(Hero, UItKe_Sunkentower, 1)");
                    
                    Other.Remember(n"choice_xardas_160281_exit_1");
                    DC(int64(0x3f0d98dd084598fe), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3f0d98dd084598fe), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceXardas222255 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x75bcd6988c1f58f8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceXardas222255);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x75bcd6988c1f58fb), Hero != nullptr && Hero.IsCloseToCharacter(Xardas, 700.0f));
                    DB(int64(0x75bcd6988c1f590a), Hero != nullptr && Hero.HasDefeated(XardasDemon));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Xardas, 700.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.HasDefeated(XardasDemon))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x75bcd6988c1f58e9), EConversationDebugInfo::Executing);
                // I perceive weakness in my demon... Has some undesirable ...
                Xardas.AI.Say(LocText("TEXT_WIP_UPEPMIC_20250221_141339_41"));
                DC(int64(0x75bcd6988c1f58e9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardas226937 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x3f0d98dd0845993a);
            default Caption = LocText("INFO_XARDAS_BETTERARMOR_15_01");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceXardas226937);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a26a2), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0x3f0d98dd08459929), Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0));
                    DB(int64(0x3f0d98dd084599da), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_XARDAS_BETTERARMOR_15_01")));
                    DB(int64(0xa419a445a28a26a2), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0x3f0d98dd08459929), Hero != nullptr && Hero.HasItem(UOre_Armor_H, 1, 0));
                    DB(int64(0x3f0d98dd084599db), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_XARDAS_BETTERARMOR_15_01")));
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted() && Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0) && Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_XARDAS_BETTERARMOR_15_01")))
                    return true;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted() && Hero != nullptr && Hero.HasItem(UOre_Armor_H, 1, 0) && Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_XARDAS_BETTERARMOR_15_01")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3f0d98dd0845992a), EConversationDebugInfo::Executing);
                
                // Any idea where I could get a better armor from? ...
                Hero.AI.Say(LocText("INFO_XARDAS_BETTERARMOR_15_01"));
                DC(int64(0x3f0d98dd0845992a), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd08459959), EConversationDebugInfo::Executing);
                // Like ... a robe? 
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151308"));
                DC(int64(0x3f0d98dd08459959), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd0845995a), EConversationDebugInfo::Executing);
                
                // What would you want with that? You're a fighter. 
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151315"));
                DC(int64(0x3f0d98dd0845995a), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd0845995b), EConversationDebugInfo::Executing);
                
                // It can't hurt. 
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151325"));
                DC(int64(0x3f0d98dd0845995b), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd0845995c), EConversationDebugInfo::Executing);
                
                // Well. Glad you have so much time to spare. It's not like ...
                Xardas.AI.Say(LocText("INFO_XARDAS_BETTERARMOR_14_05"));
                DC(int64(0x3f0d98dd0845995c), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd0845995d), EConversationDebugInfo::Executing);
                // Anyway. Try my old tower. 
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151351"));
                DC(int64(0x3f0d98dd0845995d), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd0845995e), EConversationDebugInfo::Executing);
                
                // The sunken one in the lake? 
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151038"));
                DC(int64(0x3f0d98dd0845995e), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd0845995f), EConversationDebugInfo::Executing);
                
                // Yes. I left it when an earthquake devastated the area, ...
                Xardas.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_150933"));
                DC(int64(0x3f0d98dd0845995f), EConversationDebugInfo::Done);
                DC(int64(0x3f0d98dd08459960), EConversationDebugInfo::Executing);
                
                // I'll take a look. 
                Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_151103"));
                DC(int64(0x3f0d98dd08459960), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_Robe);
                Print("Skipped Xardas.AddItemToInventory(UItKe_Sunkentower, 1)");
                Print("Skipped Xardas.AI.GiveItemTo(Hero, UItKe_Sunkentower, 1)");
                DC(int64(0x3f0d98dd08459982), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3f0d98dd08459982), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceXardasAccept : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2649);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasEventhow, UChoiceXardasEventwhere, UChoiceXardasEventwhy);
            default Rules.HideIfKnows(UChoiceXardasAccept);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a264a), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a264b), EConversationDebugInfo::Executing);
                // So you think this shaman will vouch for me?
                Hero.AI.Say(LocText("INFO_XARDAS_ACCEPT_15_01"));
                DC(int64(0xa419a445a28a264b), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2cb), EConversationDebugInfo::Executing);
                
                // It'll be a bit more complicated, but he'll hopefully ...
                Xardas.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_113345"));
                DC(int64(0x962243a4707fa2cb), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a264c), EConversationDebugInfo::Executing);
                // My servant already gave you a teleport rune that will ...
                Xardas.AI.Say(LocText("INFO_XARDAS_ACCEPT_14_02"));
                DC(int64(0xa419a445a28a264c), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a264d), EConversationDebugInfo::Executing);
                // Oh, and before you go, we should use the time to teach ...
                Xardas.AI.Say(LocText("INFO_XARDAS_ACCEPT_14_03"));
                DC(int64(0xa419a445a28a264d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDXARDAS, Document::UDocumentSegment_CH4_FINDXARDAS_MeetXardas);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDORCSHAMAN, Document::UDocumentSegment_CH4_FINDORCSHAMAN_Start);
                DC(int64(0xa419a445a28a264e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Guardnc); }
                DC(int64(0xa419a445a28a264e), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a264f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cord))) { Cord.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Cord_709_Fmtaken); }
                DC(int64(0xa419a445a28a264f), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2650), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY17_735))) { NC_SLD_MERCENARY17_735.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary17_735_Fmtaken); }
                DC(int64(0xa419a445a28a2650), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2651), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY18_736))) { NC_SLD_MERCENARY18_736.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary18_736_Fmtaken); }
                DC(int64(0xa419a445a28a2651), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2652), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.StartQuest();
                DC(int64(0xa419a445a28a2652), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2653), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"SpawnFindOrcShamanQuestCharacters");
                DC(int64(0xa419a445a28a2653), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf127e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Wolf))) { Wolf.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Wolf_855_FMTaken); }
                DC(int64(0xb4aa8f8f32bf127e), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1280), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE23_838))) { NC_ORG_ROGUE23_838.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue23_838_FMTaken); }
                DC(int64(0xb4aa8f8f32bf1280), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1282), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE22_837))) { NC_ORG_ROGUE22_837.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue22_837_FMTaken); }
                DC(int64(0xb4aa8f8f32bf1282), EConversationDebugInfo::Done);
                DC(int64(0x111ea4452841cf0a), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"GornMoveToFreeMineEvent");
                DC(int64(0x111ea4452841cf0a), EConversationDebugInfo::Done);
                DC(int64(0xe61ad584b339461a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT.StartQuest();
                DC(int64(0xe61ad584b339461a), EConversationDebugInfo::Done);
                DC(int64(0x1945daa7360313d5), EConversationDebugInfo::Executing);
                Xardas.ExchangeDailyRoutineToClass(UDailyRoutine_XT_DMB_Xardas_404_Start);
                DC(int64(0x1945daa7360313d5), EConversationDebugInfo::Done);
                DC(int64(0xba42e58f42ccbcf9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_Lswait); }
                DC(int64(0xba42e58f42ccbcf9), EConversationDebugInfo::Done);
                DC(int64(0x4e5bc0ce05b0dbc8), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UrShak))) { UrShak.GiveImmortality(); }
                DC(int64(0x4e5bc0ce05b0dbc8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasAltrune : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a26fa);
            default Caption = LocText("INFO_XARDAS_ALTRUNE_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasLoadsword);
            default Rules.HideIfKnows(UChoiceXardasAltrune);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb59de03c42dbf998), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x320c516fcf2e90fe), Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0));
                    DB(int64(0xebbc2a68a710978a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_DemonSummoner));
                    DB(int64(0x320c516fcf2e90fd), Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0));
                    DB(int64(0xebbc2a68a710978b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x320c516fcf2e90fc), Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_DemonSummoner) && Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a26fc), EConversationDebugInfo::Executing);
                // Speaking of proficiency, I'm a mage myself. Even if we ...
                Hero.AI.Say(LocText("INFO_XARDAS_ALTRUNE_15_01"));
                DC(int64(0xa419a445a28a26fc), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a26fd), EConversationDebugInfo::Executing);
                
                // Beliar be praised! That completely eluded my attention.
                Xardas.AI.Say(LocText("INFO_XARDAS_ALTRUNE_14_02"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0xa419a445a28a26fd), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17ce4), EConversationDebugInfo::Executing);
                // Don't be a fool - of course I'm not expecting you to go ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_215916"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel03);
                DC(int64(0x2fd8c43f58a17ce4), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a26fe), EConversationDebugInfo::Executing);
                // I have a solution in mind. But one step at a time. ...
                Xardas.AI.Say(LocText("INFO_XARDAS_ALTRUNE_14_03"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel02);
                DC(int64(0xa419a445a28a26fe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasBetterarmor : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a26a1);
            default Caption = LocText("INFO_XARDAS_BETTERARMOR_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceXardasBetterarmor);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a26a2), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0x3f0d98dd08459929), Hero != nullptr && !Hero.HasItem(UOre_Armor_M, 1, 0));
                    DB(int64(0x3f0d98dd084599cb), Hero != nullptr && !Hero.HasItem(UOre_Armor_H, 1, 0));
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UOre_Armor_H, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a26a3), EConversationDebugInfo::Executing);
                
                // Any idea where I could get a better armor from? ...
                Hero.AI.Say(LocText("INFO_XARDAS_BETTERARMOR_15_01"));
                DC(int64(0xa419a445a28a26a3), EConversationDebugInfo::Done);
                DB(int64(0xa419a445a28a26a7), Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdw_Armor_L));
                DB(int64(0xfd2b18cf051e04c9), Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdw_Armor_H));
                DB(int64(0xfd2b18cf051e04ca), Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdf_Armor_L));
                DB(int64(0xda9e7c5ad6680c98), Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdf_Armor_H));
                DB(int64(0xda9e7c5ad6680c99), Hero != nullptr && Hero.Inventory.HasEquippedItem(UCrw_Armor_H));
                
                if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdw_Armor_L))
                {
                    DC(int64(0xfd154210ca1e64ae), EConversationDebugInfo::Executing);
                    // This pair of robes isn't gonna get me far ... 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145854"));
                    DC(int64(0xfd154210ca1e64ae), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_betterarmor_exit_1");
                }
                else if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdw_Armor_H))
                {
                    DC(int64(0xfd154210ca1e64af), EConversationDebugInfo::Executing);
                    // This pair of robes isn't gonna get me far ... 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145854"));
                    DC(int64(0xfd154210ca1e64af), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_betterarmor_exit_2");
                }
                else if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdf_Armor_L))
                {
                    DC(int64(0xfd154210ca1e64b0), EConversationDebugInfo::Executing);
                    // This pair of robes isn't gonna get me far ... 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145854"));
                    DC(int64(0xfd154210ca1e64b0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_betterarmor_exit_3");
                }
                else if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UKdf_Armor_H))
                {
                    DC(int64(0xfd154210ca1e64b1), EConversationDebugInfo::Executing);
                    // This pair of robes isn't gonna get me far ... 
                    Hero.AI.Say(LocText("TEXT_WIP_WLOOBMH_20250219_145854"));
                    DC(int64(0xfd154210ca1e64b1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_betterarmor_exit_4");
                }
                else if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UCrw_Armor_H))
                {
                    DC(int64(0x595cc98cbbea8a53), EConversationDebugInfo::Executing);
                    // Those crawler plates barely hold together anymore. 
                    Hero.AI.Say(LocText("TEXT_WIP_KFZFBUC_20250219_103910_2083"));
                    DC(int64(0x595cc98cbbea8a53), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_betterarmor_exit_5");
                }
                else
                {
                    DC(int64(0xa419a445a28a26ab), EConversationDebugInfo::Executing);
                    // This steel isn't gonna get me far ... 
                    Hero.AI.Say(LocText("INFO_XARDAS_BETTERARMOR_15_04"));
                    DC(int64(0xa419a445a28a26ab), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_betterarmor_exit_6");
                }
            }
        }
        
        
        class UChoiceXardasDanger : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2625);
            default Caption = LocText("INFO_XARDAS_DANGER_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasSaturas);
            default Rules.HideIfKnows(UChoiceXardasDanger);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2626), EConversationDebugInfo::Executing);
                // What makes you think their escape plan won't work?
                Hero.AI.Say(LocText("INFO_XARDAS_DANGER_15_01"));
                DC(int64(0xa419a445a28a2626), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2627), EConversationDebugInfo::Executing);
                
                // My common sense - which is what Saturas and his friends ...
                Xardas.AI.Say(LocText("INFO_XARDAS_DANGER_14_02"));
                DC(int64(0xa419a445a28a2627), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2628), EConversationDebugInfo::Executing);
                // Focus stone or not, nobody can control all of this ore ...
                Xardas.AI.Say(LocText("INFO_XARDAS_DANGER_14_03"));
                DC(int64(0xa419a445a28a2628), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2629), EConversationDebugInfo::Executing);
                
                // I'm listening.
                Hero.AI.Say(LocText("INFO_XARDAS_DANGER_15_04"));
                DC(int64(0xa419a445a28a2629), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a262a), EConversationDebugInfo::Executing);
                
                // (long sigh) Hm ... You know, I was going to tell you ...
                Xardas.AI.Say(LocText("INFO_XARDAS_DANGER_14_05"));
                DC(int64(0xa419a445a28a262a), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb97424230), EConversationDebugInfo::Executing);
                // I'll be brief: there's a reason the barrier spell ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_143334"));
                DC(int64(0x8fe8e6cb97424230), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb9742425b), EConversationDebugInfo::Executing);
                // A disease that now lies deep within the temple of the ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_143941"));
                DC(int64(0x8fe8e6cb9742425b), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb9742425c), EConversationDebugInfo::Executing);
                
                // ... The Sleeper. 
                Hero.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_144022"));
                DC(int64(0x8fe8e6cb9742425c), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb9742425d), EConversationDebugInfo::Executing);
                
                // Correct. I've been keeping an eye on you, so I know ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145223"));
                DC(int64(0x8fe8e6cb9742425d), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb9742425e), EConversationDebugInfo::Executing);
                // Briefly put, the murals in the orc graveyard are showing ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145310"));
                DC(int64(0x8fe8e6cb9742425e), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb9742425f), EConversationDebugInfo::Executing);
                // If he wakes up - and he is about to - his power is ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145409"));
                DC(int64(0x8fe8e6cb9742425f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Xardas_101982,
                    UTopic_Xardas_102228,
                    UTopic_Xardas_103308,
                    UTopic_Xardas_102002
                );
            }
        }
        
        
        class UTopic_Xardas_101982 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x8fe8e6cb9742426a);
            default Caption = LocText("TEXT_WIP_UJNSYIC_20240528_145512_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_101982);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8fe8e6cb9742426b), EConversationDebugInfo::Executing);
                // You've been keeping an eye on me? How?
                Hero.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145512_41"));
                DC(int64(0x8fe8e6cb9742426b), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb97424281), EConversationDebugInfo::Executing);
                
                // Beliar's magic is quite versatile. 
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145650"));
                DC(int64(0x8fe8e6cb97424281), EConversationDebugInfo::Done);
                DC(int64(0x1c345971eb8e69b6), EConversationDebugInfo::Executing);
                
                // Not sure how I feel about that ... 
                Hero.AI.Say(LocText("TEXT_WIP_CUGUMHD_20241008_142931"));
                DC(int64(0x1c345971eb8e69b6), EConversationDebugInfo::Done);
                DC(int64(0x1c345971eb8e69b7), EConversationDebugInfo::Executing);
                
                // Oh, please. How long have you been here? A few weeks? ...
                Xardas.AI.Say(LocText("TEXT_WIP_CUGUMHD_20241008_142938"));
                DC(int64(0x1c345971eb8e69b7), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb97424298), EConversationDebugInfo::Executing);
                // If you don't want people to watch you, maybe work on ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145955"));
                DC(int64(0x8fe8e6cb97424298), EConversationDebugInfo::Done);
                DC(int64(0x73fa8602822d574c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x73fa8602822d574c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_102228 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x8fe8e6cb97424282);
            default Caption = LocText("TEXT_WIP_UJNSYIC_20240528_145711_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_102228);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8fe8e6cb97424283), EConversationDebugInfo::Executing);
                // And you know all this how? 
                Hero.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145711_1924"));
                DC(int64(0x8fe8e6cb97424283), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb97424289), EConversationDebugInfo::Executing);
                
                // I know it, because these books aren't just for ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145722"));
                DC(int64(0x8fe8e6cb97424289), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb9742428a), EConversationDebugInfo::Executing);
                // But, sadly, my brothers in robes and just about everyone ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145742"));
                DC(int64(0x8fe8e6cb9742428a), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb9742428b), EConversationDebugInfo::Executing);
                // Let alone thousands of years. 
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145833"));
                DC(int64(0x8fe8e6cb9742428b), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb97424285), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x8fe8e6cb97424285), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_103308 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x8fe8e6cb974242a0);
            default Caption = LocText("TEXT_WIP_VJNSYIC_20240529_091808");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_103308);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9838995b7c42b110), EConversationDebugInfo::Executing);
                // What makes you so sure blowing up the Barrier won't ...
                Hero.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_091808"));
                DC(int64(0x9838995b7c42b110), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b111), EConversationDebugInfo::Executing);
                
                // (sighs) Listen, boy, I'm not in the mood to prove myself ...
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_091808_41"));
                DC(int64(0x9838995b7c42b111), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b11a), EConversationDebugInfo::Executing);
                // It's a foolish endeavor that will either fail or end in ...
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_091947"));
                DC(int64(0x9838995b7c42b11a), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b11b), EConversationDebugInfo::Executing);
                // And again, even if it were to work, which it won't, we'd ...
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_092006"));
                DC(int64(0x9838995b7c42b11b), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b11c), EConversationDebugInfo::Executing);
                // So quit wasting my time with this pointless blabber. 
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_092025"));
                DC(int64(0x9838995b7c42b11c), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b116), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9838995b7c42b116), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_102002 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x8fe8e6cb9742426e);
            default Caption = LocText("TEXT_WIP_UJNSYIC_20240528_145512_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_102002);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8fe8e6cb9742426f), EConversationDebugInfo::Executing);
                // So how DO we stop the Sleeper?
                Hero.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_145512_2238"));
                DC(int64(0x8fe8e6cb9742426f), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb974242ad), EConversationDebugInfo::Executing);
                
                // We kill it. The problem is getting into the temple ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_150218"));
                DC(int64(0x8fe8e6cb974242ad), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b11f), EConversationDebugInfo::Executing);
                
                // Let me guess: that's my job?
                Hero.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_093558"));
                DC(int64(0x9838995b7c42b11f), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b11d), EConversationDebugInfo::Executing);
                
                // Correct. The first step will be getting into the orc ...
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_092144"));
                DC(int64(0x9838995b7c42b11d), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b120), EConversationDebugInfo::Executing);
                // Thankfully, I already know someone who can help you with ...
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_093639"));
                DC(int64(0x9838995b7c42b120), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_OLS_URSHAK, Document::UDocumentSegment_Glossary_UL_OLS_URSHAK_TheMysteriousOrc);
            }
        }
        
        
        class UChoiceXardasDisturb : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a260a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceXardasDisturb);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a260b), G1R.UrShak_SpokeOfUluMulu == 0);
                    DB(int64(0x9ad9619980d8456e), G1R != nullptr && G1R.HasReachedChapter(4));
                }
                
                if (G1R.UrShak_SpokeOfUluMulu != 0)
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a260d), EConversationDebugInfo::Executing);
                // Congratulations.
                Xardas.AI.Say(LocText("INFO_XARDAS_DISTURB_14_01"));
                DC(int64(0xa419a445a28a260d), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a260e), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("INFO_XARDAS_DISTURB_15_02"));
                DC(int64(0xa419a445a28a260e), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a260f), EConversationDebugInfo::Executing);
                
                // You're the first to make it past my guardians. 
                Xardas.AI.Say(LocText("INFO_XARDAS_DISTURB_14_03"));
                DC(int64(0xa419a445a28a260f), EConversationDebugInfo::Done);
                DC(int64(0xcf89cfedc0b9ea86), EConversationDebugInfo::Executing);
                // That - and only that - is why I'm giving you the ...
                Xardas.AI.Say(LocText("TEXT_WIP_WFMTDRD_20241002_213343"));
                DC(int64(0xcf89cfedc0b9ea86), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_Introduction);
                DC(int64(0xe61ad584b33944fb), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_FIND.SucceedQuest();
                DC(int64(0xe61ad584b33944fb), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5712), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5712), EConversationDebugInfo::Done);
                DC(int64(0xde2da8b75593002b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lee))) { Lee.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Lee_700_Start); }
                DC(int64(0xde2da8b75593002b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasEventhow : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a263b);
            default Caption = LocText("INFO_XARDAS_EVENTHOW_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasDanger);
            default Rules.HideIfKnows(UChoiceXardasEventhow);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VJNSYIC_20240529_095214"), int64(0xa419a445a28a263b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a263c), EConversationDebugInfo::Executing);
                // Why would a shaman of the orcs help me get into their ...
                Hero.AI.Say(LocText("INFO_XARDAS_EVENTHOW_15_01"));
                DC(int64(0xa419a445a28a263c), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2c7), EConversationDebugInfo::Executing);
                
                // As I told you, he does not think like the other orcs - ...
                Xardas.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_112959"));
                DC(int64(0x962243a4707fa2c7), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2c8), EConversationDebugInfo::Executing);
                
                // You mean ... he opposes the Sleeper?
                Hero.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_113039"));
                DC(int64(0x962243a4707fa2c8), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2c9), EConversationDebugInfo::Executing);
                
                // There's a chance, yes. But if this encounter goes well, ...
                Xardas.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_113105"));
                DC(int64(0x962243a4707fa2c9), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2ca), EConversationDebugInfo::Executing);
                // In either case, he's our best chance.
                Xardas.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_113205"));
                DC(int64(0x962243a4707fa2ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasEventwhere : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2644);
            default Caption = LocText("INFO_XARDAS_EVENTWHERE_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasDanger);
            default Rules.HideIfKnows(UChoiceXardasEventwhere);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_ORCSHAMAN_THX_17_01"), int64(0xa419a445a28a2644));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2645), EConversationDebugInfo::Executing);
                
                // Where can I find this shaman?
                Hero.AI.Say(LocText("INFO_XARDAS_EVENTWHERE_15_01"));
                DC(int64(0xa419a445a28a2645), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2646), EConversationDebugInfo::Executing);
                
                // Last I saw him, he was at the old castle up on the ...
                Xardas.AI.Say(LocText("INFO_XARDAS_EVENTWHERE_14_02"));
                DC(int64(0xa419a445a28a2646), EConversationDebugInfo::Done);
                DC(int64(0x86da55731415a57e), EConversationDebugInfo::Executing);
                // It's near the orc enclave - you can see there from the ...
                Xardas.AI.Say(LocText("TEXT_WIP_FSMIFZI_20240628_114810"));
                DC(int64(0x86da55731415a57e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasEventwhy : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2638);
            default Caption = LocText("INFO_XARDAS_EVENTWHY_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasDanger);
            default Rules.HideIfKnows(UChoiceXardasEventwhy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2639), EConversationDebugInfo::Executing);
                
                // Why has this "Ur-Shak"  been dishonored?
                Hero.AI.Say(LocText("INFO_XARDAS_EVENTWHY_15_01"));
                DC(int64(0xa419a445a28a2639), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a263a), EConversationDebugInfo::Executing);
                
                // We haven't exactly sat down for a cup of tea, so I don't ...
                Xardas.AI.Say(LocText("INFO_XARDAS_EVENTWHY_14_02"));
                DC(int64(0xa419a445a28a263a), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b121), EConversationDebugInfo::Executing);
                // However, I believe it has something to do with his study ...
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_095214"));
                DC(int64(0x9838995b7c42b121), EConversationDebugInfo::Done);
                DC(int64(0x9838995b7c42b122), EConversationDebugInfo::Executing);
                // Orcs consider that sort of thing dishonorable. 
                Xardas.AI.Say(LocText("TEXT_WIP_VJNSYIC_20240529_095252"));
                DC(int64(0x9838995b7c42b122), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasExit : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2602);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xa419a445a28a2604), Xardas != nullptr && !Xardas.HasItem(UItAr_Rune_FireBall, 1, 0));
                
                if (Xardas != nullptr && !Xardas.HasItem(UItAr_Rune_FireBall, 1, 0))
                {
                    DC(int64(0xa419a445a28a2605), EConversationDebugInfo::Executing);
                    Xardas.AddItemToInventory(UItAr_Rune_FireBall, 1);
                    DC(int64(0xa419a445a28a2605), EConversationDebugInfo::Done);
                }
                DB(int64(0xa419a445a28a2607), Xardas != nullptr && !Xardas.HasItem(UItAr_Scroll_SummonDemon, 1, 0));
                
                if (Xardas != nullptr && !Xardas.HasItem(UItAr_Scroll_SummonDemon, 1, 0))
                {
                    DC(int64(0xa419a445a28a2608), EConversationDebugInfo::Executing);
                    Xardas.AddItemToInventory(UItAr_Scroll_SummonDemon, 2);
                    DC(int64(0xa419a445a28a2608), EConversationDebugInfo::Done);
                }
                DC(int64(0xa419a445a28a2609), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa419a445a28a2609), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceXardasKdw : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a261b);
            default Caption = LocText("INFO_XARDAS_KDW_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasDisturb);
            default Rules.HideIfKnows(UChoiceXardasKdw);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb1fb8ab2d1c7afa1), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                }
                
                return Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a261c), EConversationDebugInfo::Executing);
                // The Fire Mages are dead. Gomez had them all killed. 
                Hero.AI.Say(LocText("INFO_XARDAS_KDW_15_01"));
                DC(int64(0xa419a445a28a261c), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a261e), EConversationDebugInfo::Executing);
                
                // Those who sow wind must reap a storm. I always told ...
                Xardas.AI.Say(LocText("INFO_XARDAS_KDW_14_03"));
                DC(int64(0xa419a445a28a261e), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a261f), EConversationDebugInfo::Executing);
                // They chose their own headsmen.
                Xardas.AI.Say(LocText("INFO_XARDAS_KDW_14_04"));
                DC(int64(0xa419a445a28a261f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasLoadsword : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a267f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceXardasLoadsword);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a2680), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0));
                    DB(int64(0x132e4ca1945c9b36), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2fd8c43f58a17cb8), EConversationDebugInfo::Executing);
                // Well, well - who have we here? I heard there was quite a ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_205150"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL");
                DC(int64(0x2fd8c43f58a17cb8), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2681), EConversationDebugInfo::Executing);
                
                // I did, but there was some barrier I couldn't get past. I ...
                Hero.AI.Say(LocText("INFO_XARDAS_LOADSWORD_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL", bUnskippable = true);
                DC(int64(0xa419a445a28a2681), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cbc), EConversationDebugInfo::Executing);
                
                // And?
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_205453"), ForceCameraPreset = n"TWO SHOT FLAT URIZIEL", bUnskippable = true);
                DC(int64(0x2fd8c43f58a17cbc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_ChargeUriziel);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Xardas);
                DC(int64(0xedc440f0c0c204fd), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowUriziel);
                DC(int64(0xedc440f0c0c204fd), EConversationDebugInfo::Done);
                DC(int64(0x9afb83adba270760), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_XARDAS.SucceedQuest();
                DC(int64(0x9afb83adba270760), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cbe), EConversationDebugInfo::Executing);
                // And I found this sword here in some kind of vault. It ...
                Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_205531"), ForceCameraPreset = n"TWO SHOT COWBOY TC URIZIEL", bUnskippable = true);
                DC(int64(0x2fd8c43f58a17cbe), EConversationDebugInfo::Done);
                DC(int64(0x7ae351d1e69a2920), EConversationDebugInfo::Executing);
                
                // Hmm ... curious. That vault - were there murals? Like ...
                Xardas.AI.Say(LocText("TEXT_WIP_IKFZPFD_20240730_184505"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY URIZIEL", bUnskippable = true);
                DC(int64(0x7ae351d1e69a2920), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cbf), EConversationDebugInfo::Executing);
                
                // Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_210118"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY URIZIEL");
                DC(int64(0x2fd8c43f58a17cbf), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2682), EConversationDebugInfo::Executing);
                
                // Interesting. Let me see. 
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD_14_02"), ForceCameraPreset = n"TWO SHOT COWBOY TC URIZIEL", bUnskippable = true);
                DC(int64(0xa419a445a28a2682), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2689), EConversationDebugInfo::Executing);
                // Well, well ... lucky you. This is Uriziel.
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD_14_03"), ForceCameraPreset = n"TWO SHOT FLAT URIZIEL", bUnskippable = true);
                DC(int64(0xa419a445a28a2689), EConversationDebugInfo::Done);
                DC(int64(0x65136567c769807a), EConversationDebugInfo::Executing);
                
                // Say again?
                Hero.AI.Say(LocText("TEXT_WIP_XWVMEJE_20240801_162047"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY URIZIEL");
                DC(int64(0x65136567c769807a), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a268a), EConversationDebugInfo::Executing);
                
                // "Uriziel." I've come across it in my research. ...
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD_14_04"), ForceCameraPreset = n"TWO SHOT FLAT URIZIEL");
                DC(int64(0xa419a445a28a268a), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a268b), EConversationDebugInfo::Executing);
                // I was never certain if that story was fiction, but the ...
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD_14_05"), ForceCameraPreset = n"TWO SHOT FLAT URIZIEL", bUnskippable = true);
                DC(int64(0xa419a445a28a268b), EConversationDebugInfo::Done);
                DC(int64(0xedc440f0c0c2052f), EConversationDebugInfo::Executing);
                Hero.AI.EndAnyOngoingInteraction();
                DC(int64(0xedc440f0c0c2052f), EConversationDebugInfo::Done);
                DC(int64(0x487e9b7b3859bc2c), EConversationDebugInfo::Executing);
                Hero.AI.WaitUntilNoLongerSpeaking();
                DC(int64(0x487e9b7b3859bc2c), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cc2), EConversationDebugInfo::Executing);
                // So the orcs killed this guy and then stashed it in the ...
                Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_210518"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL", bUnskippable = true);
                DC(int64(0x2fd8c43f58a17cc2), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cc3), EConversationDebugInfo::Executing);
                
                // So it seems. I bet they used the power of the gemstone ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_210530"), ForceCameraPreset = n"INDIVIDUAL MEDIUM URIZIEL", Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x2fd8c43f58a17cc3), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a268c), EConversationDebugInfo::Executing);
                // Anyway, let's not lose ourselves in history lessons. ...
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD_14_06"), ForceCameraPreset = n"TWO SHOT FLAT URIZIEL", bUnskippable = true, Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel01);
                DC(int64(0xa419a445a28a268c), EConversationDebugInfo::Done);
                DB(int64(0xa4ba9cf5f3ffea96), Hero != nullptr && Hero.Inventory.HasEquippedItem(UItMw_2H_Sword_Uriziel_01));
                
                if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UItMw_2H_Sword_Uriziel_01))
                {
                    DC(int64(0xa4ba9cf5f3ffea5c), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMw_2H_Sword_Uriziel_01, 1, 0);
                    DC(int64(0xa4ba9cf5f3ffea5c), EConversationDebugInfo::Done);
                    DC(int64(0xa4ba9cf5f3ffeab4), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMw_2H_Sword_Uriziel_02, 1);
                    DC(int64(0xa4ba9cf5f3ffeab4), EConversationDebugInfo::Done);
                    DC(int64(0xa4ba9cf5f3ffeab6), EConversationDebugInfo::Executing);
                    Hero.Inventory.EquipMeleeWeaponOfClass(UItMw_2H_Sword_Uriziel_02);
                    DC(int64(0xa4ba9cf5f3ffeab6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_loadsword_exit_1");
                }
                else
                {
                    DC(int64(0xa4ba9cf5f3ffeab8), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMw_2H_Sword_Uriziel_01, 1, 0);
                    DC(int64(0xa4ba9cf5f3ffeab8), EConversationDebugInfo::Done);
                    DC(int64(0xa4ba9cf5f3ffeaca), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMw_2H_Sword_Uriziel_02, 1);
                    DC(int64(0xa4ba9cf5f3ffeaca), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_loadsword_exit_2");
                }
            }
        }
        
        
        class UChoiceXardasLoadsword01 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a268f);
            default Caption = LocText("INFO_XARDAS_LOADSWORD01_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasLoadsword);
            default Rules.HideIfKnows(UChoiceXardasLoadsword01);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2695), EConversationDebugInfo::Executing);
                // How DO we restore its magic? 
                Hero.AI.Say(LocText("INFO_XARDAS_LOADSWORD01_15_05"));
                DC(int64(0xa419a445a28a2695), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17ccf), EConversationDebugInfo::Executing);
                
                // I have an idea - but first, we need to return those five ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_210907"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x2fd8c43f58a17ccf), EConversationDebugInfo::Done);
                DC(int64(0x7ae351d1e69a291e), EConversationDebugInfo::Executing);
                // I'm assuming the orcs removed them when they repurposed ...
                Xardas.AI.Say(LocText("TEXT_WIP_IKFZPFD_20240730_163008"));
                DC(int64(0x7ae351d1e69a291e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Gems);
                DC(int64(0x9afb83adba270794), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS.StartQuest();
                DC(int64(0x9afb83adba270794), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5714), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5714), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasLoadsword02 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2696);
            default Caption = LocText("TEXT_WIP_STVIVXK_20240724_170419");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasLoadsword01);
            default Rules.HideIfKnows(UChoiceXardasLoadsword02);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a2697), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                    DB(int64(0xb59de03c42dbf9cf), Hero != nullptr && Hero.HasItem(UItMi_UrizielGem_01, 1, 0));
                    DB(int64(0x3c023786a8c2e17b), Hero != nullptr && Hero.HasItem(UItMi_UrizielGem_02, 1, 0));
                    DB(int64(0x3c023786a8c2e17c), Hero != nullptr && Hero.HasItem(UItMi_UrizielGem_03, 1, 0));
                    DB(int64(0x3c023786a8c2e17d), Hero != nullptr && Hero.HasItem(UItMi_UrizielGem_04, 1, 0));
                    DB(int64(0x3c023786a8c2e17e), Hero != nullptr && Hero.HasItem(UItMi_UrizielGem_05, 1, 0));
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_02, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_03, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_04, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_UrizielGem_05, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb59de03c42dbf9d3), EConversationDebugInfo::Executing);
                // I have those gemstones. Right here. 
                Hero.AI.Say(LocText("TEXT_WIP_STVIVXK_20240724_170419"));
                DC(int64(0xb59de03c42dbf9d3), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cd0), EConversationDebugInfo::Executing);
                
                // Let's see ... yes. Yes, that looks good. I can already ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_211223"));
                DC(int64(0x2fd8c43f58a17cd0), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2698), EConversationDebugInfo::Executing);
                
                // Let me guess: it isn't enough? 
                Hero.AI.Say(LocText("INFO_XARDAS_LOADSWORD02_15_01"));
                DC(int64(0xa419a445a28a2698), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2699), EConversationDebugInfo::Executing);
                
                // No. Like I said, maintaining that barrier spell for a ...
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD02_14_02"));
                DC(int64(0xa419a445a28a2699), EConversationDebugInfo::Done);
                DC(int64(0x41a9a79dae185078), EConversationDebugInfo::Executing);
                // We'll need a source to recharge it. A BIG one. 
                Xardas.AI.Say(LocText("TEXT_WIP_JKFZPFD_20240731_205018"));
                DC(int64(0x41a9a79dae185078), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a269a), EConversationDebugInfo::Executing);
                
                // ... The ore pile.
                Hero.AI.Say(LocText("INFO_XARDAS_LOADSWORD02_15_03"));
                DC(int64(0xa419a445a28a269a), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a269b), EConversationDebugInfo::Executing);
                
                // You read my mind. As it happens, I have a spell scroll ...
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD02_14_04"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0xa419a445a28a269b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Completed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_Milten);
                Subdialog(
                    UTopic_Xardas_110066,
                    UTopic_Xardas_110086,
                    UTopic_Xardas_110108,
                    UTopic_Xardas_111753
                );
                DC(int64(0x2fd8c43f58a17cdd), EConversationDebugInfo::Executing);
                // How will we go about this, then?
                Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_215517"));
                DC(int64(0x2fd8c43f58a17cdd), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cde), EConversationDebugInfo::Executing);
                
                // Disregarding the obvious fact that dear old Saturas ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_215534"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x2fd8c43f58a17cde), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a269d), EConversationDebugInfo::Executing);
                // You'll need someone else to help you cast the spell as ...
                Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD02_14_06"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel07);
                DC(int64(0xa419a445a28a269d), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17cdf), EConversationDebugInfo::Executing);
                
                // Milten.
                Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_215710"));
                DC(int64(0x2fd8c43f58a17cdf), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17ce0), EConversationDebugInfo::Executing);
                
                // Then you should seek him out and ask him to help you. ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_215713"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x2fd8c43f58a17ce0), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Xardas.AddItemToInventory(UItWr_Scroll_Milten, 1);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0xda9e7c5ad6680c10), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS.SucceedQuest();
                DC(int64(0xda9e7c5ad6680c10), EConversationDebugInfo::Done);
                DC(int64(0xd47f896dcbb4cdc4), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ncreport); }
                DC(int64(0xd47f896dcbb4cdc4), EConversationDebugInfo::Done);
                DC(int64(0xd47f896dcbb4ce84), EConversationDebugInfo::Executing);
                Xardas.AI.GiveItemTo(Hero, UItWr_Scroll_Milten, 1);
                DC(int64(0xd47f896dcbb4ce84), EConversationDebugInfo::Done);
                DC(int64(0x9afb83adba2707b7), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_URIZIEL.StartQuest();
                DC(int64(0x9afb83adba2707b7), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5716), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5716), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_110066 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x566cb0e83ac7d6ef);
            default Caption = LocText("TEXT_WIP_FGXCIAC_20240909_194201_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_110066);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x566cb0e83ac7d748), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x566cb0e83ac7d6f0), EConversationDebugInfo::Executing);
                // I'm a Water Mage. I can't betray my brothers. 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_194201_1924"));
                DC(int64(0x566cb0e83ac7d6f0), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d75f), EConversationDebugInfo::Executing);
                
                // Very noble. Also: very stupid. 
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_194718"));
                DC(int64(0x566cb0e83ac7d75f), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d760), EConversationDebugInfo::Executing);
                // Listen, I'm not here to make light of whatever fancy ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_194813"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x566cb0e83ac7d760), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d775), EConversationDebugInfo::Executing);
                // But you've BEEN to the Sleeper Temple - you've seen that ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195353"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel05);
                DC(int64(0x566cb0e83ac7d775), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d777), EConversationDebugInfo::Executing);
                // ESPECIALLY as we've already established Saturas' great ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195410"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel06);
                DC(int64(0x566cb0e83ac7d777), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d787), EConversationDebugInfo::Executing);
                
                // ... Guess you're right. 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195642"));
                DC(int64(0x566cb0e83ac7d787), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_110086 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x566cb0e83ac7d6f3);
            default Caption = LocText("TEXT_WIP_FGXCIAC_20240909_194201_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_110086);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x566cb0e83ac7d754), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x566cb0e83ac7d6f4), EConversationDebugInfo::Executing);
                // I'm a mercenary. I can't betray the Water Mages like ...
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_194201_3436"));
                DC(int64(0x566cb0e83ac7d6f4), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d769), EConversationDebugInfo::Executing);
                
                // (sighs) You soldiers. Always so straightlaced. 
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195258"));
                DC(int64(0x566cb0e83ac7d769), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d76a), EConversationDebugInfo::Executing);
                // Listen, I'm not going to make light of whatever noble ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195309"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x566cb0e83ac7d76a), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d77d), EConversationDebugInfo::Executing);
                // But you've BEEN to the Sleeper Temple - you've seen that ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195353"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel05);
                DC(int64(0x566cb0e83ac7d77d), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d77e), EConversationDebugInfo::Executing);
                // ESPECIALLY as we've already established Saturas' great ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195410"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel06);
                DC(int64(0x566cb0e83ac7d77e), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d789), EConversationDebugInfo::Executing);
                
                // ... Guess you're right. 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195642"));
                DC(int64(0x566cb0e83ac7d789), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_110108 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x566cb0e83ac7d6fc);
            default Caption = LocText("TEXT_WIP_FGXCIAC_20240909_194338_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_110108);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x566cb0e83ac7d6fd), EConversationDebugInfo::Executing);
                // I'm not sure about this. Is there really no other way? 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_194338_3286"));
                DC(int64(0x566cb0e83ac7d6fd), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d784), EConversationDebugInfo::Executing);
                
                // (deep sigh) Look, I understand your ... need for peace ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195558"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel04);
                DC(int64(0x566cb0e83ac7d784), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d785), EConversationDebugInfo::Executing);
                // But you've BEEN to the Sleeper Temple - you've seen that ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195353"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel05);
                DC(int64(0x566cb0e83ac7d785), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d786), EConversationDebugInfo::Executing);
                // ESPECIALLY as we've already established Saturas' great ...
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195410"), Posture = GameplayTag::Posture_Standing_Forced_ChargeUriziel06);
                DC(int64(0x566cb0e83ac7d786), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d78a), EConversationDebugInfo::Executing);
                
                // ... Guess you're right. 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195642"));
                DC(int64(0x566cb0e83ac7d78a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Xardas_111753 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0x566cb0e83ac7d78b);
            default Caption = LocText("TEXT_WIP_FGXCIAC_20240909_195717_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Xardas_111753);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x566cb0e83ac7d78c), EConversationDebugInfo::Executing);
                // Alright, then. Seems like this is the only way. 
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195717_686"));
                DC(int64(0x566cb0e83ac7d78c), EConversationDebugInfo::Done);
                DC(int64(0x566cb0e83ac7d794), EConversationDebugInfo::Executing);
                
                // It is. 
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_195727"));
                DC(int64(0x566cb0e83ac7d794), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasLoadsword09 : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2721);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090827_1221");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Sixth);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a2722), Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE != nullptr && Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE.HasSucceeded());
                    DB(int64(0xa419a445a28a2723), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x31cfd98d4dc07a4e), G1R != nullptr && G1R.HasReachedChapter(5));
                    DB(int64(0xcfd33f16f0d27470), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_6));
                    DB(int64(0xcfd33f16f0d27471), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5));
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE != nullptr && !Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(5))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_6))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2724), EConversationDebugInfo::Executing);
                
                // Can you initiate me into the Sixth Circle of magic? 
                Hero.AI.Say(LocText("INFO_XARDAS_LOADSWORD09_15_01"));
                DC(int64(0xa419a445a28a2724), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_TeachMagic);
                DB(int64(0xa419a445a28a2728), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_6));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_6))
                {
                    DC(int64(0xa419a445a28a2729), EConversationDebugInfo::Executing);
                    // Fine. You're capable enough.
                    Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD09_14_02"));
                    DC(int64(0xa419a445a28a2729), EConversationDebugInfo::Done);
                    DC(int64(0xa419a445a28a272a), EConversationDebugInfo::Executing);
                    // But in case you weren't aware of its reputation: It's ...
                    Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD09_14_03"));
                    DC(int64(0xa419a445a28a272a), EConversationDebugInfo::Done);
                    DC(int64(0xa419a445a28a272b), EConversationDebugInfo::Executing);
                    // Why is that, you think?
                    Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD09_14_04"));
                    DC(int64(0xa419a445a28a272b), EConversationDebugInfo::Done);
                    DC(int64(0x1a19c74c0a9e0e2c), EConversationDebugInfo::Executing);
                    
                    // Because the spells channel Beliar's powers?
                    Hero.AI.Say(LocText("TEXT_WIP_LVEVHHJ_20240930_200740"));
                    DC(int64(0x1a19c74c0a9e0e2c), EConversationDebugInfo::Done);
                    DC(int64(0xa419a445a28a272c), EConversationDebugInfo::Executing);
                    
                    // Precisely. It's one thing for a god to breathe life into ...
                    Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD09_14_05"));
                    DC(int64(0xa419a445a28a272c), EConversationDebugInfo::Done);
                    DC(int64(0xa419a445a28a272d), EConversationDebugInfo::Executing);
                    // There aren't many spells as severe as those. And there's ...
                    Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD09_14_06"));
                    DC(int64(0xa419a445a28a272d), EConversationDebugInfo::Done);
                    DC(int64(0xa419a445a28a2733), EConversationDebugInfo::Executing);
                    Hero.SetTrueGuild(UGE_Guild_Human_DemonSummoner);
                    DC(int64(0xa419a445a28a2733), EConversationDebugInfo::Done);
                    DC(int64(0xa419a445a28a2734), EConversationDebugInfo::Executing);
                    G1R.Info_Xardas_LOADSWORD09_permanent = 0;
                    DC(int64(0xa419a445a28a2734), EConversationDebugInfo::Done);
                    DC(int64(0x31cfd98d4dc07a64), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_6);
                    DC(int64(0x31cfd98d4dc07a64), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_loadsword09_exit_1");
                    DC(int64(0xa419a445a28a2735), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa419a445a28a2735), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xa419a445a28a2736), EConversationDebugInfo::Executing);
                    // Not yet. You have the skill, but you're not experienced ...
                    Xardas.AI.Say(LocText("INFO_XARDAS_LOADSWORD09_14_07"));
                    DC(int64(0xa419a445a28a2736), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardas_loadsword09_exit_2");
                    DC(int64(0xa419a445a28a2737), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa419a445a28a2737), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceXardasMakerunedoit : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a270c);
            default Caption = LocText("INFO_XARDAS_MAKERUNEDOIT_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasSwordloaded);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_XARDAS_ALTRUNE_15_01"), int64(0xa419a445a28a270c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a270d), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a270f), EConversationDebugInfo::Executing);
                // Do it, then. Remove the rune.
                Hero.AI.Say(LocText("INFO_XARDAS_MAKERUNEDOIT_15_01"));
                DC(int64(0xa419a445a28a270f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XT_DMB_XARDAS, Document::UDocumentSegment_Glossary_XT_DMB_XARDAS_UrizielRune);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_Rune);
                DC(int64(0xa419a445a28a2711), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: has_talent */ false)
                {
                    DC(int64(0xa419a445a28a2712), EConversationDebugInfo::Executing);
                    // I can - but a word of warning: you're not ready yet. ...
                    Xardas.AI.Say(LocText("INFO_XARDAS_MAKERUNEDOIT_14_02"));
                    DC(int64(0xa419a445a28a2712), EConversationDebugInfo::Done);
                }
                DC(int64(0xa419a445a28a2713), EConversationDebugInfo::Executing);
                // Once I remove it, its bond with the blade will break. ...
                Xardas.AI.Say(LocText("INFO_XARDAS_MAKERUNEDOIT_14_03"));
                DC(int64(0xa419a445a28a2713), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17d0a), EConversationDebugInfo::Executing);
                // Are you sure you want me to do this?
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_221147"));
                DC(int64(0x2fd8c43f58a17d0a), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceXardasMakeruneYes,
                    UChoiceXardasMakeruneNo
                );
            }
        }
        
        
        class UChoiceXardasMakeruneYes : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xe8603e87342bff86);
            default Caption = LocText("INFO_XARDAS_MAKERUNEDOIT_15_04");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2716), EConversationDebugInfo::Executing);
                // Yes, do it. I want the rune.
                Hero.AI.Say(LocText("INFO_XARDAS_MAKERUNEDOIT_15_04"));
                DC(int64(0xa419a445a28a2716), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2717), EConversationDebugInfo::Executing);
                
                // All right then. This shouldn't take long.
                Xardas.AI.Say(LocText("INFO_XARDAS_MAKERUNEDOIT_14_05"));
                DC(int64(0xa419a445a28a2717), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17d0b), EConversationDebugInfo::Executing);
                // Here you go. May it serve you well. Now go, and be fast. ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_221239"));
                DC(int64(0x2fd8c43f58a17d0b), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2718), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMw_2H_Sword_Uriziel_03, 1, 0);
                DC(int64(0xa419a445a28a2718), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2719), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItAr_Rune_UrizielWaveOfDeath, 1);
                DC(int64(0xa419a445a28a2719), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasMakeruneNo : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xe8603e87342bff90);
            default Caption = LocText("INFO_XARDAS_MAKERUNEDOIT_15_06");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a271f), EConversationDebugInfo::Executing);
                // Let me think about it.
                Hero.AI.Say(LocText("INFO_XARDAS_MAKERUNEDOIT_15_06"));
                DC(int64(0xa419a445a28a271f), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2720), EConversationDebugInfo::Executing);
                
                // Fine - but don't think too long. Our time is running ...
                Xardas.AI.Say(LocText("INFO_XARDAS_MAKERUNEDOIT_14_07"));
                DC(int64(0xa419a445a28a2720), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasOthers : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2611);
            default Caption = LocText("INFO_XARDAS_OTHERS_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasDisturb);
            default Rules.HideIfKnows(UChoiceXardasOthers);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb1fb8ab2d1c7afa1), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted());
                }
                
                return Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2612), EConversationDebugInfo::Executing);
                
                // Did others make it up here?
                Hero.AI.Say(LocText("INFO_XARDAS_OTHERS_15_01"));
                DC(int64(0xa419a445a28a2612), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2613), EConversationDebugInfo::Executing);
                
                // Alive? No.
                Xardas.AI.Say(LocText("INFO_XARDAS_OTHERS_14_02"));
                DC(int64(0xa419a445a28a2613), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e48447503ab), EConversationDebugInfo::Executing);
                // Now - I'm listening. 
                Xardas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_191125"));
                DC(int64(0xe6a87e48447503ab), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasSaturas : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2615);
            default Caption = LocText("INFO_XARDAS_SATURAS_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasDisturb);
            default Rules.HideIfKnows(UChoiceXardasSaturas);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2616), EConversationDebugInfo::Executing);
                
                // Saturas sent me. 
                Hero.AI.Say(LocText("INFO_XARDAS_SATURAS_15_01"));
                DC(int64(0xa419a445a28a2616), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2617), EConversationDebugInfo::Executing);
                // We managed to get the focus stones, but they need ...
                Hero.AI.Say(LocText("INFO_XARDAS_SATURAS_15_02"));
                DC(int64(0xa419a445a28a2617), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2618), EConversationDebugInfo::Executing);
                
                // (Sighs) No. 
                Xardas.AI.Say(LocText("INFO_XARDAS_SATURAS_14_03"));
                DC(int64(0xa419a445a28a2618), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2619), EConversationDebugInfo::Executing);
                
                // No? 
                Hero.AI.Say(LocText("INFO_XARDAS_SATURAS_15_04"));
                DC(int64(0xa419a445a28a2619), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a261a), EConversationDebugInfo::Executing);
                
                // Forget about Saturas and his glittering pile of ore. ...
                Xardas.AI.Say(LocText("INFO_XARDAS_SATURAS_14_05"));
                DC(int64(0xa419a445a28a261a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasSleeper : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a2620);
            default Caption = LocText("INFO_XARDAS_SLEEPER_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasDisturb);
            default Rules.HideIfKnows(UChoiceXardasSleeper);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_UJNSYIC_20240528_145310"), int64(0xa419a445a28a2620));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2621), EConversationDebugInfo::Executing);
                
                // The Brotherhood has fallen apart.
                Hero.AI.Say(LocText("INFO_XARDAS_SLEEPER_15_01"));
                DC(int64(0xa419a445a28a2621), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2622), EConversationDebugInfo::Executing);
                // It seems the Sleeper they worshipped is a demon the orcs ...
                Hero.AI.Say(LocText("INFO_XARDAS_SLEEPER_15_02"));
                DC(int64(0xa419a445a28a2622), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb974241b1), EConversationDebugInfo::Executing);
                
                // Incredible. If only I had known.
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_135817"));
                DC(int64(0x8fe8e6cb974241b1), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2623), EConversationDebugInfo::Executing);
                
                // I take it, this isn't news to you?
                Hero.AI.Say(LocText("INFO_XARDAS_SLEEPER_15_03"));
                DC(int64(0xa419a445a28a2623), EConversationDebugInfo::Done);
                DC(int64(0xa419a445a28a2624), EConversationDebugInfo::Executing);
                
                // No. But I appreciate you risking your life just to play ...
                Xardas.AI.Say(LocText("INFO_XARDAS_SLEEPER_14_04"));
                DC(int64(0xa419a445a28a2624), EConversationDebugInfo::Done);
                DC(int64(0x8fe8e6cb974241b2), EConversationDebugInfo::Executing);
                // Unless, that is, there was something else you sought me ...
                Xardas.AI.Say(LocText("TEXT_WIP_UJNSYIC_20240528_135940"));
                DC(int64(0x8fe8e6cb974241b2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasSwordloaded : UTopic_Hero__XT_DMB_XARDAS_404
        {
            default DebugId = int64(0xa419a445a28a26ff);
            default Caption = LocText("INFO_XARDAS_SWORDLOADED_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceXardasSwordloaded);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"IO_XT_INSCRIPTION_02", 4000.0f, int64(0xa419a445a28a26ff));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa419a445a28a2700), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa419a445a28a2701), EConversationDebugInfo::Executing);
                
                // We did it. We recharged Uriziel.
                Hero.AI.Say(LocText("INFO_XARDAS_SWORDLOADED_15_01"));
                DC(int64(0xa419a445a28a2701), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17ce5), EConversationDebugInfo::Executing);
                
                // I know. I felt the magic the second you set foot into my ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_220135"));
                DC(int64(0x2fd8c43f58a17ce5), EConversationDebugInfo::Done);
                DC(int64(0x65136567c769807e), EConversationDebugInfo::Executing);
                // It truly is incredibly powerful. Well done, boy - this ...
                Xardas.AI.Say(LocText("TEXT_WIP_XWVMEJE_20240801_174514"));
                DC(int64(0x65136567c769807e), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17ce6), EConversationDebugInfo::Executing);
                
                // Back into the Sleeper temple, I presume?
                Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_220422"));
                DC(int64(0x2fd8c43f58a17ce6), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17ce7), EConversationDebugInfo::Executing);
                
                // You presume right. Something has happened in the orc ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_220429"));
                DC(int64(0x2fd8c43f58a17ce7), EConversationDebugInfo::Done);
                DC(int64(0x2fd8c43f58a17ce8), EConversationDebugInfo::Executing);
                // Either way, you have to be fast. Find a way back into ...
                Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_220501"));
                DC(int64(0x2fd8c43f58a17ce8), EConversationDebugInfo::Done);
                DB(int64(0xfd2b18cf051e04d3), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_XARDAS_ALTRUNE_15_01")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("INFO_XARDAS_ALTRUNE_15_01")))
                {
                    DC(int64(0x2fd8c43f58a17d09), EConversationDebugInfo::Executing);
                    // I'm still bad with a sword, though. You said-
                    Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_220804"));
                    DC(int64(0x2fd8c43f58a17d09), EConversationDebugInfo::Done);
                    DC(int64(0x65136567c769807f), EConversationDebugInfo::Executing);
                    
                    // I did not forget. I can turn Uriziel's gems into a rune.
                    Xardas.AI.Say(LocText("TEXT_WIP_XWVMEJE_20240801_180158"));
                    DC(int64(0x65136567c769807f), EConversationDebugInfo::Done);
                    DC(int64(0xa419a445a28a2708), EConversationDebugInfo::Executing);
                    // I'm not sure what kind of spell it will hold, but I have ...
                    Xardas.AI.Say(LocText("INFO_XARDAS_MAKERUNE_14_04"));
                    DC(int64(0xa419a445a28a2708), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_URIZIEL, Document::UDocumentSegment_CH5_URIZIEL_RuneOffer);
                }
                else
                {
                    DC(int64(0x2fd8c43f58a17cff), EConversationDebugInfo::Executing);
                    // I'll handle it.
                    Hero.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_220702"));
                    DC(int64(0x2fd8c43f58a17cff), EConversationDebugInfo::Done);
                    DC(int64(0x2fd8c43f58a17d00), EConversationDebugInfo::Executing);
                    
                    // I know you will.
                    Xardas.AI.Say(LocText("TEXT_WIP_WRDAKHC_20240812_220702_2238"));
                    DC(int64(0x2fd8c43f58a17d00), EConversationDebugInfo::Done);
                }
                DC(int64(0xf6453bf67b3b7b5), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN.SucceedQuest();
                DC(int64(0xf6453bf67b3b7b5), EConversationDebugInfo::Done);
                DC(int64(0xf6453bf67b3b8b7), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER6_SLEEPER.StartQuest();
                DC(int64(0xf6453bf67b3b8b7), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */