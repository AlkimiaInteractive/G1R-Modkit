#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_SR_Riding_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_SR_Riding;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125951"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125959"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/scavenger_mount_prompt"), LocText("TEXT_WIP_DABMKKF_20260223_154918"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_130005"));
                AddParagraph(LocText("TEXT_WIP_AOZFMND_20260417_165631"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_130012"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_130018"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_130027"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_130035"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_130049"));
            }
        }
        
        
        class UDocument_Tut_SR_Riding : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_SR_Riding_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_125932";
            default m_SortOrder = 1208;
            default Metadata.Add(n"SortOrder", "1208");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_SR_Riding : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_SR_Riding;
        }
    }
}
#endif /* WITH_STORY_G1R */