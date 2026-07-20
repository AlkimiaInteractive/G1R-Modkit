#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Snapper_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Snapper;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_110101"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Snapper_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Snapper;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_110124"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Snapper_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Snapper;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_110132"));
            }
        }
        
        
        class UDocument_Glossary_Snapper : UGlossaryCreaturesDocument
        {
            default Title = LocText("SNAPPER");
            default Metadata.Add(n"GlossaryForCharacter", "SNAPPER");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Snapper_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Snapper_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Snapper : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Snapper;
        }
    }
}
#endif /* WITH_STORY_G1R */