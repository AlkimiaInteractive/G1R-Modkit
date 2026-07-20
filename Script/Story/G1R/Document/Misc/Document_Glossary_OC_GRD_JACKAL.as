#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_JACKAL_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_JACKAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_090359"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_JACKAL_PayMoney : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_JACKAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_090644"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_JACKAL_FreeMine : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_JACKAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_092017"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_JACKAL_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_JACKAL;
            default AutoEvaluateUnlockFor.Add(n"OC_GRD_JACKAL_201");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_GRD_JACKAL_201") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_GRD_JACKAL_201").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_092054"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_JACKAL : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_GRD_JACKAL_201");
            default Metadata.Add(n"GlossaryForCharacter", "OC_GRD_JACKAL_201");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jackal_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jackal_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_JACKAL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_JACKAL;
        }
    }
}
#endif /* WITH_STORY_G1R */