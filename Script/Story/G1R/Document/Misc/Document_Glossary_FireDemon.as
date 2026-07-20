#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FireDemon_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireDemon;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_152852"));
            }
        }
        
        
        class UDocument_Glossary_FireDemon : UGlossaryCreaturesDocument
        {
            default Title = LocText("DEMON_FIRE");
            default Metadata.Add(n"GlossaryForCharacter", "DEMON_FIRE");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_FireDemon_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_FireDemon_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FireDemon : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FireDemon;
        }
    }
}
#endif /* WITH_STORY_G1R */