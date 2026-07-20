class UExampleStatsPageExtension : UGothicModExt_WidgetExtension
{
	default AddToWidgetOfClass = n"/Game/UI/ManagementUI/Stats/W_Stats_Main.W_Stats_Main_C";

	TSoftObjectPtr<UDataTable> TextStyle = n"/Game/UI/Texts/TS_Dialogue.TS_Dialogue";

	// The games generic button. UButtonWidget itself is abstract, the looks live in the blueprint.
	TSoftClassPtr<UButtonWidget> ButtonWidgetClass = n"WidgetBlueprint'/Game/UI/Common/W_GenericButton.W_GenericButton_C'";

	UAlkRichTextBlock ExampleTextBlock;
	UAlkRichTextBlock CharacterLocationTextBlock;

	UFUNCTION(BlueprintOverride)
	void Initialize()
	{
		UUserWidget StatsPage = GetWidget();

		auto Content = StatsPage.GetWidgetFromName(n"ScrollBox_Content", UPanelWidget);

		if (!IsValid(Content))
		{
			Error("Example-StatsPage: Could not find the content area of the stats page.");
			return;
		}

		ExampleTextBlock = Cast<UAlkRichTextBlock>(StatsPage.ConstructWidget(UAlkRichTextBlock, n"ExampleTextBlock"));

		if (IsValid(ExampleTextBlock))
		{
			ExampleTextBlock.SetTextStyleSet(FAssetPreload::BlockingLoad(TextStyle));
			ExampleTextBlock.SetText(FText::FromString("Example Text Widget"));
			Content.AddChild(ExampleTextBlock);
		}

		CharacterLocationTextBlock = Cast<UAlkRichTextBlock>(StatsPage.ConstructWidget(UAlkRichTextBlock, n"CharacterLocationTextBlock"));

		if (IsValid(CharacterLocationTextBlock))
		{
			CharacterLocationTextBlock.SetTextStyleSet(FAssetPreload::BlockingLoad(TextStyle));
			Content.AddChild(CharacterLocationTextBlock);
		}

		auto ButtonWidget = Cast<UButtonWidget>(StatsPage.ConstructWidget(FAssetPreload::BlockingLoad(ButtonWidgetClass), n"ExampleButton"));

		if (IsValid(ButtonWidget))
		{
			// The label is a text block inside the widget blueprint.
			auto Label = ButtonWidget.GetWidgetFromName(n"TextBlock_Label", UTextBlock);

			if (IsValid(Label))
			{
					Label.SetText(FText::FromString("Example Button"));
			}

			ButtonWidget.m_OnClickedBP.AddUFunction(this, n"OnExampleButtonClicked");
			Content.AddChild(ButtonWidget);
		}
	}

	UFUNCTION()
	private void OnExampleButtonClicked()
	{
		AGothicPlayerState::MainPlayerState.IncreaseStrengthAttributeBy(1);
	}

	UFUNCTION(BlueprintOverride)
	void Tick(FGeometry MyGeometry, float InDeltaTime)
	{
		if (IsValid(CharacterLocationTextBlock))
		{
			FString Text;

			Text += "Location:\n";
			Text += f"\t{Gameplay::GetPlayerCharacter(0).ActorLocation.ToString()}\n";
			Text += "Time:\n";
			Text += f"\t{FInGameTime::Now().ToString()}\n";

			CharacterLocationTextBlock.SetText(FText::FromString(Text));
		}
	}
}
