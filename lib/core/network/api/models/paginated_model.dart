class PaginatedModel<T> {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNextPage;
  final List<T> results;

  PaginatedModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNextPage,
    required this.results,
  });
}
