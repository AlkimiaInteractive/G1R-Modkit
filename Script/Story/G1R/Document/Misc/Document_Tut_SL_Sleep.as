#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_SL_Sleep_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_SL_Sleep;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134701"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134714"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134716"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/sleep_ui_clock"), LocText("TEXT_WIP_DABMKKF_20260223_154049"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134731"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134740"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134755"));
                AddSectionHeading(LocText("TEXT_WIP_EBBFEBC_20260205_134903"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134846"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_134853"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_135039"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_135056"));
                AddSectionHeading(LocText("TEXT_WIP_EBBFEBC_20260205_135301"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_135255"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/sleep_ui_recovery_preview+sleep_recovery_max"), LocText("TEXT_WIP_DABMKKF_20260223_154128"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_135324"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_135345"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/sleep_ui_recovery_preview+sleep_recovery_max"), LocText("TEXT_WIP_DABMKKF_20260223_154145"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_135403"));
            }
        }
        
        
        class UDocument_Tut_SL_Sleep : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_SL_Sleep_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_133452";
            default m_SortOrder = 1205;
            default Metadata.Add(n"SortOrder", "1205");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_SL_Sleep : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_SL_Sleep;
        }
    }
}
#endif /* WITH_STORY_G1R */