#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_ORCGRAVEYARD_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_Talas : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_TalasCoward : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FZNMDQD_20250612_141941"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_MeetLukor : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_LukorJoined : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_Key : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_Opened : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_7"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_InvisiblePower : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_9"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_Focus : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_10"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_LukorCrazy : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            default AutoEvaluateUnlockFor.Add(n"OG_GUR_BAALLUKOR_1211");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OG_GUR_BAALLUKOR_1211") != nullptr && AGothicCharacterState::FindByUniqueName(n"OG_GUR_BAALLUKOR_1211").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_11"));
            }
        }
        
        
        class UDocumentSegment_CH3_ORCGRAVEYARD_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ORCGRAVEYARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_ORCGRAVEYARD_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH3_ORCGRAVEYARD : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_ORCGRAVEYARD : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_ORCGRAVEYARD;
        }
    }
}
#endif /* WITH_STORY_G1R */