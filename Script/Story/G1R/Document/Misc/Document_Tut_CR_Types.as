#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CR_Types_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CR_Types;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123810"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_123819"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_123826"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124124"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124133"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_124217"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124231"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124313"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_124327"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124336"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_124346"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_124355"));
            }
        }
        
        
        class UDocument_Tut_CR_Types : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CR_Types_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_123721";
            default m_SortOrder = 1007;
            default Metadata.Add(n"SortOrder", "1007");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CR_Types : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CR_Types;
        }
    }
}
#endif /* WITH_STORY_G1R */