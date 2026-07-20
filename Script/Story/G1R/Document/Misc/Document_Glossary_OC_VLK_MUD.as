#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_MUD_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_MUD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_145255"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_MUD_Annoying : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_MUD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_150819"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_MUD_Beated : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_MUD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_152343"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_MUD_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_MUD;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_MUD_574");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_MUD_574") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_MUD_574").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_094122"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_MUD : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_MUD_574");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_MUD_574");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Mud_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Mud_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_MUD : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_MUD;
        }
    }
}
#endif /* WITH_STORY_G1R */