UCLASS()
class UEquipData_Lizard : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Draw/Lizard_Draw_Montage.Lizard_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Draw/Lizard_Shelve_Montage.Lizard_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Lizard_Fire : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Draw/Lizard_Fire_Draw_Montage.Lizard_Fire_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Draw/Lizard_Fire_Shelve_Montage.Lizard_Fire_Shelve_Montage'"));
}