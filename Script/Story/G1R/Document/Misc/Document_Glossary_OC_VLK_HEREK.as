#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_HEREK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HEREK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DXNCAVK_20250416_143417"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_HEREK_Introduction_2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HEREK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DXNCAVK_20250416_143440"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_HEREK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HEREK;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_HEREK_511");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_HEREK_511") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_HEREK_511").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093903"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_HEREK : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_HEREK_511");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_HEREK_511");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Herek_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Herek_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_HEREK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_HEREK;
        }
    }
}
#endif /* WITH_STORY_G1R */