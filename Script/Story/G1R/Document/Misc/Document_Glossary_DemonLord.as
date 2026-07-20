#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_DemonLord_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_DemonLord;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_153308"));
            }
        }
        
        
        class UDocument_Glossary_DemonLord : UGlossaryCreaturesDocument
        {
            default Title = LocText("DEMON LORD");
            default Metadata.Add(n"GlossaryForCharacter", "DEMON LORD");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_DemonLord01_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_DemonLord01_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_DemonLord : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_DemonLord;
        }
    }
}
#endif /* WITH_STORY_G1R */