#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_SLD_KHARIM_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_SLD_KHARIM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_154409"));
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_154415"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_SLD_KHARIM_Duel : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_SLD_KHARIM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_154457"));
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_154736"));
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_154744"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_SLD_KHARIM_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_SLD_KHARIM;
            default AutoEvaluateUnlockFor.Add(n"OC_SLD_KHARIM_729");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_SLD_KHARIM_729") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_SLD_KHARIM_729").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_162200"));
            }
        }
        
        
        class UDocument_Glossary_OC_SLD_KHARIM : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_SLD_KHARIM_729");
            default Metadata.Add(n"GlossaryForCharacter", "OC_SLD_KHARIM_729");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Kharim_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Kharim_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_SLD_KHARIM : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_SLD_KHARIM;
        }
    }
}
#endif /* WITH_STORY_G1R */