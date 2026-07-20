#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_STT_FISK_Introduction_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FISK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_160817"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_161213"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_FISK_FiskNewDealerCompleted : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FISK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_165838"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_165856"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_165904"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_FISK_FiskNewDealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FISK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_165142"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_165148"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_165203"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_FISK_Armor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FISK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LEKGWP_20251022_074413"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_FISK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FISK;
            default AutoEvaluateUnlockFor.Add(n"OC_STT_FISK_311");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_STT_FISK_311") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_STT_FISK_311").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_162321"));
            }
        }
        
        
        class UDocument_Glossary_OC_STT_FISK : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_STT_FISK_311");
            default Metadata.Add(n"GlossaryForCharacter", "OC_STT_FISK_311");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fisk_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fisk_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_STT_FISK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_STT_FISK;
        }
    }
}
#endif /* WITH_STORY_G1R */