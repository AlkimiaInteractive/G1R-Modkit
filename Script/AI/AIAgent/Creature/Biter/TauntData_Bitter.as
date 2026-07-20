UCLASS()
class UTauntData_Biter : UTauntData_Config
{
    /// MONTAGES
    FName Biter_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Taunt/Biter_Taunt_01_Montage.Biter_Taunt_01_Montage'";
    FName Biter_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Taunt/Biter_Taunt_02_Montage.Biter_Taunt_02_Montage'";
    FName Biter_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Taunt/Biter_Taunt_03_Montage.Biter_Taunt_03_Montage'";
    FName Biter_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Taunt/A_Biter_Taunt_Short_01_Montage.A_Biter_Taunt_Short_01_Montage'";

    FName Biter_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Warning/Biter_Warning_01_Montage.Biter_Warning_01_Montage'";
    FName Biter_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Warning/Biter_Warning_02_Montage.Biter_Warning_02_Montage'";
    FName Biter_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Warning/Biter_Warning_03_Montage.Biter_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Biter_Taunt_02_Montage)
        .AddMontage(Biter_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Biter_Taunt_01_Montage)
        .AddMontage(Biter_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Biter_Warning_01_Montage)
        .AddMontage(Biter_Warning_02_Montage)
        .AddMontage(Biter_Warning_03_Montage)
        .Set();
};