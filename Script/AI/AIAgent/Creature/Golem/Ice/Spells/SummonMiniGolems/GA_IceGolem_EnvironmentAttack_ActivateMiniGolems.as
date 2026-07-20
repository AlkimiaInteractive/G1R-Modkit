class UGA_IceGolem_EnvironmentAttack_ActivateMiniGolems : UGA_EnvironmentAttack_SummonCreatureByHealth
{

    default m_spellConfigClass = USummonIceMiniGolem_IceGolem_SpellConfig::StaticClass();
    
    void GetAllSpawnerActorsByClass() override
    {
        GetAllActorsOfClass(AMiniGolemIceRockSpawnerVisual::StaticClass(), m_SpawnerActors);
    }

    void DoActivateCreature(AActor Actor) override
    {
        auto spawnerRock = Cast<AMiniGolemIceRockSpawnerVisual>(Actor);
        if(spawnerRock != nullptr)
        {
            spawnerRock.SetOwner(GetAvatarActorFromActorInfo());
            spawnerRock.DoActivate();
        }
    }

    void DoRestartCreature(AActor Actor) override
    {
        auto spawnerRock = Cast<AMiniGolemIceRockSpawnerVisual>(Actor);
        if(spawnerRock != nullptr)
        {
            spawnerRock.DoRestart();
        }       
    }
}