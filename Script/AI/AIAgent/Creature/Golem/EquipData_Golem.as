//~~~~~~~~~~~~~~~~
//  STONE GOLEM
//~~~~~~~~~~~~~~~~
UCLASS()
class UEquipData_Golem_Stone : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Draw/StoneGolem_Shelve_Montage.StoneGolem_Shelve_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Draw/StoneGolem_Draw_Montage.StoneGolem_Draw_Montage'"));
}

UCLASS()
class UEquipData_Golem_Stone_Bridge : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Draw/StoneGolem_Shelve_Montage.StoneGolem_Shelve_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Draw/StoneGolem_Draw_Montage.StoneGolem_Draw_Montage'"));
}

UCLASS()
class UEquipData_Golem_Stone_Rock : UEquipData
{
    default m_SocketName = n"weapon_r_central";
}

UCLASS()
class UEquipData_Golem_Stone_Wave : UEquipData
{
    default m_SocketName = n"ball_r";
}

//~~~~~~~~~~~~~~~~
//   ICE GOLEM
//~~~~~~~~~~~~~~~~
UCLASS()
class UEquipData_Golem_Ice : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Draw/IceGolem_Draw_Montage.IceGolem_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Draw/IceGolem_Shelve_Montage.IceGolem_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Golem_Ice_Throw_Grenade : UEquipData
{
    default m_SocketName = n"weapon_r";
}

UCLASS()
class UEquipData_Golem_Ice_Throw_IceBolt : UEquipData
{
    //Head and yaw have bad orientations.
    default m_SocketName = n"neck";
}

//~~~~~~~~~~~~~~~~
//   FIRE GOLEM
//~~~~~~~~~~~~~~~~
UCLASS()
class UEquipData_Golem_Fire : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Draw/FireGolem_Draw_Montage.FireGolem_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Draw/FireGolem_Shelve_Montage.FireGolem_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Golem_Fire_Rock : UEquipData
{
    default m_SocketName = n"weapon_r";
}
