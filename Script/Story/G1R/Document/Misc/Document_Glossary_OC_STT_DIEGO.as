#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_STT_DIEGO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DIEGO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YAHLLEL_20250408_161157"));
                AddParagraph(LocText("TEXT_WIP_DZYJPTK_20250409_142639"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_DIEGO_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DIEGO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DZYJPTK_20250409_102611"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_DIEGO_FourFriends : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DIEGO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DZYJPTK_20250409_160210"));
                AddParagraph(LocText("TEXT_WIP_DZYJPTK_20250409_161906"));
                AddParagraph(LocText("TEXT_WIP_DZYJPTK_20250409_162004"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_DIEGO_FogTower : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DIEGO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_112532"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_DIEGO_Stonehenge : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DIEGO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_115012"));
            }
        }
        
        
        class UDocument_Glossary_OC_STT_DIEGO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_STT_DIEGO");
            default Metadata.Add(n"GlossaryForCharacter", "OC_STT_DIEGO");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Diego_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Diego_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_STT_DIEGO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_STT_DIEGO;
        }
    }
}
#endif /* WITH_STORY_G1R */