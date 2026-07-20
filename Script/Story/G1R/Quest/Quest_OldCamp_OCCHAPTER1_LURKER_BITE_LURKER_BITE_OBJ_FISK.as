#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LURKER_BITE;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                DC(int64(0x0000003e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_LURKERBITE_FISK);
                DC(int64(0x0000003e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LURKERBITE, Document::UDocumentSegment_CH1_LURKERBITE_Entry2);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK GetOldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */