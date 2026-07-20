UCLASS()
class UTauntData_Demon_Fire : UTauntData_Config
{
    /// MONTAGES
    FName FireDemon_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Aggressive_Taunt01_Montage.FireDemon_Aggressive_Taunt01_Montage'";
    FName FireDemon_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Aggressive_Taunt02_Montage.FireDemon_Aggressive_Taunt02_Montage'";
    FName FireDemon_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Observer_Taunt01_Montage.FireDemon_Observer_Taunt01_Montage'";
    FName FireDemon_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Observer_Taunt02_Montage.FireDemon_Observer_Taunt02_Montage'";
    FName FireDemon_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Short_Taunt01_Montage.FireDemon_Short_Taunt01_Montage'";

    FName FireDemon_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_01_Montage.FireDemon_Warning_01_Montage'";
    FName FireDemon_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_02_Montage.FireDemon_Warning_02_Montage'";
    //FName FireDemon_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_03_Montage.FireDemon_Warning_03_Montage'";


    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddProperty(GameplayTag::Combat_Taunt_Aggressive)
        .AddMontage(FireDemon_Taunt_01_Montage)
        .AddMontage(FireDemon_Taunt_02_Montage)
        .Set();

    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireDemon_Taunt_05_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireDemon_Taunt_03_Montage)
        .AddMontage(FireDemon_Taunt_04_Montage)
        .Set();

    // WARNING

    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireDemon_Warning_01_Montage)
        .AddMontage(FireDemon_Warning_02_Montage)
        //.AddMontage(FireDemon_Warning_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_Demon_Lesser : UTauntData_Config
{
    /// MONTAGES
    FName LesserDemon_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Taunt/A_LesserDemon_Taunt_01_Montage.A_LesserDemon_Taunt_01_Montage'";
    FName LesserDemon_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Taunt/A_LesserDemon_Taunt_02_Montage.A_LesserDemon_Taunt_02_Montage'";
    FName LesserDemon_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Taunt/A_LesserDemon_Taunt_Short_01_Montage.A_LesserDemon_Taunt_Short_01_Montage'";
    FName LesserDemon_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Taunt/A_LesserDemon_Taunt_Short_02_Montage.A_LesserDemon_Taunt_Short_02_Montage'";
    
    FName LesserDemon_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Warning/LesserDemon_Warning_01_Montage.LesserDemon_Warning_01_Montage'";
    FName LesserDemon_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Warning/LesserDemon_Warning_02_Montage.LesserDemon_Warning_02_Montage'";
    FName LesserDemon_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Warning/LesserDemon_Warning_03_Montage.LesserDemon_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LesserDemon_Taunt_03_Montage)
        .AddMontage(LesserDemon_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LesserDemon_Taunt_01_Montage)
        .AddMontage(LesserDemon_Taunt_02_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LesserDemon_Warning_01_Montage)
        .AddMontage(LesserDemon_Warning_02_Montage)
        .AddMontage(LesserDemon_Warning_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_Demon_Lord : UTauntData_Config
{
    /// MONTAGES
    FName LordDemon_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Aggressive_Taunt01_Montage.FireDemon_Aggressive_Taunt01_Montage'";
    FName LordDemon_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Aggressive_Taunt02_Montage.FireDemon_Aggressive_Taunt02_Montage'";
    FName LordDemon_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Observer_Taunt01_Montage.FireDemon_Observer_Taunt01_Montage'";
    FName LordDemon_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Observer_Taunt02_Montage.FireDemon_Observer_Taunt02_Montage'";
    FName LordDemon_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Short_Taunt01_Montage.FireDemon_Short_Taunt01_Montage'";

    FName LordDemon_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_01_Montage.FireDemon_Warning_01_Montage'";
    FName LordDemon_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_02_Montage.FireDemon_Warning_02_Montage'";
    //FName LordDemon_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_03_Montage.FireDemon_Warning_03_Montage'";


    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddProperty(GameplayTag::Combat_Taunt_Aggressive)
        .AddMontage(LordDemon_Taunt_01_Montage)
        .AddMontage(LordDemon_Taunt_02_Montage)
        .Set();

    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LordDemon_Taunt_05_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LordDemon_Taunt_03_Montage)
        .AddMontage(LordDemon_Taunt_04_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LordDemon_Warning_01_Montage)
        .AddMontage(LordDemon_Warning_02_Montage)
        //.AddMontage(LordDemon_Warning_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_Demon_Kalom : UTauntData_Config
{
    /// MONTAGES
    FName LordDemon_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Aggressive_Taunt01_Montage.FireDemon_Aggressive_Taunt01_Montage'";
    FName LordDemon_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Aggressive_Taunt02_Montage.FireDemon_Aggressive_Taunt02_Montage'";
    FName LordDemon_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Observer_Taunt01_Montage.FireDemon_Observer_Taunt01_Montage'";
    FName LordDemon_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Observer_Taunt02_Montage.FireDemon_Observer_Taunt02_Montage'";
    FName LordDemon_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Taunt/FireDemon_Short_Taunt01_Montage.FireDemon_Short_Taunt01_Montage'";

    //FName LordDemon_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_01_Montage.FireDemon_Warning_01_Montage'";
    //FName LordDemon_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/FireDemon_Warning_02_Montage.FireDemon_Warning_02_Montage'";
    FName LordDemon_Warning_03_Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Warning/KalomDemon_Warning_01_Montage.KalomDemon_Warning_01_Montage'";


    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddProperty(GameplayTag::Combat_Taunt_Aggressive)
        .AddMontage(LordDemon_Taunt_01_Montage)
        .AddMontage(LordDemon_Taunt_02_Montage)
        .Set();

    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LordDemon_Taunt_05_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(LordDemon_Taunt_03_Montage)
        .AddMontage(LordDemon_Taunt_04_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        // .AddMontage(LordDemon_Warning_01_Montage)
        // .AddMontage(LordDemon_Warning_02_Montage)
        .AddMontage(LordDemon_Warning_03_Montage)
        .Set();
}