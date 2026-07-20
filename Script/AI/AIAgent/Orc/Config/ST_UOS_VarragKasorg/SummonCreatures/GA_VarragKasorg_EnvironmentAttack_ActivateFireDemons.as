class UGA_VarragKasorg_EnvironmentAttack_ActivateFireDemons : UGA_EnvironmentAttack_SummonCreatureByHealth
{

    default m_spellConfigClass = USpellConfig_SummonFireDemons_VarragKasorg::StaticClass();
    
    void GetAllSpawnerActorsByClass() override
    {
        GetAllActorsOfClass(AKasorgFireDemonSpawnerVisual::StaticClass(), m_SpawnerActors);
    }

    void DoActivateCreature(AActor Actor) override
    {
        auto spawner = Cast<AKasorgFireDemonSpawnerVisual>(Actor);
        if(spawner != nullptr)
        {
            spawner.SetOwner(GetAvatarActorFromActorInfo());
            spawner.DoActivate();
        }
    }

    void DoRestartCreature(AActor Actor) override
    {
        auto spawner = Cast<AKasorgFireDemonSpawnerVisual>(Actor);
        if(spawner != nullptr)
        {
            spawner.DoRestart();
        }       
    }
}