#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Wolf_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Wolf;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_112939"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Wolf_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Wolf;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_112959"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Wolf_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Wolf;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_113006"));
            }
        }
        
        
        class UDocument_Glossary_Wolf : UGlossaryCreaturesDocument
        {
            default Title = LocText("WOLF");
            default Metadata.Add(n"GlossaryForCharacter", "WOLF");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Wolf_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Wolf_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Wolf : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Wolf;
        }
    }
}
#endif /* WITH_STORY_G1R */