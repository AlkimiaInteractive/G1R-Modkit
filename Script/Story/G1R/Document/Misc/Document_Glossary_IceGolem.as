#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_IceGolem_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_IceGolem;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_101115"));
            }
        }
        
        
        class UDocumentSegment_Glossary_IceGolem_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_IceGolem;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_101124"));
            }
        }
        
        
        class UDocument_Glossary_IceGolem : UGlossaryCreaturesDocument
        {
            default Title = LocText("GOLEM_ICE");
            default Metadata.Add(n"GlossaryForCharacter", "GOLEM_ICE");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Ice_Golem_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Ice_Golem_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_IceGolem : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_IceGolem;
        }
    }
}
#endif /* WITH_STORY_G1R */