#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_OCBANDITSCAMP_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_113919"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_Location : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_140720"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_FoundCamp : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_141210"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_Trust : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_141718"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_TrustProved : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_142635"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_Mages : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_142312"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_Quentin : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_143038"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_CompletedThreat : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_143247"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_CompletedDead : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_143531"));
            }
        }
        
        
        class UDocumentSegment_CH3_OCBANDITSCAMP_CompleteNoThreat : UDocumentSegment
        {
            default InDocument = UDocument_CH3_OCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_143652"));
            }
        }
        
        
        class UDocument_CH3_OCBANDITSCAMP : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_OCBANDITSCAMP : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_OCBANDITSCAMP;
        }
    }
}
#endif /* WITH_STORY_G1R */