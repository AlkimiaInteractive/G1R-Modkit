UCLASS()
class UAIGroup_Warning_Trespassing : UAIGroup_Warning_Base
{
    default AllowTransitionFromGroups.Add(UAIGroup_Search_Trespassing);
}