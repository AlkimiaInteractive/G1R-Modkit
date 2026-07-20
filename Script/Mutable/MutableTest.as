


///                  EXAMPLE INSTANCES



/*
class MutableSkeletonInstances : UScriptMutableInstances
{
    UFUNCTION(BlueprintOverride)
    void DefineInstances(TArray<FMutablePropertyScriptData>& instances)
    {
        // ------------------------------------------------
        auto SkeletonWarrior = UMutableSkeleton("Skeleton_1");
        SkeletonWarrior.Shirt = MutableSkeleton::EShirt::Shirt_01;
        SkeletonWarrior.ArmBandage_L = MutableSkeleton::EArmBandage_L::NO;
        SkeletonWarrior.ArmBandage_R = MutableSkeleton::EArmBandage_R::YES;
        SkeletonWarrior.FootBandage_L = MutableSkeleton::EFootBandage_L::NO;
        SkeletonWarrior.FootBandage_R = MutableSkeleton::EFootBandage_R::NO;

        instances.Add(SkeletonWarrior.ToInstance());

        // ------------------------------------------------
        auto SkeletonWarrior2 = UMutableSkeleton("Skeleton_2");
        
        SkeletonWarrior2.Shirt = MutableSkeleton::EShirt::Shirt_01;
        SkeletonWarrior2.ArmBandage_L = MutableSkeleton::EArmBandage_L::YES;
        SkeletonWarrior2.ArmBandage_R = MutableSkeleton::EArmBandage_R::YES;
        SkeletonWarrior2.FootBandage_L = MutableSkeleton::EFootBandage_L::NO;
        SkeletonWarrior2.FootBandage_R = MutableSkeleton::EFootBandage_R::YES;

        instances.Add(SkeletonWarrior2.ToInstance());

    }
}
*/