#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_KDW_CRONOS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_CRONOS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_134911"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_CRONOS_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_CRONOS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_135712"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_CRONOS_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_CRONOS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_135822"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_CRONOS_WaterMessenger : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_CRONOS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_140402"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_CRONOS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_CRONOS;
            default AutoEvaluateUnlockFor.Add(n"NC_KDW_CRONOS_604");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_KDW_CRONOS_604") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_KDW_CRONOS_604").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_140907"));
            }
        }
        
        
        class UDocument_Glossary_NC_KDW_CRONOS : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_KDW_CRONOS_604");
            default Metadata.Add(n"GlossaryForCharacter", "NC_KDW_CRONOS_604");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cronos_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cronos_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_KDW_CRONOS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_KDW_CRONOS;
        }
    }
}
#endif /* WITH_STORY_G1R */