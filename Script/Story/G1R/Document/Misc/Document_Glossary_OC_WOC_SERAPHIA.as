#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_WOC_SERAPHIA_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SERAPHIA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_164429"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_SERAPHIA_ChangeOpinion : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SERAPHIA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_164343"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_SERAPHIA_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SERAPHIA;
            default AutoEvaluateUnlockFor.Add(n"OC_WOC_SERAPHIA_110");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_WOC_SERAPHIA_110") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_WOC_SERAPHIA_110").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_154953"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_SERAPHIA_Safe : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_SERAPHIA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_155001"));
            }
        }
        
        
        class UDocument_Glossary_OC_WOC_SERAPHIA : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_WOC_SERAPHIA_110");
            default Metadata.Add(n"GlossaryForCharacter", "OC_WOC_SERAPHIA_110");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Seraphia_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Seraphia_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_WOC_SERAPHIA : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_WOC_SERAPHIA;
        }
    }
}
#endif /* WITH_STORY_G1R */