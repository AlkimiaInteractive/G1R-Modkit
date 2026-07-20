#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_HUNO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HUNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DXNCAVK_20250416_143824"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_HUNO_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HUNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DXNCAVK_20250416_144935"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_HUNO_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HUNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_103245"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_HUNO_GoodTeacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HUNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_103048"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_HUNO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_HUNO;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_HUNO_538");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_HUNO_538") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_HUNO_538").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093936"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_HUNO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_HUNO_538");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_HUNO_538");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Huno_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Huno_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_HUNO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_HUNO;
        }
    }
}
#endif /* WITH_STORY_G1R */