class UGA_TraceItem_Telekinesis : UGA_TraceTarget_Item
{
    default m_SpellConfig = UTelekinesisSpellConfig::StaticClass();

    default m_CastSpellClass = UGA_CastSpell_Telekinesis::StaticClass();

    float GetMinOffsetToValidItemTarget()
    {
        return Cast<UTelekinesisSpellConfig>(GetConfig()).m_MinOffsetToValidItemTarget;
    }

    bool IsTargetAtValidDistance(const AActor Actor) override
    {
        auto interactiveComp = Cast<UInteractiveComponent>(Actor.GetComponentByClass(UInteractiveComponent::StaticClass()));
        if(interactiveComp == nullptr)
            return false;

        float distance = Actor.GetActorLocation().Distance(GetAvatarActorFromActorInfo().ActorLocation);
        return distance > (interactiveComp.GetPlayerInteractDistance() + GetMinOffsetToValidItemTarget());
    }
}