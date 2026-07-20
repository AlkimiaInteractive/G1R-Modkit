#if WITH_IMGUI

/**
 * This example shows how to add an ImGui debugging UI that is shown while the Character is inside a state.
 * The debug UI can be added to any state by overriding the DisplayImGui()-function.
 * 
 * To view the debug UI of the current state, go to "AI -> AIState" while playing.
 */

UCLASS()
class UAIState_Example_ImGuiDebug : UGothicCharacterAIState
{
    UPROPERTY()
    float32 DistanceLeft = 100.0f;
    
    UPROPERTY()
    float32 DistanceRight = 100.0f;

    UPROPERTY()
    FString SomeText;

    UPROPERTY()
    bool bEnableWaiting = false;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (true)
        {
            AI.GoLeft(DistanceLeft);

            if (bEnableWaiting)
            {
                WaitSeconds(3.0f);
            }

            AI.GoRight(DistanceRight);

            Print(f"SomeText says: {SomeText}");
        }
    }

    /** Override this to add your own debug UI to this AI state */
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        ImGui::Text("My example debugging UI!");

#if TEST
        // You can find a complete list of supported icons at https://forkaweso.me/Fork-Awesome/icons/
        ImGui::Text(f"Look, we have Icons like a Star {Icon::STAR_O} or a Gamepad! {Icon::GAMEPAD}");
#endif
        // We have colored text!
        ImGui::TextColored(FColor::Orange, "I'm orange!");
        ImGui::TextColored(FColor::Green, "I'm green!");

        ImGui::Separator();

        // Make use of f-String style string formatting!
        ImGui::Text(f"NPC is currently at {Self.ActorLocation}");
        
        ImGui::Separator();
        
        // Create bullet-lists!
        ImGui::Text("Attributes:");
        ImGui::BulletText(f"Health: {Self.GetHealthAttribute()}");
        ImGui::BulletText(f"Mana: {Self.GetManaAttribute()}");
        
        ImGui::Separator();

        // Put sliders for your values!
        ImGui::Slider("Distance Left", DistanceLeft, 0.0f, 500.0f);
        ImGui::Slider("Distance Right", DistanceRight, 0.0f, 500.0f);

        ImGui::Separator();

        // Display values!
        ImGui::ValueFloat("Distance Left", DistanceLeft);
        ImGui::ValueFloat("Distance Right", DistanceRight);

        // Create textboxes where text can be entered!
        ImGui::InputTextWithHint("Enter some Text", SomeText);
        
        ImGui::Separator();

        // You can have checkboxes that can be toggled!
        ImGui::Checkbox("Enable Waiting", bEnableWaiting);

        ImGui::Separator();

#if TEST
        // You can have clickable buttons!
        if (ImGui::Button(Icon::FILM)) 
        { 
            Print("Film?"); 
        }

        ImGui::SameLine();
        
        if (ImGui::Button(Icon::GLASS)) 
        { 
            Print("Glass?"); 
        }

        ImGui::SameLine();
        
        if (ImGui::Button(Icon::HANDSHAKE_O)) 
        { 
            Print("Handshake?"); 
        }
#endif

        ImGui::Separator();

        // Lists of selectable things!
        if (ImGui::Selectable("This"))
        {
            Print("Clicked this!"); 
        }
        
        if (ImGui::Selectable("That"))
        {
            Print("Clicked that!"); 
        }
        
        if (ImGui::Selectable("what?"))
        {
            Print("Clicked what?"); 
        }

        // You can put 3D debug drawings into the world, too!
        DebugScript::DrawCircle(Self.ActorLocation + FVector::UpVector * 20.0f, DistanceLeft, FColor::Blue);
    }
}
#endif