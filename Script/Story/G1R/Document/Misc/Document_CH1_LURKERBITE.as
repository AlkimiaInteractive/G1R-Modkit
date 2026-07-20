#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_LURKERBITE_Entry1 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LURKERBITE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OKWAAOH_20241120_114306"));
            }
        }
        
        
        class UDocumentSegment_CH1_LURKERBITE_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LURKERBITE;
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK != nullptr && Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OKWAAOH_20241120_114416"));
            }
        }
        
        
        class UDocumentSegment_CH1_LURKERBITE_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LURKERBITE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OKWAAOH_20241120_114504"));
            }
        }
        
        
        class UDocumentSegment_CH1_LURKERBITE_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LURKERBITE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_OKWAAOH_20241120_114530"));
            }
        }
        
        
        class UDocument_CH1_LURKERBITE : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_LURKERBITE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_LURKERBITE;
        }
    }
}
#endif /* WITH_STORY_G1R */