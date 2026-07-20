UCLASS()
class UTransformSpellConfig : USpellConfig
{
    default m_SpellCategoryTag = GameplayTag::Event_Spell_Transform;
}

UCLASS()
class UTransformMeatbugSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(5.f, 0.0f, .0f, UGA_Spell_Transform_Meatbug::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformScavengerSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(5.f, 0.0f, .0f, UGA_Spell_Transform_Scavenger_Medium::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformMoleratSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(5.f, 0.0f, .0f, UGA_Spell_Transform_Molerat::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformBloodflySpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(10.f, 0.0f, 0.0f, UGA_Spell_Transform_Bloodfly::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformWolfSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(10.f, 0.0f, 0.0f, UGA_Spell_Transform_Wolf::StaticClass());

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformLizardSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(15.f, 0.0f, .0f, UGA_Spell_Transform_Lizard::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformLurkerSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(15.f, 0.0f, .0f, UGA_Spell_Transform_Lurker::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformOrcDogSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(20.f, 0.0f, 0.0f, UGA_Spell_Transform_OrcDog::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformMinecrawlerSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(20.f, 0.0f, 0.0f, UGA_Spell_Transform_Minecrawler::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformSnapperSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(25.f, 0.0f, .0f, UGA_Spell_Transform_Snapper::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformShadowbeastSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(50.f, 0.0f, .0f, UGA_Spell_Transform_Shadowbeast::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformBiterSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(30.f, 0.0f, 0.0f, UGA_Spell_Transform_Biter::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformRazorSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(35.f, 0.0f, .0f, UGA_Spell_Transform_Razor::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformBloodhoundSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(35.f, 0.0f, .0f, UGA_Spell_Transform_Bloodhound::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformFireLizardSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(35.f, 0.0f, .0f, UGA_Spell_Transform_FireLizard::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformHarpySpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(60.f, 0.0f, .0f, UGA_Spell_Transform_Harpy::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}

UCLASS()
class UTransformSwampsharkSpellConfig : UTransformSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(60.f, 0.0f, .0f, UGA_Spell_Transform_Swampshark::StaticClass());
    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellTransform();
    }
}