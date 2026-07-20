class UStoneGolemTeleportComponent : UCreatureTeleportComponent
{
    default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Stone/BP_StoneGolem_Teleport_Visual.BP_StoneGolem_Teleport_Visual_C'";

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