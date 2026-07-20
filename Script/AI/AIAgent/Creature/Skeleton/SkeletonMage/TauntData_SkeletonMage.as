UCLASS()
class UTauntData_SkeletonMage : UTauntData_Config
{
    /// MONTAGES
    FName SkMage_Taunt_01_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Taunt/A_SkeletonMage_Taunt_01_Montage.A_SkeletonMage_Taunt_01_Montage'";
    FName SkMage_Taunt_02_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Taunt/A_SkeletonMage_Taunt_02_Montage.A_SkeletonMage_Taunt_02_Montage'";
    FName SkMage_Taunt_03_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Taunt/A_SkeletonMage_Taunt_03_Montage.A_SkeletonMage_Taunt_03_Montage'";
    FName SkMage_Taunt_04_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Taunt/A_SkeletonMage_Taunt_Short_01_Montage.A_SkeletonMage_Taunt_Short_01_Montage'";
    
    /// PROPERTIES
    // TAUNTS - IP Short
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(SkMage_Taunt_02_Montage)
        .AddMontage(SkMage_Taunt_04_Montage)
        .Set();

    // TAUNTS - IP
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(SkMage_Taunt_01_Montage)
        .AddMontage(SkMage_Taunt_03_Montage)
        .Set();

    // WARNING
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddProperty(GameplayTag::Combat_Taunt_Short)
        .AddMontage(SkMage_Taunt_01_Montage)
        .Set();
    
    default CreateNewTauntGroup()
        .AddProperty(GameplayTag::Combat_Taunt_InPlace)
        .AddProperty(GameplayTag::Combat_Taunt_Warning)
        .AddProperty(GameplayTag::Combat_Taunt_Noticeable)
        .AddMontage(SkMage_Taunt_01_Montage)
        .Set();
}