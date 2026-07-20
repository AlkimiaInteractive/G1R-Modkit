#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PC_Hearing_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PC_Hearing;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123158"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123212"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_123225"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_123233"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_123239"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_123244"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123252"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123302"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123320"));
            }
        }
        
        
        class UDocument_Tut_PC_Hearing : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PC_Hearing_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_123145";
            default m_SortOrder = 1202;
            default Metadata.Add(n"SortOrder", "1202");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PC_Hearing : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PC_Hearing;
        }
    }
}
#endif /* WITH_STORY_G1R */