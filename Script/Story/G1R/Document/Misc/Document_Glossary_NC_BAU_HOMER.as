#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_HOMER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HOMER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_142710"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HOMER_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HOMER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_144125"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HOMER_DAM : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HOMER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FEKGWP_20251028_220725"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_HOMER_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_HOMER;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_HOMER_935");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_HOMER_935") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_HOMER_935").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_144703"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_HOMER : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_HOMER_935");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_HOMER_935");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Homer_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Homer_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_HOMER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_HOMER;
        }
    }
}
#endif /* WITH_STORY_G1R */