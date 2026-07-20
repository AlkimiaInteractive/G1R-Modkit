UCLASS()
class UTauntData_Swampshark : UTauntData_Config
{
    /// MONTAGES
    FName Swampshark_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Taunt/A_Swampshark_Taunt_01_Montage.A_Swampshark_Taunt_01_Montage'";
    FName Swampshark_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Taunt/A_Swampshark_Taunt_02_Montage.A_Swampshark_Taunt_02_Montage'";
    FName Swampshark_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Taunt/A_Swampshark_Taunt_03_Montage.A_Swampshark_Taunt_03_Montage'";
    FName Swampshark_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Taunt/A_Swampshark_Taunt_Short_01_Montage.A_Swampshark_Taunt_Short_01_Montage'";
    
    FName Swampshark_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Warning/Swampshark_Warning_01_Montage.Swampshark_Warning_01_Montage'";
    FName Swampshark_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Warning/Swampshark_Warning_02_Montage.Swampshark_Warning_02_Montage'";
    FName Swampshark_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Warning/Swampshark_Warning_03_Montage.Swampshark_Warning_03_Montage'";
    
    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Swampshark_Taunt_03_Montage)
        .AddMontage(Swampshark_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Swampshark_Taunt_01_Montage)
        .AddMontage(Swampshark_Taunt_02_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Swampshark_Warning_01_Montage)
        .AddMontage(Swampshark_Warning_02_Montage)
        .AddMontage(Swampshark_Warning_03_Montage)
        .Set();
}