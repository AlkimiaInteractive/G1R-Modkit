#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_RIORDIAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_153726"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_RIORDIAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_154244"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Heal : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_RIORDIAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_154413"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_RIORDIAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_154531"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_KDW_RIORDIAN;
            default AutoEvaluateUnlockFor.Add(n"NC_KDW_RIORDIAN_605");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_KDW_RIORDIAN_605") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_KDW_RIORDIAN_605").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_154910"));
            }
        }
        
        
        class UDocument_Glossary_NC_KDW_RIORDIAN : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_KDW_RIORDIAN_605");
            default Metadata.Add(n"GlossaryForCharacter", "NC_KDW_RIORDIAN_605");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Riordian_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Riordian_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_KDW_RIORDIAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_KDW_RIORDIAN;
        }
    }
}
#endif /* WITH_STORY_G1R */