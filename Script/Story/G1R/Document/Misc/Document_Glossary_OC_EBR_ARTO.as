#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_EBR_ARTO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_ARTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_160643"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_ARTO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_ARTO;
            default AutoEvaluateUnlockFor.Add(n"OC_EBR_ARTO_102");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_EBR_ARTO_102") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_EBR_ARTO_102").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_161944"));
            }
        }
        
        
        class UDocument_Glossary_OC_EBR_ARTO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_EBR_ARTO_102");
            default Metadata.Add(n"GlossaryForCharacter", "OC_EBR_ARTO_102");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Arto_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Arto_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_EBR_ARTO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_EBR_ARTO;
        }
    }
}
#endif /* WITH_STORY_G1R */