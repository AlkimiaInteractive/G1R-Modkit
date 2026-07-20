UCLASS()
class UComplainAboutNegativeScalesTool : UGothicScriptedEditorMenuEntry
{
    default EntryName = "Log StaticMeshes with negative Scale";
    default EntrySubmenu = "Level";

    UFUNCTION(BlueprintOverride)
    void OnMenuEntrySelected()
    {
        int n = 0;
        for (auto Component : UEditorActorSubsystem::Get().AllLevelActorsComponents)
        {
            auto StaticMesh = Cast<UStaticMeshComponent>(Component);

            if (StaticMesh == nullptr)
                continue;

            if (StaticMesh.WorldScale.X < 0 || StaticMesh.WorldScale.Y < 0 || StaticMesh.WorldScale.Z < 0)
            {
                Warning(f"{StaticMesh.Owner.GetActorLabel()} has negative scale ({StaticMesh.WorldScale})");

                n += 1;
            }
        }

        Warning(f"Found {n} components with negative scale");
    }
}