#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_ULUMULU_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_ULUMULU_ENTRY_8"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_Meet : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_ULUMULU_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_Lizard : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_ULUMULU_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_Shadowbeast : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_ULUMULU_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_Swampshark : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_ULUMULU_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_Troll : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_ULUMULU_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_Materials : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_ULUMULU_ENTRY_7"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_Zarr : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WVUDSGD_20250620_151229"));
            }
        }
        
        
        class UDocumentSegment_CH4_ULUMULU_TarrokDead : UDocumentSegment
        {
            default InDocument = UDocument_CH4_ULUMULU;
            default AutoEvaluateUnlockFor.Add(n"FM_OSL_TARROK_2001");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"FM_OSL_TARROK_2001") != nullptr && AGothicCharacterState::FindByUniqueName(n"FM_OSL_TARROK_2001").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WVUDSGD_20250620_151357"));
            }
        }
        
        
        class UDocument_CH4_ULUMULU : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_ULUMULU : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_ULUMULU;
        }
    }
}
#endif /* WITH_STORY_G1R */