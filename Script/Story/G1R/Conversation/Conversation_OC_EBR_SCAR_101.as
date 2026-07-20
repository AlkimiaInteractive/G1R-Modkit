#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_EBR_SCAR_101 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_EBR_SCAR_101";
        }
        
        
        class UTopic_Hero__OC_EBR_SCAR_101 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_EBR_SCAR_101";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetScar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceScar157640_0 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default DebugId = int64(0xed4abbb5972f5200);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceScar157640);
            
            default Rules.HideIfKnows(UChoiceScar157640_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f518b), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0xed4abbb5972f5192), G1R != nullptr && !G1R.HasReachedChapter(6));
                    DB(int64(0xed4abbb5972f51eb), Hero != nullptr && Hero.IsCloseToCharacter(Scar, 600.0f));
                    DB(int64(0xed4abbb5972f520c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(6))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Scar, 600.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd49be3d11e8564b), EConversationDebugInfo::Executing);
                // Had a hunch it would come to this.
                Scar.AI.Say(LocText("TEXT_WIP_NGQCOCC_20250320_162124"));
                DC(int64(0xdd49be3d11e8564b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScar157640_1 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScar157640_0);
            default Rules.HideIfKnows(UChoiceScar157640_1);
            default DebugId = int64(0xed4abbb5972f5200);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f51ff), EConversationDebugInfo::Executing);
                // You know, at first I thought you were useful. Then you ...
                Scar.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_113530_1091"));
                DC(int64(0xed4abbb5972f51ff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScar157640_2 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScar157640_1);
            default Rules.HideIfKnows(UChoiceScar157640_2);
            default DebugId = int64(0xed4abbb5972f5200);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f520f), EConversationDebugInfo::Executing);
                
                // I just want to get out of here.
                Hero.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_113827"));
                DC(int64(0xed4abbb5972f520f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScar157640 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScar157640_2);
            default Rules.HideIfKnows(UChoiceScar157640);
            default DebugId = int64(0xed4abbb5972f5200);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f5211), EConversationDebugInfo::Executing);
                
                // Bad news. You won't.
                Scar.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_113905"));
                DC(int64(0xed4abbb5972f5211), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScar157656_0 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default DebugId = int64(0xed4abbb5972f5204);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceScar157656);
            
            default Rules.HideIfKnows(UChoiceScar157656_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f518b), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0xed4abbb5972f5192), G1R != nullptr && !G1R.HasReachedChapter(6));
                    DB(int64(0xed4abbb5972f51eb), Hero != nullptr && Hero.IsCloseToCharacter(Scar, 600.0f));
                    DB(int64(0xed4abbb5972f520d), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(6))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Scar, 600.0f))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd49be3d11e8564c), EConversationDebugInfo::Executing);
                // Had a hunch it would come to this.
                Scar.AI.Say(LocText("TEXT_WIP_NGQCOCC_20250320_162136"));
                DC(int64(0xdd49be3d11e8564c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScar157656_1 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScar157656_0);
            default Rules.HideIfKnows(UChoiceScar157656_1);
            default DebugId = int64(0xed4abbb5972f5204);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f5203), EConversationDebugInfo::Executing);
                // You picked the wrong side, friend. You really fucked ...
                Scar.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_113621_651"));
                DC(int64(0xed4abbb5972f5203), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScar157656_2 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScar157656_1);
            default Rules.HideIfKnows(UChoiceScar157656_2);
            default DebugId = int64(0xed4abbb5972f5204);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f5210), EConversationDebugInfo::Executing);
                
                // I just want to get out of here.
                Hero.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_113851"));
                DC(int64(0xed4abbb5972f5210), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScar157656 : UTopic_Hero__OC_EBR_SCAR_101
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScar157656_2);
            default Rules.HideIfKnows(UChoiceScar157656);
            default DebugId = int64(0xed4abbb5972f5204);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f5212), EConversationDebugInfo::Executing);
                
                // Bad news. You won't.
                Scar.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_113914"));
                DC(int64(0xed4abbb5972f5212), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScarExit : UTopic_Hero__OC_EBR_SCAR_101
        {
            default DebugId = int64(0x8444020bb1bb3645);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8444020bb1bb3646), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8444020bb1bb3646), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceScarFrau : UTopic_Hero__OC_EBR_SCAR_101
        {
            default DebugId = int64(0x8444020bb1bb364e);
            default Caption = LocText("DIA_SCAR_FRAU_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScarWhat);
            default Rules.HideIfKnows(UChoiceScarFrau);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8444020bb1bb364f), EConversationDebugInfo::Executing);
                // There was a woman on the carts when they threw me in ...
                Hero.AI.Say(LocText("DIA_SCAR_FRAU_15_00"));
                DC(int64(0x8444020bb1bb364f), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb3650), EConversationDebugInfo::Executing);
                
                // And?
                Scar.AI.Say(LocText("DIA_SCAR_FRAU_08_01"));
                DC(int64(0x8444020bb1bb3650), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb3651), EConversationDebugInfo::Executing);
                
                // Is she here?
                Hero.AI.Say(LocText("DIA_SCAR_FRAU_15_02"));
                DC(int64(0x8444020bb1bb3651), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb3652), EConversationDebugInfo::Executing);
                
                // Aww. Caught your fancy, did she? Here's some advice for ...
                Scar.AI.Say(LocText("DIA_SCAR_FRAU_08_03"));
                DC(int64(0x8444020bb1bb3652), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb3653), EConversationDebugInfo::Executing);
                // She's Gomez's now. 
                Scar.AI.Say(LocText("DIA_SCAR_FRAU_08_04"));
                DC(int64(0x8444020bb1bb3653), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScarHello : UTopic_Hero__OC_EBR_SCAR_101
        {
            default DebugId = int64(0x8444020bb1bb3647);
            default Caption = LocText("DIA_SCAR_HELLO_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceScarHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8444020bb1bb3648), EConversationDebugInfo::Executing);
                
                // Who are you?
                Hero.AI.Say(LocText("DIA_SCAR_HELLO_15_00"));
                DC(int64(0x8444020bb1bb3648), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb3649), EConversationDebugInfo::Executing);
                
                // They call me Scar. 
                Scar.AI.Say(LocText("DIA_SCAR_HELLO_08_01"));
                DC(int64(0x8444020bb1bb3649), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_SCAR, Document::UDocumentSegment_Glossary_OC_EBR_SCAR_Introduction);
            }
        }
        
        
        class UChoiceScarPerm : UTopic_Hero__OC_EBR_SCAR_101
        {
            default DebugId = int64(0x8444020bb1bb3655);
            default Caption = LocText("DIA_SCAR_PERM_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScarFrau);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8444020bb1bb3656), EConversationDebugInfo::Executing);
                // What can you tell me about Gomez?
                Hero.AI.Say(LocText("DIA_SCAR_PERM_15_00"));
                DC(int64(0x8444020bb1bb3656), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb3657), EConversationDebugInfo::Executing);
                
                // What's there to say? He's the most powerful man in the ...
                Scar.AI.Say(LocText("DIA_SCAR_PERM_08_01"));
                DC(int64(0x8444020bb1bb3657), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb3658), EConversationDebugInfo::Executing);
                // He can take whatever he wants, though what he's really ...
                Scar.AI.Say(LocText("DIA_SCAR_PERM_08_02"));
                DC(int64(0x8444020bb1bb3658), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScarWhat : UTopic_Hero__OC_EBR_SCAR_101
        {
            default DebugId = int64(0x8444020bb1bb364a);
            default Caption = LocText("DIA_SCAR_WHAT_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScarHello);
            default Rules.HideIfKnows(UChoiceScarWhat);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8444020bb1bb364b), EConversationDebugInfo::Executing);
                
                // And ... what's your job?
                Hero.AI.Say(LocText("DIA_SCAR_WHAT_15_00"));
                DC(int64(0x8444020bb1bb364b), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb364c), EConversationDebugInfo::Executing);
                
                // I make sure Gomez doesn't get any uninvited guests. Arto ...
                Scar.AI.Say(LocText("DIA_SCAR_WHAT_08_01"));
                DC(int64(0x8444020bb1bb364c), EConversationDebugInfo::Done);
                DC(int64(0x8444020bb1bb364d), EConversationDebugInfo::Executing);
                // Oh, and I also look after the women. You know, making ...
                Scar.AI.Say(LocText("DIA_SCAR_WHAT_08_02"));
                DC(int64(0x8444020bb1bb364d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_SCAR, Document::UDocumentSegment_Glossary_OC_EBR_SCAR_Women);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */