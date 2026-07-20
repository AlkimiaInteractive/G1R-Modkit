#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OPS_UMAKHAL_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_UMAKHAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_104831"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OPS_UMAKHAL_ThroneRoom : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_UMAKHAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_111127"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OPS_UMAKHAL_StopFollowing : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_UMAKHAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_111352"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OPS_UMAKHAL_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_UMAKHAL;
            default AutoEvaluateUnlockFor.Add(n"OW_OPS_UMAKHAL_2402");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OPS_UMAKHAL_2402") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OPS_UMAKHAL_2402").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_111524"));
            }
        }
        
        
        class UDocument_Glossary_OW_OPS_UMAKHAL : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OPS_UMAKHAL_2402");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OPS_UMAKHAL_2402");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Umakhal_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Umakhal_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OPS_UMAKHAL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OPS_UMAKHAL;
        }
    }
}
#endif /* WITH_STORY_G1R */