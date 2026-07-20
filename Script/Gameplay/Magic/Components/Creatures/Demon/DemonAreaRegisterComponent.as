class UDemonAreaRegisterComponent : UCreatureGenericMagicComponent
{
    UPROPERTY(Replicated)
	TMap<EDemonAreaTypes, ADemonAreaVisual> m_SpawnedAreas;

    UDemonAreaRegisterComponent()
    {
        m_SpawnedAreas = TMap<EDemonAreaTypes, ADemonAreaVisual>();
    }


    bool CanSpawnArea(EDemonAreaTypes DemonAreaType)
    {
        return !Contains(DemonAreaType);
    }

    bool Contains(EDemonAreaTypes DemonAreaType)
    {
        if(m_SpawnedAreas.Contains(DemonAreaType))
        {
            if(m_SpawnedAreas[DemonAreaType] == nullptr)
                return false;
            return true;
        }
        return false;
    }


    void AddArea(ADemonAreaVisual DemonArea)
    {
        if(!Contains(DemonArea.m_AreaType))
        {
            m_SpawnedAreas.Add(DemonArea.m_AreaType, DemonArea);
        }
    }

    void RemoveArea(ADemonAreaVisual DemonArea)
    {
        if(Contains(DemonArea.m_AreaType))
        {
            m_SpawnedAreas.Remove(DemonArea.m_AreaType);
        }
    }



}