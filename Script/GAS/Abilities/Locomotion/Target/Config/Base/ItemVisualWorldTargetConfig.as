UCLASS(Abstract)
class UItemVisualWorldTargetConfig_AS : UItemVisualWorldTargetConfig
{
    default m_DetectionRadiusAI = 1500.f;
    default m_DetectionRadiusPlayer = 1500.f;

    default m_TargetCheckVisibilityRate = 0.25f;
    default m_TargetLostTimeout = 1.0f;

	default m_ShouldFindTargetOnVisualLost = false;
	default m_ShouldFindTargetOnTargetDefeated = false;
	default m_ShouldFindTargetOnTargetDie = false;
	default m_ShouldFindTargetOnTargetCantBeTargeted = true;

    UFUNCTION(BlueprintOverride)
    bool IsValidTarget_Scriptable(const USceneComponent Comp, AActor AvatarActor) const
    {
        if(Comp == nullptr || AvatarActor == nullptr)
            return false;

        auto targetActor = Comp.GetOwner();
        if(targetActor == nullptr)
            return false;

        //@DE - ACarriableWorldItem are AI items like world boxes
        auto carriableWorlditem = Cast<ACarriableWorldItem>(targetActor);
        if(carriableWorlditem != nullptr)
            return false;

        auto itemVisualWorld = Cast<AItemVisualWorld>(targetActor);
        if(itemVisualWorld == nullptr)
            return false;
        auto itemDef = itemVisualWorld.GetItemDefinition();
        if(itemDef == nullptr)
            return false;
         //@DE - Focus stones cant be get by telekinesis.
        if(itemDef.IsA(UOG_FocusStone::StaticClass()))
            return false;

        UInteractiveComponent interactiveComp = Cast<UInteractiveComponent>(targetActor.GetComponentByClass(UInteractiveComponent::StaticClass()));
        if(interactiveComp == nullptr)
            return false;

        if(!CheckVisibility(Comp, AvatarActor))
            return false;
        
        bool canInteract = interactiveComp.GetActorToInteract() == nullptr && !interactiveComp.GetIsBeingUsed();
        //Print(canInteract ? "CAN INTERACT" : "No Interact", 5.f, canInteract ? FLinearColor::Green : FLinearColor::Red); 
        return interactiveComp.GetActorToInteract() == nullptr && !interactiveComp.GetIsBeingUsed();
    }
}