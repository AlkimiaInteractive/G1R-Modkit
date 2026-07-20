// class UGA_Spell_BallLightning_Orc : UGA_ThrowProjectile
// {
//     TSubclassOf<UBallLightningDefinition_Base> m_SpellConfig = UOrcBallLightningProjectileDefinition::StaticClass();
//     UFUNCTION(BlueprintOverride)
//     void InitializeProjectile_Scriptable(AProjectileVisual ProjectileVisual) const
//     {
//          ABallLightningVisual projectileVisual = Cast<ABallLightningVisual>(ProjectileVisual);
//         if(projectileVisual != nullptr)
//         {
//             auto avatarActor = GetAvatarActorFromActorInfo();
//             SetOwnerAndInstigator(projectileVisual, avatarActor);
//             projectileVisual.m_CollisionComp.m_WeaponData = m_SpellConfig;
//             IgnoreActors(projectileVisual.m_CollisionComp, avatarActor);
            
//             projectileVisual.OnProjectileFired(m_SpellConfig);
//         }
//     }

   
// }