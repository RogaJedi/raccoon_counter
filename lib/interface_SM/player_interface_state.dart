class PlayerInterfaceState {
  final int currentPage;
  final bool showPickColorCard;

  PlayerInterfaceState({
    this.currentPage = 1,
    this.showPickColorCard = false,
  });

  PlayerInterfaceState copyWith({
    int? currentPage,
    bool? showPickColorCard,
  }) {
    return PlayerInterfaceState(
      currentPage: currentPage ?? this.currentPage,
      showPickColorCard: showPickColorCard ?? this.showPickColorCard,
    );
  }
}