enum EIngameTool_TransformGizmoMode
{
	None,
	Translate,
	Rotate,
	Scale
}

enum EIngameTool_TransformGizmoSpace
{
	Local,
	Global
}

/**
 * Automatically collected by UIngameTool_SelectedActorProperties. Allows user defined actor-class specific property visualizers.
 */
UCLASS(Abstract)
class UIngameTool_SelectedActorProperties_ActorVisualizer
{
	UPROPERTY(EditDefaultsOnly)
	TSubclassOf<AActor> ForActorsOfClass;

	UPROPERTY()
	AActor Actor;

	UPROPERTY()
	FString Title;

	void DrawImGuiForActor()
	{
		// Override, fill with your ImGui controls
	}
}

class UIngameTool_SelectedActorProperties : UIngameTool
{
	default Category = "World";
	default MenuPath = "World.Actors";
	default Title = "Selected Actor Properties";
	default bIsWindowOpen = true;
	default DefaultDockNode = EIngameToolPanelDockNode::RightBottom;

	UPROPERTY()
	EIngameTool_TransformGizmoMode GizmoMode = EIngameTool_TransformGizmoMode::Translate;

	UPROPERTY()
	EIngameTool_TransformGizmoSpace GizmoSpace = EIngameTool_TransformGizmoSpace::Global;

	TArray<UIngameTool_SelectedActorProperties_ActorVisualizer> ActorVisualizers;

	float GridSnapping = 0.0f;
	FString PropertyFilter;

	UFUNCTION(BlueprintOverride)
	void Initialize()
	{
		IngameTool::Get(UIngameTool_Outliner).OnSelectedElementChanged.AddUFunction(this, n"HandleSelectedElementChanged");
	}

	UFUNCTION()
	private void HandleSelectedElementChanged(UIngameToolOutlinerElement NewSelectedElement)
	{
		if (!IsValid(NewSelectedElement))
		{
			UpdateVisualizersForActor(nullptr);
			return;
		}

		auto NewSelectedActor = Cast<UIngameToolOutlinerElement_Actor>(NewSelectedElement);

		if (!IsValid(NewSelectedActor))
		{
			UpdateVisualizersForActor(nullptr);
			return;
	}

		UpdateVisualizersForActor(NewSelectedActor.SelectedActor);
	}

	UFUNCTION(BlueprintOverride)
	void DrawImGuiWindow()
	{
		if (!IsValid(SelectedActor))
		{
			ActorVisualizers.Reset();

			UIngameToolOutlinerElement Element = IngameTool::Get(UIngameTool_Outliner).SelectedElement;

			if (IsValid(Element))
			{
				DrawElement(Element);
			}
			else
			{
				ImGui::TextDisabled("Nothing selected in the Outliner.");
			}

			return;
		}

		ImGui::Text(SelectedActor.ActorNameOrLabel);
		ImGui::SeparatorText("Properties");

		if (ImGui::BeginChild("##SelectedActorProperties"))
		{
			DrawIdentity();

			ImGui::Separator();

			DrawTransform();

			if (ImGui::CollapsingHeader("Actor Properties"))
			{
				ImGui::InputTextWithHint(f"{Icon::SEARCH} Filter...", PropertyFilter);
				ImGui::Separator();
				ImGui::EditUObject(SelectedActor, PropertyFilter);
			}

			if (!ActorVisualizers.IsEmpty())
			{
				for (auto ActorVisualizer : ActorVisualizers)
				{
					if (!ImGui::CollapsingHeader(ActorVisualizer.Title.IsEmpty() ? ActorVisualizer.Class.Name.ToString() : ActorVisualizer.Title, bIsDefaultOpen = true))
						continue;

					ImGui::Indent();
					ImGui::BeginGroup();
					ActorVisualizer.DrawImGuiForActor();
					ImGui::EndGroup();
					ImGui::Unindent();
				}
			}
		}
		ImGui::EndChild();
	}

