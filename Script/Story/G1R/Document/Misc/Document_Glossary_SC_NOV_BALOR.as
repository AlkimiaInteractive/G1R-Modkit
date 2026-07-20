#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_BALOR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_BALOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_115507"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_BALOR_CampDivided : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_BALOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_143108"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_BALOR_ReturnToSC : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_BALOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_143523"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_BALOR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_BALOR;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_BALOR_1304");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_BALOR_1304") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_BALOR_1304").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_155340"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_BALOR : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_BALOR_1304");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_BALOR_1304");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Balor_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Balor_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_BALOR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_BALOR;
        }
    }
}
#endif /* WITH_STORY_G1R */