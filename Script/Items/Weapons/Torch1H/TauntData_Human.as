UCLASS()
class UTauntData_T1H : UTauntData_Config
{
    /// MONTAGES
    FName A_Man_T1H_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Taunts/A_Man_T1H_Taunt_01_Montage.A_Man_T1H_Taunt_01_Montage'";
    FName A_Man_T1H_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Taunts/A_Man_T1H_Taunt_02_Montage.A_Man_T1H_Taunt_02_Montage'";
    FName A_Man_T1H_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Taunts/A_Man_T1H_Taunt_03_Montage.A_Man_T1H_Taunt_03_Montage'";

    /// PROPERTIES
    // TAUNTS - In Movement
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InMovement)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_Man_T1H_Taunt_01_Montage)
        .AddMontage(A_Man_T1H_Taunt_02_Montage)
        .AddMontage(A_Man_T1H_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_Man_T1H_Taunt_01_Montage)
        .AddMontage(A_Man_T1H_Taunt_02_Montage)
        .AddMontage(A_Man_T1H_Taunt_03_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Observer)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(A_Man_T1H_Taunt_01_Montage)
        .AddMontage(A_Man_T1H_Taunt_02_Montage)
        .AddMontage(A_Man_T1H_Taunt_03_Montage)
        .Set();
}