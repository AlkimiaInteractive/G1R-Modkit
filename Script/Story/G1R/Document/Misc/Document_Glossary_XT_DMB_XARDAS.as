#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_151311"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_TeachOrcish : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_152629"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_153300"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_Robe : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_153544"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_TeachMagic : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_155731"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_ChargeUriziel : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_160141"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_UrizielRune : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_160035"));
            }
        }
        
        
        class UDocumentSegment_Glossary_XT_DMB_XARDAS_SleeperTemple : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_XT_DMB_XARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_155834"));
            }
        }
        
        
        class UDocument_Glossary_XT_DMB_XARDAS : UGlossaryOutsidersDocument
        {
            default Title = LocText("XT_DMB_XARDAS_404");
            default Metadata.Add(n"GlossaryForCharacter", "XT_DMB_XARDAS_404");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Xardas_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Xardas_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_XT_DMB_XARDAS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_XT_DMB_XARDAS;
        }
    }
}
#endif /* WITH_STORY_G1R */