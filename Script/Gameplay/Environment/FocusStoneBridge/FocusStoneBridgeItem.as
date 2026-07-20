UCLASS()
class AFocusStoneBridgeItem : AItemVisualWorld
{
    default m_InteractiveComponent.m_ForceDisableInteraction = true;
    default m_WorldItemDefinition = UItFocusStoneBridgeItem::StaticClass();

    UPROPERTY()
    ATelekinesisFocusStoneBridge m_TelekinesisBridgeActor;

    void DoDestroy()
    {
        m_WorldItemDefinition = nullptr;
        SetActorEnableCollision(false);
        SetLifeSpan(1.f);
    }
    
}

UCLASS()
class UItFocusStoneBridgeItem: UItemDefinition
{
	default m_Name = "FocusStoneBridgeItem";
	default m_Description = "FocusStoneBridgeItem";
	default m_MaxStack = 1;
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
};
