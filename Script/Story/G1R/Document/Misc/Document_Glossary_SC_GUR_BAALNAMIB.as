#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_112429"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Ignore : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_112448"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Impress : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_113050"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Armor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_112655"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Tattoo : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MCIYDVF_20261014_155022"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Ink : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MCIYDVF_20261014_155017"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
            default AutoEvaluateUnlockFor.Add(n"SC_GUR_BAALNAMIB_1204");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALNAMIB_1204") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALNAMIB_1204").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_114549"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_BAALNAMIB : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_BAALNAMIB_1204");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_BAALNAMIB_1204");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalNamib_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalNamib_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_BAALNAMIB : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_BAALNAMIB;
        }
    }
}
#endif /* WITH_STORY_G1R */