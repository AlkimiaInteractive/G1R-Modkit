#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_ORG_RENYU_860 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_ORG_RENYU_860";
        }
        
        
        class UTopic_Hero__UL_ORG_RENYU_860 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_RENYU_860";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRenyu() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceOrg860RenyuGetlost : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0x70e5ab13ad5a3eb8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x70e5ab13ad5a3eb9), Renyu != nullptr && Renyu.IsInConversation());
                }
                
                return Renyu != nullptr && Renyu.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x420b6856caf65ba5), EConversationDebugInfo::Executing);
                // Piss off!
                Renyu.AI.Say(LocText("ORG_860_RENYU_GETLOST_INFO_06_00"));
                DC(int64(0x420b6856caf65ba5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_RENYU, Document::UDocumentSegment_Glossary_UL_ORG_RENYU_Introduction);
                DC(int64(0x420b6856caf65ba6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x420b6856caf65ba6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRenyu79732 : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0xba6ab426a478e3ac);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceRenyu79732);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_IWM_CAVE_ENTRANCE", 500.0f, int64(0xba6ab426a478e3ac));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xda8110e5f4b18ad5), G1R.IlegalWeedMixer_Permision == 0);
                }
                
                return G1R.IlegalWeedMixer_Permision == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xba6ab426a478e3ab), EConversationDebugInfo::Executing);
                // Hey! Where do you think you're going?
                Renyu.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_103849_41"));
                DC(int64(0xba6ab426a478e3ab), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_RENYU, Document::UDocumentSegment_Glossary_UL_ORG_RENYU_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DRUGMONOPOL, Document::UDocumentSegment_CH1_DRUGMONOPOL_SecretCave);
                DC(int64(0x8d453fe08e1feb29), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND.SucceedQuest();
                DC(int64(0x8d453fe08e1feb29), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Renyu_79761,
                    UTopic_Renyu_79781,
                    UTopic_Renyu_79957,
                    UTopic_Renyu_80010
                );
            }
        }
        
        
        class UTopic_Renyu_79761 : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0xba6ab426a478e3af);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_104021_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Renyu_79761);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xba6ab426a478e3c9), Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xba6ab426a478e3b0), EConversationDebugInfo::Executing);
                // Cor Kalom sent me.
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_104021_2238"));
                DC(int64(0xba6ab426a478e3b0), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3b7), EConversationDebugInfo::Executing);
                
                // The old Loon? Why?
                Renyu.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_104105"));
                DC(int64(0xba6ab426a478e3b7), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe1581), EConversationDebugInfo::Executing);
                
                // Who's your boss?
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_172639"));
                DC(int64(0x9abbd37ababe1581), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe1582), EConversationDebugInfo::Executing);
                
                // ... Jacko. you can go in. But I'll have my eyes on you.
                Renyu.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_172645"));
                DC(int64(0x9abbd37ababe1582), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_RENYU, Document::UDocumentSegment_Glossary_UL_ORG_RENYU_GrantedAccess);
                DC(int64(0xda8110e5f4b18ad7), EConversationDebugInfo::Executing);
                G1R.IlegalWeedMixer_Permision = 1;
                DC(int64(0xda8110e5f4b18ad7), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3ba), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xba6ab426a478e3ba), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Renyu_79781 : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0xba6ab426a478e3b3);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_104021_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Renyu_79781);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_AGHDBGC_20240306_181425_1609"), int64(0xba6ab426a478e3b3));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xba6ab426a478e3cb), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xba6ab426a478e3b4), EConversationDebugInfo::Executing);
                // I'm looking for Bran, the foreman.
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_104021_2785"));
                DC(int64(0xba6ab426a478e3b4), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3b8), EConversationDebugInfo::Executing);
                
                // Bran? You're here to pay up?
                Renyu.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_104237"));
                DC(int64(0xba6ab426a478e3b8), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe1590), EConversationDebugInfo::Executing);
                
                // What are you talking about?
                Hero.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_174546"));
                DC(int64(0x9abbd37ababe1590), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe1591), EConversationDebugInfo::Executing);
                
                // You know what, best ask Jacko. Go on in - but I'll keep ...
                Renyu.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_174604"));
                DC(int64(0x9abbd37ababe1591), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_RENYU, Document::UDocumentSegment_Glossary_UL_ORG_RENYU_GrantedAccess);
                DC(int64(0xda8110e5f4b18ad9), EConversationDebugInfo::Executing);
                G1R.IlegalWeedMixer_Permision = 1;
                DC(int64(0xda8110e5f4b18ad9), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3bb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xba6ab426a478e3bb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Renyu_79957 : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0xba6ab426a478e3bc);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_104441_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Renyu_79957);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xba6ab426a478e3bd), EConversationDebugInfo::Executing);
                // None of your business.
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_104441_3436"));
                DC(int64(0xba6ab426a478e3bd), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe1592), EConversationDebugInfo::Executing);
                
                // Wow, feeling tough, eh? Good. It's been too long since ...
                Renyu.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_180236"));
                DC(int64(0x9abbd37ababe1592), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3c1), EConversationDebugInfo::Executing);
                Renyu.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xba6ab426a478e3c1), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3c2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xba6ab426a478e3c2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Renyu_80010 : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0xba6ab426a478e3c3);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_104609_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Renyu_80010);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xba6ab426a478e3c4), EConversationDebugInfo::Executing);
                // Sorry. Wrong turn. 
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_104609_3286"));
                DC(int64(0xba6ab426a478e3c4), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe1593), EConversationDebugInfo::Executing);
                
                // Damn straight. 
                Renyu.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_180648"));
                DC(int64(0x9abbd37ababe1593), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3c7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xba6ab426a478e3c7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRenyu80087 : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0xba6ab426a478e3ce);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Renyu_80010);
            default Rules.HideIfKnows(UChoiceRenyu80087);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_IWM_CAVE_ENTRANCE", 200.0f, int64(0xba6ab426a478e3ce));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xda8110e5f4b18ada), Renyu != nullptr && !Renyu.WasDefeatedBy(Hero));
                }
                
                return Renyu != nullptr && !Renyu.WasDefeatedBy(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xba6ab426a478e3cd), EConversationDebugInfo::Executing);
                // I warned you!
                Renyu.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_105552_686"));
                DC(int64(0xba6ab426a478e3cd), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3d1), EConversationDebugInfo::Executing);
                Renyu.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xba6ab426a478e3d1), EConversationDebugInfo::Done);
                DC(int64(0xba6ab426a478e3d2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xba6ab426a478e3d2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRenyu88747 : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0xac1c7bffed0b3757);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceRenyu88747);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xac1c7bffed0b375a), Renyu != nullptr && Renyu.WasDefeatedBy(Hero));
                }
                
                return Renyu != nullptr && Renyu.WasDefeatedBy(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac1c7bffed0b3756), EConversationDebugInfo::Executing);
                // All right, all right ... you can go in. Bloody hell ...
                Renyu.AI.Say(LocText("TEXT_WIP_MLUUHUE_20240410_175552_41"));
                DC(int64(0xac1c7bffed0b3756), EConversationDebugInfo::Done);
                DC(int64(0xf5cfc80fce8045c7), EConversationDebugInfo::Executing);
                
                // Thanks.
                Hero.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_101819"));
                DC(int64(0xf5cfc80fce8045c7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_RENYU, Document::UDocumentSegment_Glossary_UL_ORG_RENYU_Beated);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_RENYU, Document::UDocumentSegment_Glossary_UL_ORG_RENYU_GrantedAccess);
                DC(int64(0xac1c7bffed0b375b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xac1c7bffed0b375b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRenyuExit : UTopic_Hero__UL_ORG_RENYU_860
        {
            default DebugId = int64(0x70e5ab13ad5a3eb6);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x420b6856caf65ba4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x420b6856caf65ba4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */