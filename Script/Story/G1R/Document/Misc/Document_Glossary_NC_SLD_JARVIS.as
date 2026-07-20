#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_SLD_JARVIS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_JARVIS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_154750"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_JARVIS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_JARVIS;
            default AutoEvaluateUnlockFor.Add(n"NC_SLD_JARVIS_728");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_SLD_JARVIS_728") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_SLD_JARVIS_728").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_155016"));
            }
        }
        
        
        class UDocument_Glossary_NC_SLD_JARVIS : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_SLD_JARVIS_728");
            default Metadata.Add(n"GlossaryForCharacter", "NC_SLD_JARVIS_728");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jarvis_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jarvis_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_SLD_JARVIS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_SLD_JARVIS;
        }
    }
}
#endif /* WITH_STORY_G1R */