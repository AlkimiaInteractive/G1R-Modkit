UCLASS()
class UEquipData_Troll  :   UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Draw/AdultTroll_Draw_Montage.AdultTroll_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Draw/AdultTroll_Shelve_Montage.AdultTroll_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Troll_Juvenile  :   UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Draw/JuvenileTroll_Draw_Montage.JuvenileTroll_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Draw/JuvenileTroll_Shelve_Montage.JuvenileTroll_Shelve_Montage'"));
}

UCLASS()
class UEquipData_AdultTroll_ThrowGoblin : UEquipData
{
    default m_SocketName = n"weapon_r";
}

UCLASS()
class UEquipData_AdultTroll_ThrowRock : UEquipData
{
    default m_SocketName = n"weapon_r";
}