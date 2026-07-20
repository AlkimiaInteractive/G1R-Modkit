#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_CORANGAR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORANGAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_164350"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORANGAR_Teach : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORANGAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_164442"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORANGAR_TeachIchor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORANGAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_164740"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORANGAR_Leader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORANGAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_165612"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORANGAR_WaitInTrainingArea : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORANGAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_170010"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_CORANGAR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_CORANGAR;
            default AutoEvaluateUnlockFor.Add(n"SC_GUR_CORANGAR_1202");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_GUR_CORANGAR_1202") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_GUR_CORANGAR_1202").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QMNINLL_20250512_170352"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_CORANGAR : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_CORANGAR_1202");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_CORANGAR_1202");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_CorAngar_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_CorAngar_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_CORANGAR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_CORANGAR;
        }
    }
}
#endif /* WITH_STORY_G1R */