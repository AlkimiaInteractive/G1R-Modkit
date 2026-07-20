UCLASS()
class UTauntData_Skeleton : UTauntData_Config
{
    /// MONTAGES
    FName Skeleton_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_01_Montage.A_Skeleton_Taunt_01_Montage'";
    FName Skeleton_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_02_Montage.A_Skeleton_Taunt_02_Montage'";
    FName Skeleton_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_03_Montage.A_Skeleton_Taunt_03_Montage'";
    FName Skeleton_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_04_Montage.A_Skeleton_Taunt_04_Montage'";
    FName Skeleton_Taunt_05_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_05_Montage.A_Skeleton_Taunt_05_Montage'";
    FName Skeleton_Taunt_06_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_06_Montage.A_Skeleton_Taunt_06_Montage'";
    FName Skeleton_Taunt_07_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_Short_01_Montage.A_Skeleton_Taunt_Short_01_Montage'";
    

    FName Skeleton_Warning_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Warning/Skeleton_Warning_01_Montage.Skeleton_Warning_01_Montage'";
    FName Skeleton_Warning_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Warning/Skeleton_Warning_02_Montage.Skeleton_Warning_02_Montage'";
    FName Skeleton_Warning_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Warning/Skeleton_Warning_03_Montage.Skeleton_Warning_03_Montage'";

    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Skeleton_Taunt_04_Montage)
        .AddMontage(Skeleton_Taunt_05_Montage)
        .AddMontage(Skeleton_Taunt_06_Montage)
        .AddMontage(Skeleton_Taunt_07_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Skeleton_Taunt_01_Montage)
        .AddMontage(Skeleton_Taunt_02_Montage)
        .AddMontage(Skeleton_Taunt_03_Montage)
        .Set();

    // WARNING
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(Skeleton_Warning_01_Montage)
        .AddMontage(Skeleton_Warning_02_Montage)
        .AddMontage(Skeleton_Warning_03_Montage)
        .Set();
}