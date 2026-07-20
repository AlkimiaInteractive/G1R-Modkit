UCLASS(Abstract)
class UIngameTool_PropertyVisualizer_MeshActorBase : UIngameTool_SelectedActorProperties_ActorVisualizer
{
    void DrawMeshComponentCommon(UMeshComponent Component)
    {
        ImGui::Text(f"Mobility: {ImGui::UEnumToString(Component.Mobility)}");
        ImGui::Text(f"Visible: {Component.IsVisible()}");
        ImGui::Text(f"Casts Shadow: {Component.CastShadow}");
        ImGui::Text(f"Collision: {ImGui::UEnumToString(Component.GetCollisionEnabled())}");

        int NumMaterials = Component.GetNumMaterials();
        ImGui::Text(f"Materials: {NumMaterials}");

        for (int i = 0; i < NumMaterials; i++)
        {
            UMaterialInterface Material = Component.GetMaterial(i);
            FString MaterialName = IsValid(Material) ? Material.GetName().ToString() : "None";
            ImGui::BulletText(f"[{i}] {MaterialName}");
        }
    }

    void DrawActorBounds()
    {
        FVector Origin;
        FVector Extent;
        Actor.GetActorBounds(false, Origin, Extent);

        ImGui::Text(f"Bounds Size: {Extent.X * 2.0f}, {Extent.Y * 2.0f}, {Extent.Z * 2.0f}");
    }
}

class UIngameTool_PropertyVisualizer_StaticMeshActor : UIngameTool_PropertyVisualizer_MeshActorBase
{
    default ForActorsOfClass = AStaticMeshActor;
    default Title = "Static Mesh";

    void DrawImGuiForActor() override
    {
        AStaticMeshActor MeshActor = Cast<AStaticMeshActor>(Actor);
        if (!IsValid(MeshActor))
        {
            ImGui::TextDisabled("Not an AStaticMeshActor.");
            return;
        }

        UStaticMeshComponent Component = MeshActor.StaticMeshComponent;
        if (!IsValid(Component))
        {
            ImGui::TextDisabled("No StaticMeshComponent.");
            return;
        }

        UStaticMesh Mesh = Component.StaticMesh;
        FString MeshName = IsValid(Mesh) ? Mesh.GetPathName() : "None";
        ImGui::Text(f"Mesh: {MeshName}");

        ImGui::SeparatorText("Rendering");
        DrawMeshComponentCommon(Component);
    }
}

class UIngameTool_PropertyVisualizer_SkeletalMeshActor : UIngameTool_PropertyVisualizer_MeshActorBase
{
    default ForActorsOfClass = ASkeletalMeshActor;
    default Title = "Skeletal Mesh";

    void DrawImGuiForActor() override
    {
        ASkeletalMeshActor MeshActor = Cast<ASkeletalMeshActor>(Actor);
        if (!IsValid(MeshActor))
        {
            ImGui::TextDisabled("Not an ASkeletalMeshActor.");
            return;
        }

        USkeletalMeshComponent Component = MeshActor.SkeletalMeshComponent;
        if (!IsValid(Component))
        {
            ImGui::TextDisabled("No SkeletalMeshComponent.");
            return;
        }

        USkeletalMesh Mesh = Component.GetSkeletalMeshAsset();
        FString MeshName = IsValid(Mesh) ? Mesh.GetName().ToString() : "None";
        ImGui::Text(f"Mesh: {MeshName}");

        UAnimInstance AnimInstance = Component.AnimInstance;
        FString AnimName = IsValid(AnimInstance) ? AnimInstance.GetName().ToString() : "None";
        ImGui::Text(f"Anim Instance: {AnimName}");

        ImGui::Text(f"Playing: {Component.IsPlaying()}");

        DrawActorBounds();

        ImGui::SeparatorText("Rendering");
        DrawMeshComponentCommon(Component);
    }
}
