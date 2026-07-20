UCLASS()
class UTauntData_Golem_Stone : UTauntData_Config
{
    /// MONTAGES
    FName StoneGolem_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_01_Montage.A_StoneGolem_Taunt_01_Montage'";
    FName StoneGolem_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_02_Montage.A_StoneGolem_Taunt_02_Montage'";
    FName StoneGolem_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_03_Montage.A_StoneGolem_Taunt_03_Montage'";
    FName StoneGolem_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_04_Montage.A_StoneGolem_Taunt_04_Montage'";
    FName StoneGolem_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_05_Montage.A_StoneGolem_Taunt_05_Montage'";
    FName StoneGolem_Taunt_06_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_06_Montage.A_StoneGolem_Taunt_06_Montage'";
    FName StoneGolem_Taunt_07_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_07_Montage.A_StoneGolem_Taunt_07_Montage'";
    FName StoneGolem_Taunt_08_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Taunt/A_StoneGolem_Taunt_Short_01_Montage.A_StoneGolem_Taunt_Short_01_Montage'";

    FName StoneGolem_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Warning/StoneGolem_Warning_01_Montage.StoneGolem_Warning_01_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(StoneGolem_Taunt_06_Montage)
        .AddMontage(StoneGolem_Taunt_07_Montage)
        .AddMontage(StoneGolem_Taunt_08_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(StoneGolem_Taunt_01_Montage)
        .AddMontage(StoneGolem_Taunt_02_Montage)
        .AddMontage(StoneGolem_Taunt_03_Montage)
        .AddMontage(StoneGolem_Taunt_04_Montage)
        .AddMontage(StoneGolem_Taunt_05_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(StoneGolem_Warning_01_Montage)
        .Set();
}

class UTauntData_Golem_Ice : UTauntData_Config
{
    /// MONTAGES
    FName IceGolem_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Taunt/A_IceGolem_Taunt_01_Montage.A_IceGolem_Taunt_01_Montage'";
    FName IceGolem_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Taunt/A_IceGolem_Taunt_02_Montage.A_IceGolem_Taunt_02_Montage'";
    FName IceGolem_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Taunt/A_IceGolem_Taunt_03_Montage.A_IceGolem_Taunt_03_Montage'";
    FName IceGolem_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Taunt/A_IceGolem_Taunt_Short_01_Montage.A_IceGolem_Taunt_Short_01_Montage'";
    
    FName IceGolem_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Warning/IceGolem_Warning_01_Montage.IceGolem_Warning_01_Montage'";
    
    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(IceGolem_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(IceGolem_Taunt_01_Montage)
        .AddMontage(IceGolem_Taunt_02_Montage)
        .AddMontage(IceGolem_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(IceGolem_Warning_01_Montage)
        .Set();
}

class UTauntData_Golem_Fire : UTauntData_Config
{
    /// MONTAGES
    FName FireGolem_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Taunt/FireGolem_Taunt_01_Montage.FireGolem_Taunt_01_Montage'";
    FName FireGolem_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Taunt/FireGolem_Taunt_02_Montage.FireGolem_Taunt_02_Montage'";
    FName FireGolem_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Taunt/FireGolem_Taunt_03_Montage.FireGolem_Taunt_03_Montage'";
    FName FireGolem_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Taunt/FireGolem_Taunt_Short_01_Montage.FireGolem_Taunt_Short_01_Montage'";
    
    FName FireGolem_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Warning/FireGolem_Warning_01_Montage.FireGolem_Warning_01_Montage'";
    
    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireGolem_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireGolem_Taunt_01_Montage)
        .AddMontage(FireGolem_Taunt_02_Montage)
        .AddMontage(FireGolem_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(FireGolem_Warning_01_Montage)
        .Set();
}