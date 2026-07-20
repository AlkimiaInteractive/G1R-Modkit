#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Shadowbeast_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Shadowbeast;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_095108"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Shadowbeast_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Shadowbeast;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_095130"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Shadowbeast_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Shadowbeast;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_095228"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Shadowbeast_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Shadowbeast;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_095236"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Shadowbeast_Entry5 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Shadowbeast;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_095246"));
            }
        }
        
        
        class UDocument_Glossary_Shadowbeast : UGlossaryCreaturesDocument
        {
            default Title = LocText("SHADOWBEAST");
            default Metadata.Add(n"GlossaryForCharacter", "SHADOWBEAST");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Shadowbeast_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Shadowbeast_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Shadowbeast : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Shadowbeast;
        }
    }
}
#endif /* WITH_STORY_G1R */