	UFUNCTION(BlueprintOverride)
	void DrawImGuiAlways()
	{
		DrawGizmo();
	}

	UFUNCTION(BlueprintOverride)
	void DrawImGuiQuickToolButtons()
	{
		ImGui::PushStyleVar(ImGuiStyleVar::ItemSpacing, FVector2D(0.0f, 0.0f));
		if (ImGui::SelectableButton(f"{Icon::MOUSE_POINTER}", GizmoMode == EIngameTool_TransformGizmoMode::None))
		{
			GizmoMode = EIngameTool_TransformGizmoMode::None;
		}
		ImGui::SetTooltipOnHover("None");

		if (ImGui::SelectableButton(f"{Icon::ARROWS}", GizmoMode == EIngameTool_TransformGizmoMode::Translate))
		{
			GizmoMode = EIngameTool_TransformGizmoMode::Translate;
		}
		ImGui::SetTooltipOnHover("Translate");

		if (ImGui::SelectableButton(f"{Icon::REPEAT}", GizmoMode == EIngameTool_TransformGizmoMode::Rotate))
		{
			GizmoMode = EIngameTool_TransformGizmoMode::Rotate;
		}
		ImGui::SetTooltipOnHover("Rotate");

		if (ImGui::SelectableButton(f"{Icon::EXPAND}", GizmoMode == EIngameTool_TransformGizmoMode::Scale))
		{
			GizmoMode = EIngameTool_TransformGizmoMode::Scale;
		}
		ImGui::SetTooltipOnHover("Scale");
		ImGui::PopStyleVar(); // ImGuiStyleVar::ItemSpacing

		bool bLocal = GizmoSpace == EIngameTool_TransformGizmoSpace::Local;
		if (ImGui::Button(bLocal ? f"{Icon::CUBE}" : f"{Icon::GLOBE}"))
		{
			GizmoSpace = bLocal ? EIngameTool_TransformGizmoSpace::Global : EIngameTool_TransformGizmoSpace::Local;
		}
		ImGui::SetTooltipOnHover(bLocal ? "Local" : "Global");

		if (ImGui::Button(Icon::TH))
		{
			ImGui::OpenPopup("GridSnappingSelection");
		}
		ImGui::SetTooltipOnHover("Grid snapping");

		if (ImGui::BeginPopup("GridSnappingSelection"))
		{
			if (ImGui::Selectable("0", GridSnapping == 0.0f))
			{
				GridSnapping = 0.0f;
			}
			if (ImGui::Selectable("1", GridSnapping == 1.0f))
			{
				GridSnapping = 1.0f;
			}
			if (ImGui::Selectable("5", GridSnapping == 5.0f))
			{
				GridSnapping = 5.0f;
			}
			if (ImGui::Selectable("10", GridSnapping == 10.0f))
			{
				GridSnapping = 10.0f;
			}
			if (ImGui::Selectable("25", GridSnapping == 25.0f))
			{
				GridSnapping = 25.0f;
			}
			if (ImGui::Selectable("50", GridSnapping == 50.0f))
			{
				GridSnapping = 50.0f;
			}
			if (ImGui::Selectable("100", GridSnapping == 100.0f))
			{
				GridSnapping = 100.0f;
			}

			ImGui::EndPopup();
		}
	}

	private AActor GetSelectedActor() const property
	{
		return IngameTool::Get(UIngameTool_Outliner).GetSelectedActor();
	}

	private void DrawIdentity()
	{
		FString ClassName = SelectedActor.Class.FullName;
		FString Path = SelectedActor.GetPathName();

		ImGui::InputText("Class", ClassName, ImGuiInputTextFlags::ReadOnly);
		ContextMenu_Copy("##ClassContext", "Class", ClassName);

		ImGui::InputText("Path", Path, ImGuiInputTextFlags::ReadOnly);
		ContextMenu_Copy("##PathContext", "Path", Path);
	}

