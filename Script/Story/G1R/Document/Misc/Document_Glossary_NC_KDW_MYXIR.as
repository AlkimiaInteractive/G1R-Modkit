#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_KDW_MYXIR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_MYXIR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_150844"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_MYXIR_Vibrations : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_MYXIR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_152110"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_MYXIR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_MYXIR;
            default AutoEvaluateUnlockFor.Add(n"NC_KDW_MYXIR_601");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_KDW_MYXIR_601") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_KDW_MYXIR_601").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_152143"));
            }
        }
        
        
        class UDocument_Glossary_NC_KDW_MYXIR : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_KDW_MYXIR_601");
            default Metadata.Add(n"GlossaryForCharacter", "NC_KDW_MYXIR_601");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Myxir_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Myxir_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_KDW_MYXIR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_KDW_MYXIR;
        }
    }
}
#endif /* WITH_STORY_G1R */