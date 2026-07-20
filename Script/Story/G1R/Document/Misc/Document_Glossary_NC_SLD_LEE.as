#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_SLD_LEE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_LEE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_155558"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_LEE_BecomeMercenary : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_LEE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_155713"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_LEE_SecondChance : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_LEE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_155917"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_LEE_BackStory : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_LEE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_160059"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_LEE_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_LEE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_160220"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_SLD_LEE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_SLD_LEE;
            default AutoEvaluateUnlockFor.Add(n"NC_SLD_LEE_700");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_SLD_LEE_700") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_SLD_LEE_700").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_160229"));
            }
        }
        
        
        class UDocument_Glossary_NC_SLD_LEE : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_SLD_LEE_700");
            default Metadata.Add(n"GlossaryForCharacter", "NC_SLD_LEE_700");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lee_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Lee_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_SLD_LEE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_SLD_LEE;
        }
    }
}
#endif /* WITH_STORY_G1R */