#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OrcDog_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcDog;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_091047"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OrcDog_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcDog;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_091055"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OrcDog_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OrcDog;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_091103"));
            }
        }
        
        
        class UDocument_Glossary_OrcDog : UGlossaryCreaturesDocument
        {
            default Title = LocText("ORCDOG");
            default Metadata.Add(n"GlossaryForCharacter", "ORCDOG");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Orcdog_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Orcdog_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OrcDog : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OrcDog;
        }
    }
}
#endif /* WITH_STORY_G1R */