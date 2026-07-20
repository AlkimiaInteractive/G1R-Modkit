#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CR_Fines_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CR_Fines;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125641"));
                AddParagraph(LocText("TEXT_WIP_EJEGGUI_20260326_171020"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111555"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125655"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125723"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125730"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125735"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125741"));
                AddBulletListEntry(LocText("TEXT_WIP_EBBFEBC_20260205_125747"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125719"));
            }
        }
        
        
        class UDocument_Tut_CR_Fines : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CR_Fines_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_125630";
            default m_SortOrder = 1010;
            default Metadata.Add(n"SortOrder", "1010");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CR_Fines : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CR_Fines;
        }
    }
}
#endif /* WITH_STORY_G1R */