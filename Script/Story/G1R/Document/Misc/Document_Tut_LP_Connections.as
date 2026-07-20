#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_LP_Connections_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_LP_Connections;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171725"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/lockpicking_connections"), LocText("TEXT_WIP_DABMKKF_20260223_154505"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171727"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_171736"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_171743"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171751"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171801"));
            }
        }
        
        
        class UDocument_Tut_LP_Connections : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_LP_Connections_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_171459";
            default m_SortOrder = 1108;
            default Metadata.Add(n"SortOrder", "1108");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_LP_Connections : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_LP_Connections;
        }
    }
}
#endif /* WITH_STORY_G1R */