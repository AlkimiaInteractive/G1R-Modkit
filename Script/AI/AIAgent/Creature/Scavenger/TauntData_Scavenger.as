UCLASS()
class UTauntData_Scavenger_Young : UTauntData_Config
{
    /// MONTAGES
    FName ScavYoung_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Taunt/Scavenger_Taunt_01_Montage.Scavenger_Taunt_01_Montage'";
    FName ScavYoung_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Taunt/Scavenger_Taunt_02_Montage.Scavenger_Taunt_02_Montage'";
    //FName ScavYoung_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Taunt/Scavenger_Taunt_03_Montage.Scavenger_Taunt_03_Montage'";
    FName ScavYoung_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Taunt/A_Scavenger_Taunt_Short_01_Montage.A_Scavenger_Taunt_Short_01_Montage'";
    FName ScavYoung_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Taunt/A_Scavenger_Taunt_Short_02_Montage.A_Scavenger_Taunt_Short_02_Montage'";
    
    FName ScavYoung_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Warning/Scavenger_Warning_01_Montage.Scavenger_Warning_01_Montage'";
    FName ScavYoung_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Warning/Scavenger_Warning_02_Montage.Scavenger_Warning_02_Montage'";
    FName ScavYoung_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Warning/Scavenger_Warning_03_Montage.Scavenger_Warning_03_Montage'";


    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavYoung_Taunt_04_Montage)
        .AddMontage(ScavYoung_Taunt_05_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavYoung_Taunt_01_Montage)
        .AddMontage(ScavYoung_Taunt_02_Montage)
        //.AddMontage(ScavYoung_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavYoung_Warning_01_Montage)
        .AddMontage(ScavYoung_Warning_02_Montage)
        .AddMontage(ScavYoung_Warning_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_Scavenger_Medium : UTauntData_Config
{
    /// MONTAGES
    FName ScavMedium_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Taunt/Scavenger_Med_Taunt_01_Montage.Scavenger_Med_Taunt_01_Montage'";
    FName ScavMedium_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Taunt/Scavenger_Med_Taunt_02_Montage.Scavenger_Med_Taunt_02_Montage'";
    FName ScavMedium_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Taunt/Scavenger_Med_Taunt_03_Montage.Scavenger_Med_Taunt_03_Montage'";
    FName ScavMedium_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Taunt/Scavenger_Med_TauntShort_01_Montage.Scavenger_Med_TauntShort_01_Montage'";
    
    FName ScavMed_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Warning/Scavenger_Med_Warning_01_Montage.Scavenger_Med_Warning_01_Montage'";
    FName ScavMed_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Warning/Scavenger_Med_Warning_02_Montage.Scavenger_Med_Warning_02_Montage'";
    FName ScavMed_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Warning/Scavenger_Med_Warning_03_Montage.Scavenger_Med_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavMedium_Taunt_01_Montage)
        .AddMontage(ScavMedium_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavMedium_Taunt_02_Montage)
        .AddMontage(ScavMedium_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavMed_Warning_01_Montage)
        .AddMontage(ScavMed_Warning_02_Montage)
        .AddMontage(ScavMed_Warning_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_Scavenger_Adult : UTauntData_Config
{
    /// MONTAGES
    FName ScavAdult_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Taunt/Scavenger_Adult_Taunt_01_Montage.Scavenger_Adult_Taunt_01_Montage'";
    FName ScavAdult_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Taunt/A_Scavenger_Adult_TauntShort_01_Montage.A_Scavenger_Adult_TauntShort_01_Montage'";
    
    FName ScavAdult_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Warning/Scavenger_Adult_Warning_01_Montage.Scavenger_Adult_Warning_01_Montage'";
    FName ScavAdult_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Warning/Scavenger_Adult_Warning_02_Montage.Scavenger_Adult_Warning_02_Montage'";
    FName ScavAdult_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Warning/Scavenger_Adult_Warning_03_Montage.Scavenger_Adult_Warning_03_Montage'";


    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavAdult_Taunt_01_Montage)
        .AddMontage(ScavAdult_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavAdult_Taunt_01_Montage)
        //.AddMontage(ScavAdult_Taunt_02_Montage)
        //.AddMontage(ScavAdult_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(ScavAdult_Warning_01_Montage)
        .AddMontage(ScavAdult_Warning_02_Montage)
        .AddMontage(ScavAdult_Warning_03_Montage)
        .Set();
}