#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_BAALTONDRAL_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTONDRAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_145214"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALTONDRAL_Talkative : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTONDRAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_152318"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALTONDRAL_Blessing : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTONDRAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_152620"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALTONDRAL_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTONDRAL;
            default AutoEvaluateUnlockFor.Add(n"SC_GUR_BAALTONDRAL_1203");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALTONDRAL_1203") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALTONDRAL_1203").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_152659"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_BAALTONDRAL : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_BAALTONDRAL_1203");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_BAALTONDRAL_1203");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalTondral_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalTondral_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_BAALTONDRAL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_BAALTONDRAL;
        }
    }
}
#endif /* WITH_STORY_G1R */