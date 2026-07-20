#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PR_Base_Skill_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PR_Base_Skill;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_112152"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/stat_screen_lessons"), LocText("TEXT_WIP_DABMKKF_20260223_152937"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_114311"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_114447"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_114538"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_114550"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_114611"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_114618"));
            }
        }
        
        
        class UDocument_Tut_PR_Base_Skill : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PR_Base_Skill_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_112045";
            default m_SortOrder = 4;
            default Metadata.Add(n"SortOrder", "4");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PR_Base_Skill : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PR_Base_Skill;
        }
    }
}
#endif /* WITH_STORY_G1R */