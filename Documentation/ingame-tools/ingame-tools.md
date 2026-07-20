---
title: "Ingame Tools"
description: "Mod developer ImGui ingame tool panels."
sidebar:
  order: 1
---

Ingame tools can be enabled in the ModManagementUI or by passing the `-ingametools` commandline flag, and provide some developer tools that can be used at runtime. Mod developers can easily make their own ingame tool panels, too.

*Gothic 1 Remake* ships with two builtin panels:

 * **Outliner**: Shows all actors currently in the level (built in C++)
 * **Selected**: Actor Properties for the Actor selected in the Outliner

You can easily make your own custom panels by inheriting from `UInGameTool`:

```cpp
class UIngameTool_MyCustomToolPanel : UIngameTool
{
	default Category = "MyCustomTools";
	default MenuPath = "MyCustomTools.SomePath";
	default Title = "My Custom Tool Panel";

	UFUNCTION(BlueprintOverride)
	void Initialize()
	{
        // ...
	}

	UFUNCTION(BlueprintOverride)
	void DrawImGuiWindow()
	{
        ImGui::Text(f"Hello world! {World.TimeSeconds}");
    }
}
```

Once loaded into the game, you will find it in the top-menu bar.

To access other tools - ie. the Outliner to get the currently selected Actor - you can use:

```
IngameTool::Get(UIngameTool_Outliner).SelectedActor = ...;
```

## 3D Drawings and Gizmos

Additionally to the regular ImGui functions, you may also use the functions in

 * `ImGui::Draw3D` and 
 * `ImGui::Gizmo` 
 
from your ingame tool panels. 

