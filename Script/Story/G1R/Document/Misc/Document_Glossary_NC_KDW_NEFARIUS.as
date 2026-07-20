#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_KDW_NEFARIUS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_NEFARIUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_152737"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_NEFARIUS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_NEFARIUS;
            default AutoEvaluateUnlockFor.Add(n"NC_KDW_NEFARIUS_603");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_KDW_NEFARIUS_603") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_KDW_NEFARIUS_603").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_153622"));
            }
        }
        
        
        class UDocument_Glossary_NC_KDW_NEFARIUS : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_KDW_NEFARIUS_603");
            default Metadata.Add(n"GlossaryForCharacter", "NC_KDW_NEFARIUS_603");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Nefarius_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Nefarius_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_KDW_NEFARIUS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_KDW_NEFARIUS;
        }
    }
}
#endif /* WITH_STORY_G1R */