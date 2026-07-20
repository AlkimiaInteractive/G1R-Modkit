#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_NCBANDITSCAMP_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142143"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_FoundCamp : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142240"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_Trust : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142308"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_TrustProved : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142315"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_Mages : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142337"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_Quentin : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142415"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_CompletedThreat : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142442"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_CompletedDead : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142546"));
            }
        }
        
        
        class UDocumentSegment_CH3_NCBANDITSCAMP_CompleteNoThreat : UDocumentSegment
        {
            default InDocument = UDocument_CH3_NCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_142610"));
            }
        }
        
        
        class UDocument_CH3_NCBANDITSCAMP : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_NCBANDITSCAMP : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_NCBANDITSCAMP;
        }
    }
}
#endif /* WITH_STORY_G1R */