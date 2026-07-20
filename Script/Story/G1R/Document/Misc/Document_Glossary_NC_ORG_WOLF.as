#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_WOLF_Introduction_Armor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WOLF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_110928"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_WOLF_TeachBow : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WOLF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_111217"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_WOLF_TradeBow : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WOLF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_111314"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_WOLF_TradeSkins_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WOLF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_112259"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_WOLF_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_WOLF;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_WOLF_855");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_WOLF_855") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_WOLF_855").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HWVXGON_20260609_095745"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_WOLF : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_WOLF_855");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_WOLF_855");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_CWolf_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_CWolf_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_WOLF : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_WOLF;
        }
    }
}
#endif /* WITH_STORY_G1R */