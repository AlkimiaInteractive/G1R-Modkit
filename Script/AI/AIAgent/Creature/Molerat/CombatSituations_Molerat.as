class UCS_CanPerformDigAttackTowardsTarget : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;

        auto DiggableTerrainSubsystem = Cast<UDiggableTerrainSubsystem>(UDiggableTerrainSubsystem::Get());

        if (!DiggableTerrainSubsystem.IsLocationDiggableTerrain(Combat.Self.NavAgentLocation))
            return false;

        FVector DirectionTowardsTarget = Combat.CharacterOfInterest.NavAgentLocation - Combat.Self.NavAgentLocation;
        DirectionTowardsTarget.Normalize();        
        
        int Resolution = 4;
        float StepDistance = Combat.Self.NavAgentLocation.Distance(Combat.CharacterOfInterest.NavAgentLocation) / Resolution;
        for (int i = 0; i < Resolution; i++)
        {
            FVector AttackExitLocation = Combat.Self.NavAgentLocation + DirectionTowardsTarget * StepDistance * i;
            if (!DiggableTerrainSubsystem.IsLocationDiggableTerrain(AttackExitLocation))
                return false;
        }

        if (!DiggableTerrainSubsystem.IsLocationDiggableTerrain(Combat.CharacterOfInterest.NavAgentLocation))
            return false;

        return true;
    }
}