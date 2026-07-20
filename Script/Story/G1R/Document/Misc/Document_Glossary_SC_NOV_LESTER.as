#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_LESTER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_LESTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_100025"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_LESTER_FourFriends : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_LESTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_115604"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_LESTER_FogTower : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_LESTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_103532"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_LESTER_Library : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_LESTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_121115"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_LESTER : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_LESTER");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_LESTER");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lester_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lester_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_LESTER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_LESTER;
        }
    }
}
#endif /* WITH_STORY_G1R */