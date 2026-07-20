#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LURKER_BITE;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMw_1H_Axe_Sickle_01, 5, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000039), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_FISK.StartQuest();
                DC(int64(0x00000039), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES GetOldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */