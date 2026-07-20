UCLASS()
class UTauntData_Lurker : UTauntData_Config
{
    /// MONTAGES
    FName Lurker_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Taunt/Lurker_Taunt_01_AnimMontage.Lurker_Taunt_01_AnimMontage'";
    FName Lurker_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Taunt/A_Lurker_Taunt_02_Montage.A_Lurker_Taunt_02_Montage'";
    FName Lurker_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Taunt/A_Lurker_Taunt_03_Montage.A_Lurker_Taunt_03_Montage'";
    FName Lurker_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Taunt/A_Lurker_Taunt_Short_01_Montage.A_Lurker_Taunt_Short_01_Montage'";
    
    FName Lurker_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Warning/Lurker_Warning_01_Montage.Lurker_Warning_01_Montage'";
    FName Lurker_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Warning/Lurker_Warning_02_Montage.Lurker_Warning_02_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Lurker_Taunt_01_Montage)
        .AddMontage(Lurker_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Lurker_Taunt_02_Montage)
        .AddMontage(Lurker_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Lurker_Warning_01_Montage)
        .AddMontage(Lurker_Warning_02_Montage)
        .Set();
}