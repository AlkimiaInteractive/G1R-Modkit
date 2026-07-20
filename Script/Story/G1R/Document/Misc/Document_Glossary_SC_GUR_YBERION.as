#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_YBERION_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_YBERION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_120100"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_YBERION_Invocation : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_YBERION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_143012"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_YBERION_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_YBERION;
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_143006"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_YBERION : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_YBERION_1200");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_YBERION_1200");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_YBerion_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_YBerion_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_YBERION : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_YBERION;
        }
    }
}
#endif /* WITH_STORY_G1R */