#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_170604"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_JoinSC : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_104607"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_Amulet : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_110138"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_Mandibles : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_111629"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_PreparingInvocation : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_112308"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_CampDivided : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_112540"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_KalomCamp : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_113149"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORKALOM_SleeperFollower : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORKALOM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_112806"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_CORKALOM : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_CORKALOM_1201");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_CORKALOM_1201");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_CorKalom_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_CorKalom_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_CORKALOM : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_CORKALOM;
        }
    }
}
#endif /* WITH_STORY_G1R */