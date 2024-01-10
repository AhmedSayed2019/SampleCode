


class PaginationEntity {
  final int _count;
  final int _total;
  final int _perPage;
  final int _currentPage;
  final int _totalPages;

  const PaginationEntity({
    required int count,
    required int total,
    required int perPage,
    required int currentPage,
    required int totalPages,
  })  : _count = count,
        _total = total,
        _perPage = perPage,
        _currentPage = currentPage,
        _totalPages = totalPages;

  int get totalPages => _totalPages;

  int get currentPage => _currentPage;

  int get perPage => _perPage;

  int get total => _total;

  int get count => _count;
}

