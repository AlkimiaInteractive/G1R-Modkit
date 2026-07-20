UCLASS()
class UTauntData_Wolf : UTauntData_Config
{
    /// MONTAGES
    FName Wolf_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Taunt/Wolf_Taunt_01_AnimMontage.Wolf_Taunt_01_AnimMontage'";
    FName Wolf_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Taunt/A_Wolf_Taunt_02_Montage.A_Wolf_Taunt_02_Montage'";
    FName Wolf_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Taunt/A_Wolf_Taunt_03_Montage.A_Wolf_Taunt_03_Montage'";
    FName Wolf_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Taunt/A_Wolf_Taunt_Short_01_Montage.A_Wolf_Taunt_Short_01_Montage'";
    
    FName Wolf_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Warning/Wolf_Warning_01_Montage.Wolf_Warning_01_Montage'";
    FName Wolf_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Warning/Wolf_Warning_02_Montage.Wolf_Warning_02_Montage'";
    FName Wolf_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Warning/Wolf_Warning_03_Montage.Wolf_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Wolf_Taunt_01_Montage)
        .AddMontage(Wolf_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Wolf_Taunt_02_Montage)
        .AddMontage(Wolf_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Wolf_Warning_01_Montage)
        .AddMontage(Wolf_Warning_02_Montage)
        .AddMontage(Wolf_Warning_03_Montage)
        .Set();
}