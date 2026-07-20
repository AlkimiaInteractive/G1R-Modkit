#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Parry_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Parry;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_123025"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_123036"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/parry_timing"), LocText("TEXT_WIP_DABMKKF_20260223_153200"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123054"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123105"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123116"));
            }
        }
        
        
        class UDocument_Tut_MC_Parry : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Parry_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_123018";
            default m_SortOrder = 402;
            default Metadata.Add(n"SortOrder", "402");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Parry : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Parry;
        }
    }
}
#endif /* WITH_STORY_G1R */