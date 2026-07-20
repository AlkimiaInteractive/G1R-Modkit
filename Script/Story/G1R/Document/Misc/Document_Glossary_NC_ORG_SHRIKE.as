#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_SHRIKE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SHRIKE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_091857"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_SHRIKE_AfterFight : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SHRIKE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_092714"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_SHRIKE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SHRIKE;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_SHRIKE_842");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_SHRIKE_842") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_SHRIKE_842").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_093706"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_SHRIKE : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_SHRIKE_842");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_SHRIKE_842");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Shrike_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Shrike_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_SHRIKE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_SHRIKE;
        }
    }
}
#endif /* WITH_STORY_G1R */