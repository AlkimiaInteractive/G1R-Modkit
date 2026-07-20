#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Skeleton_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Skeleton;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_100720"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Skeleton_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Skeleton;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_100728"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Skeleton_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Skeleton;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_100736"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Skeleton_Entry5 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Skeleton;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_100805"));
            }
        }
        
        
        class UDocument_Glossary_Skeleton : UGlossaryCreaturesDocument
        {
            default Title = LocText("SKELETON");
            default Metadata.Add(n"GlossaryForCharacter", "SKELETON");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Skeleton_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Skeleton_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Skeleton : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Skeleton;
        }
    }
}
#endif /* WITH_STORY_G1R */