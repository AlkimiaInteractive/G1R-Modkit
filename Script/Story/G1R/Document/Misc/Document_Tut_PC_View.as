#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PC_View_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PC_View;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122745"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113521"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122800"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113526"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122814"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_113531"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122833"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122843"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122850"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_122902"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_122909"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_122915"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_122921"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_122934"));
            }
        }
        
        
        class UDocument_Tut_PC_View : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PC_View_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_122730";
            default m_SortOrder = 1204;
            default Metadata.Add(n"SortOrder", "1204");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PC_View : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PC_View;
        }
    }
}
#endif /* WITH_STORY_G1R */