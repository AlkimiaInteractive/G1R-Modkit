#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_BAALTYON_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_152942"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALTYON_Impress : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_161712"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALTYON_Ignore : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_161959"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALTYON_Joint : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_162353"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALTYON_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALTYON;
            default AutoEvaluateUnlockFor.Add(n"SC_GUR_BAALTYON_1210");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALTYON_1210") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALTYON_1210").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_162448"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_BAALTYON : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_BAALTYON_1210");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_BAALTYON_1210");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalTyon_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalTyon_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_BAALTYON : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_BAALTYON;
        }
    }
}
#endif /* WITH_STORY_G1R */