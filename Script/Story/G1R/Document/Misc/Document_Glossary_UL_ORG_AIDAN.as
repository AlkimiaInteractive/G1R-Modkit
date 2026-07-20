#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_ORG_AIDAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_AIDAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_113331"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_AIDAN_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_AIDAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_113327"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_AIDAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_AIDAN;
            default AutoEvaluateUnlockFor.Add(n"UL_ORG_AIDAN_859");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_ORG_AIDAN_859") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_ORG_AIDAN_859").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_113440"));
            }
        }
        
        
        class UDocument_Glossary_UL_ORG_AIDAN : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_ORG_AIDAN_859");
            default Metadata.Add(n"GlossaryForCharacter", "UL_ORG_AIDAN_859");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Aidan_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Aidan_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_ORG_AIDAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_ORG_AIDAN;
        }
    }
}
#endif /* WITH_STORY_G1R */