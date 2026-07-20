#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_STT_IAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_IAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_160654"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_IAN_Advice : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_IAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_161042"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_IAN_Lie : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_IAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_161810"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_IAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_IAN;
            default AutoEvaluateUnlockFor.Add(n"OM_STT_IAN_301");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_STT_IAN_301") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_STT_IAN_301").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_162245"));
            }
        }
        
        
        class UDocument_Glossary_OM_STT_IAN : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_STT_IAN_301");
            default Metadata.Add(n"GlossaryForCharacter", "OM_STT_IAN_301");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ian_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ian_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_STT_IAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_STT_IAN;
        }
    }
}
#endif /* WITH_STORY_G1R */