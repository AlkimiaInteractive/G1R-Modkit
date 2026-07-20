UCLASS()
class UTauntData_Molerat : UTauntData_Config
{
    /// MONTAGES
    FName Molerat_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Taunt/Molerat_Taunt_01_Montage.Molerat_Taunt_01_Montage'";
    FName Molerat_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Taunt/Molerat_Taunt_02_Montage.Molerat_Taunt_02_Montage'";
    FName Molerat_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Taunt/Molerat_Taunt_03_Montage.Molerat_Taunt_03_Montage'";
    FName Molerat_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Taunt/A_Molerat_Taunt_Short_01_Montage.A_Molerat_Taunt_Short_01_Montage'";
    
    FName Molerat_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Warning/Molerat_Warning_01_Montage.Molerat_Warning_01_Montage'";
    FName Molerat_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Warning/Molerat_Warning_02_Montage.Molerat_Warning_02_Montage'";
    FName Molerat_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Warning/Molerat_Warning_03_Montage.Molerat_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Molerat_Taunt_01_Montage)
        .AddMontage(Molerat_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Molerat_Taunt_02_Montage)
        .AddMontage(Molerat_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Molerat_Warning_01_Montage)
        .AddMontage(Molerat_Warning_02_Montage)
        .AddMontage(Molerat_Warning_03_Montage)
        .Set();
}