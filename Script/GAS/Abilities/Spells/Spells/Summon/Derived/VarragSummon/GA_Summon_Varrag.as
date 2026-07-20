UCLASS()
class UGA_Summon_Varrag : UGA_Summon_NotVisible_Delayed
{
    void InitializeSpawningVisualActor() override
    {
        Super::InitializeSpawningVisualActor();
        TArray<AActor> outActors;
        GetAllActorsOfClass(m_SpawningVisualActorClass, outActors);
        if(outActors.Num() > 0)
            m_SpawningVisualActor = Cast<ASummonCreatureVisualEffect>(outActors[0]);
    }
}