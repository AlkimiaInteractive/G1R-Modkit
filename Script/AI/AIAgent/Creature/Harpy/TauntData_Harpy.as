UCLASS()
class UTauntData_Harpy : UTauntData_Config
{
    /// MONTAGES
    FName Harpy_Taunt_01_Scream_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Taunt/A_Harpy_Scream_Montage.A_Harpy_Scream_Montage'";
    FName Harpy_Taunt_02_Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Taunt/A_Harpy_Taunt_01_Montage.A_Harpy_Taunt_01_Montage'";
    FName Harpy_Taunt_03_Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Taunt/A_Harpy_Roar_Montage.A_Harpy_Roar_Montage'";
    FName Harpy_Taunt_04_Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Taunt/A_Harpy_Taunt_03_Montage.A_Harpy_Taunt_03_Montage'";
    FName Harpy_Taunt_Short_Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Taunt/A_Harpy_Taunt_Short_Montage.A_Harpy_Taunt_Short_Montage'";

    FName Harpy_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Warning/Harpy_Warning_01_Montage.Harpy_Warning_01_Montage'";
    FName Harpy_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Warning/Harpy_Warning_02_Montage.Harpy_Warning_02_Montage'";
    FName Harpy_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Warning/Harpy_Warning_03_Montage.Harpy_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Harpy_Taunt_01_Scream_Montage)
        .Set();

    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Harpy_Taunt_Short_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Harpy_Taunt_02_Montage)
        .Set();

    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Harpy_Taunt_03_Montage)
        .Set();

    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Harpy_Taunt_04_Montage)
        .Set();


    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Harpy_Warning_01_Montage)
        .AddMontage(Harpy_Warning_02_Montage)
        .AddMontage(Harpy_Warning_03_Montage)
        .Set();
}