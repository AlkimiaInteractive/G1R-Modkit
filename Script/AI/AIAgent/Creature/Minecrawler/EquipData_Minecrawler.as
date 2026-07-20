UCLASS()
class UEquipData_Minecrawler : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Draw/MCrawler_Draw_Montage.MCrawler_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Draw/MCrawler_Shelve_Montage.MCrawler_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Minecrawler_Warrior : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Draw/MCrawler_Warrior_Draw_Montage.MCrawler_Warrior_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Draw/MCrawler_Warrior_Shelve_Montage.MCrawler_Warrior_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Minecrawler_Queen : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n""));
    default m_UnequipMontages.Add(FEquipMontage(n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Movement/Idles/MCQueen_Ph1_Shelve_Montage.MCQueen_Ph1_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Minecrawler_Queen2 : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n""));
    default m_UnequipMontages.Add(FEquipMontage(n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Movement/Idles/MCQueen_Ph2_Shelve_Montage.MCQueen_Ph2_Shelve_Montage'"));
}