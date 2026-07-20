#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SkeletonMage_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SkeletonMage;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_141302"));
            }
        }
        
        
        class UDocument_Glossary_SkeletonMage : UGlossaryCreaturesDocument
        {
            default Title = LocText("SKELETONMAGE");
            default Metadata.Add(n"GlossaryForCharacter", "SKELETONMAGE");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Skeleton_Mage_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Skeleton_Mage_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SkeletonMage : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SkeletonMage;
        }
    }
}
#endif /* WITH_STORY_G1R */