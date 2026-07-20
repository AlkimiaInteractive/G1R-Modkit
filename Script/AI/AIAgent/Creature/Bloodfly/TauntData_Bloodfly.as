UCLASS()
class UTauntData_Bloodfly : UTauntData_Config
{
    /// MONTAGES
    FName Bloodfly_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Taunt/Bloodfly_Taunt_01_Montage.Bloodfly_Taunt_01_Montage'";
    FName Bloodfly_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Taunt/Bloodfly_Taunt_02_Montage.Bloodfly_Taunt_02_Montage'";
    FName Bloodfly_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Taunt/Bloodfly_Taunt_Short_01_Montage.Bloodfly_Taunt_Short_01_Montage'";
   
    FName Bloodfly_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Warning/Bloodfly_Warning_01_Montage.Bloodfly_Warning_01_Montage'";
    FName Bloodfly_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Warning/Bloodfly_Warning_02_Montage.Bloodfly_Warning_02_Montage'";
    FName Bloodfly_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Warning/Bloodfly_Warning_03_Montage.Bloodfly_Warning_03_Montage'";


    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Bloodfly_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Bloodfly_Taunt_01_Montage)
        .AddMontage(Bloodfly_Taunt_02_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Bloodfly_Warning_01_Montage)
        .AddMontage(Bloodfly_Warning_02_Montage)
        .AddMontage(Bloodfly_Warning_03_Montage)
        .Set();
}