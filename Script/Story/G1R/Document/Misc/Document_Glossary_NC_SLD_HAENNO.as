#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_SLD_HAENNO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_HAENNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_160421"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_HAENNO_CraftBows : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_HAENNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_104044"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_HAENNO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_HAENNO;
            default AutoEvaluateUnlockFor.Add(n"NC_SLD_HAENNO_741");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_SLD_HAENNO_741") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_SLD_HAENNO_741").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_104212"));
            }
        }
        
        
        class UDocument_Glossary_NC_SLD_HAENNO : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_SLD_HAENNO_741");
            default Metadata.Add(n"GlossaryForCharacter", "NC_SLD_HAENNO_741");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Haenno_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Haenno_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_SLD_HAENNO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_SLD_HAENNO;
        }
    }
}
#endif /* WITH_STORY_G1R */