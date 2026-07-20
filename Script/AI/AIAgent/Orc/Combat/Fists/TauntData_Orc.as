UCLASS()
class UTauntData_Orc_Fists : UTauntData_Config
{
    /// MONTAGES
    FName A_OrcM_Fists_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_Fists_Taunt_01_Montage.A_OrcM_Fists_Taunt_01_Montage'";
    FName A_OrcM_Fists_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_Fists_Taunt_02_Montage.A_OrcM_Fists_Taunt_02_Montage'";
    FName A_OrcM_Fists_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_Fists_Taunt_03_Montage.A_OrcM_Fists_Taunt_03_Montage'";

    /// PROPERTIES
    // TAUNTS - In Movement
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InMovement)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_Fists_Taunt_01_Montage)
        .AddMontage(A_OrcM_Fists_Taunt_02_Montage)
        .AddMontage(A_OrcM_Fists_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_Fists_Taunt_01_Montage)
        .AddMontage(A_OrcM_Fists_Taunt_02_Montage)
        .AddMontage(A_OrcM_Fists_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Observer)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_Fists_Taunt_01_Montage)
        .AddMontage(A_OrcM_Fists_Taunt_02_Montage)
        .AddMontage(A_OrcM_Fists_Taunt_03_Montage)
        .Set();

    // WARNING
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddMontage(A_OrcM_Fists_Taunt_02_Montage)
        .Set();
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_Fists_Taunt_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_UndeadOrc_Fists : UTauntData_Orc_Fists
{
    /// MONTAGES
    default A_OrcM_Fists_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_U_Fists_Taunt_01_Montage.A_OrcM_U_Fists_Taunt_01_Montage'";
    default A_OrcM_Fists_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_U_Fists_Taunt_02_Montage.A_OrcM_U_Fists_Taunt_02_Montage'";
    default A_OrcM_Fists_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_U_Fists_Taunt_03_Montage.A_OrcM_U_Fists_Taunt_03_Montage'";
}

UCLASS()
class UTauntData_Orc_Shaman_Fists : UTauntData_Orc_Fists
{
    /// MONTAGES
    default A_OrcM_Fists_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_S_Fists_Taunt_01_Montage.A_OrcM_S_Fists_Taunt_01_Montage'";
    default A_OrcM_Fists_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_S_Fists_Taunt_02_Montage.A_OrcM_S_Fists_Taunt_02_Montage'";
    default A_OrcM_Fists_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_S_Fists_Taunt_03_Montage.A_OrcM_S_Fists_Taunt_03_Montage'";
}

UCLASS()
class UTauntData_UndeadOrc_Shaman_Fists : UTauntData_Orc_Fists
{
    /// MONTAGES
    default A_OrcM_Fists_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_US_Fists_Taunt_01_Montage.A_OrcM_US_Fists_Taunt_01_Montage'";
    default A_OrcM_Fists_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_US_Fists_Taunt_02_Montage.A_OrcM_US_Fists_Taunt_02_Montage'";
    default A_OrcM_Fists_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_US_Fists_Taunt_03_Montage.A_OrcM_US_Fists_Taunt_03_Montage'";
}