	private void DrawTransform()
	{
		bool bHasRoot = IsValid(SelectedActor.RootComponent) && SelectedActor.RootComponent.IsA(USceneComponent);
		bool bStatic = bHasRoot && SelectedActor.RootComponent.Mobility == EComponentMobility::Static;

		ImGui::BeginDisabled(!bHasRoot);
		{
			FVector Location = SelectedActor.ActorLocation;
			FRotator Rotation = SelectedActor.ActorRotation;
			FVector Scale = SelectedActor.ActorScale3D;

			ImGui::DragFloat3(f"{Icon::ARROWS} Location", Location);
			ContextMenu_Copy("##LocationContext", "Location", Location.ToString());

			FVector Euler(Rotation.Pitch, Rotation.Yaw, Rotation.Roll);
			if (ImGui::DragFloat3(f"{Icon::REPEAT} Rotation", Euler))
			{
				Rotation = FRotator(Euler.X, Euler.Y, Euler.Z);
			}
			ContextMenu_Copy("##RotationContext", "Rotation", Rotation.ToString());

			ImGui::DragFloat3(f"{Icon::EXPAND} Scale", Scale, 0.01f);
			ContextMenu_Copy("##ScaleContext", "Scale", Scale.ToString());

			bool bChanged =
				Location != SelectedActor.ActorLocation ||
				Rotation != SelectedActor.ActorRotation ||
				Scale != SelectedActor.ActorScale3D;

			if (bChanged && !bStatic)
			{
				SelectedActor.ActorLocation = Location;
				SelectedActor.ActorRotation = Rotation;
				SelectedActor.ActorScale3D = Scale;
			}
		}
		ImGui::EndDisabled();
	}

	private void DrawElement(UIngameToolOutlinerElement Element)
	{
		ImGui::Text(Element.GetShortDisplayName());
		ImGui::SeparatorText("Properties");

		FString ClassName = Element.Class.Name.ToString();
		FString Path = Element.GetDisplayPath();

		ImGui::InputText("Type", ClassName, ImGuiInputTextFlags::ReadOnly);
		ImGui::InputText("Path", Path, ImGuiInputTextFlags::ReadOnly);
		ContextMenu_Copy("##ElementPathContext", "Path", Path);

		ImGui::Separator();

		FTransform Transform = Element.GetTransform();
		FVector Location = Transform.GetLocation();
		FRotator Rotation = Transform.Rotator();
		FVector Scale = Transform.GetScale3D();
		bool bChanged = false;

		ImGui::BeginDisabled(!CanTransformElement(Element));
		{
			if (ImGui::DragFloat3(f"{Icon::ARROWS} Location", Location))
			{
				bChanged = true;
			}
			ContextMenu_Copy("##ElementLocationContext", "Location", Location.ToString());

			FVector Euler(Rotation.Pitch, Rotation.Yaw, Rotation.Roll);
			if (ImGui::DragFloat3(f"{Icon::REPEAT} Rotation", Euler))
			{
				Rotation = FRotator(Euler.X, Euler.Y, Euler.Z);
				bChanged = true;
			}
			ContextMenu_Copy("##ElementRotationContext", "Rotation", Rotation.ToString());

			if (ImGui::DragFloat3(f"{Icon::EXPAND} Scale", Scale, 0.01f))
			{
				bChanged = true;
			}
			ContextMenu_Copy("##ElementScaleContext", "Scale", Scale.ToString());
		}
		ImGui::EndDisabled();

		if (bChanged)
		{
			Element.SetTransform(FTransform(Rotation, Location, Scale));
		}
	}

