UCLASS()
class UTauntData_Orcdog : UTauntData_Config
{
    /// MONTAGES
    FName Orcdog_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Taunt/OrcDog_Taunt_01_AnimMontage.OrcDog_Taunt_01_AnimMontage'";
    FName Orcdog_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Taunt/OrcDog_Taunt_02_AnimMontage.OrcDog_Taunt_02_AnimMontage'";
    FName Orcdog_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Taunt/OrcDog_Taunt_03_AnimMontage.OrcDog_Taunt_03_AnimMontage'";
    FName Orcdog_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Taunt/A_OrcDog_Taunt_Short_01_Montage.A_OrcDog_Taunt_Short_01_Montage'";
    
    FName Orcdog_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Warning/OrcDog_Warning_01_Montage.OrcDog_Warning_01_Montage'";
    FName Orcdog_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Warning/OrcDog_Warning_02_Montage.OrcDog_Warning_02_Montage'";
    FName Orcdog_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Warning/OrcDog_Warning_03_Montage.OrcDog_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Orcdog_Taunt_01_Montage)
        .AddMontage(Orcdog_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Orcdog_Taunt_02_Montage)
        .AddMontage(Orcdog_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Orcdog_Warning_01_Montage)
        .AddMontage(Orcdog_Warning_02_Montage)
        .AddMontage(Orcdog_Warning_03_Montage)
        .Set();
}