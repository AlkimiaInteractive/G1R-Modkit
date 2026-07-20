#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_EBR_BARTHOLO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_BARTHOLO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_161115"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_BARTHOLO_Teleport : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_BARTHOLO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_161552"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_BARTHOLO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_BARTHOLO;
            default AutoEvaluateUnlockFor.Add(n"OC_EBR_BARTHOLO_106");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_EBR_BARTHOLO_106") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_EBR_BARTHOLO_106").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_161720"));
            }
        }
        
        
        class UDocument_Glossary_OC_EBR_BARTHOLO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_EBR_BARTHOLO_106");
            default Metadata.Add(n"GlossaryForCharacter", "OC_EBR_BARTHOLO_106");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Bartholo_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Bartholo_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_EBR_BARTHOLO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_EBR_BARTHOLO;
        }
    }
}
#endif /* WITH_STORY_G1R */