#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_KDF_RODRIGUEZ_400 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_KDF_RODRIGUEZ_400";
        }
        
        
        class UTopic_Hero__OC_KDF_RODRIGUEZ_400 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_RODRIGUEZ_400";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRodriguez() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
        }
        
        
        class UChoiceRodriguez114839 : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0x14197298145f7232);
            default Caption = LocText("TEXT_WIP_XHHWUEL_20241202_105926_2785");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceRodriguez114839);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Rodriguez, 500.0f));
                    DB(int64(0xce11cc9452ea4c39), Rodriguez != nullptr && !Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_WaitYard));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Rodriguez, 500.0f))
                    return false;
                
                if (Rodriguez != nullptr && Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f7231), EConversationDebugInfo::Executing);
                // So, you passed the trial? Didn't think you had it in ...
                Rodriguez.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_105926_2785"));
                DC(int64(0x14197298145f7231), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRodriguez132723 : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0x8d360a6909e5c64);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8d360a6909e5c77), G1R.FireMagesPermission < 1);
                    DB(int64(0x8d360a6909e5c7b), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0xdec3772243bfb3d2), Rodriguez != nullptr && Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_Door));
                    DB(int64(0x425e95e2cf9e78b3), Rodriguez != nullptr && !Rodriguez.IsRefusingToTalkWith(Hero));
                }
                
                if (G1R.FireMagesPermission >= 1)
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Rodriguez != nullptr && !Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_Door))
                    return false;
                
                if (Rodriguez != nullptr && Rodriguez.IsRefusingToTalkWith(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8d360a6909e5c63), EConversationDebugInfo::Executing);
                // Ey! This is a restricted area, just for fire mages.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_180154_2238"));
                DC(int64(0x8d360a6909e5c63), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c75), EConversationDebugInfo::Executing);
                // Only fire mages or Corristo's guests can enter here.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_180822"));
                DC(int64(0x8d360a6909e5c75), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_RODRIGUEZ, Document::UDocumentSegment_Glossary_OC_KDF_RODRIGUEZ_Introduction);
                DC(int64(0x425e95e2cf9e78b2), EConversationDebugInfo::Executing);
                Rodriguez.RefuseToTalk(30);
                DC(int64(0x425e95e2cf9e78b2), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Rodriguez_132981,
                    UTopic_Rodriguez_133001,
                    UTopic_Rodriguez_231756
                );
            }
        }
        
        
        class UTopic_Rodriguez_132981 : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0x8d360a6909e5c6c);
            default Caption = LocText("TEXT_WIP_ZLCTYHF_20241216_174917");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rodriguez_132981);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_200_THORUS_WANNABEMAGE_INFO_09_02"), int64(0x8d360a6909e5c6c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x38e3477028edfa1b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8d360a6909e5c50), EConversationDebugInfo::Executing);
                // I would like to meet Master Corristo.
                Hero.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_174917"));
                DC(int64(0x8d360a6909e5c50), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c51), EConversationDebugInfo::Executing);
                
                // You're the one who helped in the swamp ritual, right?
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_174917_41"));
                DC(int64(0x8d360a6909e5c51), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c59), EConversationDebugInfo::Executing);
                // Master mentioned that he wanted to meet you.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_175659"));
                DC(int64(0x8d360a6909e5c59), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c5b), EConversationDebugInfo::Executing);
                // Come in, he's upstairs.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_180006"));
                DC(int64(0x8d360a6909e5c5b), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c7d), EConversationDebugInfo::Executing);
                G1R.FireMagesPermission = 1;
                DC(int64(0x8d360a6909e5c7d), EConversationDebugInfo::Done);
                DC(int64(0xb19fe5feff58b03), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb19fe5feff58b03), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Rodriguez_133001 : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0x8d360a6909e5c70);
            default Caption = LocText("TEXT_WIP_ZLCTYHF_20241216_180429_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rodriguez_133001);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7ad9abd50e872bc6), Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8d360a6909e5c71), EConversationDebugInfo::Executing);
                // I'm looking for Milten, do you know where he might be?
                Hero.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_180429_2386"));
                DC(int64(0x8d360a6909e5c71), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c78), EConversationDebugInfo::Executing);
                
                // He has spoken to the master and left.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_181102"));
                DC(int64(0x8d360a6909e5c78), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c79), EConversationDebugInfo::Executing);
                // I've been asked to fill in for him while he is away.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_181115"));
                DC(int64(0x8d360a6909e5c79), EConversationDebugInfo::Done);
                DC(int64(0xb19fe5feff58b04), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb19fe5feff58b04), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rodriguez_231756 : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0xb19fe5feff58abc);
            default Caption = LocText("INFO_FREEMINEORC_EXIT_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb19fe5feff58b02), EConversationDebugInfo::Executing);
                // I'll leave you be.
                Hero.AI.Say(LocText("INFO_FREEMINEORC_EXIT_15_01"));
                DC(int64(0xb19fe5feff58b02), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRodriguez211573 : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0x5c017b6d6f800512);
            default Caption = LocText("TEXT_WIP_ZLCTYHF_20241216_174917");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRodriguez132723);
            default Rules.HideIfKnows(UChoiceRodriguez211573);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_200_THORUS_WANNABEMAGE_INFO_09_02"), int64(0x5c017b6d6f800512));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x38e3477028edfa1b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x5c017b6d6f80051c), G1R.FireMagesPermission < 1);
                    DB(int64(0x5c017b6d6f80051d), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0x5c017b6d6f80051e), Rodriguez != nullptr && Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_Door));
                    DB(int64(0x425e95e2cf9e78b4), Rodriguez != nullptr && !Rodriguez.IsRefusingToTalkWith(Hero));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (G1R.FireMagesPermission >= 1)
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Rodriguez != nullptr && !Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_Door))
                    return false;
                
                if (Rodriguez != nullptr && Rodriguez.IsRefusingToTalkWith(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c017b6d6f800510), EConversationDebugInfo::Executing);
                // I would like to meet Master Corristo.
                Hero.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_174917"));
                DC(int64(0x5c017b6d6f800510), EConversationDebugInfo::Done);
                DC(int64(0x5c017b6d6f800511), EConversationDebugInfo::Executing);
                
                // You're the one who helped in the swamp ritual, right?
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_174917_41"));
                DC(int64(0x5c017b6d6f800511), EConversationDebugInfo::Done);
                DC(int64(0x5c017b6d6f800514), EConversationDebugInfo::Executing);
                // Master mentioned that he wanted to meet you.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_175659"));
                DC(int64(0x5c017b6d6f800514), EConversationDebugInfo::Done);
                DC(int64(0x5c017b6d6f800515), EConversationDebugInfo::Executing);
                // Come in, he's upstairs.
                Rodriguez.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_180006"));
                DC(int64(0x5c017b6d6f800515), EConversationDebugInfo::Done);
                DC(int64(0x8d360a6909e5c7d), EConversationDebugInfo::Executing);
                G1R.FireMagesPermission = 1;
                DC(int64(0x8d360a6909e5c7d), EConversationDebugInfo::Done);
                DC(int64(0x5c017b6d6f800519), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5c017b6d6f800519), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRodriguezExit : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0x1099b9f6e25742fc);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1099b9f6e25742fd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1099b9f6e25742fd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRodriguezHello : UTopic_Hero__OC_KDF_RODRIGUEZ_400
        {
            default DebugId = int64(0x1099b9f6e25742fe);
            default Caption = LocText("DIA_RODRIGUEZ_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_KDF_MILTEN", n"FP_OC_STANDAROUND_92_MILTEN", 500.0f, int64(0x1099b9f6e25742fe));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1099b9f6e25742ff), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1099b9f6e2574300), EConversationDebugInfo::Executing);
                // I'm looking for the highest Fire Mage.
                Hero.AI.Say(LocText("DIA_RODRIGUEZ_HELLO_15_00"));
                DC(int64(0x1099b9f6e2574300), EConversationDebugInfo::Done);
                DC(int64(0x1099b9f6e2574301), EConversationDebugInfo::Executing);
                
                // Then talk to Milten. He takes care of the messengers. 
                Rodriguez.AI.Say(LocText("DIA_RODRIGUEZ_HELLO_12_01"));
                DC(int64(0x1099b9f6e2574301), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_RODRIGUEZ, Document::UDocumentSegment_Glossary_OC_KDF_RODRIGUEZ_Introduction);
                DC(int64(0x1099b9f6e2574302), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1099b9f6e2574302), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */