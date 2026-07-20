#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_GUR_BAALCADAR_1208 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_GUR_BAALCADAR_1208";
        }
        
        
        class UTopic_Hero__SC_GUR_BAALCADAR_1208 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_BAALCADAR_1208";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalCadar() const property
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
            
            AGothicCharacterState GetSC_NOV_NOVICE19_1326() const property
            {
                return GetCharacter(n"SC_NOV_NOVICE19_1326");
            }
            
            AGothicCharacterState GetSC_NOV_NOVICE25_1336() const property
            {
                return GetCharacter(n"SC_NOV_NOVICE25_1336");
            }
            
            AGothicCharacterState GetSC_NOV_Novice29_1340() const property
            {
                return GetCharacter(n"SC_NOV_Novice29_1340");
            }
            
            AGothicCharacterState GetSC_NOV_Novice34_1345() const property
            {
                return GetCharacter(n"SC_NOV_Novice34_1345");
            }
        }
        
        
        class UChoiceBaalcadar113694 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xa7deef969d1cb40e);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_121504_110");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Inscription);
            
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
                DC(int64(0xa7deef969d1cb40c), EConversationDebugInfo::Executing);
                // Can you teach me how to craft magical scrolls? 
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135311"));
                DC(int64(0xa7deef969d1cb40c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALCADAR, Document::UDocumentSegment_Glossary_SC_GUR_BAALCADAR_TeacherInscription);
                DB(int64(0xa7deef969d1cb411), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Inscription));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Inscription))
                {
                    DB(int64(0xf11f5810a9502243), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Inscription));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Inscription))
                    {
                        DC(int64(0xa7deef969d1cb414), EConversationDebugInfo::Executing);
                        // I suppose I can. To create a scroll, you'll first need a ...
                        BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135406"));
                        DC(int64(0xa7deef969d1cb414), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb418), EConversationDebugInfo::Executing);
                        // Real scroll paper, not some hide or rags. They're not ...
                        BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135535"));
                        DC(int64(0xa7deef969d1cb418), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb419), EConversationDebugInfo::Executing);
                        // You'll also need the glyphs for the spell you're trying ...
                        BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135705"));
                        DC(int64(0xa7deef969d1cb419), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb41a), EConversationDebugInfo::Executing);
                        // Once you have both, find yourself a scribing desk and ...
                        BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135728"));
                        DC(int64(0xa7deef969d1cb41a), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb41b), EConversationDebugInfo::Executing);
                        // It'll take a lot of focus, willpower, and resources, but ...
                        BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135755"));
                        DC(int64(0xa7deef969d1cb41b), EConversationDebugInfo::Done);
                        DC(int64(0xf11f5810a950228a), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Inscription);
                        DC(int64(0xf11f5810a950228a), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e8358415d), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_Charm);
                        DC(int64(0x9733703e8358415d), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e8358415f), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_Control);
                        DC(int64(0x9733703e8358415f), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584161), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformMeatbug);
                        DC(int64(0x9733703e83584161), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584163), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformMolerat);
                        DC(int64(0x9733703e83584163), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584165), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformScavenger);
                        DC(int64(0x9733703e83584165), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584167), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformWolf);
                        DC(int64(0x9733703e83584167), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_baalcadar_113694_exit_1");
                        DC(int64(0xf11f5810a950228e), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf11f5810a950228e), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1cb439), EConversationDebugInfo::Executing);
                        // Some lessons are for free, but this one isn't, Brother. ...
                        BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_140119"));
                        DC(int64(0xa7deef969d1cb439), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_baalcadar_113694_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb412), EConversationDebugInfo::Executing);
                    // You've got a few more things to learn first. Come back ...
                    BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135401"));
                    DC(int64(0xa7deef969d1cb412), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalcadar_113694_exit_3");
                }
            }
        }
        
        
        class UChoiceBaalcadar145962 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xc2bbabf13f180c18);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaalcadar145962);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_YQBMRVC_20240430_124507"), int64(0xc2bbabf13f180c18));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bc7), Hero != nullptr && Hero.IsCloseToCharacter(BaalCadar, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(BaalCadar, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc2bbabf13f180c14), EConversationDebugInfo::Executing);
                // What? Oh, forgive me. I was ... lost in thought.
                BaalCadar.AI.Say(LocText("TEXT_WIP_HVXGRO_20250129_152434_1769"));
                DC(int64(0xc2bbabf13f180c14), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalcadarExit : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7c3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7c4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdef916aff27af7c4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalcadarNotalk : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7c5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdef916aff27af7c6), BaalCadar != nullptr && BaalCadar.IsInConversation());
                    DB(int64(0xdef916aff27af7c7), G1R.BaalCadar_responsive == 0);
                    DB(int64(0xdef916aff27af7c9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (BaalCadar != nullptr && !BaalCadar.IsInConversation())
                    return false;
                
                if (G1R.BaalCadar_responsive != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALCADAR, Document::UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Introduction);
                DB(int64(0x14efdc7c8b96db94), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALCADAR, Document::UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Ignore);
                }
                Subdialog(
                    UChoiceBaalcadarNotalkImp,
                    UChoiceBaalcadarNotalkSleeper,
                    UChoiceBaalcadarNotalkHi,
                    UBaalCadar_109620
                );
            }
        }
        
        
        class UChoiceBaalcadarNotalkImp : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7cb);
            default Caption = LocText("DIA_BAALCADAR_NOTALK_IMP_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7cc), EConversationDebugInfo::Executing);
                // You look like a powerful man, master.
                Hero.AI.Say(LocText("DIA_BAALCADAR_NOTALK_IMP_15_00"));
                DC(int64(0xdef916aff27af7cc), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7cd), EConversationDebugInfo::Executing);
                
                // (scoffs in annoyance)
                BaalCadar.AI.Say(LocText("DIA_BAALCADAR_NOTALK_IMP_02_01"));
                DC(int64(0xdef916aff27af7cd), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7ce), EConversationDebugInfo::Executing);
                G1R.BaalCadar_Sacrilege = 1;
                DC(int64(0xdef916aff27af7ce), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7cf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdef916aff27af7cf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalcadarNotalkSleeper : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7d0);
            default Caption = LocText("DIA_BAALCADAR_NOTALK_SLEEPER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7d1), EConversationDebugInfo::Executing);
                // Master, your head is quite shiny today.
                Hero.AI.Say(LocText("DIA_BAALCADAR_NOTALK_SLEEPER_15_00"));
                DC(int64(0xdef916aff27af7d1), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7d2), EConversationDebugInfo::Executing);
                
                // (annoyed sigh)
                BaalCadar.AI.Say(LocText("DIA_BAALCADAR_NOTALK_SLEEPER_02_01"));
                DC(int64(0xdef916aff27af7d2), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7d3), EConversationDebugInfo::Executing);
                G1R.BaalCadar_Sacrilege = 1;
                DC(int64(0xdef916aff27af7d3), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7d4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdef916aff27af7d4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalcadarNotalkHi : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7d5);
            default Caption = LocText("DIA_BAALCADAR_NOTALK_HI_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7d6), EConversationDebugInfo::Executing);
                // I want to become a novice. Can you help me?
                Hero.AI.Say(LocText("DIA_BAALCADAR_NOTALK_HI_15_00"));
                DC(int64(0xdef916aff27af7d6), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7d7), EConversationDebugInfo::Executing);
                
                // (deep, tired sigh)
                BaalCadar.AI.Say(LocText("DIA_BAALCADAR_NOTALK_HI_02_01"));
                DC(int64(0xdef916aff27af7d7), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7d8), EConversationDebugInfo::Executing);
                G1R.BaalCadar_Sacrilege = 1;
                DC(int64(0xdef916aff27af7d8), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7d9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdef916aff27af7d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalCadar_109620 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0x17d303b625fb150a);
            default Caption = LocText("TEXT_WIP_NTVBIZH_20241002_145207_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x17d303b625fb150b), EConversationDebugInfo::Executing);
                // Good chat.
                Hero.AI.Say(LocText("TEXT_WIP_NTVBIZH_20241002_145207_41"));
                DC(int64(0x17d303b625fb150b), EConversationDebugInfo::Done);
                DC(int64(0x17d303b625fb1514), EConversationDebugInfo::Executing);
                
                // (deep, tired sigh)
                BaalCadar.AI.Say(LocText("DIA_BAALCADAR_NOTALK_HI_02_01"));
                DC(int64(0x17d303b625fb1514), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7d8), EConversationDebugInfo::Executing);
                G1R.BaalCadar_Sacrilege = 1;
                DC(int64(0xdef916aff27af7d8), EConversationDebugInfo::Done);
                DC(int64(0x17d303b625fb151f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x17d303b625fb151f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalcadarSleepspell : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7da);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBaalcadarSleepspell);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdef916aff27af7dd), SC_NOV_NOVICE19_1326 != nullptr && SC_NOV_NOVICE19_1326.HasDebuff(GameplayTag::Debuff_Sleep));
                    DB(int64(0xdef916aff27af7de), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded());
                    DB(int64(0x646f6c8d1ce4962e), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xdef916aff27af7db), SC_NOV_NOVICE25_1336 != nullptr && SC_NOV_NOVICE25_1336.HasDebuff(GameplayTag::Debuff_Sleep));
                    DB(int64(0xdef916aff27af7dc), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded());
                    DB(int64(0x646f6c8d1ce4962d), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xdef916aff27af7dd), SC_NOV_Novice29_1340 != nullptr && SC_NOV_Novice29_1340.HasDebuff(GameplayTag::Debuff_Sleep));
                    DB(int64(0xdef916aff27af7de), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded());
                    DB(int64(0x646f6c8d1ce4962e), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xdef916aff27af7df), SC_NOV_Novice34_1345 != nullptr && SC_NOV_Novice34_1345.HasDebuff(GameplayTag::Debuff_Sleep));
                    DB(int64(0xdef916aff27af7e0), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded());
                    DB(int64(0x646f6c8d1ce4962f), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (SC_NOV_NOVICE19_1326 != nullptr && SC_NOV_NOVICE19_1326.HasDebuff(GameplayTag::Debuff_Sleep) && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded() && G1R != nullptr && !G1R.HasReachedChapter(2))
                    return true;
                
                if (SC_NOV_NOVICE25_1336 != nullptr && SC_NOV_NOVICE25_1336.HasDebuff(GameplayTag::Debuff_Sleep) && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded() && G1R != nullptr && !G1R.HasReachedChapter(2))
                    return true;
                
                if (SC_NOV_Novice29_1340 != nullptr && SC_NOV_Novice29_1340.HasDebuff(GameplayTag::Debuff_Sleep) && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded() && G1R != nullptr && !G1R.HasReachedChapter(2))
                    return true;
                
                if (SC_NOV_Novice34_1345 != nullptr && SC_NOV_Novice34_1345.HasDebuff(GameplayTag::Debuff_Sleep) && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded() && G1R != nullptr && !G1R.HasReachedChapter(2))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7e1), EConversationDebugInfo::Executing);
                // What do you think you're doing? We are meditating here!
                BaalCadar.AI.Say(LocText("DIA_BAALCADAR_SLEEPSPELL_02_00"));
                DC(int64(0xdef916aff27af7e1), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7e2), EConversationDebugInfo::Executing);
                // Then again, I've never seen an outsider use the ...
                BaalCadar.AI.Say(LocText("DIA_BAALCADAR_SLEEPSPELL_02_01"));
                DC(int64(0xdef916aff27af7e2), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7e3), EConversationDebugInfo::Executing);
                
                // No one. I just read the scroll. 
                Hero.AI.Say(LocText("DIA_BAALCADAR_SLEEPSPELL_15_02"));
                DC(int64(0xdef916aff27af7e3), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7e4), EConversationDebugInfo::Executing);
                
                // Well, not everybody can theory into practice right away. ...
                BaalCadar.AI.Say(LocText("DIA_BAALCADAR_SLEEPSPELL_02_03"));
                DC(int64(0xdef916aff27af7e4), EConversationDebugInfo::Done);
                DC(int64(0x73bd91e3a5fb1890), EConversationDebugInfo::Executing);
                // I've seen you mill about the camp ... you're looking to ...
                BaalCadar.AI.Say(LocText("TEXT_WIP_MTCTNOC_20240209_173139"));
                DC(int64(0x73bd91e3a5fb1890), EConversationDebugInfo::Done);
                DC(int64(0x73bd91e3a5fb1891), EConversationDebugInfo::Executing);
                // Now off with you - you're disrupting our lesson. 
                BaalCadar.AI.Say(LocText("TEXT_WIP_MTCTNOC_20240209_173218"));
                DC(int64(0x73bd91e3a5fb1891), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALCADAR, Document::UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_CadarImpressed);
                DC(int64(0xdef916aff27af7e5), EConversationDebugInfo::Executing);
                G1R.BaalCadar_responsive = 1;
                DC(int64(0xdef916aff27af7e5), EConversationDebugInfo::Done);
                DC(int64(0x1a34e2931ab9dbc4), EConversationDebugInfo::Executing);
                G1R.Kalom_Counter += 1;
                DC(int64(0x1a34e2931ab9dbc4), EConversationDebugInfo::Done);
                DC(int64(0x7e5d602938fe6d62), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR.SucceedQuest();
                DC(int64(0x7e5d602938fe6d62), EConversationDebugInfo::Done);
                DB(int64(0x1a34e2931ab9dbc6), G1R.Kalom_Counter >= 2);
                DB(int64(0x1547dbe6d32bec5e), G1R.CaineVanished == 0);
                
                if (G1R.Kalom_Counter >= 2 && G1R.CaineVanished == 0)
                {
                    DC(int64(0x1a34e2931ab9dbc8), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Caine_1301_Dead); }
                    DC(int64(0x1a34e2931ab9dbc8), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82bc), EConversationDebugInfo::Executing);
                    G1R.ActivateStoryDataLayer("FindingCaine");
                    DC(int64(0x608d6fba46cd82bc), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82c2), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnFindingCaine");
                    DC(int64(0x608d6fba46cd82c2), EConversationDebugInfo::Done);
                    DC(int64(0x1547dbe6d32bec4b), EConversationDebugInfo::Executing);
                    G1R.CaineVanished = 1;
                    DC(int64(0x1547dbe6d32bec4b), EConversationDebugInfo::Done);
                    DC(int64(0x28003880c3e01fd5), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.NPCState.RemoveFromWorld(); }
                    DC(int64(0x28003880c3e01fd5), EConversationDebugInfo::Done);
                }
                DB(int64(0xdef916aff27af7e7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0xdef916aff27af7e8), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI.StartQuest();
                    DC(int64(0xdef916aff27af7e8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalcadar_sleepspell_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_baalcadar_sleepspell_exit_2");
                }
            }
        }
        
        
        class UChoiceGur1208BaalcadarFirsttest : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7f2);
            default Caption = LocText("GUR_1208_BAALCADAR_FIRSTTEST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGur1208BaalcadarFirsttest);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8d84be1b2207757a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7f3), EConversationDebugInfo::Executing);
                // I want to learn rune magic.
                Hero.AI.Say(LocText("GUR_1208_BAALCADAR_FIRSTTEST_INFO_15_01"));
                DC(int64(0xdef916aff27af7f3), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7f4), EConversationDebugInfo::Executing);
                
                // Hmm ... fine, I shall try. 
                BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_FIRSTTEST_INFO_02_02"));
                DC(int64(0xdef916aff27af7f4), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7f5), EConversationDebugInfo::Executing);
                // Many can learn to understand the language of the runes, ...
                BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_FIRSTTEST_INFO_02_03"));
                DC(int64(0xdef916aff27af7f5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGur1208BaalcadarKreis1 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7f6);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090826_2776");
            default PriorityRank = 1;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_First);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGur1208BaalcadarFirsttest);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdef916aff27af7f7), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x31cfd98d4dbffe43), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x8f17b9411eb40d7a), G1R.Magician_Level < 1);
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (G1R.Magician_Level >= 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7f8), EConversationDebugInfo::Executing);
                
                // I'm ready to enter the First Circle.
                Hero.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS1_INFO_15_01"));
                DC(int64(0xdef916aff27af7f8), EConversationDebugInfo::Done);
                DB(int64(0x8f17b9411eb40d3a), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_1));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_1))
                {
                    DC(int64(0xdef916aff27af7fa), EConversationDebugInfo::Executing);
                    // Very well. Listen closely:
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS1_INFO_02_02"));
                    DC(int64(0xdef916aff27af7fa), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af7fb), EConversationDebugInfo::Executing);
                    // Many years ago, the Sleeper sent the wretched souls of ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS1_INFO_02_03"));
                    DC(int64(0xdef916aff27af7fb), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af7fc), EConversationDebugInfo::Executing);
                    // Alas, many ignored his calling, blinded as they were by ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS1_INFO_02_04"));
                    DC(int64(0xdef916aff27af7fc), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af7fd), EConversationDebugInfo::Executing);
                    // Only Y'Berion and a few others heeded it, and it was ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS1_INFO_02_05"));
                    DC(int64(0xdef916aff27af7fd), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af7fe), EConversationDebugInfo::Executing);
                    // The moment they accepted the Sleeper into their souls ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS1_INFO_02_06"));
                    DC(int64(0xdef916aff27af7fe), EConversationDebugInfo::Done);
                    DC(int64(0x6b673100f2bfcb99), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_1);
                    DC(int64(0x6b673100f2bfcb99), EConversationDebugInfo::Done);
                    DC(int64(0x8f17b9411eb40d79), EConversationDebugInfo::Executing);
                    G1R.Magician_Level = 1;
                    DC(int64(0x8f17b9411eb40d79), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis1_exit_1");
                    DC(int64(0xdef916aff27af800), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xdef916aff27af800), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x8f17b9411eb40d49), EConversationDebugInfo::Executing);
                    // You've got a few more things to learn first. Come back ...
                    BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135401"));
                    DC(int64(0x8f17b9411eb40d49), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis1_exit_2");
                }
            }
        }
        
        
        class UChoiceGur1208BaalcadarKreis2 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af801);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090826_1103");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Second);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6b673100f2bfcb9a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x31cfd98d4dbffe44), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x31cfd98d4dbffe45), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0xccf003b89dcf4579), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0xccf003b89dcf457a), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af803), EConversationDebugInfo::Executing);
                // I am ready to enter the Second Circle.
                Hero.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS2_INFO_15_01"));
                DC(int64(0xdef916aff27af803), EConversationDebugInfo::Done);
                DB(int64(0x8f17b9411eb40d90), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2))
                {
                    DC(int64(0xdef916aff27af805), EConversationDebugInfo::Executing);
                    // Then hear my words and be enlightened.
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS2_INFO_02_02"));
                    DC(int64(0xdef916aff27af805), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af806), EConversationDebugInfo::Executing);
                    // The Sleeper guided Y'Berion and his faithful acolytes to ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS2_INFO_02_03"));
                    DC(int64(0xdef916aff27af806), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af807), EConversationDebugInfo::Executing);
                    // They worked without respite, days, weeks, months - and ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS2_INFO_02_04"));
                    DC(int64(0xdef916aff27af807), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af808), EConversationDebugInfo::Executing);
                    // And it was through meditation and prayer that they ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS2_INFO_02_05"));
                    DC(int64(0xdef916aff27af808), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af809), EConversationDebugInfo::Executing);
                    // Thus, the Second Circle was born.
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS2_INFO_02_06"));
                    DC(int64(0xdef916aff27af809), EConversationDebugInfo::Done);
                    DC(int64(0x6b673100f2bfcba2), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_2);
                    DC(int64(0x6b673100f2bfcba2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis2_exit_1");
                    DC(int64(0xdef916aff27af80b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xdef916aff27af80b), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x8f17b9411eb40da3), EConversationDebugInfo::Executing);
                    // You've got a few more things to learn first. Come back ...
                    BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135401"));
                    DC(int64(0x8f17b9411eb40da3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis2_exit_2");
                }
            }
        }
        
        
        class UChoiceGur1208BaalcadarKreis3 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af80c);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090826_3477");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Third);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6b673100f2bfcb9a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x31cfd98d4dbffe44), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x31cfd98d4dbffe45), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0xccf003b89dcf4579), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0xccf003b89dcf457a), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af80e), EConversationDebugInfo::Executing);
                // I'm ready for the Third Circle.
                Hero.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS3_INFO_15_01"));
                DC(int64(0xdef916aff27af80e), EConversationDebugInfo::Done);
                DB(int64(0x620d4d49a61485af), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_3));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_3))
                {
                    DC(int64(0xdef916aff27af810), EConversationDebugInfo::Executing);
                    // Then hear my words:
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS3_INFO_02_02"));
                    DC(int64(0xdef916aff27af810), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af811), EConversationDebugInfo::Executing);
                    // The Sleeper's visions grew clearer, but alas, the ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS3_INFO_02_03"));
                    DC(int64(0xdef916aff27af811), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af812), EConversationDebugInfo::Executing);
                    // However, one of the gurus, an alchemist, found a way: he ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS3_INFO_02_04"));
                    DC(int64(0xdef916aff27af812), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af813), EConversationDebugInfo::Executing);
                    // Overjoyed, the novices ventured into the other camps, ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS3_INFO_02_05"));
                    DC(int64(0xdef916aff27af813), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af814), EConversationDebugInfo::Executing);
                    // Thus, the Third Circle was born.
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS3_INFO_02_06"));
                    DC(int64(0xdef916aff27af814), EConversationDebugInfo::Done);
                    DC(int64(0x6b673100f2bfcbac), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_3);
                    DC(int64(0x6b673100f2bfcbac), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis3_exit_1");
                    DC(int64(0xdef916aff27af815), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xdef916aff27af815), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x620d4d49a61485b0), EConversationDebugInfo::Executing);
                    // You've got a few more things to learn first. Come back ...
                    BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135401"));
                    DC(int64(0x620d4d49a61485b0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis3_exit_2");
                }
            }
        }
        
        
        class UChoiceGur1208BaalcadarKreis4 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af816);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090826_755");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Fourth);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6b673100f2bfcb9a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x31cfd98d4dbffe44), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x31cfd98d4dbffe45), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0xccf003b89dcf4579), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0xccf003b89dcf457a), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                    DB(int64(0x77d7135055de58ed), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5));
                    DB(int64(0x77d7135055de58ee), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_6));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_6))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af818), EConversationDebugInfo::Executing);
                // I'm ready to enter the Fourth Circle.
                Hero.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS4_INFO_15_01"));
                DC(int64(0xdef916aff27af818), EConversationDebugInfo::Done);
                DB(int64(0x620d4d49a61485ab), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Mage_Circle_4));
                
                if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Mage_Circle_4))
                {
                    DC(int64(0xdef916aff27af81a), EConversationDebugInfo::Executing);
                    // So be it. Listen to my words: much time has passed since ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS4_INFO_02_02"));
                    DC(int64(0xdef916aff27af81a), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af81b), EConversationDebugInfo::Executing);
                    // Our faith grew stronger. Its roots have sunk deep into ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS4_INFO_02_03"));
                    DC(int64(0xdef916aff27af81b), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af81c), EConversationDebugInfo::Executing);
                    // But we never lost sight of our true calling: to summon ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS4_INFO_02_04"));
                    DC(int64(0xdef916aff27af81c), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af81d), EConversationDebugInfo::Executing);
                    // The strength of our faith, oh Brother, forms the Fourth ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS4_INFO_02_05"));
                    DC(int64(0xdef916aff27af81d), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af81e), EConversationDebugInfo::Executing);
                    // And with this, I have taught you all I know of our ...
                    BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_KREIS4_INFO_02_06"));
                    DC(int64(0xdef916aff27af81e), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af81f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_4);
                    DC(int64(0xdef916aff27af81f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis4_exit_1");
                    DC(int64(0x6b673100f2bfcbb5), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6b673100f2bfcbb5), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x620d4d49a61485b4), EConversationDebugInfo::Executing);
                    // You've got a few more things to learn first. Come back ...
                    BaalCadar.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_135401"));
                    DC(int64(0x620d4d49a61485b4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_kreis4_exit_2");
                }
            }
        }
        
        
        class UChoiceGur1208BaalcadarSellstuff : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af820);
            default Caption = LocText("TEXT_CHOICE_GUR_1208_BAALCADAR_SELLSTUFF");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdef916aff27af821), G1R.BaalCadar_responsive != 0);
                    DB(int64(0xdef916aff27af822), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (G1R.BaalCadar_responsive != 0)
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALCADAR, Document::UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Dealer);
                DB(int64(0x7ec56dc721168cba), BaalCadar != nullptr && BaalCadar.IsAngryTowards(Hero));
                
                if (BaalCadar != nullptr && BaalCadar.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168cc2), EConversationDebugInfo::Executing);
                    // It seems you don't want to grasp the wisdom of the ...
                    BaalCadar.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_120445_1869"));
                    DC(int64(0x7ec56dc721168cc2), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231631f22), EConversationDebugInfo::Executing);
                    // Part of it is showing respect for the Brotherhood, ...
                    BaalCadar.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_152545"));
                    DC(int64(0x81b634f231631f22), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_sellstuff_exit_1");
                    DC(int64(0x7ec56dc721168cc6), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168cc6), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DB(int64(0xdef916aff27af824), G1R.LogBaalcadarsell == 0);
                    
                    if (G1R.LogBaalcadarsell == 0)
                    {
                        DC(int64(0xdef916aff27af825), EConversationDebugInfo::Executing);
                        G1R.LogBaalcadarsell = 1;
                        DC(int64(0xdef916aff27af825), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xdef916aff27af826), EConversationDebugInfo::Executing);
                    // I am looking for scrolls and potions.
                    Hero.AI.Say(LocText("GUR_1208_BAALCADAR_SELLSTUFF_INFO_15_01"));
                    DC(int64(0xdef916aff27af826), EConversationDebugInfo::Done);
                    DC(int64(0xdef916aff27af827), EConversationDebugInfo::Executing);
                    BaalCadar.AI.StartTradingWith(Hero);
                    DC(int64(0xdef916aff27af827), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gur_1208_baalcadar_sellstuff_exit_2");
                }
            }
        }
        
        
        class UChoiceGur1208BaalcadarTeach : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0xdef916aff27af7ea);
            default Caption = LocText("GUR_1208_BAALCADAR_TEACH_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdef916aff27af7eb), G1R.BaalCadar_responsive != 0);
                    DB(int64(0xdef916aff27af7ec), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                if (G1R.BaalCadar_responsive != 0)
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdef916aff27af7ed), EConversationDebugInfo::Executing);
                // I want to improve the power of my magic.
                Hero.AI.Say(LocText("GUR_1208_BAALCADAR_TEACH_INFO_15_01"));
                DC(int64(0xdef916aff27af7ed), EConversationDebugInfo::Done);
                DC(int64(0xdef916aff27af7ee), EConversationDebugInfo::Executing);
                
                // The power of your mind is the key.
                BaalCadar.AI.Say(LocText("GUR_1208_BAALCADAR_TEACH_INFO_02_02"));
                DC(int64(0xdef916aff27af7ee), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALCADAR, Document::UDocumentSegment_Glossary_SC_GUR_BAALCADAR_TeacherMana);
                DB(int64(0xdef916aff27af7f0), G1R.LogBaalcadartrain == 0);
                
                if (G1R.LogBaalcadartrain == 0)
                {
                    DC(int64(0x2901e00d4fe84534), EConversationDebugInfo::Executing);
                    G1R.LogBaalcadartrain = 1;
                    DC(int64(0x2901e00d4fe84534), EConversationDebugInfo::Done);
                }
                DC(int64(0x5225337a9d9cdc5f), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(BaalCadar);
                DC(int64(0x5225337a9d9cdc5f), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGur1208BaalcadarTeachBack,
                    UChoiceGur1208BaalcadarTeachMan5,
                    UBaalCadar_210447
                );
            }
        }
        
        
        class UChoiceGur1208BaalcadarTeachBack : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0x2901e00d4fe84536);
            default Caption = LocText("TEXT_CHOICE_KDW_604_CRONOS_MANA_MAN_1_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2901e00d4fe8453b), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(BaalCadar, 1);
                DC(int64(0x2901e00d4fe8453b), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e99601), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e99601), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGur1208BaalcadarTeachMan5 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0x2901e00d4fe84537);
            default Caption = LocText("TEXT_CHOICE_GUR_1208_BAALCADAR_TEACH_MAN_5");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2901e00d4fe84538), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(BaalCadar, 5);
                DC(int64(0x2901e00d4fe84538), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e99605), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e99605), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalCadar_210447 : UTopic_Hero__SC_GUR_BAALCADAR_1208
        {
            default DebugId = int64(0x6c1e299bd1a513ea);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5225337a9d9cdcbb), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(BaalCadar);
                DC(int64(0x5225337a9d9cdcbb), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */