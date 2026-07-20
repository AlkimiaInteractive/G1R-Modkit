UCLASS()
class UAIGroup_Search_Trespassing : UAIGroup_StateEvent
{
    default MaximumMembers = -1;
    default bAllowJoiningAfterActionHasStarted = true;

    default ShareMemberCountWithGroups.Add(UAIGroup_Warning_Trespassing);
} 

UCLASS()
class UAIGroup_Search_Investigate : UAIGroup_StateEvent
{
    default MaximumMembers = -1;
    default bAllowJoiningAfterActionHasStarted = true;
} 