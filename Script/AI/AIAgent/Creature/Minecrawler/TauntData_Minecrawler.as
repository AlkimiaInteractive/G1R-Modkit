UCLASS()
class UTauntData_Minecrawler : UTauntData_Config
{
    /// MONTAGES
    FName MCrawler_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt01_Montage.MCrawler_Aggressive_Taunt01_Montage'";
    FName MCrawler_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt02_Montage.MCrawler_Aggressive_Taunt02_Montage'";
    FName MCrawler_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Observer_Taunt01_Montage.MCrawler_Observer_Taunt01_Montage'";
    FName MCrawler_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Short_Taunt01_Montage.MCrawler_Short_Taunt01_Montage'";

    FName MCrawler_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Warning/MCrawler_Warning_01_Montage.MCrawler_Warning_01_Montage'";
    FName MCrawler_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Warning/MCrawler_Warning_02_Montage.MCrawler_Warning_02_Montage'";
    FName MCrawler_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Warning/MCrawler_Warning_03_Montage.MCrawler_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCrawler_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCrawler_Taunt_01_Montage)
        .AddMontage(MCrawler_Taunt_02_Montage)
        .AddMontage(MCrawler_Taunt_03_Montage)
        .Set();

    // WARNING
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCrawler_Warning_01_Montage)
        .AddMontage(MCrawler_Warning_02_Montage)
        .AddMontage(MCrawler_Warning_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_Minecrawler_Warrior : UTauntData_Config
{
    /// MONTAGES
    FName MCWarrior_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Taunt/MCrawlerWarrior_Aggressive_Taunt01_Montage.MCrawlerWarrior_Aggressive_Taunt01_Montage'";
    FName MCWarrior_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Taunt/MCrawlerWarrior_Aggressive_Taunt02_Montage.MCrawlerWarrior_Aggressive_Taunt02_Montage'";
    FName MCWarrior_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Taunt/MCrawlerWarrior_Observer_Taunt01_Montage.MCrawlerWarrior_Observer_Taunt01_Montage'";
    FName MCWarrior_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Taunt/A_MCrawlerWarrior_Taunt_Short_01_Montage.A_MCrawlerWarrior_Taunt_Short_01_Montage'";

    FName MCWarrior_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Warning/MCrawler_Warrior_Warning_01_Montage.MCrawler_Warrior_Warning_01_Montage'";
    FName MCWarrior_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Warning/MCrawler_Warrior_Warning_02_Montage.MCrawler_Warrior_Warning_02_Montage'";
    FName MCWarrior_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Warning/MCrawler_Warrior_Warning_03_Montage.MCrawler_Warrior_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCWarrior_Taunt_01_Montage)
        .AddMontage(MCWarrior_Taunt_02_Montage)
        .AddMontage(MCWarrior_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCWarrior_Taunt_04_Montage)
        .AddMontage(MCWarrior_Taunt_01_Montage)
        .AddMontage(MCWarrior_Taunt_02_Montage)
        .AddMontage(MCWarrior_Taunt_03_Montage)
        .Set();

    // WARNING
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCWarrior_Warning_01_Montage)
        .AddMontage(MCWarrior_Warning_02_Montage)
        .AddMontage(MCWarrior_Warning_03_Montage)
        .Set();
    
}

UCLASS()
class UTauntData_Minecrawler_Queen_Ph1 : UTauntData_Config
{
    /// MONTAGES
    FName MCQueen_Ph1_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Taunt/A_MCQueen_Ph1_Taunt_01_Montage.A_MCQueen_Ph1_Taunt_01_Montage'";
    FName MCQueen_Ph1_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Taunt/A_MCQueen_Ph1_Taunt_02_Montage.A_MCQueen_Ph1_Taunt_02_Montage'";
    FName MCQueen_Ph1_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Taunt/A_MCQueen_Ph1_Taunt_03_Montage.A_MCQueen_Ph1_Taunt_03_Montage'";
    FName MCQueen_Ph1_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Taunt/A_MCQueen_Ph1_Taunt_Short_01_Montage.A_MCQueen_Ph1_Taunt_Short_01_Montage'";

    FName MCQueen_Warning_Ph1_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Warning/MCQueen_Ph1_Warning_01_Montage.MCQueen_Ph1_Warning_01_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCQueen_Ph1_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCQueen_Ph1_Taunt_01_Montage)
        .AddMontage(MCQueen_Ph1_Taunt_02_Montage)
        .AddMontage(MCQueen_Ph1_Taunt_03_Montage)
        .Set();

    // WARNING
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCQueen_Warning_Ph1_01_Montage)
        .Set();
}

UCLASS()
class UTauntData_Minecrawler_Queen_Ph2 : UTauntData_Config
{
    /// MONTAGES
    FName MCQueen_Ph2_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Taunt/MCQueen_Ph2_Taunt_01_Montage.MCQueen_Ph2_Taunt_01_Montage'";
    FName MCQueen_Ph2_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Taunt/A_MCQueen_Ph2_Taunt_02_Montage.A_MCQueen_Ph2_Taunt_02_Montage'";
    FName MCQueen_Ph2_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Taunt/MCQueen_Ph2_Taunt_03_Montage.MCQueen_Ph2_Taunt_03_Montage'";
    FName MCQueen_Ph2_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Taunt/MCQueen_Ph2_Taunt_Short_01_Montage.MCQueen_Ph2_Taunt_Short_01_Montage'";

   FName MCQueen_Warning_Ph2_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Warning/MCQueen_Ph2_Warning_01_Montage.MCQueen_Ph2_Warning_01_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCQueen_Ph2_Taunt_02_Montage)
        .AddMontage(MCQueen_Ph2_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCQueen_Ph2_Taunt_01_Montage)
        .AddMontage(MCQueen_Ph2_Taunt_03_Montage)
        .Set();

    // WARNING
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(MCQueen_Warning_Ph2_01_Montage)
        .Set();
}