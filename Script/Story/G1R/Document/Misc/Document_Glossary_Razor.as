#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Razor_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Razor;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_092817"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Razor_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Razor;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_092845"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Razor_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Razor;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_092853"));
            }
        }
        
        
        class UDocument_Glossary_Razor : UGlossaryCreaturesDocument
        {
            default Title = LocText("RAZOR");
            default Metadata.Add(n"GlossaryForCharacter", "RAZOR");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Razor_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Razor_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Razor : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Razor;
        }
    }
}
#endif /* WITH_STORY_G1R */