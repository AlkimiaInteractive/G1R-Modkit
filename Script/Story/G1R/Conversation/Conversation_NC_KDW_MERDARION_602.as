#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_KDW_MERDARION_602 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_KDW_MERDARION_602";
        }
        
        
        class UTopic_Hero__NC_KDW_MERDARION_602 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_MERDARION_602";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMerdarion() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMerdarion111217 : UTopic_Hero__NC_KDW_MERDARION_602
        {
            default DebugId = int64(0xe525574b1fff179c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceMerdarion111217);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd56b128c2225e404), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe525574b1fff17a0), EConversationDebugInfo::Executing);
                // Hello, I'm-
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140137"));
                DC(int64(0xe525574b1fff17a0), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17a1), EConversationDebugInfo::Executing);
                
                // I don't care. 
                Merdarion.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140137_2785"));
                DC(int64(0xe525574b1fff17a1), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17a6), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140208"));
                DC(int64(0xe525574b1fff17a6), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17a7), EConversationDebugInfo::Executing);
                
                // I don't care who you are, what your name is, and what ...
                Merdarion.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140213"));
                DC(int64(0xe525574b1fff17a7), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17a8), EConversationDebugInfo::Executing);
                // I have studies to conduct. Now sod off. 
                Merdarion.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140245"));
                DC(int64(0xe525574b1fff17a8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_MERDARION, Document::UDocumentSegment_Glossary_NC_KDW_MERDARION_Teach);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_MERDARION, Document::UDocumentSegment_Glossary_NC_KDW_MERDARION_Introduction);
            }
        }
        
        
        class UChoiceMerdarion114812 : UTopic_Hero__NC_KDW_MERDARION_602
        {
            default DebugId = int64(0xa7deef969d1cb424);
            default Caption = LocText("TEXT_WIP_CDCKZPD_20241107_135919");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMerdarion114812);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe5c36a26ebcf61d1), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription));
                    DB(int64(0xb1963c358795f358), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb420), EConversationDebugInfo::Executing);
                // Can you teach me how to craft scrolls?
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135919"));
                DC(int64(0xa7deef969d1cb420), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb421), EConversationDebugInfo::Executing);
                
                // Teach? You? That would be a collosal waste of time ... 
                Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135919_443"));
                DC(int64(0xa7deef969d1cb421), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb426), EConversationDebugInfo::Executing);
                
                // Is that a "no?"
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135952"));
                DC(int64(0xa7deef969d1cb426), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb427), EConversationDebugInfo::Executing);
                
                // (sighs) Well, you're one of us now, so I suppose it ...
                Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135955"));
                DC(int64(0xa7deef969d1cb427), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMerdarion114907 : UTopic_Hero__NC_KDW_MERDARION_602
        {
            default DebugId = int64(0x14197298145f7274);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMerdarion114907);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Merdarion, 500.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Merdarion, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f726e), EConversationDebugInfo::Executing);
                // Brother...
                Merdarion.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_110853_3984"));
                DC(int64(0x14197298145f726e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMerdarion132417 : UTopic_Hero__NC_KDW_MERDARION_602
        {
            default DebugId = int64(0xf11f5810a95022a2);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_131249_2238");
            default PriorityRank = 3;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Inscription);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMerdarion114812);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf11f5810a95022b3), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf11f5810a950229e), EConversationDebugInfo::Executing);
                
                // Then teach me. 
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140022"));
                DC(int64(0xf11f5810a950229e), EConversationDebugInfo::Done);
                DB(int64(0xa7deef969d1cb441), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Inscription));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Inscription))
                {
                    DB(int64(0xf11f5810a9502366), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Inscription));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Inscription))
                    {
                        DC(int64(0xa7deef969d1cb451), EConversationDebugInfo::Executing);
                        // Fine then, I suppose it can't be helped. 
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140314"));
                        DC(int64(0xa7deef969d1cb451), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb460), EConversationDebugInfo::Executing);
                        // To create a scroll, you'll first need a proper piece of ...
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140332"));
                        DC(int64(0xa7deef969d1cb460), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb469), EConversationDebugInfo::Executing);
                        // Real scroll paper, not some hide or rags. They're not ...
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140337"));
                        DC(int64(0xa7deef969d1cb469), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb472), EConversationDebugInfo::Executing);
                        // You'll also need the glyphs for the spell you're trying ...
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140346"));
                        DC(int64(0xa7deef969d1cb472), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb47b), EConversationDebugInfo::Executing);
                        // Once you have both, find yourself a scribing desk and ...
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140352"));
                        DC(int64(0xa7deef969d1cb47b), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb484), EConversationDebugInfo::Executing);
                        // It'll take a lot of focus, willpower, and resources, but ...
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140358"));
                        DC(int64(0xa7deef969d1cb484), EConversationDebugInfo::Done);
                        DC(int64(0xf11f5810a950238d), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Inscription);
                        DC(int64(0xf11f5810a950238d), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e8358413a), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_Charm);
                        DC(int64(0x9733703e8358413a), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e8358413c), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_Control);
                        DC(int64(0x9733703e8358413c), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e8358413e), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformMeatbug);
                        DC(int64(0x9733703e8358413e), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584140), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformMolerat);
                        DC(int64(0x9733703e83584140), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584142), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformScavenger);
                        DC(int64(0x9733703e83584142), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584144), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformWolf);
                        DC(int64(0x9733703e83584144), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_merdarion_132417_exit_1");
                        DC(int64(0xf11f5810a9502393), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf11f5810a9502393), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1cb44a), EConversationDebugInfo::Executing);
                        // What, for Adanos's blessings and that silly grin of ...
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140239"));
                        DC(int64(0xa7deef969d1cb44a), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb450), EConversationDebugInfo::Executing);
                        // A donation for the ore pile is the least I expect.
                        Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140309"));
                        DC(int64(0xa7deef969d1cb450), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_merdarion_132417_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb445), EConversationDebugInfo::Executing);
                    // Why would you even bother me about this?
                    Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140205"));
                    DC(int64(0xa7deef969d1cb445), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb449), EConversationDebugInfo::Executing);
                    // Not even the most patient teacher would be able to ...
                    Merdarion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140227"));
                    DC(int64(0xa7deef969d1cb449), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_merdarion_132417_exit_3");
                }
            }
        }
        
        
        class UChoiceMerdarion144587 : UTopic_Hero__NC_KDW_MERDARION_602
        {
            default DebugId = int64(0xcf6cde32246c7eb6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMerdarion144587);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2141), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded());
                    DB(int64(0x9720fc4dba61836a), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0x3f3055364bb570b7), Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")));
                    DB(int64(0x8840daf1ff7c2140), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning());
                    DB(int64(0x9720fc4dba61836b), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0x3f3055364bb570cc), Hero != nullptr && Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")))
                    return true;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && Hero != nullptr && Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7eb0), EConversationDebugInfo::Executing);
                // You. What are you doing? Go speak with Saturas.
                Merdarion.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_141807_2853"));
                DC(int64(0xcf6cde32246c7eb0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMerdarion181783 : UTopic_Hero__NC_KDW_MERDARION_602
        {
            default DebugId = int64(0xd56b128c2225e416);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceMerdarion181783);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_GSVMXID_20241017_140245"), int64(0xd56b128c2225e416));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd56b128c2225e410), EConversationDebugInfo::Executing);
                // Are you deaf? Sod off!
                Merdarion.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140139_3436"));
                DC(int64(0xd56b128c2225e410), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMerdarionExit : UTopic_Hero__NC_KDW_MERDARION_602
        {
            default DebugId = int64(0x2b5ae8d6808cc891);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2b5ae8d6808cc892), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2b5ae8d6808cc892), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */