#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_POCK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_POCK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_105533"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_POCK_Reason : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_POCK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_105808"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_POCK_Dementia : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_POCK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MKCBYML_20250505_105941"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_POCK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_POCK;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_POCK_902");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_POCK_902") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_POCK_902").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_093614"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_POCK : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_POCK_902");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_POCK_902");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Pock_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Pock_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_POCK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_POCK;
        }
    }
}
#endif /* WITH_STORY_G1R */