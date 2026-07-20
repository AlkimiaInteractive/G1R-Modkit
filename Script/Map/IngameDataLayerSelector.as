class UIngameDataLayerSelector : UScriptWorldSubsystem
{
    TMap<FName, EDataLayerRuntimeState> Layers;

    // Options:
    //
    //  - Unloaded:  Not loaded (and not visble)
    //  - Loaded:    Loaded but not visible
    //  - Activated: Loaded and visible

    default Layers.Add(n"FluidNinja", EDataLayerRuntimeState::Activated);
    default Layers.Add(n"Freepoints", EDataLayerRuntimeState::Activated);
    default Layers.Add(n"Patrol", EDataLayerRuntimeState::Activated);
    
    //default Layers.Add(n"Items_Art", EDataLayerRuntimeState::Activated);
    default Layers.Add(n"Screenshots_Cinematics", EDataLayerRuntimeState::Activated);

    default Layers.Add(n"Hairstyles", EDataLayerRuntimeState::Unloaded);
    default Layers.Add(n"Niagara_Fire", EDataLayerRuntimeState::Unloaded);
    default Layers.Add(n"WayPoints", EDataLayerRuntimeState::Unloaded);
    default Layers.Add(n"WorldPoints", EDataLayerRuntimeState::Unloaded);
    default Layers.Add(n"Items_Art", EDataLayerRuntimeState::Unloaded);
    
    default Layers.Add(n"Blockouts", EDataLayerRuntimeState::Unloaded);

    UFUNCTION(BlueprintOverride)
    void PostInitialize()
    {
        if (World.IsEditorWorld())
            return;

        if (World.Name != "MainMap")
            return;

        for (auto Layer : Layers)
        {
            UDataLayerSubsystem::Get().SetDataLayerRuntimeStateByLabel(Layer.Key, Layer.Value);
        }
    }
}