#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_WOC_SYRA_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SYRA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_164546"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_SYRA_Trust : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SYRA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_164617"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_SYRA_Escape : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SYRA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_164836"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_SYRA_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SYRA;
            default AutoEvaluateUnlockFor.Add(n"OC_WOC_SYRA_109");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"OC_WOC_SYRA_109") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_WOC_SYRA_109").IsEveryoneOfThisKindDead()) || ((!IsCharacterInWorld(AGothicCharacterState::FindByUniqueName(n"OC_WOC_SYRA_109")) && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted()));
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_154015"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_SYRA_Safe : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SYRA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_154751"));
            }
        }
        
        
        class UDocument_Glossary_OC_WOC_SYRA : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_WOC_SYRA_109");
            default Metadata.Add(n"GlossaryForCharacter", "OC_WOC_SYRA_109");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Syra_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Syra_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_WOC_SYRA : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_WOC_SYRA;
        }
    }
}
#endif /* WITH_STORY_G1R */