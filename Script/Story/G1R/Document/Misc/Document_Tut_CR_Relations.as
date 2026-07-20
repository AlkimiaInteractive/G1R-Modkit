#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CR_Relations_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CR_Relations;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_124639"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124654"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124659"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124705"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_124716"));
            }
        }
        
        
        class UDocument_Tut_CR_Relations : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CR_Relations_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_124600";
            default m_SortOrder = 1006;
            default Metadata.Add(n"SortOrder", "1006");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CR_Relations : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CR_Relations;
        }
    }
}
#endif /* WITH_STORY_G1R */