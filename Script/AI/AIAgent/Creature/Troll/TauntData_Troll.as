UCLASS()
class UTauntData_Troll_Adult : UTauntData_Config
{
    /// MONTAGES
    FName AdultTroll_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Taunt/AdultTroll_Taunt_01_Montage.AdultTroll_Taunt_01_Montage'";
    FName AdultTroll_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Taunt/A_AdultTroll_Taunt_02_Montage.A_AdultTroll_Taunt_02_Montage'";
    FName AdultTroll_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Taunt/AdultTroll_Taunt_03_Montage.AdultTroll_Taunt_03_Montage'";
    FName AdultTroll_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Taunt/A_AdultTroll_Taunt_04_Montage.A_AdultTroll_Taunt_04_Montage'";
    FName AdultTroll_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Taunt/A_AdultTroll_Taunt_05_Montage.A_AdultTroll_Taunt_05_Montage'";
    FName AdultTroll_Taunt_06_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Taunt/AdultTroll_Taunt_Short_01_Montage.AdultTroll_Taunt_Short_01_Montage'";
     
    FName AdultTroll_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Warning/AdultTroll_Warning_01_Montage.AdultTroll_Warning_01_Montage'";
    
    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(AdultTroll_Taunt_03_Montage)
        .AddMontage(AdultTroll_Taunt_05_Montage)
        .AddMontage(AdultTroll_Taunt_06_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(AdultTroll_Taunt_01_Montage)
        .AddMontage(AdultTroll_Taunt_02_Montage)
        .AddMontage(AdultTroll_Taunt_04_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(AdultTroll_Warning_01_Montage)
        .Set();
}

UCLASS()
class UTauntData_Troll_Juvenile : UTauntData_Config
{
    /// MONTAGES
    FName JuvTroll_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Taunts/JuvenilleTroll_Taunt_01_Montage.JuvenilleTroll_Taunt_01_Montage'";
    FName JuvTroll_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Taunts/A_JuvenilleTroll_Taunt_02_Montage.A_JuvenilleTroll_Taunt_02_Montage'";
    FName JuvTroll_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Taunts/JuvenilleTroll_Taunt_03_Montage.JuvenilleTroll_Taunt_03_Montage'";
    FName JuvTroll_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Taunts/A_JuvenilleTroll_Taunt_04_Montage.A_JuvenilleTroll_Taunt_04_Montage'";
    FName JuvTroll_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Taunts/A_JuvenilleTroll_Taunt_05_Montage.A_JuvenilleTroll_Taunt_05_Montage'";
    FName JuvTroll_Taunt_06_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Taunts/JuvenilleTroll_Taunt_Short_01_Montage.JuvenilleTroll_Taunt_Short_01_Montage'";
    
    FName JuvenileTroll_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Warning/JuvenileTroll_Warning_01_Montage.JuvenileTroll_Warning_01_Montage'";
    
    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(JuvTroll_Taunt_03_Montage)
        .AddMontage(JuvTroll_Taunt_05_Montage)
        .AddMontage(JuvTroll_Taunt_06_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(JuvTroll_Taunt_01_Montage)
        .AddMontage(JuvTroll_Taunt_02_Montage)
        .AddMontage(JuvTroll_Taunt_04_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(JuvenileTroll_Warning_01_Montage)
        .Set();
}