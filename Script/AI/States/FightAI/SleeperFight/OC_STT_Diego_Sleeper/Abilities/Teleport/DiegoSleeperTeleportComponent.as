class UDiegoSleeperTeleportComponent : UCreatureTeleportComponent
{
    UPROPERTY()
    FVector m_ExecutionLocation;
    UPROPERTY()
    bool m_ForceTeleportToExecutionLocation;

    FVector GetTeleportSpotLocation() override
    {
        //@DE - We do not need to find a teleport spot. We already have the location
        if(m_ForceTeleportToExecutionLocation)
		{
			FVector teleportLocation = m_ExecutionLocation;
			//Clear location for next execution
			m_ExecutionLocation = FVector::ZeroVector;
			m_ForceTeleportToExecutionLocation = false;
			return teleportLocation;
		}

		return Super::GetTeleportSpotLocation();
    }

    bool ShouldRotateCharacter() override
    {
        return true;
    }

    FRotator GetTeleportSpotRotation() override
    {
        auto gothicChar = Cast<AGothicCharacter>(GetOwner());
        auto rotation = gothicChar.GetActorRotation();
        if(gothicChar != nullptr)
        {
            auto targetedActor = gothicChar.GetTargetedActor();
            if(targetedActor != nullptr)
            {
                auto targetRotation =  MagicScript::FindLookAtRotation(GetTeleportSpotLocation(), targetedActor.GetActorLocation());
                rotation.Yaw = targetRotation.Yaw;
            }
        }

        return rotation;
    }

}
