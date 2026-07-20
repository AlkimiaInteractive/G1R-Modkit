UCLASS()
class UTauntData_Snapper : UTauntData_Config
{
    /// MONTAGES
    FName Snapper_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Taunt/Snapper_Taunt_01_Montage.Snapper_Taunt_01_Montage'";
    FName Snapper_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Taunt/Snapper_Taunt_02_Montage.Snapper_Taunt_02_Montage'";
    FName Snapper_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Taunt/Snapper_Taunt_03_Montage.Snapper_Taunt_03_Montage'";
    FName Snapper_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Taunt/A_Snapper_Taunt_Short_01_Montage.A_Snapper_Taunt_Short_01_Montage'";
    
    FName Snapper_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Warning/Snapper_Warning_01_Montage.Snapper_Warning_01_Montage'";
    FName Snapper_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Warning/Snapper_Warning_02_Montage.Snapper_Warning_02_Montage'";
    FName Snapper_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Warning/Snapper_Warning_03_Montage.Snapper_Warning_03_Montage'";


    /// PROPERTIES
    // TAUNTS - IP
    default CreateNewTauntGroup()
        //.AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        //.AddMontage(Snapper_Taunt_01_Montage)
        .AddMontage(Snapper_Taunt_02_Montage)
        .AddMontage(Snapper_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        //.AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Snapper_Taunt_04_Montage)
        .AddMontage(Snapper_Taunt_02_Montage)
        .AddMontage(Snapper_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Snapper_Warning_01_Montage)
        .AddMontage(Snapper_Warning_02_Montage)
        .AddMontage(Snapper_Warning_03_Montage)
        .Set();
}