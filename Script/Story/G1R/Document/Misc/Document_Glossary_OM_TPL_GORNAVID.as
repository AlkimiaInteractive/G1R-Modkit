#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_TPL_GORNAVID_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_TPL_GORNAVID;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_115847"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_TPL_GORNAVID_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_TPL_GORNAVID;
            default AutoEvaluateUnlockFor.Add(n"OM_TPL_GORNAVID_1433");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_TPL_GORNAVID_1433") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_TPL_GORNAVID_1433").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_115910"));
            }
        }
        
        
        class UDocument_Glossary_OM_TPL_GORNAVID : UGlossarySwampCampDocument
        {
            default Title = LocText("OM_TPL_GORNAVID_1433");
            default Metadata.Add(n"GlossaryForCharacter", "OM_TPL_GORNAVID_1433");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNavid_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNavid_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_TPL_GORNAVID : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_TPL_GORNAVID;
        }
    }
}
#endif /* WITH_STORY_G1R */