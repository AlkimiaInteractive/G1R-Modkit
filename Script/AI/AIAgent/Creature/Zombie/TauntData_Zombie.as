UCLASS()
class UTauntData_Zombie : UTauntData_Config
{
    /// MONTAGES
    FName Zombie_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Taunt/Zombie_Taunt_01_Montage.Zombie_Taunt_01_Montage'";
    FName Zombie_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Taunt/Zombie_Taunt_02_Montage.Zombie_Taunt_02_Montage'";
    FName Zombie_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Taunt/Zombie_Taunt_03_Montage.Zombie_Taunt_03_Montage'";
    FName Zombie_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Taunt/Zombie_Taunt_Short_01_Montage.Zombie_Taunt_Short_01_Montage'";
    
    FName Zombie_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Warning/Zombie_Warning_01_Montage.Zombie_Warning_01_Montage'";
    FName Zombie_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Warning/Zombie_Warning_02_Montage.Zombie_Warning_02_Montage'";
    FName Zombie_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Warning/Zombie_Warning_03_Montage.Zombie_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Zombie_Taunt_01_Montage)
        .AddMontage(Zombie_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Zombie_Taunt_02_Montage)
        .AddMontage(Zombie_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Zombie_Warning_01_Montage)
        .AddMontage(Zombie_Warning_02_Montage)
        .AddMontage(Zombie_Warning_03_Montage)
        .Set();
}