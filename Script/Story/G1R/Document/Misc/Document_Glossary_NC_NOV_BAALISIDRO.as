#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_NOV_BAALISIDRO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_NOV_BAALISIDRO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_162703"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_NOV_BAALISIDRO_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_NOV_BAALISIDRO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_104307_440"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_NOV_BAALISIDRO_HelpKagan : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_NOV_BAALISIDRO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_105459"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_NOV_BAALISIDRO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_NOV_BAALISIDRO;
            default AutoEvaluateUnlockFor.Add(n"NC_NOV_BAALISIDRO_1333");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_NOV_BAALISIDRO_1333") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_NOV_BAALISIDRO_1333").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_163526"));
            }
        }
        
        
        class UDocument_Glossary_NC_NOV_BAALISIDRO : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_NOV_BAALISIDRO_1333");
            default Metadata.Add(n"GlossaryForCharacter", "NC_NOV_BAALISIDRO_1333");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalIsidro_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalIsidro_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_NOV_BAALISIDRO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_NOV_BAALISIDRO;
        }
    }
}
#endif /* WITH_STORY_G1R */