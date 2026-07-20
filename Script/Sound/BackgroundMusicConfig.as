class UMenuMusicMode : UMusicModeParameter
{
    default Mode = EMusicMode::Menu;
    default Priority = 1.0f;

    UFUNCTION(BlueprintOverride)
    bool CanBeActivated() const
    {
        TArray<TSoftObjectPtr<UWorld>> MainMenuMaps = MusicSettings.MainMenuMap;

        if (MainMenuMaps.IsEmpty())
            return false;

        for (TSoftObjectPtr<UWorld> Map : MainMenuMaps)
        {
            if (!Map.IsValid())
                continue;

            if (IsMapActive(Map.Get()))
                return true;
        }

        return false;
    }
}

class UGameMusicMode : UMusicModeParameter
{
    default Mode = EMusicMode::Game;
    default Priority = 0.0f;
    default InappropriateModesToFollow.Add(UIntroMusicMode);

    UFUNCTION(BlueprintOverride)
    bool CanBeActivated() const
    {
        return true;
    }
}

class UDeathMusicMode : UMusicModeParameter
{
    default Mode = EMusicMode::Death;
    default Priority = 2.0;

    UFUNCTION(BlueprintOverride)
    bool CanBeActivated() const
    {
        if(PlayerCharacterState == nullptr)
            return false;

        return PlayerCharacterState.AbilitySystemComponent.HasGameplayTag(GameplayTag::State_Dead);
    }
}

class UCutsceneMusicMode : UMusicModeParameter
{
    default Mode = EMusicMode::Cutscene;
    default Priority = 3.0;

    UFUNCTION(BlueprintOverride)
    bool CanBeActivated() const
    {
        if(PlayerCharacterState == nullptr)
            return false;
        
        return PlayerCharacterState.AbilitySystemComponent.HasGameplayTag(GameplayTag::State_Cinematic);
    }
}

class UIntroMusicMode : UMusicModeParameter
{
    default Mode = EMusicMode::Cutscene;
    default Priority = 4.0f;

    UFUNCTION(BlueprintOverride)
    bool CanBeActivated() const
    {
        return PlayerCharacter == nullptr && IntroIsPlaying();
    }
}

class UCreditMusicMode : UMusicModeParameter
{
    default Mode = EMusicMode::Credits;
    default Priority = 3.0;

    UFUNCTION(BlueprintOverride)
    bool CanBeActivated() const
    {
        auto CreditScreenWidgetClass = MusicSettings.CreditScreenWidget;

        if(CreditScreenWidgetClass == nullptr)
            return false;

        return IsWidgetClassActive(CreditScreenWidgetClass);
    }
}

class UBossfightMusicMode : UMusicModeParameter
{
    default Mode = EMusicMode::BossFight;
    default Priority = 1.0;

    UFUNCTION(BlueprintOverride)
    bool CanBeActivated() const
    {
        return UMusicManager::Get(this).PlayerIsInBossFightMusicRegion();
    }
}