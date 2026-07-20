#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_Zombie_Unlock1 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Zombie;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_114029"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Zombie_Unlock2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Zombie;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_114018"));
            }
        }
        
        
        class UDocumentSegment_Glossary_Zombie_Unlock3 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_Zombie;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OLOSEG_20250819_113919"));
            }
        }
        
        
        class UDocument_Glossary_Zombie : UGlossaryCreaturesDocument
        {
            default Title = LocText("ZOMBIE");
            default Metadata.Add(n"GlossaryForCharacter", "ZOMBIE");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Zombie_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Creatures/T_GlossaryImage_Zombie_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_Zombie : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_Zombie;
        }
    }
}
#endif /* WITH_STORY_G1R */