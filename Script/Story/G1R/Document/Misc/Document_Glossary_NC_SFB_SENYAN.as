#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_SFB_SENYAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SFB_SENYAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_113923"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SFB_SENYAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SFB_SENYAN;
            default AutoEvaluateUnlockFor.Add(n"NC_SFB_SENYAN_1000");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_SFB_SENYAN_1000") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_SFB_SENYAN_1000").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_113940"));
            }
        }
        
        
        class UDocument_Glossary_NC_SFB_SENYAN : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_SFB_SENYAN_1000");
            default Metadata.Add(n"GlossaryForCharacter", "NC_SFB_SENYAN_1000");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Senyan_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Senyan_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_SFB_SENYAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_SFB_SENYAN;
        }
    }
}
#endif /* WITH_STORY_G1R */