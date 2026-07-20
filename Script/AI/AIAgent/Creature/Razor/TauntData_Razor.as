UCLASS()
class UTauntData_Razor : UTauntData_Config
{   
    /// MONTAGES
    FName Razor_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Taunt/Razor_Taunt_01_Montage.Razor_Taunt_01_Montage'";
    FName Razor_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Taunt/Razor_Taunt_02_Montage.Razor_Taunt_02_Montage'";
    FName Razor_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Taunt/Razor_Taunt_03_Montage.Razor_Taunt_03_Montage'";
    FName Razor_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Taunt/A_Razor_Taunt_04_Montage.A_Razor_Taunt_04_Montage'";
    FName Razor_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Taunt/A_Razor_Taunt_Short_01_Montage.A_Razor_Taunt_Short_01_Montage'";
    
    FName Razor_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Warning/Razor_Warning_01_Montage.Razor_Warning_01_Montage'";
    FName Razor_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Warning/Razor_Warning_02_Montage.Razor_Warning_02_Montage'";
    FName Razor_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Warning/Razor_Warning_03_Montage.Razor_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Razor_Taunt_02_Montage)
        .AddMontage(Razor_Taunt_05_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Razor_Taunt_01_Montage)
        .AddMontage(Razor_Taunt_03_Montage)
        .AddMontage(Razor_Taunt_04_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Razor_Warning_01_Montage)
        .AddMontage(Razor_Warning_02_Montage)
        .AddMontage(Razor_Warning_03_Montage)
        .Set();
}