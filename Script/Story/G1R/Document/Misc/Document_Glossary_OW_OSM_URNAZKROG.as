#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OSM_URNAZKROG_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OSM_URNAZKROG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_114423"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OSM_URNAZKROG_Chosen : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OSM_URNAZKROG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_114746"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OSM_URNAZKROG_DifferentOpinion : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OSM_URNAZKROG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_122453"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OSM_URNAZKROG_AccesToTemple : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OSM_URNAZKROG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_124833"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OSM_URNAZKROG_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OSM_URNAZKROG;
            default AutoEvaluateUnlockFor.Add(n"OW_OSM_URNAZKROG_2401");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OSM_URNAZKROG_2401") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OSM_URNAZKROG_2401").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_124800"));
            }
        }
        
        
        class UDocument_Glossary_OW_OSM_URNAZKROG : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OSM_URNAZKROG_2401");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OSM_URNAZKROG_2401");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Urnazkrog_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Urnazkrog_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OSM_URNAZKROG : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OSM_URNAZKROG;
        }
    }
}
#endif /* WITH_STORY_G1R */