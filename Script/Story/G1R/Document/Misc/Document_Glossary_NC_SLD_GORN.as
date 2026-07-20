#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_SLD_GORN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_GORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_115324"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_GORN_FourFriends : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_GORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_134843"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_GORN_Monastery : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_GORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_150937"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_GORN_FreeMine : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_GORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_153300"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_GORN_WaitFreeMine : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_GORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_154236"));
            }
        }
        
        
        class UDocument_Glossary_NC_SLD_GORN : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_SLD_GORN_699");
            default Metadata.Add(n"GlossaryForCharacter", "NC_SLD_GORN_699");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gorn_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gorn_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_SLD_GORN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_SLD_GORN;
        }
    }
}
#endif /* WITH_STORY_G1R */