	private void DrawGizmo()
	{
		UIngameToolOutlinerElement Element = IngameTool::Get(UIngameTool_Outliner).SelectedElement;

		if (!CanTransformElement(Element))
			return;

		FTransform Transform = Element.GetTransform();
		FVector OldLocation = Transform.GetLocation();
		FRotator OldRotation = Transform.Rotator();
		FVector OldScale = Transform.GetScale3D();

		FVector Location = OldLocation;
		FRotator Rotation = OldRotation;
		FVector Scale = OldScale;

		bool bLocal = GizmoSpace == EIngameTool_TransformGizmoSpace::Local;
		FTransform WidgetTransform = bLocal ? Transform : FTransform::Identity;

		switch (GizmoMode)
		{
			case EIngameTool_TransformGizmoMode::None:
				break;
			case EIngameTool_TransformGizmoMode::Translate:
				ImGui::Gizmo::Translation("SelectedElementTranslation", Location, WidgetTransform, GridSnapping = GridSnapping);
				break;
			case EIngameTool_TransformGizmoMode::Rotate:
				ImGui::Gizmo::Rotation("SelectedElementRotation", Location, Rotation, WidgetTransform, GridSnapping = GridSnapping);
				break;
			case EIngameTool_TransformGizmoMode::Scale:
				ImGui::Gizmo::Scale("SelectedElementScale", Location, Scale, WidgetTransform, GridSnapping = GridSnapping);
				break;
		}

		bool bChanged =
			Location != OldLocation ||
			Rotation != OldRotation ||
			Scale != OldScale;

		if (bChanged)
		{
			Element.SetTransform(FTransform(Rotation, Location, Scale));
		}
	}

	private bool CanTransformElement(UIngameToolOutlinerElement Element) const
	{
		if (!IsValid(Element))
			return false;

		if (Element.IsReadOnly())
			return false;

		auto ActorElement = Cast<UIngameToolOutlinerElement_Actor>(Element);

		if (!IsValid(ActorElement))
			return true;

		AActor Actor = ActorElement.SelectedActor;

		if (!IsValid(Actor))
			return false;

		bool bHasRoot = IsValid(Actor.RootComponent) && Actor.RootComponent.IsA(USceneComponent);
		bool bStatic = bHasRoot && Actor.RootComponent.Mobility == EComponentMobility::Static;

		return bHasRoot && !bStatic;
	}

	// Adds a right-click "Copy <What>" entry to the previous item, copying Value to the clipboard.
	private void ContextMenu_Copy(const FString& Id, const FString& What, const FString& Value)
	{
		if (ImGui::BeginPopupContextItem(Id))
		{
			if (ImGui::MenuItem(f"{Icon::CLONE} Copy {What}"))
			{
				ImGui::SetClipboardText(Value);
			}

			ImGui::EndPopup();
		}
	}

	private void UpdateVisualizersForActor(AActor Actor)
	{
		ActorVisualizers.Reset();

		if (!IsValid(Actor))
			return;

		for (auto& VisualizerClass : GatherActorVisualizers(Actor.Class))
		{
			ActorVisualizers.Add(NewObject(this, VisualizerClass));
			ActorVisualizers.Last().Actor = Actor;
		}
	}

	private TArray<TSubclassOf<UIngameTool_SelectedActorProperties_ActorVisualizer>> GatherActorVisualizers(TSubclassOf<AActor> ForActorClass) const
	{
		TArray<TSubclassOf<UIngameTool_SelectedActorProperties_ActorVisualizer>> Result;

		for (auto VisualizerUClass : UClass::FindAllClassesInheritingFrom(UIngameTool_SelectedActorProperties_ActorVisualizer))
		{
			if (VisualizerUClass.IsAbstract())
				continue;

			TSubclassOf<UIngameTool_SelectedActorProperties_ActorVisualizer> VisualizerClass = VisualizerUClass;

			if (!IsValid(VisualizerClass.DefaultObject.ForActorsOfClass.Get()))
				continue;

			if (!ForActorClass.Get().IsChildOf(VisualizerClass.DefaultObject.ForActorsOfClass.Get()))
				continue;

			Result.Add(VisualizerClass);
		}

		return Result;
	}
}
