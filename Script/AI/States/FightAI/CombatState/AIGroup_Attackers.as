UCLASS()
class UAIGroup_Attackers : UGothicAIGroup
{
    UPROPERTY()
    TMap<AGothicCharacterState, AGothicCharacter> AttackersAndTargets;

    UFUNCTION(BlueprintOverride)
    void HandleMemberJoined(AGothicCharacter Character)
    {
        if (!IsValid(Character))
            return;
        
        auto AI = Character.GetGothicAI();
        if (!IsValid(AI))
            return;

        AGothicCharacter CharacterOfInterest = AI.CharacterOfInterest;
        if (!IsValid(CharacterOfInterest))
            return;

        AttackersAndTargets.Add(Character.CharacterState, CharacterOfInterest);
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberLeft(AGothicCharacter Character)
    {
        AttackersAndTargets.Remove(Character.CharacterState);
    }

    bool IsPathTooCloseToAnyAttackVector(AGothicCharacter MovingCharacter, FVector MovementDirection, float MovingSegmentLength = 150.0f, float AdditionalDistanceFromAttackSegment = 0.0f)
    {
        if (!IsValid(MovingCharacter))
            return false;

        if (MovementDirection.Size() < 0.1f || MovingSegmentLength < 0.1f)
            return false;


        for (auto AttackerCharacter : JoinedCharacters)
        {
            AGothicCharacter TargetCharacter;
            if (!AttackersAndTargets.Find(AttackerCharacter.CharacterState, TargetCharacter))
                continue;

            if (!IsValid(TargetCharacter))
                continue;
        
            float MinDistanceBetweenSegments = MovingCharacter.SimpleCollisionRadius + AttackerCharacter.SimpleCollisionRadius + AdditionalDistanceFromAttackSegment; 

            FVector AttackSegmentStartLocation = AttackerCharacter.ActorLocation;
            FVector AttackSegmentEndLocation = TargetCharacter.ActorLocation;
            AttackSegmentEndLocation += (AttackSegmentStartLocation - AttackSegmentEndLocation).GetSafeNormal() * TargetCharacter.SimpleCollisionRadius;

            FVector MovementSegmentStartLocation = MovingCharacter.ActorLocation;
            FVector MovementSegmentEndLocation = MovementSegmentStartLocation + MovementDirection.GetSafeNormal() * MovingSegmentLength;

            FVector AttackSegmentClosestPoint;
            FVector MovementSegmentClosestPoint;
            Math::FindNearestPointsOnLineSegments(AttackSegmentStartLocation, AttackSegmentEndLocation, MovementSegmentStartLocation, MovementSegmentEndLocation, AttackSegmentClosestPoint, MovementSegmentClosestPoint);

            if (AttackSegmentClosestPoint.Distance(MovementSegmentClosestPoint) < MinDistanceBetweenSegments)
            {
                // DebugScript::DrawLine(MovementSegmentStartLocation, MovementSegmentEndLocation, FColor::Blue, 7.f, 4.f);
                // DebugScript::DrawLine(AttackSegmentStartLocation, AttackSegmentEndLocation, FColor::Blue, 10.f, 4.f);
                // DebugScript::DrawLine(AttackSegmentClosestPoint, MovementSegmentClosestPoint, FColor::Red, 7.f, 4.f);

                return true;
            }
        }

        return false;
    }

    
    bool WouldCharacterBeBlockedByAnyAttackVector(AGothicCharacter MovingCharacter, float TimeHorizon)
    {
        if (!IsValid(MovingCharacter))
            return false;

        float MovingCharacterDistanceToHorizon = MovingCharacter.Velocity.Size() * TimeHorizon;

        if (MovingCharacterDistanceToHorizon < 1.f)
            return false;

        for (auto AttackerCharacter : JoinedCharacters)
        {
            AGothicCharacter TargetCharacter;
            if (!AttackersAndTargets.Find(AttackerCharacter.CharacterState, TargetCharacter))
                continue;

            if (!IsValid(TargetCharacter))
                continue;
    
            float MinDistanceBetweenSegments = MovingCharacter.SimpleCollisionRadius * 1.5f + AttackerCharacter.SimpleCollisionRadius * 1.5f; 

            float DistanceCollisionsAttackerTarget = AttackerCharacter.ActorLocation.Distance(TargetCharacter.ActorLocation) - (TargetCharacter.SimpleCollisionRadius + AttackerCharacter.SimpleCollisionRadius);
            bool bX = ensureAlways(DistanceCollisionsAttackerTarget > 0.f);
            float EstimatedAttackerMoveDistance = AttackerCharacter.Velocity.Size() * TimeHorizon;
            FVector FutureAttackerStartLocation = AttackerCharacter.ActorLocation + AttackerCharacter.Velocity.GetSafeNormal() * Math::Min(DistanceCollisionsAttackerTarget, EstimatedAttackerMoveDistance);
            FVector FutureAttackerEndLocation = TargetCharacter.ActorLocation;
        
            FVector FutureMoverStartLocation = MovingCharacter.ActorLocation;
            FVector FutureMoverEndLocation = FutureMoverStartLocation + MovingCharacter.Velocity * TimeHorizon;

            // FVector ClosestPoint = Math::ClosestPointOnLine(FutureAttackerStartLocation, TargetCharacter.ActorLocation, FutureMoverStartLocation);

            FVector ClosestPointAttackSegment;
            FVector ClosestPointMoveSegment;
            Math::FindNearestPointsOnLineSegments(FutureAttackerStartLocation, FutureAttackerEndLocation, FutureMoverStartLocation, FutureMoverEndLocation, ClosestPointAttackSegment, ClosestPointMoveSegment);

            if (ClosestPointAttackSegment.Distance(ClosestPointMoveSegment) < MinDistanceBetweenSegments)
            {
                // DebugScript::DrawLine(FutureAttackerStartLocation, FutureAttackerEndLocation, FColor::Purple, 7.f, 1.5f);
                // DebugScript::DrawLine(FutureMoverStartLocation, FutureMoverEndLocation, FColor::Blue, 7.f, 1.5f);
                // DebugScript::DrawLine(ClosestPointAttackSegment, ClosestPointMoveSegment, FColor::Red, 7.f, 1.5f);
                // DebugScript::DrawCharacterCapsule(AttackerCharacter, FutureAttackerStartLocation, FColor::Purple, 2.f, 1.5f);
                // DebugScript::DrawCharacterCapsule(MovingCharacter, FutureMoverEndLocation, FColor::Blue, 2.f, 1.5f);

                // DebugScript::DrawSphere(AttackerCharacter.ActorLocation + FVector::UpVector * 40.f, AttackerCharacter.SimpleCollisionRadius, FColor::Yellow, 1.5f);
                // DebugScript::DrawSphere(MovingCharacter.ActorLocation + FVector::UpVector * 40.f, AttackerCharacter.SimpleCollisionRadius, FColor::Yellow, 1.5f);

                return true;
            }
        }

        return false;
    }

    bool WillCharacterMoveBlockAnyAttackVector(AGothicCharacter MovingCharacter, float TimeHorizon)
    {
        if (!IsValid(MovingCharacter))
            return false;

        float MovingCharacterDistanceToHorizon = MovingCharacter.Velocity.Size() * TimeHorizon;

        if (MovingCharacterDistanceToHorizon < 1.f)
            return false;

        for (auto AttackerCharacter : JoinedCharacters)
        {
            AGothicCharacter TargetCharacter;
            if (!AttackersAndTargets.Find(AttackerCharacter.CharacterState, TargetCharacter))
                continue;

            if (!IsValid(TargetCharacter))
                continue;

            // The moves of attacker and mover are fully overlapping: one of them IS already in the way and WILL be in the way after moving
            // skip block check
            if (HaveFullyOverlappingMoves(MovingCharacter, AttackerCharacter, TimeHorizon))
            {
                continue;
            }

            if (WillCharactersMoveBlockAttackSegment(MovingCharacter, AttackerCharacter, TimeHorizon, 0.f))
            {
                return true;
            }
        
        }

        return false;
    }

    /** 
    * When MovingCharacter continues its move for the duration of TimeHorizon, will it block the move of AttackerCharacter towards its Target anywhere on the way? 
    * AdditionalDistanceBetweenCharacters: Situation is considered a block when the distance between Mover & Attackers collisions is smaller than this value. Use default value to detect hit/overlaps only
    */
    bool WillCharactersMoveBlockAttackSegment(AGothicCharacter MovingCharacter, AGothicCharacter AttackerCharacter, float TimeHorizon, float AdditionalDistanceBetweenCharacters = 0.0f)
    {
        AGothicCharacter TargetCharacter;
        if (!AttackersAndTargets.Find(AttackerCharacter.CharacterState, TargetCharacter))
        {
            PrintWarning("WillCharactersMoveBlockAttackSegment: given AttackerCharacter does not have a target");
            return false;
        }

        FVector AttackerStartLocation = AttackerCharacter.ActorLocation;
        FVector FutureAttackerEndLocation = EstimateLocationAfterMove(AttackerCharacter, AttackerCharacter.Velocity, TimeHorizon);
        FVector FutureMoverStartLocation = MovingCharacter.ActorLocation;
        FVector FutureMoverEndLocation = EstimateLocationAfterMove(MovingCharacter, MovingCharacter.Velocity, TimeHorizon);

        FVector ClosestPointAttackSegment;
        FVector ClosestPointMoveSegment;
        Math::FindNearestPointsOnLineSegments(AttackerStartLocation, FutureAttackerEndLocation, FutureMoverStartLocation, FutureMoverEndLocation, ClosestPointAttackSegment, ClosestPointMoveSegment);

        float DistToClosestPoint = AttackerStartLocation.Distance(ClosestPointAttackSegment);
        // how much of the total move can attacker do until reaching the closest point to the mover?
        float AttackerMoveUntilPotentialHitAlpha = 0.0f;

        float AttackerTotalMoveDistance = AttackerStartLocation.Distance(FutureAttackerEndLocation);
        if (AttackerTotalMoveDistance > 0.0f)
        {
            AttackerMoveUntilPotentialHitAlpha = DistToClosestPoint / AttackerTotalMoveDistance; 
        }

        FVector MoverLocationUntilPotentialHit = Math::Lerp(FutureMoverStartLocation, FutureMoverEndLocation, AttackerMoveUntilPotentialHitAlpha);

        float MinDistanceBetweenSegments = MovingCharacter.SimpleCollisionRadius + AttackerCharacter.SimpleCollisionRadius + AdditionalDistanceBetweenCharacters; 
        
        if (MoverLocationUntilPotentialHit.Distance(ClosestPointAttackSegment) < MinDistanceBetweenSegments)
        {
            // DebugScript::DrawLine(AttackerStartLocation, FutureAttackerEndLocation, FColor::Purple, 7.f, 1.5f);
            // DebugScript::DrawLine(FutureMoverStartLocation, FutureMoverEndLocation, FColor::Blue, 7.f, 1.5f);
            // DebugScript::DrawLine(ClosestPointAttackSegment, ClosestPointMoveSegment, FColor::Red, 7.f, 1.5f);
            // DebugScript::DrawCharacterCapsule(AttackerCharacter, AttackerStartLocation, FColor::Purple, 2.f, 1.5f);
            // DebugScript::DrawCharacterCapsule(MovingCharacter, FutureMoverEndLocation, FColor::Blue, 2.f, 1.5f);
            
            return true;
        }

        return false;
    }

    bool HaveFullyOverlappingMoves(AGothicCharacter SelfCharacter, AGothicCharacter OtherCharcter, float TimeHorizon, float AdditionalDistanceBetweenCharacters = 0.0f)
    {
        FVector SelfStartLocation = SelfCharacter.ActorLocation;
        FVector FutureSelfEndLocation = EstimateLocationAfterMove(SelfCharacter, SelfCharacter.Velocity, TimeHorizon);
        FVector OtherStartLocation = OtherCharcter.ActorLocation;
        FVector FutureOtherEndLocation = EstimateLocationAfterMove(OtherCharcter, OtherCharcter.Velocity, TimeHorizon);

        FVector ClosestPointToOtherStart = Math::ClosestPointOnLine(SelfStartLocation, FutureSelfEndLocation, OtherStartLocation);
        FVector ClosestPointOtherEnd = Math::ClosestPointOnLine(SelfStartLocation, FutureSelfEndLocation, FutureOtherEndLocation);

        float MinDistanceBetween = SelfCharacter.SimpleCollisionRadius + OtherCharcter.SimpleCollisionRadius + AdditionalDistanceBetweenCharacters; 

        if (OtherStartLocation.Distance(ClosestPointToOtherStart) > MinDistanceBetween)
            return false;

        if (FutureOtherEndLocation.Distance(ClosestPointOtherEnd) > MinDistanceBetween)
            return false;

        // DebugScript::DrawCharacterCapsule(SelfCharacter, OtherCharcter, FColor::Red, 2.f, 1.5f);
        return true;
    }


    /** 
    * Where would character stand if it would continue its move for the duration of MoveDurationSec? If Character is an attacker, the output location is clamped up to his target (not overlapping collisions) 
    * MoveDirection: non-normalized velocity
    */
    FVector EstimateLocationAfterMove(AGothicCharacter Character, FVector MoveDirection, float MoveDurationSec)
    {
        float EstimatedAttackerMoveDistance = MoveDirection.Size() * MoveDurationSec;
        FVector FutureAttackerEndLocation = Character.ActorLocation + MoveDirection.GetSafeNormal() * EstimatedAttackerMoveDistance; 

        AGothicCharacter TargetCharacter = nullptr; // if character is doing an attack, TargetCharacter gets set
        AttackersAndTargets.Find(Character.CharacterState, TargetCharacter);
       
        if (TargetCharacter != nullptr)
        {
            float DistanceCollisionsAttackerTarget = Character.ActorLocation.Distance(TargetCharacter.ActorLocation) - (TargetCharacter.SimpleCollisionRadius + Character.SimpleCollisionRadius);
            FutureAttackerEndLocation = Character.ActorLocation + MoveDirection.GetSafeNormal() * Math::Min(DistanceCollisionsAttackerTarget, EstimatedAttackerMoveDistance);
        }

        return FutureAttackerEndLocation;
    }


    bool IsCharacterTooCloseToAnyAttackVector(AGothicCharacter Character, FVector&out PointOfClosestAttackSegment, float MinimumDistanceFromAttackSegment = 80.0f)
    {
        if (!IsValid(Character))
            return false;

        if (MinimumDistanceFromAttackSegment < 0.1f)
            return false;
        
        bool bFoundTooCloseAttackVector = false;
        FVector ClosestPointOfClosestAttackSegment;
        float SmallestDistance = MAX_flt;
        for (auto AttackerCharacter : JoinedCharacters)
        {
            if (AttackerCharacter == Character)
                continue;

            AGothicCharacter TargetCharacter;
            if (!AttackersAndTargets.Find(AttackerCharacter.CharacterState, TargetCharacter))
                continue;

            if (!IsValid(TargetCharacter))
                continue;

            FVector AttackSegmentStartLocation = AttackerCharacter.ActorLocation;
            FVector AttackSegmentEndLocation = TargetCharacter.ActorLocation;

            FVector MovementSegmentStartLocation = Character.ActorLocation;
            FVector MovementSegmentEndLocation = MovementSegmentStartLocation;

            FVector AttackSegmentClosestPoint;
            FVector MovementSegmentClosestPoint;
            Math::FindNearestPointsOnLineSegments(AttackSegmentStartLocation, AttackSegmentEndLocation, MovementSegmentStartLocation, MovementSegmentEndLocation, AttackSegmentClosestPoint, MovementSegmentClosestPoint);

            float Distance = AttackSegmentClosestPoint.Distance(Character.ActorLocation);
            if (Distance >= MinimumDistanceFromAttackSegment)
                continue;
            
            bFoundTooCloseAttackVector = true;
            if (Distance >= SmallestDistance)
                continue;

            SmallestDistance = Distance;
            ClosestPointOfClosestAttackSegment = AttackSegmentClosestPoint;
        }

        if (bFoundTooCloseAttackVector)
        {
            PointOfClosestAttackSegment = ClosestPointOfClosestAttackSegment;
            return true;
        }

        return false;
    }

    UFUNCTION(BlueprintOverride)
    TArray<AActor> GetGroupTargets() const
    {
        TArray<AActor> Targets;

        for(auto AttackerTargetPair: AttackersAndTargets)
        {
            Targets.Add(AttackerTargetPair.Value);
        }

        return Targets;
    }
}