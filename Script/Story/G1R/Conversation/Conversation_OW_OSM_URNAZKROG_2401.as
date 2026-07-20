#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OSM_URNAZKROG_2401 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OSM_URNAZKROG_2401";
        }
        
        
        class UTopic_Hero__OW_OSM_URNAZKROG_2401 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OSM_URNAZKROG_2401";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUrNazkrog() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGrazkrak() const property
            {
                return GetCharacter(n"OW_OWR_GRAZKRAK_2400");
            }
            
            AGothicCharacterState GetOW_OWR_ORCTEMPLEWARRIORM03_2043() const property
            {
                return GetCharacter(n"OW_OWR_ORCTEMPLEWARRIORM03_2043");
            }
            
            AGothicCharacterState GetOW_OWR_ORCTEMPLEWARRIORM04_2044() const property
            {
                return GetCharacter(n"OW_OWR_ORCTEMPLEWARRIORM04_2044");
            }
            
            AGothicCharacterState GetToChurnagg() const property
            {
                return GetCharacter(n"OW_OWR_TOCHURNAGG_2403");
            }
            
            AGothicCharacterState GetUmosh() const property
            {
                return GetCharacter(n"OW_OWR_UMOSH_2406");
            }
        }
        
        
        class UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OSM_URNAZKROG_2401";
            default WithCharacter = n"OW_OWR_TOCHURNAGG_2403";
            
            AGothicCharacterState GetUrNazkrog() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGrazkrak() const property
            {
                return GetCharacter(n"OW_OWR_GRAZKRAK_2400");
            }
            
            AGothicCharacterState GetOW_OWR_ORCTEMPLEWARRIORM03_2043() const property
            {
                return GetCharacter(n"OW_OWR_ORCTEMPLEWARRIORM03_2043");
            }
            
            AGothicCharacterState GetOW_OWR_ORCTEMPLEWARRIORM04_2044() const property
            {
                return GetCharacter(n"OW_OWR_ORCTEMPLEWARRIORM04_2044");
            }
            
            AGothicCharacterState GetToChurnagg() const property
            {
                return GetCharacter(n"OW_OWR_TOCHURNAGG_2403");
            }
            
            AGothicCharacterState GetUmosh() const property
            {
                return GetCharacter(n"OW_OWR_UMOSH_2406");
            }
        }
        
        
        class UChoiceUrnazkrog100540 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xe6bb99a9eea7c1e2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6bb99a9eea7c1e1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe6bb99a9eea7c1e1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUrnazkrog100556 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xe6bb99a9eea7c1e6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog100556);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa77480f9b999ea5b), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                    DB(int64(0x1b4ac452425d68a5), Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && !Quest::ORCENCLAVE_THECHAMPIONBURIAL.HasFailed());
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return false;
                
                if (Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.HasFailed())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2b25a2fff0a0a350), EConversationDebugInfo::Executing);
                // Look who has come. I have been waiting for you.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_102959"));
                DC(int64(0x2b25a2fff0a0a350), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a353), EConversationDebugInfo::Executing);
                // You are here for Krushak. Are you not?
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_103634"));
                DC(int64(0x2b25a2fff0a0a353), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a352), EConversationDebugInfo::Executing);
                
                // Well ...
                Hero.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_103627"));
                DC(int64(0x2b25a2fff0a0a352), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a351), EConversationDebugInfo::Executing);
                
                // Come now. Why else would a morra come here bearing the ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_103103"));
                DC(int64(0x2b25a2fff0a0a351), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a354), EConversationDebugInfo::Executing);
                // One who our scouts have sighted going in and out of the ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_103835"));
                DC(int64(0x2b25a2fff0a0a354), EConversationDebugInfo::Done);
                DC(int64(0x50c0631945905c8d), EConversationDebugInfo::Executing);
                // Tell me: what is it that you seek from Krushak?
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_134923"));
                DC(int64(0x50c0631945905c8d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OSM_URNAZKROG, Document::UDocumentSegment_Glossary_OW_OSM_URNAZKROG_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Urnazkrog);
                Subdialog(
                    UTopic_UrNazkrog_100814,
                    UTopic_UrNazkrog_100834,
                    UTopic_UrNazkrog_101006,
                    UTopic_UrNazkrog_101100
                );
                DC(int64(0x50c0631945905cbf), EConversationDebugInfo::Executing);
                // I will speak plainly. You likely believe your being here ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_140054"));
                DC(int64(0x50c0631945905cbf), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a36b), EConversationDebugInfo::Executing);
                // You are here because Krushak guided you. Like all of us, ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_191731"));
                DC(int64(0x2b25a2fff0a0a36b), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a384), EConversationDebugInfo::Executing);
                // That, and the Ulu-Mulu, is why I let you in. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193411"));
                DC(int64(0x2b25a2fff0a0a384), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_UrNazkrog_105147,
                    UTopic_UrNazkrog_106486,
                    UTopic_UrNazkrog_106261
                );
            }
        }
        
        
        class UTopic_UrNazkrog_100814 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x50c0631945905c8f);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_134942_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_100814);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2b25a2fff0a0a356), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50c0631945905c90), EConversationDebugInfo::Executing);
                // I come from the swamp. We worship Krushak, same as you.
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_134942_41"));
                DC(int64(0x50c0631945905c90), EConversationDebugInfo::Done);
                DC(int64(0x50c0631945905c97), EConversationDebugInfo::Executing);
                
                // Right ... the "Brotherhood." 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_135004"));
                DC(int64(0x50c0631945905c97), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a36a), EConversationDebugInfo::Executing);
                // Not that it truly matters.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_191627"));
                DC(int64(0x2b25a2fff0a0a36a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_UrNazkrog_100834 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x50c0631945905c93);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_134942_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_100834);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50c0631945905c94), EConversationDebugInfo::Executing);
                
                // Because I want to kill him.
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_134942_2238"));
                DC(int64(0x50c0631945905c94), EConversationDebugInfo::Done);
                DC(int64(0x50c0631945905c9d), EConversationDebugInfo::Executing);
                
                // And you tell this to me? You are funny, little morra. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_135202"));
                DC(int64(0x50c0631945905c9d), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a369), EConversationDebugInfo::Executing);
                // Not that it truly matters.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_191624"));
                DC(int64(0x2b25a2fff0a0a369), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_UrNazkrog_101006 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x50c0631945905c9e);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_135215_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_101006);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2b25a2fff0a0a359), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50c0631945905c9f), EConversationDebugInfo::Executing);
                
                // I worship Krushak, same as you.
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_135215_1924"));
                DC(int64(0x50c0631945905c9f), EConversationDebugInfo::Done);
                DC(int64(0x50c0631945905ca2), EConversationDebugInfo::Executing);
                
                // And yet you are not with those you morra call "the ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_135234"));
                DC(int64(0x50c0631945905ca2), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a368), EConversationDebugInfo::Executing);
                // Not that it truly matters.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_191615"));
                DC(int64(0x2b25a2fff0a0a368), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_UrNazkrog_101100 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x50c0631945905ca3);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_135308_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_101100);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50c0631945905ca4), EConversationDebugInfo::Executing);
                
                // Does it matter?
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_135308_2785"));
                DC(int64(0x50c0631945905ca4), EConversationDebugInfo::Done);
                DC(int64(0x50c0631945905ca7), EConversationDebugInfo::Executing);
                
                // Well asked, morra. No, it doesn't.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_135418"));
                DC(int64(0x50c0631945905ca7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_UrNazkrog_105147 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x2b25a2fff0a0a36d);
            default Caption = LocText("TEXT_WIP_VGKWYUI_20240718_191855_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_105147);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2b25a2fff0a0a36e), EConversationDebugInfo::Executing);
                
                // I'm my own master. 
                Hero.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_191855_1924"));
                DC(int64(0x2b25a2fff0a0a36e), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a375), EConversationDebugInfo::Executing);
                
                // Yes ... that is what we tell ourselves so sleep doesn't ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_191927"));
                DC(int64(0x2b25a2fff0a0a375), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a376), EConversationDebugInfo::Executing);
                // But you're not. None of us are. Morra, orcs, beasts ... ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_191948"));
                DC(int64(0x2b25a2fff0a0a376), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a377), EConversationDebugInfo::Executing);
                // Krushak holds the same power. He whispers into our ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_192030"));
                DC(int64(0x2b25a2fff0a0a377), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a378), EConversationDebugInfo::Executing);
                // But believe what you will. I know the truth. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_192149"));
                DC(int64(0x2b25a2fff0a0a378), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a370), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2b25a2fff0a0a370), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_UrNazkrog_106486 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x2b25a2fff0a0a380);
            default Caption = LocText("TEXT_WIP_VGKWYUI_20240718_193314_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_106486);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2b25a2fff0a0a381), EConversationDebugInfo::Executing);
                // Your warchief didn't seem to agree. 
                Hero.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193314_686"));
                DC(int64(0x2b25a2fff0a0a381), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a385), EConversationDebugInfo::Executing);
                
                // To-Churnagg is ... difficult kin. His mind is like a ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193427"));
                DC(int64(0x2b25a2fff0a0a385), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a386), EConversationDebugInfo::Executing);
                // He doesn't want to believe a morra could be an ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193532"));
                DC(int64(0x2b25a2fff0a0a386), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a383), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2b25a2fff0a0a383), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_UrNazkrog_106261 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x2b25a2fff0a0a379);
            default Caption = LocText("TEXT_WIP_VGKWYUI_20240718_193208_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_106261);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2b25a2fff0a0a37a), EConversationDebugInfo::Executing);
                // Let me guess: you think Krushak brought me here so I may ...
                Hero.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193208_3286"));
                DC(int64(0x2b25a2fff0a0a37a), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a37d), EConversationDebugInfo::Executing);
                
                // So you know our predicament. Ur-Shak must have told you? 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193231"));
                DC(int64(0x2b25a2fff0a0a37d), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a387), EConversationDebugInfo::Executing);
                
                // Yes. The temple is sealed, and you can't break through ...
                Hero.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193710"));
                DC(int64(0x2b25a2fff0a0a387), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a388), EConversationDebugInfo::Executing);
                
                // (snorts) Oh, Ur-Shak ... he always had a loose tongue. ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193824"));
                DC(int64(0x2b25a2fff0a0a388), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210be2), EConversationDebugInfo::Executing);
                // But not anymore. Ten days ago, I had a dream, and I saw ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_141118"));
                DC(int64(0xf13de99deb210be2), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a38a), EConversationDebugInfo::Executing);
                
                // ... You think that morra was me?
                Hero.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_193933"));
                DC(int64(0x2b25a2fff0a0a38a), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210be3), EConversationDebugInfo::Executing);
                
                // That, I need to find. The morra in the dream did ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_141252"));
                DC(int64(0xf13de99deb210be3), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210be4), EConversationDebugInfo::Executing);
                
                // What? 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_141603"));
                DC(int64(0xf13de99deb210be4), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a38c), EConversationDebugInfo::Executing);
                
                // He shaped life from death. That is all I will say. Do ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_194023"));
                DC(int64(0x2b25a2fff0a0a38c), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a38d), EConversationDebugInfo::Executing);
                // I'll be waiting. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_194139"));
                DC(int64(0x2b25a2fff0a0a38d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OSM_URNAZKROG, Document::UDocumentSegment_Glossary_OW_OSM_URNAZKROG_Chosen);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Burial);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_THECHAMPIONBURIAL, Document::UDocumentSegment_CH5_THECHAMPIONBURIAL_Start);
                DC(int64(0x50c0631945905cd5), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_THECHAMPIONBURIAL.StartQuest();
                DC(int64(0x50c0631945905cd5), EConversationDebugInfo::Done);
                DC(int64(0x48495da8d6762982), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Grazkrak))) { Grazkrak.NPCState.RemoveFromWorld(); }
                DC(int64(0x48495da8d6762982), EConversationDebugInfo::Done);
                DC(int64(0xca96020447c26f0b), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG.SucceedQuest();
                DC(int64(0xca96020447c26f0b), EConversationDebugInfo::Done);
                DC(int64(0xca96020447c26f19), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL.StartQuest();
                DC(int64(0xca96020447c26f19), EConversationDebugInfo::Done);
                DC(int64(0xf2fc6546c5997ca1), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.StartQuest();
                DC(int64(0xf2fc6546c5997ca1), EConversationDebugInfo::Done);
                DC(int64(0xde8d3f001d9ed20a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Umosh))) { Umosh.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_Umosh_2406_Burial); }
                DC(int64(0xde8d3f001d9ed20a), EConversationDebugInfo::Done);
                DC(int64(0x4aaff086bb0cfd05), EConversationDebugInfo::Executing);
                G1R.ChampionBurial();
                DC(int64(0x4aaff086bb0cfd05), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog101602 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x50c0631945905cc6);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_140417");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog100556);
            default Rules.HideIfKnows(UChoiceUrnazkrog101602);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50c0631945905cc4), EConversationDebugInfo::Executing);
                // "Shape life from death?" What does that mean? 
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_140417"));
                DC(int64(0x50c0631945905cc4), EConversationDebugInfo::Done);
                DC(int64(0x50c0631945905cc5), EConversationDebugInfo::Executing);
                
                // That, you must discover. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_140417_2801"));
                DC(int64(0x50c0631945905cc5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog101666 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x50c0631945905cca);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_140457");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog100556);
            default Rules.HideIfKnows(UChoiceUrnazkrog101666);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50c0631945905cc8), EConversationDebugInfo::Executing);
                
                // That dream you had - do you think Krushak sent it?
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_140457"));
                DC(int64(0x50c0631945905cc8), EConversationDebugInfo::Done);
                DC(int64(0x2b25a2fff0a0a38e), EConversationDebugInfo::Executing);
                
                // Yes. He has been sending me dreams as long as I live, ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_194236"));
                DC(int64(0x2b25a2fff0a0a38e), EConversationDebugInfo::Done);
                DC(int64(0x50c0631945905cc9), EConversationDebugInfo::Executing);
                // But that is all I will say. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_140457_1769"));
                DC(int64(0x50c0631945905cc9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog102653 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x341bd27e65e1dd33);
            default Caption = LocText("TEXT_WIP_ZVGQKWK_20240712_163922");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog102653);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x341bd27e65e1dd36), G1R.UrNazkrog_Spores != 0);
                    DB(int64(0x54c7f07001d0dc13), ToChurnagg != nullptr && !ToChurnagg.IsEveryoneOfThisKindDead());
                }
                
                if (G1R.UrNazkrog_Spores == 0)
                    return false;
                
                if (ToChurnagg != nullptr && ToChurnagg.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5b543ab0417e58b), EConversationDebugInfo::Executing);
                
                // I did as you asked, Ur-Nazkrog. I shaped life from ...
                Hero.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_163922"));
                DC(int64(0xc5b543ab0417e58b), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210be5), EConversationDebugInfo::Executing);
                
                // Is that so?
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_141844"));
                DC(int64(0xf13de99deb210be5), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210be6), EConversationDebugInfo::Executing);
                
                // Yes. The corpse flowers now grow from Grazkrak's flesh. 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_141932"));
                DC(int64(0xf13de99deb210be6), EConversationDebugInfo::Done);
                DC(int64(0x341bd27e65e1dd32), EConversationDebugInfo::Executing);
                
                // ... And so the dream came true. Incredible. I had ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_152507_41"));
                DC(int64(0x341bd27e65e1dd32), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210be7), EConversationDebugInfo::Executing);
                // Ah, it does not matter. Krushak guided you here - YOU ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_142132"));
                DC(int64(0xf13de99deb210be7), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210be8), EConversationDebugInfo::Executing);
                
                // So you'll let me enter the temple?
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_142215"));
                DC(int64(0xf13de99deb210be8), EConversationDebugInfo::Done);
                DC(int64(0x341bd27e65e1dd38), EConversationDebugInfo::Executing);
                
                // Yes. Lead the way - I will join and make the warriors ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_152643"));
                DC(int64(0x341bd27e65e1dd38), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OSM_URNAZKROG, Document::UDocumentSegment_Glossary_OW_OSM_URNAZKROG_AccesToTemple);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_THECHAMPIONBURIAL, Document::UDocumentSegment_CH5_THECHAMPIONBURIAL_Completed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_BurialCompleted);
                DC(int64(0xc5b543ab0417e570), EConversationDebugInfo::Executing);
                G1R.UrNazkrog_Permission = 1;
                DC(int64(0xc5b543ab0417e570), EConversationDebugInfo::Done);
                DC(int64(0xc5b543ab0417e58e), EConversationDebugInfo::Executing);
                UrNazkrog.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OSM_UrNazkrog_2401_Follow);
                DC(int64(0xc5b543ab0417e58e), EConversationDebugInfo::Done);
                DC(int64(0x9afb83adba2705ce), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL.SucceedQuest();
                DC(int64(0x9afb83adba2705ce), EConversationDebugInfo::Done);
                DC(int64(0xf7d2f7d5dd033317), EConversationDebugInfo::Executing);
                G1R.ActivateStoryDataLayer("MainQuest_THECHAMPIONBURIAL");
                DC(int64(0xf7d2f7d5dd033317), EConversationDebugInfo::Done);
                DC(int64(0x4ea181a2606180aa), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN.SucceedQuest();
                DC(int64(0x4ea181a2606180aa), EConversationDebugInfo::Done);
                DC(int64(0xf2fc6546c5997ca3), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.SucceedQuest();
                DC(int64(0xf2fc6546c5997ca3), EConversationDebugInfo::Done);
                DC(int64(0x341bd27e65e1dd3b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x341bd27e65e1dd3b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUrnazkrog102911 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xc5b543ab0417e591);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default bSayHeyYou = true;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog102911);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_TEMPLE_ENTRANCE", 600.0f, int64(0xc5b543ab0417e591));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x54c7f07001d0dc14), ToChurnagg != nullptr && !ToChurnagg.IsEveryoneOfThisKindDead());
                }
                
                return ToChurnagg != nullptr && !ToChurnagg.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb6406ff0d2d477b3), EConversationDebugInfo::Executing);
                RequestStopConversationCamera();
                DC(int64(0xb6406ff0d2d477b3), EConversationDebugInfo::Done);
                DC(int64(0x1e264f28c821a54), EConversationDebugInfo::Executing);
                RequestCameraToLookAtCharacter(UrNazkrog);
                DC(int64(0x1e264f28c821a54), EConversationDebugInfo::Done);
                DC(int64(0x1e264f28c821a6c), EConversationDebugInfo::Executing);
                UrNazkrog.AI.GotoWaypoint(n"FP_OTOWN_TEMPLE_ENTRANCE");
                DC(int64(0x1e264f28c821a6c), EConversationDebugInfo::Done);
                DC(int64(0xb6406ff0d2d477bb), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(UrNazkrog);
                DC(int64(0xb6406ff0d2d477bb), EConversationDebugInfo::Done);
                DC(int64(0x6bbe7049f5d6d1e), EConversationDebugInfo::Executing);
                UrNazkrog.AI.TurnToCharacter(Hero);
                DC(int64(0x6bbe7049f5d6d1e), EConversationDebugInfo::Done);
                DC(int64(0x6bbe7049f5d6d20), EConversationDebugInfo::Executing);
                RequestStartConversationCamera();
                DC(int64(0x6bbe7049f5d6d20), EConversationDebugInfo::Done);
                DC(int64(0x8db21c5e25f1e018), EConversationDebugInfo::Executing);
                // There we are. The hallowed grounds. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_164516_3436"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC").RunDetached();
                DC(int64(0x8db21c5e25f1e018), EConversationDebugInfo::Done);
                DC(int64(0xb6406ff0d2d477bf), EConversationDebugInfo::Executing);
                Hero.AI.GotoWaypoint(n"WP_OTOWN_TEMPLE_ENTRANCE_NH");
                DC(int64(0xb6406ff0d2d477bf), EConversationDebugInfo::Done);
                DC(int64(0x23d9bfddd946e4ca), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(UrNazkrog);
                DC(int64(0x23d9bfddd946e4ca), EConversationDebugInfo::Done);
                DC(int64(0x353245ff5bf3e7ab), EConversationDebugInfo::Executing);
                // Another barrier. Who would have thought. 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_151344"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH");
                DC(int64(0x353245ff5bf3e7ab), EConversationDebugInfo::Done);
                DC(int64(0xb6406ff0d2d477bf), EConversationDebugInfo::Executing);
                UrNazkrog.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OSM_UrNazkrog_2401_Temple);
                DC(int64(0xb6406ff0d2d477bf), EConversationDebugInfo::Done);
                DC(int64(0xa36fac7ab6dd794c), EConversationDebugInfo::Executing);
                G1R.SleeperTempleEntranceIntelligence();
                DC(int64(0xa36fac7ab6dd794c), EConversationDebugInfo::Done);
                DB(int64(0xf13de99deb210bf5), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_UGKWYUI_20240719_140138")));
                
                if (Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_UGKWYUI_20240719_140138")))
                {
                    DC(int64(0xf13de99deb210bfa), EConversationDebugInfo::Executing);
                    // That amulet you showed me - do you have it still?
                    UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_145143"), ForceCameraPreset = n"Orc Temple Entrance NHUrnazkrog");
                    DC(int64(0xf13de99deb210bfa), EConversationDebugInfo::Done);
                    DC(int64(0xf13de99deb210bfb), EConversationDebugInfo::Executing);
                    
                    // Yes. 
                    Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_145143_3984"), ForceCameraPreset = n"Orc Temple Entrance UrnazkrogNH");
                    DC(int64(0xf13de99deb210bfb), EConversationDebugInfo::Done);
                    DC(int64(0xf13de99deb210c04), EConversationDebugInfo::Executing);
                    
                    // Then use it. Krushak willing, it will break the-
                    UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_145229"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0xf13de99deb210c04), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf13de99deb210bff), EConversationDebugInfo::Executing);
                    
                    // I might have something that could help me get through. ...
                    Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_145145_1609"), ForceCameraPreset = n"Orc Temple Entrance UrnazkrogNH");
                    DC(int64(0xf13de99deb210bff), EConversationDebugInfo::Done);
                    DC(int64(0xf13de99deb210c05), EConversationDebugInfo::Executing);
                    
                    // What sort of amulet?
                    UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_151222"), ForceCameraPreset = n"Orc Temple Entrance NHUrnazkrog");
                    DC(int64(0xf13de99deb210c05), EConversationDebugInfo::Done);
                    DC(int64(0xf13de99deb210c06), EConversationDebugInfo::Executing);
                    
                    // Long story. Let me-
                    Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_151225"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH");
                    DC(int64(0xf13de99deb210c06), EConversationDebugInfo::Done);
                }
                DC(int64(0x1f4a84cc2aba98da), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OW_OWR_ORCTEMPLEWARRIORM04_2044))) { OW_OWR_ORCTEMPLEWARRIORM04_2044.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_RunToTemple); }
                DC(int64(0x1f4a84cc2aba98da), EConversationDebugInfo::Done);
                DC(int64(0x1f4a84cc2aba98dc), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OW_OWR_ORCTEMPLEWARRIORM03_2043))) { OW_OWR_ORCTEMPLEWARRIORM03_2043.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_RunToTemple); }
                DC(int64(0x1f4a84cc2aba98dc), EConversationDebugInfo::Done);
                DC(int64(0x1f4a84cc2aba98de), EConversationDebugInfo::Executing);
                if (ensure(IsValid(ToChurnagg))) { ToChurnagg.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_ToChurnagg_2403_RunToTemple); }
                DC(int64(0x1f4a84cc2aba98de), EConversationDebugInfo::Done);
                DC(int64(0x1f4a84cc2aba98e4), EConversationDebugInfo::Executing);
                RequestCameraSnapToInteractionSpot(FInteractionSpotHandle(n"FP_OTOWN_TEMPLE_ENTRANCE2"));
                DC(int64(0x1f4a84cc2aba98e4), EConversationDebugInfo::Done);
                DC(int64(0x6bbe7049f5d6ca2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6bbe7049f5d6ca2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUrnazkrog103376 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xf13de99deb210bbc);
            default Caption = LocText("TEXT_WIP_UGKWYUI_20240719_134039");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog100556);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog109069);
            default Rules.HideIfKnows(UChoiceUrnazkrog103376);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf13de99deb210bba), EConversationDebugInfo::Executing);
                // Ur-Shak believes Krushak is a danger to orcs and humans ...
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_134039"));
                DC(int64(0xf13de99deb210bba), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bbb), EConversationDebugInfo::Executing);
                
                // Yes. I was there when he made his plea. The problem with ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_134039_41"));
                DC(int64(0xf13de99deb210bbb), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bcf), EConversationDebugInfo::Executing);
                // He used to be strong of mind, but all this time studying ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_135457"));
                DC(int64(0xf13de99deb210bcf), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bd0), EConversationDebugInfo::Executing);
                
                // So you think he's wrong? 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_135957"));
                DC(int64(0xf13de99deb210bd0), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bce), EConversationDebugInfo::Executing);
                
                // Yes. But so is To-Churnagg, who believes Krushak can be ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_135044"));
                DC(int64(0xf13de99deb210bce), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bd1), EConversationDebugInfo::Executing);
                // Only Krushak knows what he will do once he wakes. And ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140056"));
                DC(int64(0xf13de99deb210bd1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OSM_URNAZKROG, Document::UDocumentSegment_Glossary_OW_OSM_URNAZKROG_DifferentOpinion);
            }
        }
        
        
        class UChoiceUrnazkrog106273 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xf13de99deb210bd4);
            default Caption = LocText("TEXT_WIP_UGKWYUI_20240719_140138");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog103376);
            default Rules.HideIfKnows(UChoiceUrnazkrog106273);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x54c7f07001d0dc16), ToChurnagg != nullptr && !ToChurnagg.IsEveryoneOfThisKindDead());
                }
                
                return ToChurnagg != nullptr && !ToChurnagg.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf13de99deb210bd2), EConversationDebugInfo::Executing);
                // (Show talisman) I have this amulet. It helped me destroy ...
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140138"));
                DC(int64(0xf13de99deb210bd2), EConversationDebugInfo::Done);
                DC(int64(0x78b1ac549a657ff6), EConversationDebugInfo::Executing);
                // Maybe it could break the temple seal, too?
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140327"));
                DC(int64(0x78b1ac549a657ff6), EConversationDebugInfo::Done);
                DC(int64(0xb218360a71ce018b), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowAmulet);
                DC(int64(0xb218360a71ce018b), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bd3), EConversationDebugInfo::Executing);
                // Let me see ... 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140138_3436"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM ORC");
                DC(int64(0xf13de99deb210bd3), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bd7), EConversationDebugInfo::Executing);
                // Interesting. Truly interesting. This holds the magic of ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140358"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM ORC");
                DC(int64(0xf13de99deb210bd7), EConversationDebugInfo::Done);
                DC(int64(0x78b1ac549a657ff1), EConversationDebugInfo::Executing);
                Hero.AI.EndAnyOngoingInteraction();
                DC(int64(0x78b1ac549a657ff1), EConversationDebugInfo::Done);
                DC(int64(0x78b1ac549a657ff3), EConversationDebugInfo::Executing);
                // Maybe you are right. It could be the key. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140430"));
                DC(int64(0x78b1ac549a657ff3), EConversationDebugInfo::Done);
                DB(int64(0xf13de99deb210bda), Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.HasSucceeded());
                
                if (Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.HasSucceeded())
                {
                    DC(int64(0xf13de99deb210bde), EConversationDebugInfo::Executing);
                    // So the dreams spoke true ... Krushak sent you. Come, it ...
                    UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140901_2386"));
                    DC(int64(0xf13de99deb210bde), EConversationDebugInfo::Done);
                    DC(int64(0xf13de99deb210be1), EConversationDebugInfo::Executing);
                    // Tell me when you are ready to leave for the temple. 
                    UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_141010"));
                    DC(int64(0xf13de99deb210be1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_urnazkrog_106273_exit_1");
                }
                else
                {
                    DC(int64(0xf13de99deb210bdc), EConversationDebugInfo::Executing);
                    // But the morra must pass the trial first. This is what I ...
                    UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_140821_686"));
                    DC(int64(0xf13de99deb210bdc), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_urnazkrog_106273_exit_2");
                }
            }
        }
        
        
        class UChoiceUrnazkrog108129 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x5f713b767244c5b4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog108129);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5f713b767244c5b9), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                    DB(int64(0xaad5b4cff97ccf2e), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded());
                    DB(int64(0x28003880c3e0c8b2), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f713b767244c5b0), EConversationDebugInfo::Executing);
                // Ur-Nazkrog.
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221051"));
                DC(int64(0x5f713b767244c5b0), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5b1), EConversationDebugInfo::Executing);
                
                // Well. The morra has returned.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221051_2238"));
                DC(int64(0x5f713b767244c5b1), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5be), EConversationDebugInfo::Executing);
                
                // What's happening? Why did you let these men into the ...
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221223"));
                DC(int64(0x5f713b767244c5be), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5bf), EConversationDebugInfo::Executing);
                
                // Isn't it obvious? Because Krushak chose them. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221242"));
                DC(int64(0x5f713b767244c5bf), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5c0), EConversationDebugInfo::Executing);
                // Their master - Kalom - was who I saw in my dream. I ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221312"));
                DC(int64(0x5f713b767244c5c0), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5c1), EConversationDebugInfo::Executing);
                // Now the time has come. Krushak will wake - as ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221331"));
                DC(int64(0x5f713b767244c5c1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_UrNazkrog_108598,
                    UTopic_UrNazkrog_108618
                );
                DC(int64(0x5f713b767244c5dc), EConversationDebugInfo::Executing);
                // Go, now. Keep on with your struggle, or enjoy your last ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221703_686"));
                DC(int64(0x5f713b767244c5dc), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5e3), EConversationDebugInfo::Executing);
                // Krushak will destroy you like all the others. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221759"));
                DC(int64(0x5f713b767244c5e3), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5d3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5f713b767244c5d3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_UrNazkrog_108598 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x5f713b767244c5c3);
            default Caption = LocText("TEXT_WIP_EPWDQLC_20240829_221354_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_108598);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f713b767244c5c4), EConversationDebugInfo::Executing);
                // If I'm not the morra you saw in your dream - aren't you ...
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221354_2785"));
                DC(int64(0x5f713b767244c5c4), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5cd), EConversationDebugInfo::Executing);
                
                // Why would I be? All happened as it should have.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221417"));
                DC(int64(0x5f713b767244c5cd), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5e4), EConversationDebugInfo::Executing);
                // Had I not trusted you and let you walk into the temple, ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221942"));
                DC(int64(0x5f713b767244c5e4), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5ce), EConversationDebugInfo::Executing);
                // We are but pawns, morra. Playthings of gods, demons, and ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221451"));
                DC(int64(0x5f713b767244c5ce), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5cf), EConversationDebugInfo::Executing);
                // And once Krushak wakes, the whole world will see. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221523"));
                DC(int64(0x5f713b767244c5cf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_UrNazkrog_108618 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x5f713b767244c5c7);
            default Caption = LocText("TEXT_WIP_EPWDQLC_20240829_221354_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_UrNazkrog_108618);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f713b767244c5c8), EConversationDebugInfo::Executing);
                
                // I'll leave you to your meditations.
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221354_3286"));
                DC(int64(0x5f713b767244c5c8), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5d8), EConversationDebugInfo::Executing);
                
                // Do that, morra.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_221613"));
                DC(int64(0x5f713b767244c5d8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog109069 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x2b25a2fff0a0a392);
            default Caption = LocText("TEXT_WIP_VGKWYUI_20240718_195705");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog100556);
            default Rules.HideIfKnows(UChoiceUrnazkrog109069);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2b25a2fff0a0a390), EConversationDebugInfo::Executing);
                
                // Is it true that Krushak wants to destroy all humans? 
                Hero.AI.Say(LocText("TEXT_WIP_VGKWYUI_20240718_195705"));
                DC(int64(0x2b25a2fff0a0a390), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bbf), EConversationDebugInfo::Executing);
                
                // This is what my ancestors summoned Krushak for, yes. The ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_134111"));
                DC(int64(0xf13de99deb210bbf), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bb8), EConversationDebugInfo::Executing);
                // We are but mortals, morra, and Krushak is a god. We ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_134005"));
                DC(int64(0xf13de99deb210bb8), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bca), EConversationDebugInfo::Executing);
                
                // Why was I thinking I'd get a straight answer ... 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_134813"));
                DC(int64(0xf13de99deb210bca), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bcb), EConversationDebugInfo::Executing);
                
                // What did you say? 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_134854"));
                DC(int64(0xf13de99deb210bcb), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210bcc), EConversationDebugInfo::Executing);
                
                // Nevermind. 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_134907"));
                DC(int64(0xf13de99deb210bcc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog143995_0 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xcf6cde32246c7ae2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog143995);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.HideIfKnows(UChoiceUrnazkrog143995_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7d31a6e891f87796), UrNazkrog != nullptr && UrNazkrog.HasAssignedDailyRoutine(UDailyRoutine_OW_OSM_UrNazkrog_2401_UluMulu));
                    DB(int64(0x7d31a6e891f87797), G1R != nullptr && G1R.IsDoorOpen(n"SK_Orc_Door"));
                }
                
                if (UrNazkrog != nullptr && !UrNazkrog.HasAssignedDailyRoutine(UDailyRoutine_OW_OSM_UrNazkrog_2401_UluMulu))
                    return false;
                
                if (G1R != nullptr && !G1R.IsDoorOpen(n"SK_Orc_Door"))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7ae4), EConversationDebugInfo::Executing);
                
                // What is this? Why aren't you killing him?
                ToChurnagg.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_115510"));
                DC(int64(0xcf6cde32246c7ae4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog143995_1 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog143995_0);
            default Rules.HideIfKnows(UChoiceUrnazkrog143995_1);
            default DebugId = int64(0xcf6cde32246c7ae2);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7ae5), EConversationDebugInfo::Executing);
                
                // Because he brought an Ulu-Mulu.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_115522"));
                DC(int64(0xcf6cde32246c7ae5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog143995_2 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog143995_1);
            default Rules.HideIfKnows(UChoiceUrnazkrog143995_2);
            default DebugId = int64(0xcf6cde32246c7ae2);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7ae6), EConversationDebugInfo::Executing);
                
                // Then he must have stolen it. Look at him - no way he ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_115530"));
                DC(int64(0xcf6cde32246c7ae6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog143995_3 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog143995_2);
            default Rules.HideIfKnows(UChoiceUrnazkrog143995_3);
            default DebugId = int64(0xcf6cde32246c7ae2);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7ae7), EConversationDebugInfo::Executing);
                
                // NO. You doubt his honor, so be it - but you will not ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_115539"));
                DC(int64(0xcf6cde32246c7ae7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog143995_4 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog143995_3);
            default Rules.HideIfKnows(UChoiceUrnazkrog143995_4);
            default DebugId = int64(0xcf6cde32246c7ae2);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7ae8), EConversationDebugInfo::Executing);
                // Have him fight one of your warriors. If he prevails, we ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_115604"));
                DC(int64(0xcf6cde32246c7ae8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog143995 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog143995_4);
            default Rules.HideIfKnows(UChoiceUrnazkrog143995);
            default DebugId = int64(0xcf6cde32246c7ae2);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7ae9), EConversationDebugInfo::Executing);
                
                // ... Fine. Open the gates! Grazkrak, you crush the morra ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_115613"));
                DC(int64(0xcf6cde32246c7ae9), EConversationDebugInfo::Done);
                DC(int64(0x7d31a6e891f877b4), EConversationDebugInfo::Executing);
                UrNazkrog.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OSM_UrNazkrog_2401_Start);
                DC(int64(0x7d31a6e891f877b4), EConversationDebugInfo::Done);
                DC(int64(0x7d31a6e891f877b8), EConversationDebugInfo::Executing);
                ToChurnagg.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_ToChurnagg_2403_Start);
                DC(int64(0x7d31a6e891f877b8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog144095 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xcf6cde32246c7b29);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog144095);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_UGKWYUI_20240719_151222"), int64(0xcf6cde32246c7b29));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_PVXGRO_20250121_121159_2801"), int64(0xcf6cde32246c7b29));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b26), EConversationDebugInfo::Executing);
                // Go on, now, morra. Approach the seal.
                UrNazkrog.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_121011_1609"));
                DC(int64(0xcf6cde32246c7b26), EConversationDebugInfo::Done);
                DC(int64(0xa36fac7ab6dd7959), EConversationDebugInfo::Executing);
                RequestStopConversationCamera();
                DC(int64(0xa36fac7ab6dd7959), EConversationDebugInfo::Done);
                DC(int64(0xa36fac7ab6dd7960), EConversationDebugInfo::Executing);
                RequestCameraToLookAtCharacter(ToChurnagg);
                DC(int64(0xa36fac7ab6dd7960), EConversationDebugInfo::Done);
                DC(int64(0xa664889a6cac4f72), EConversationDebugInfo::Executing);
                if (ensure(IsValid(ToChurnagg)) && ensure(IsValid(ToChurnagg.AI))) { ToChurnagg.AI.GotoWaypoint(n"FP_OTOWN_TEMPLE_ENTRANCE2"); }
                DC(int64(0xa664889a6cac4f72), EConversationDebugInfo::Done);
                DC(int64(0xa664889a6cac4f74), EConversationDebugInfo::Executing);
                RequestStartConversationCamera();
                DC(int64(0xa664889a6cac4f74), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog144111_0 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0xcf6cde32246c7b2f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog144111);
            
            default ExtraCharactersToInvite.Add(n"HERO");
            default Rules.HideIfKnows(UChoiceUrnazkrog144111_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), G1R.AfterCinematic_Sleeper == 1);
                }
                
                return G1R.AfterCinematic_Sleeper == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b2c), EConversationDebugInfo::Executing);
                // It worked! He is the key!
                SayViaGlobalVoice(LocText("OW_OSM_URNAZKROG_2401"), LocText("TEXT_WIP_PVXGRO_20250121_121159_2801"));
                DC(int64(0xcf6cde32246c7b2c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog144111_1 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog144111_0);
            default Rules.HideIfKnows(UChoiceUrnazkrog144111_1);
            default DebugId = int64(0xcf6cde32246c7b2f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b34), EConversationDebugInfo::Executing);
                
                // But the seal is still there. 
                SayViaGlobalVoice(LocText("OW_OWR_TOCHURNAGG_2403"), LocText("TEXT_WIP_PVXGRO_20250121_121343"));
                DC(int64(0xcf6cde32246c7b34), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog144111 : UTopic_OW_OWR_TOCHURNAGG_2403__OW_OSM_URNAZKROG_2401
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrnazkrog144111_1);
            default Rules.HideIfKnows(UChoiceUrnazkrog144111);
            default DebugId = int64(0xcf6cde32246c7b2f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b35), EConversationDebugInfo::Executing);
                
                // I better get moving before they try to follow me. 
                Hero.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_121353"));
                DC(int64(0xcf6cde32246c7b35), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrnazkrog692367 : UTopic_Hero__OW_OSM_URNAZKROG_2401
        {
            default DebugId = int64(0x54c7f07001d0dd03);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceUrnazkrog692367);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x54c7f07001d0dd06), ToChurnagg != nullptr && ToChurnagg.IsEveryoneOfThisKindDead());
                }
                
                return ToChurnagg != nullptr && ToChurnagg.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54c7f07001d0dd0a), EConversationDebugInfo::Executing);
                UrNazkrog.AI.StartAttackingImmediately(Hero);
                DC(int64(0x54c7f07001d0dd0a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */