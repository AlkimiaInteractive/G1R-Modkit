

class UGE_Human_PickAndCarryBags : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_Bag_Heavy);
    default CarryMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryOreBag/CarryOreBag_Montage.CarryOreBag_Montage'";
   
    default PutdownPositionOffset = FVector(60.0f, 0.0f, -25.0f);
    default PutdownRotationOffset = FRotator(0.0f,90.0f,0.0f);
}

class UGE_Human_PickAndCarrySacks : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_Sack);
    default CarryMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryFoodBag/Man_CarrySack_Montage.Man_CarrySack_Montage'";
    default AttachmentSocketName = n"hand_socket_l";
    
    default PutdownPositionOffset = FVector(60.0f, 0.0f, 0.0f);
    default PutdownRotationOffset = FRotator( 0.0f, -90.0f,  0.0f);
}

class UGE_Human_PickAndCarryBoxes : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_Box);
    default CarryMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryBox/CarryBox_Montage.CarryBox_Montage'";

    default PutdownPositionOffset = FVector(60.0f, 0.0f, 25.0f);
    default PutdownRotationOffset = FRotator( 0.0f, -90.0f,  0.0f);
}

class UGE_Human_PickAndCarryBoxesMidHigh : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_BoxMidHigh);
    default CarryMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryBox/CarryBoxMidHigh_Montage.CarryBoxMidHigh_Montage'";

    default PutdownPositionOffset = FVector(60.0f, 0.0f, 25.0f);
    default PutdownRotationOffset = FRotator( 0.0f, -90.0f,  0.0f);
}

class UGE_Human_PickAndCarryPlanks : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_Plank);
    default CarryMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryPlank/CarryPlank_Montage.CarryPlank_Montage'";

    default PutdownPositionOffset = FVector(60.0f, 0.0f, 2.0f);
    default PutdownRotationOffset = FRotator(0.0f,180.0f, 0.0f);
}

class UGE_Human_PickAndCarryPlanksFromWall : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_PlankFromWall);
    default CarryMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryPlank/CarryPlankFromWall_Montage.CarryPlankFromWall_Montage'";
    
    default PutdownPositionOffset = FVector(60.0f, 0.0f, 2.0f);
    default PutdownRotationOffset = FRotator(0.0f,180.0f, 0.0f);
}

class UGE_Human_PickAndCarryWood : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_Wood);
    default CarryMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryBrushWood/Man_CarryBrushwood_Montage.Man_CarryBrushwood_Montage'";

    default PutdownRotationOffset = FRotator(0.0f,90.0f, 0.0f);
    default PutdownPositionOffset = FVector(60.0f, 0.0f, 2.0f);
}

class UGE_Human_PickAndCarryWoodFromWall : UGameplayAbilityPickAndCarry
{
    default ApplicableItemTypes.AddTag(GameplayTag::Item_Ambient_WoodFromWall);
    default CarryMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CarryObject/CarryPlank/CarryPlankFromWall_Montage.CarryPlankFromWall_Montage'";
    
    default PutdownPositionOffset = FVector(60.0f, 0.0f, 2.0f);
    default PutdownRotationOffset = FRotator(0.0f,90.0f,0.0f);
}