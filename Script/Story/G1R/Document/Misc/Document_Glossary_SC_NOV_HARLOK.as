#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_HARLOK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_HARLOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_160416"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_HARLOK_Beated : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_HARLOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_160558"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_HARLOK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_HARLOK;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_HARLOK_1358");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_HARLOK_1358") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_HARLOK_1358").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_160547"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_HARLOK : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_HARLOK_1358");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_HARLOK_1358");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Harlok_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Harlok_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_HARLOK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_HARLOK;
        }
    }
}
#endif /* WITH_STORY_G1R */