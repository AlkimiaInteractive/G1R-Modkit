// Copyright by THQ Nordic & Alkimia Interactive

// This is the "changelog" screen for the main menu, showing all updates and changes to the game.
UCLASS()
class UChangelogWidgetAS : UChangelogWidget
{
    // The absolute URL to the changelog index file, which lists all available changelogs.
    default m_ChangelogIndexURL = "https://files.gothic-game.com/changelogs/G1R_ChangelogIndex_Shipping.txt";
    // If this flag is set the order of the index entries will be reversed in the UI.
    default m_ReverseIndexOrder = false;

    // The base URL for individual changelog files. The full URL will be constructed by appending the line from the index file and the suffix.
    default m_ChangelogBaseURL = "https://files.gothic-game.com/changelogs/";
    // The suffix for individual changelog files. The full URL will be constructed by prepending the base URL and the line from the index file.
    default m_ChangelogURLSuffix = ".txt";

    /// The following settings are only used to get a display name from the changelog index entry if no explicit display name is specified!
    // A map of string replacements to apply to changelog entry names for better readability.
    default m_NameReplacementMap.Add("G1R_", "");
    default m_NameReplacementMap.Add("_", " ");
    // A prefix to add to the display name of each changelog entry.
    default m_DisplayNamePrefix = "";
    // A suffix to add to the display name of each changelog entry.
    default m_DisplayNameSuffix = "";
}
