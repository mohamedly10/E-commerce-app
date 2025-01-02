abstract class NavigationState {}

class NavigationInitaial extends NavigationState{}
class NavigationSwap extends NavigationState{
  final int currentIndex;
  NavigationSwap({required this.currentIndex});
}



