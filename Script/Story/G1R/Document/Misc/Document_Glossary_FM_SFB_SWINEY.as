#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FM_SFB_SWINEY_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SFB_SWINEY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_131422"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SFB_SWINEY_Scraper : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SFB_SWINEY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_132452"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SFB_SWINEY_NotInterested : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SFB_SWINEY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_133814"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SFB_SWINEY_Interested : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SFB_SWINEY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_133833"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SFB_SWINEY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SFB_SWINEY;
            default AutoEvaluateUnlockFor.Add(n"FM_SFB_SWINEY_1037");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"FM_SFB_SWINEY_1037") != nullptr && AGothicCharacterState::FindByUniqueName(n"FM_SFB_SWINEY_1037").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_133954"));
            }
        }
        
        
        class UDocument_Glossary_FM_SFB_SWINEY : UGlossaryNewCampDocument
        {
            default Title = LocText("FM_SFB_SWINEY_1037");
            default Metadata.Add(n"GlossaryForCharacter", "FM_SFB_SWINEY_1037");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Swiney_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Swiney_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FM_SFB_SWINEY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FM_SFB_SWINEY;
        }
    }
}
#endif /* WITH_STORY_G1R */