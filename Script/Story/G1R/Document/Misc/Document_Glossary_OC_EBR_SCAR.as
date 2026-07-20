#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_EBR_SCAR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_SCAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_145544"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_SCAR_Women : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_SCAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_152411"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_SCAR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_SCAR;
            default AutoEvaluateUnlockFor.Add(n"OC_EBR_SCAR_101");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_EBR_SCAR_101") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_EBR_SCAR_101").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_145610"));
            }
        }
        
        
        class UDocument_Glossary_OC_EBR_SCAR : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_EBR_SCAR_101");
            default Metadata.Add(n"GlossaryForCharacter", "OC_EBR_SCAR_101");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Scar_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Scar_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_EBR_SCAR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_EBR_SCAR;
        }
    }
}
#endif /* WITH_STORY_G1R */