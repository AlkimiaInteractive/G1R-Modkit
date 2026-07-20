UCLASS()
class UTauntdata_Bloodhound : UTauntData_Config
{
    /// MONTAGES
    FName Bloodhound_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Taunt/Bloodhound_Taunt_01_AnimMontage.Bloodhound_Taunt_01_AnimMontage'";
    FName Bloodhound_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Taunt/Bloodhound_Taunt_02_AnimMontage.Bloodhound_Taunt_02_AnimMontage'";
    FName Bloodhound_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Taunt/Bloodhound_Taunt_03_AnimMontage.Bloodhound_Taunt_03_AnimMontage'";
    FName Bloodhound_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Taunt/A_Bloodhound_Taunt_Short_01_Montage.A_Bloodhound_Taunt_Short_01_Montage'";

    FName Bloodhound_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Warning/Bloodhound_Warning_01_Montage.Bloodhound_Warning_01_Montage'";
    FName Bloodhound_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Warning/Bloodhound_Warning_02_Montage.Bloodhound_Warning_02_Montage'";
    FName Bloodhound_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Warning/Bloodhound_Warning_03_Montage.Bloodhound_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Bloodhound_Taunt_02_Montage)
        .AddMontage(Bloodhound_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Bloodhound_Taunt_01_Montage)
        .AddMontage(Bloodhound_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Bloodhound_Warning_01_Montage)
        .AddMontage(Bloodhound_Warning_02_Montage)
        .AddMontage(Bloodhound_Warning_03_Montage)
        .Set();
}