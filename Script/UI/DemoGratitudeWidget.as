// Copyright by THQ Nordic & Alkimia Interactive

// This is the "thank you for playing" screen for the end of public demos
// It will use a random background image from loose image files from the given folder and a fixed list of texture assets
UCLASS()
class UDemoGratitudeWidget : UDemoGratitudeWidgetBase
{
    // Path of the folder that will be searched for images
    // Can be an absolute path or a relative path (starting with '/'. Base directory will be the project dir)
    default m_FolderPath = "/Backgrounds";
    // List of additional texture assets to use
    //default m_BackgroundImages.Add(TSoftObjectPtr<UTexture2D>(FSoftObjectPath("/Script/Engine.Texture2D'/Game/UI/Textures/Common/T_DeathScreen_Background.T_DeathScreen_Background'")));
}
