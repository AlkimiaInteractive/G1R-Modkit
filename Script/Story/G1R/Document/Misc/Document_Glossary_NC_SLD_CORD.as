#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_SLD_CORD_Introduction_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_CORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_114213"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_CORD_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_CORD;
            default AutoEvaluateUnlockFor.Add(n"NC_SLD_CORD_709");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_SLD_CORD_709") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_SLD_CORD_709").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_115152"));
            }
        }
        
        
        class UDocument_Glossary_NC_SLD_CORD : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_SLD_CORD_709");
            default Metadata.Add(n"GlossaryForCharacter", "NC_SLD_CORD_709");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cord_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cord_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_SLD_CORD : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_SLD_CORD;
        }
    }
}
#endif /* WITH_STORY_G1R */