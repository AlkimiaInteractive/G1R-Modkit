UCLASS()
class UTauntData_Lizard : UTauntData_Config
{
    /// MONTAGES
    FName Lizard_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Taunt/Lizard_Taunt_Montage.Lizard_Taunt_Montage'";
    FName Lizard_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Taunt/Lizard_Taunt_02_AnimMontage.Lizard_Taunt_02_AnimMontage'";
    FName Lizard_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Taunt/Lizard_Taunt_03_AnimMontage.Lizard_Taunt_03_AnimMontage'";
    FName Lizard_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Taunt/A_Lizard_Taunt_04_Montage.A_Lizard_Taunt_04_Montage'";
    FName Lizard_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Taunt/A_Lizard_Taunt_Short_01_Montage.A_Lizard_Taunt_Short_01_Montage'";

    FName Lizard_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Warning/Lizard_Warning_01_Montage.Lizard_Warning_01_Montage'";
    FName Lizard_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Warning/Lizard_Warning_02_Montage.Lizard_Warning_02_Montage'";
    FName Lizard_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Warning/Lizard_Warning_03_Montage.Lizard_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Lizard_Taunt_04_Montage)
        .AddMontage(Lizard_Taunt_05_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Lizard_Taunt_01_Montage)
        .AddMontage(Lizard_Taunt_02_Montage)
        .AddMontage(Lizard_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Lizard_Warning_01_Montage)
        .AddMontage(Lizard_Warning_02_Montage)
        .AddMontage(Lizard_Warning_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_Lizard_Fire : UTauntData_Config
{
    /// MONTAGES
    FName FireLizard_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Taunt/Lizard_Fire_Taunt_01_AnimMontage.Lizard_Fire_Taunt_01_AnimMontage'";
    FName FireLizard_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Taunt/Lizard_Fire_Taunt_02_AnimMontage.Lizard_Fire_Taunt_02_AnimMontage'";
    FName FireLizard_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Taunt/Lizard_Fire_Taunt_03_AnimMontage.Lizard_Fire_Taunt_03_AnimMontage'";
    FName FireLizard_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Taunt/A_Lizard_Fire_Taunt_04_Montage.A_Lizard_Fire_Taunt_04_Montage'";
    FName FireLizard_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Taunt/A_Lizard_Fire_Taunt_Short_01_Montage.A_Lizard_Fire_Taunt_Short_01_Montage'";

    FName FireLizard_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Warning/Lizard_Fire_Warning_01_Montage.Lizard_Fire_Warning_01_Montage'";
    FName FireLizard_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Warning/Lizard_Fire_Warning_02_Montage.Lizard_Fire_Warning_02_Montage'";
    FName FireLizard_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Warning/Lizard_Fire_Warning_03_Montage.Lizard_Fire_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireLizard_Taunt_04_Montage)
        .AddMontage(FireLizard_Taunt_05_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireLizard_Taunt_01_Montage)
        .AddMontage(FireLizard_Taunt_02_Montage)
        .AddMontage(FireLizard_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireLizard_Warning_01_Montage)
        .AddMontage(FireLizard_Warning_02_Montage)
        .AddMontage(FireLizard_Warning_03_Montage)
        .Set();
}