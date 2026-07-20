#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_LP_Goal_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_LP_Goal;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171257"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/lockpicking_interface"), LocText("TEXT_WIP_DABMKKF_20260223_154448"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171259"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171305"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171320"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171334"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171927"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171937"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/lockpicking_invalid_move"), LocText("TEXT_WIP_DABMKKF_20260223_154550"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_171951"));
            }
        }
        
        
        class UDocument_Tut_LP_Goal : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_LP_Goal_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_170910";
            default m_SortOrder = 1107;
            default Metadata.Add(n"SortOrder", "1107");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_LP_Goal : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_LP_Goal;
        }
    }
}
#endif /* WITH_STORY_G1R */