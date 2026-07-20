UCLASS()
class UTauntData_Shadowbeast : UTauntData_Config
{
    /// MONTAGES
    FName Shadowbeast_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Taunt/Shadow_Beast_Taunt_01_Montage.Shadow_Beast_Taunt_01_Montage'";
    FName Shadowbeast_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Taunt/Shadow_Beast_Taunt_02_Montage.Shadow_Beast_Taunt_02_Montage'";
    FName Shadowbeast_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Taunt/Shadow_Beast_Taunt_03_Montage.Shadow_Beast_Taunt_03_Montage'";
    FName Shadowbeast_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Taunt/Shadow_Beast_Taunt_04_Montage.Shadow_Beast_Taunt_04_Montage'";
    FName Shadowbeast_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Taunt/A_Shadow_Beast_Taunt_Short_01_Montage.A_Shadow_Beast_Taunt_Short_01_Montage'";
    
    FName Shadowbeast_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Warning/Shadow_Beast_Warning_01_Montage.Shadow_Beast_Warning_01_Montage'";
    FName Shadowbeast_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Warning/Shadow_Beast_Warning_02_Montage.Shadow_Beast_Warning_02_Montage'";
    FName Shadowbeast_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Warning/Shadow_Beast_Warning_03_Montage.Shadow_Beast_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Shadowbeast_Taunt_05_Montage)
        .AddMontage(Shadowbeast_Taunt_02_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Shadowbeast_Taunt_01_Montage)
        .AddMontage(Shadowbeast_Taunt_03_Montage)
        .AddMontage(Shadowbeast_Taunt_04_Montage)
        .Set();

    // // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Shadowbeast_Warning_01_Montage)
        .AddMontage(Shadowbeast_Warning_02_Montage)
        .AddMontage(Shadowbeast_Warning_03_Montage)
        .Set();
}