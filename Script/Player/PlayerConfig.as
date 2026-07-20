UCLASS()
class AG1RPlayerState : AGothicPlayerState
{
	default CharacterConfig = Cast<UPlayerConfig>(UPlayerConfig_G1R::StaticClass().DefaultObject);

    UFUNCTION(BlueprintOverride)
    void PlayerStartLessons()
    {        
        UGothicAbilitySystemComponent GothicASC = AbilitySystemComponent;

        // Add abilities
        UDifficultyManager DiffManager = UDifficultyManager::Get();
        if (DiffManager != nullptr)
        {
            UScriptProgressionDifficultySettings ProgressionSettings = Cast<UScriptProgressionDifficultySettings>(DiffManager.GetProgressionDifficultySettings());
            if (ProgressionSettings != nullptr)
            {
                TArray<TSubclassOf<UGE_Skill_Generic>> LessonsToAdd = ProgressionSettings.GetDifficultyLessons();

                for (int i = 0; i < LessonsToAdd.Num(); i++)
                {
                    TSubclassOf<UGE_Skill_Generic> Lesson = LessonsToAdd[i];
                    GothicASC.ApplyGameplayEffectToSelf(Lesson, 1, GothicASC.MakeEffectContext());
                }
            }
        }
    }
}


UCLASS()
class UPlayerConfig_G1R : UPlayerConfig
{
	default  m_CharacterDefinition = UG1RPlayer::StaticClass();
	default  m_LocomotionConfig = ULocomotionConfig_Player::StaticClass();
	default  m_AnimConfig = UAnimConfig_Player::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Player::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}


UCLASS()
class UPlayerConfigTwo_G1R : UPlayerConfig_G1R
{
	default  m_CharacterDefinition = UGR2Player::StaticClass();
}

UCLASS()
class UPlayerConfigThree_G1R : UPlayerConfig_G1R
{
	default  m_CharacterDefinition = UGR3Player::StaticClass();
}

UCLASS()
class UPlayerConfigFour_G1R : UPlayerConfig_G1R
{
	default  m_CharacterDefinition = UGR4Player::StaticClass();
}

UCLASS()
class UPlayerConfigFive_G1R : UPlayerConfig_G1R
{
	default  m_CharacterDefinition = UGR5Player::StaticClass();
}

