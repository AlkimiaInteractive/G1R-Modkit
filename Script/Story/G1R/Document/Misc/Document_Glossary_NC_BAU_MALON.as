#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_BAU_MALON_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_MALON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HJEGGUI_20260325_095242"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_MALON_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_MALON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HJEGGUI_20260325_095257"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_MALON_RicelordForeman : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_MALON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HJEGGUI_20260325_095318"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_BAU_MALON_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_BAU_MALON;
            default AutoEvaluateUnlockFor.Add(n"NC_BAU_MALON_930");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_BAU_MALON_930") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_BAU_MALON_930").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HJEGGUI_20260325_095341"));
            }
        }
        
        
        class UDocument_Glossary_NC_BAU_MALON : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_BAU_MALON_930");
            default Metadata.Add(n"GlossaryForCharacter", "NC_BAU_MALON_930");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Malon_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Malon_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_BAU_MALON : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_BAU_MALON;
        }
    }
}
#endif /* WITH_STORY_G1R */