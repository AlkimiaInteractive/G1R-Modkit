UCLASS()
class UEquipData_Scavenger_Adult  :   UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Draw/Scavenger_Adult_Draw_Montage.Scavenger_Adult_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Draw/Scavenger_Adult_Shelve_Montage.Scavenger_Adult_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Scavenger_Medium  :   UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Draw/Scavenger_Med_Draw_Montage.Scavenger_Med_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Draw/Scavenger_Med_Shelve_Montage.Scavenger_Med_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Scavenger_Young  :   UEquipData
{
    
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Draw/Scavenger_Draw_Montage.Scavenger_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Draw/Scavenger_Shelve_Montage.Scavenger_Shelve_Montage'"));

}