#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Biter_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Biter;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_160820"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Biter_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Biter;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_160831"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Biter_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Biter;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_160930"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Biter_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Biter;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_161103"));
            }
        }
        
        
        class UDocument_Glossary_Biter : UGlossaryCreaturesDocument
        {
            default Title = LocText("BITER");
            default Metadata.Add(n"GlossaryForCharacter", "BITER");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Biter_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Biter_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Biter : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Biter;
        }
    }
}
#endif /* WITH_STORY_G1R */