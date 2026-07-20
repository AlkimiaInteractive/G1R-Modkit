class UGA_TrollAdult_PickGoblin : UGA_AttackThrow
{
    UPROPERTY()
    AGothicCharacter m_SelectedProjectileCharacter;

    AGothicCharacter GetSelectedCharacter(AActor OwnerActor)
    {
        auto Troll = Cast<ATroll>(OwnerActor);
        if (Troll == nullptr)
            return nullptr;

        return Troll.m_SelectedProjectileCharacter;
    }

    // void SetSelectedCharacter(AActor OwnerActor, AGothicCharacter Character)
    // {
    //     auto Troll = Cast<ATroll>(OwnerActor);
    //     if (Troll == nullptr)
    //         return;

    //     Troll.m_SelectedProjectileCharacter = Character;
    // }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_SelectedProjectileCharacter = GetSelectedCharacter(GetAvatarActorFromActorInfo());
        if(m_SelectedProjectileCharacter == nullptr)
        {
            //Print("No Goblin projectile");
            EndAbility();
            return;
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnProjectileSpawned_Scriptable(AProjectileVisual ProjectileVisual)
    {
        Super::OnProjectileSpawned_Scriptable(ProjectileVisual);
       if(m_SelectedProjectileCharacter == nullptr)
        {
            //EndAbility();
            //return;
            //Print("No Cast");
            return;
        }

        Cast<AThrowableCharacterVisual>(ProjectileVisual).OnProjectileSpawned(m_SelectedProjectileCharacter);
    }

    UFUNCTION(BlueprintOverride)
    void InitializeProjectile_Scriptable(AProjectileVisual ProjectileVisual)
    {
        Cast<AThrowableCharacterVisual>(ProjectileVisual).InitializeProjectile();
        //SetSelectedCharacter(GetAvatarActorFromActorInfo(), nullptr);
    }
}
