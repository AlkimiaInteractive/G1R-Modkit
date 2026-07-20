UCLASS()
class UTauntData_Goblin : UTauntData_Config
{
    /// MONTAGES
    FName Goblin_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Taunt/GreenGoblin_Taunt_01_Montage.GreenGoblin_Taunt_01_Montage'";
    FName Goblin_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Taunt/GreenGoblin_Taunt_02_Montage.GreenGoblin_Taunt_02_Montage'";
    FName Goblin_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Taunt/A_GreenGoblin_Taunt_03_Montage.A_GreenGoblin_Taunt_03_Montage'";
    FName Goblin_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Taunt/GreenGoblin_Taunt_04_Montage.GreenGoblin_Taunt_04_Montage'";
    FName Goblin_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Taunt/GreenGoblin_Taunt_05_Montage.GreenGoblin_Taunt_05_Montage'";
    FName Goblin_Taunt_06_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Taunt/GreenGoblin_Taunt_Short_01_Montage.GreenGoblin_Taunt_Short_01_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Goblin_Taunt_01_Montage)
        .AddMontage(Goblin_Taunt_02_Montage)
        .AddMontage(Goblin_Taunt_04_Montage)
        .AddMontage(Goblin_Taunt_05_Montage)
        .AddMontage(Goblin_Taunt_06_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Goblin_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Goblin_Taunt_03_Montage)
        .AddMontage(Goblin_Taunt_01_Montage)
        .Set();
}