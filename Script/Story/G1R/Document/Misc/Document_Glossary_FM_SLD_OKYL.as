#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FM_SLD_OKYL_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SLD_OKYL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_184146"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SLD_OKYL_Who : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SLD_OKYL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_184329"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SLD_OKYL_Access : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SLD_OKYL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_184345"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SLD_OKYL_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SLD_OKYL;
            default AutoEvaluateUnlockFor.Add(n"FM_SLD_OKYL_752");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"FM_SLD_OKYL_752") != nullptr && AGothicCharacterState::FindByUniqueName(n"FM_SLD_OKYL_752").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_184446"));
            }
        }
        
        
        class UDocument_Glossary_FM_SLD_OKYL : UGlossaryNewCampDocument
        {
            default Title = LocText("FM_SLD_OKYL_752");
            default Metadata.Add(n"GlossaryForCharacter", "FM_SLD_OKYL_752");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Okyl_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Okyl_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FM_SLD_OKYL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FM_SLD_OKYL;
        }
    }
}
#endif /* WITH_STORY_G1R */