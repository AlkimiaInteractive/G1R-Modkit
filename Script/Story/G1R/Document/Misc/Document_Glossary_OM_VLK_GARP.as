#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_VLK_GARP_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_GARP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_125509"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_GARP_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_GARP;
            default AutoEvaluateUnlockFor.Add(n"OM_VLK_GARP_587");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_VLK_GARP_587") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_VLK_GARP_587").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_094225"));
            }
        }
        
        
        class UDocument_Glossary_OM_VLK_GARP : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_VLK_GARP_587");
            default Metadata.Add(n"GlossaryForCharacter", "OM_VLK_GARP_587");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Garp_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Garp_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_VLK_GARP : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_VLK_GARP;
        }
    }
}
#endif /* WITH_STORY_G1R */