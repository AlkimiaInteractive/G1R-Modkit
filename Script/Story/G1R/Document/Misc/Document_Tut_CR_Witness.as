#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CR_Witness_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CR_Witness;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125143"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125150"));
                AddParagraph(LocText("TEXT_WIP_EJEGGUI_20260326_172959"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125156"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125202"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125207"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125213"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125228"));
                AddParagraph(LocText("TEXT_WIP_EJEGGUI_20260326_173018"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125245"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125251"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125240"));
            }
        }
        
        
        class UDocument_Tut_CR_Witness : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CR_Witness_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_125136";
            default m_SortOrder = 1008;
            default Metadata.Add(n"SortOrder", "1008");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CR_Witness : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CR_Witness;
        }
    }
}
#endif /* WITH_STORY_G1R */