#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Bloodfly_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Bloodfly;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_163352"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Bloodfly_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Bloodfly;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_163427"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Bloodfly_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Bloodfly;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_163441"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Bloodfly_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Bloodfly;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FVYSOSE_20250814_163453"));
            }
        }
        
        
        class UDocument_Glossary_Bloodfly : UGlossaryCreaturesDocument
        {
            default Title = LocText("BLOODFLY");
            default Metadata.Add(n"GlossaryForCharacter", "BLOODFLY");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Bloodfly_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Bloodfly_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Bloodfly : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Bloodfly;
        }
    }
}
#endif /* WITH_STORY_G1R */