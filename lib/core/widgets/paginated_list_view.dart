import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pickle_rick/core/network/api/models/paginated_model.dart';

typedef ItemBuilder<T> =
    Widget Function(BuildContext context, T item, int index);
typedef FetchPaginated<T> = Future<PaginatedModel<T>?> Function(int page);

class PaginatedListView<T> extends StatefulWidget {
  final FetchPaginated<T> fetchPage;
  final ItemBuilder<T> itemBuilder;
  final EdgeInsets padding;

  const PaginatedListView({
    super.key,
    required this.fetchPage,
    required this.itemBuilder,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  final ScrollController _scrollController = ScrollController();

  List<T> items = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasNextPage = true;
  bool initialLoad = true;

  @override
  void initState() {
    super.initState();
    _loadNextPage();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        !isLoading &&
        hasNextPage) {
      _loadNextPage();
    }
  }

  Future<void> _loadNextPage() async {
    setState(() => isLoading = true);
    try {
      final pageData = await widget.fetchPage(currentPage);
      if (pageData != null) {
        setState(() {
          items.addAll(pageData.results);
          hasNextPage = pageData.hasNextPage;
          currentPage = pageData.currentPage + 1;
          initialLoad = false;
        });
      } else {
        hasNextPage = false;
        debugPrint('No data returned from fetchPage');
      }
    } catch (e) {
      debugPrint('Error loading page: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialLoad && isLoading) {
      return Center(child: SpinKitChasingDots(color: Colors.greenAccent));
    }

    return ListView.builder(
      controller: _scrollController,
      padding: widget.padding,
      itemCount: items.length + (isLoading || hasNextPage ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < items.length) {
          return widget.itemBuilder(context, items[index], index);
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(child: SpinKitChasingDots(color: Colors.greenAccent)),
          );
        }
      },
    );
  }
}
