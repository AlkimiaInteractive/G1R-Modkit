UCLASS()
class UTauntData_Orc_S1H : UTauntData_Config
{
    /// MONTAGES
    FName A_OrcM_S1H_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_01_Montage.A_OrcM_S1H_Taunt_01_Montage'";
    FName A_OrcM_S1H_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_02_Montage.A_OrcM_S1H_Taunt_02_Montage'";
    FName A_OrcM_S1H_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_03_Montage.A_OrcM_S1H_Taunt_03_Montage'";
    FName A_OrcM_S1H_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_04_Montage.A_OrcM_S1H_Taunt_04_Montage'";

    /// PROPERTIES
    // TAUNTS - In Movement
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InMovement)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_S1H_Taunt_01_Montage)
        .AddMontage(A_OrcM_S1H_Taunt_02_Montage)
        .AddMontage(A_OrcM_S1H_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_S1H_Taunt_01_Montage)
        .AddMontage(A_OrcM_S1H_Taunt_02_Montage)
        .AddMontage(A_OrcM_S1H_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Observer)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_S1H_Taunt_01_Montage)
        .AddMontage(A_OrcM_S1H_Taunt_02_Montage)
        .AddMontage(A_OrcM_S1H_Taunt_03_Montage)
        .Set();

    // WARNING
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddMontage(A_OrcM_S1H_Taunt_02_Montage)
        .Set();
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_OrcM_S1H_Taunt_03_Montage)
        .Set();
}

UCLASS()
class UTauntData_UndeadOrc_S1H : UTauntData_Orc_S1H
{
    /// MONTAGES
    default A_OrcM_S1H_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_U_S1H_Taunt_01_Montage.A_OrcM_U_S1H_Taunt_01_Montage'";
    default A_OrcM_S1H_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_U_S1H_Taunt_02_Montage.A_OrcM_U_S1H_Taunt_02_Montage'";
    default A_OrcM_S1H_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_U_S1H_Taunt_03_Montage.A_OrcM_U_S1H_Taunt_03_Montage'";
    default A_OrcM_S1H_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_U_S1H_Taunt_04_Montage.A_OrcM_U_S1H_Taunt_04_Montage'";
}