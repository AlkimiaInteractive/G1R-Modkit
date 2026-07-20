#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_ROSCOE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_ROSCOE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_144538"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_ROSCOE_Permission : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_ROSCOE;
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return G1R::UStoryG1R::Get().Lares_Permission != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_170338"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_ROSCOE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_ROSCOE;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_ROSCOE_840");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_ROSCOE_840") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_ROSCOE_840").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_160532"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_ROSCOE : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_ROSCOE_840");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_ROSCOE_840");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Roscoe_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Roscoe_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_ROSCOE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_ROSCOE;
        }
    }
}
#endif /* WITH_STORY_G1R */