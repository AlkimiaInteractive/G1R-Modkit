#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_SHRIKESHUT_ReportGorn : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SHRIKESHUT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SHRIKESHUT_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_SHRIKESHUT_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SHRIKESHUT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SHRIKESHUT_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_SHRIKESHUT_End : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SHRIKESHUT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SHRIKESHUT_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_SHRIKESHUT_Fail : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SHRIKESHUT;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_SHRIKE_842");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_SHRIKE_842") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_SHRIKE_842").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WWCYNLH_20260204_103216"));
            }
        }
        
        
        class UDocument_CH1_SHRIKESHUT : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_SHRIKESHUT : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_SHRIKESHUT;
        }
    }
}
#endif /* WITH_STORY_G1R */