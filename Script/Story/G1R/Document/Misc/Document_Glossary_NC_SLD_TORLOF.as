#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_SLD_TORLOF_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_TORLOF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_155141"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_TORLOF_Armor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_TORLOF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_155327"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_TORLOF_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_TORLOF;
            default AutoEvaluateUnlockFor.Add(n"NC_SLD_TORLOF_737");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_SLD_TORLOF_737") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_SLD_TORLOF_737").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_155423"));
            }
        }
        
        
        class UDocument_Glossary_NC_SLD_TORLOF : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_SLD_TORLOF_737");
            default Metadata.Add(n"GlossaryForCharacter", "NC_SLD_TORLOF_737");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Torlof_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Torlof_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_SLD_TORLOF : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_SLD_TORLOF;
        }
    }
}
#endif /* WITH_STORY_G1R */