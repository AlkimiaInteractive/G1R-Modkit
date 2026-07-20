#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_FIREMAGES_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FIREMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TXFLHFD_20250618_155129"));
            }
        }
        
        
        class UDocumentSegment_CH4_FIREMAGES_Thorus : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FIREMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TXFLHFD_20250618_155223"));
            }
        }
        
        
        class UDocumentSegment_CH4_FIREMAGES_Corristo : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FIREMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TXFLHFD_20250618_155732"));
            }
        }
        
        
        class UDocumentSegment_CH4_FIREMAGES_Milten : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FIREMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TXFLHFD_20250618_160310"));
            }
        }
        
        
        class UDocumentSegment_CH4_FIREMAGES_Gomez : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FIREMAGES;
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return G1R::UStoryG1R::Get().FireMagesDead != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FIREMAGES_ENTRY_9"));
            }
        }
        
        
        class UDocumentSegment_CH4_FIREMAGES_Warn : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FIREMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FIREMAGES_ENTRY_10"));
            }
        }
        
        
        class UDocumentSegment_CH4_FIREMAGES_End : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FIREMAGES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FIREMAGES_ENTRY_2"));
            }
        }
        
        
        class UDocument_CH4_FIREMAGES : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_FIREMAGES : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_FIREMAGES;
        }
    }
}
#endif /* WITH_STORY_G1R */