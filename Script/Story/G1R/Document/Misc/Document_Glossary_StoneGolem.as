#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_StoneGolem_Unlock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_StoneGolem;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_090539"));
            }
        }
        
        
        class UDocumentSegment_Glossary_StoneGolem_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_StoneGolem;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MHWBCKC_20250820_090547"));
            }
        }
        
        
        class UDocument_Glossary_StoneGolem : UGlossaryCreaturesDocument
        {
            default Title = LocText("GOLEM_STONE");
            default Metadata.Add(n"GlossaryForCharacter", "GOLEM_STONE");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Stone_Golem_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Stone_Golem_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_StoneGolem : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_StoneGolem;
        }
    }
}
#endif /* WITH_STORY_G1R */