#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH5_THECHAMPIONBURIAL_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH5_THECHAMPIONBURIAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_110234"));
            }
        }
        
        
        class UDocumentSegment_CH5_THECHAMPIONBURIAL_BurialTip : UDocumentSegment
        {
            default InDocument = UDocument_CH5_THECHAMPIONBURIAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_110415"));
            }
        }
        
        
        class UDocumentSegment_CH5_THECHAMPIONBURIAL_BurialLocation : UDocumentSegment
        {
            default InDocument = UDocument_CH5_THECHAMPIONBURIAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_110506"));
            }
        }
        
        
        class UDocumentSegment_CH5_THECHAMPIONBURIAL_AccessDenied : UDocumentSegment
        {
            default InDocument = UDocument_CH5_THECHAMPIONBURIAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_120202"));
            }
        }
        
        
        class UDocumentSegment_CH5_THECHAMPIONBURIAL_AccessGranted : UDocumentSegment
        {
            default InDocument = UDocument_CH5_THECHAMPIONBURIAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_121555"));
            }
        }
        
        
        class UDocumentSegment_CH5_THECHAMPIONBURIAL_AfterBurial : UDocumentSegment
        {
            default InDocument = UDocument_CH5_THECHAMPIONBURIAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_133634"));
            }
        }
        
        
        class UDocumentSegment_CH5_THECHAMPIONBURIAL_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH5_THECHAMPIONBURIAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_135030"));
            }
        }
        
        
        class UDocument_CH5_THECHAMPIONBURIAL : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH5_THECHAMPIONBURIAL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH5_THECHAMPIONBURIAL;
        }
    }
}
#endif /* WITH_STORY_G1R */