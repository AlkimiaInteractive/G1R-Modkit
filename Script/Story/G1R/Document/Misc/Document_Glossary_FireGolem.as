#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FireGolem_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireGolem;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_091227"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FireGolem_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FireGolem;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_091236"));
            }
        }
        
        
        class UDocument_Glossary_FireGolem : UGlossaryCreaturesDocument
        {
            default Title = LocText("GOLEM_FIRE");
            default Metadata.Add(n"GlossaryForCharacter", "GOLEM_FIRE");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_FireGolem_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_FireGolem_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FireGolem : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FireGolem;
        }
    }
}
#endif /* WITH_STORY_G1R */