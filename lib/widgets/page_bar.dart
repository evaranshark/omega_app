import 'package:flutter/material.dart';
import 'package:omega_app/themes.dart';

class PageBar extends StatefulWidget {
  const PageBar({
    super.key,
    required this.pages,
    this.direction = Axis.horizontal,
    this.onSelected,
  }) : assert(pages.length > 1, "PageBar should contain not less than 2 pages");
  final List<PageItem> pages;
  final Axis direction;
  final ValueChanged<int>? onSelected;

  @override
  State<PageBar> createState() => _PageBarState();
}

class _PageBarState extends State<PageBar> {
  late PageItem selectedItem;
  int selectedIndex = 0;
  void _onItemSelected(PageItem item) {
    setState(() {
      selectedItem = item;
      selectedIndex = widget.pages.indexOf(item);
    });
    widget.onSelected?.call(selectedIndex);
  }

  @override
  void initState() {
    super.initState();
    selectedItem = widget.pages[0];
  }

  @override
  Widget build(BuildContext context) {
    Widget pageFor(PageItem item) {
      final bool itemSelected = (selectedItem == item);
      return _PageItem(
        onSelected: _onItemSelected,
        selected: itemSelected,
        item: item,
      );
    }

    List<Widget> destinations = [];
    destinations = widget.pages.map(pageFor).toList();
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      direction: widget.direction,
      children: destinations,
    );
  }
}

class _PageItem extends StatefulWidget {
  final ValueChanged<PageItem> onSelected;
  final bool selected;
  final PageItem item;
  const _PageItem({
    super.key,
    required this.onSelected,
    required this.item,
    required this.selected,
  });

  @override
  State<_PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<_PageItem> with MaterialStateMixin {
  late final MaterialStatesController statesController;

  @override
  void initState() {
    super.initState();
    statesController = MaterialStatesController(
        <MaterialState>{if (widget.selected) MaterialState.selected});
    statesController.addListener(onController);
  }

  @override
  void didUpdateWidget(_PageItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      statesController.update(MaterialState.selected, widget.selected);
    }
  }

  onController() {
    setState(() {});
  }

  /// Getter for whether this class considers [MaterialState.disabled] to be active.
  @override
  bool get isDisabled =>
      statesController.value.contains(MaterialState.disabled);

  /// Getter for whether this class considers [MaterialState.dragged] to be active.
  @override
  bool get isDragged => statesController.value.contains(MaterialState.dragged);

  /// Getter for whether this class considers [MaterialState.error] to be active.
  @override
  bool get isErrored => statesController.value.contains(MaterialState.error);

  /// Getter for whether this class considers [MaterialState.focused] to be active.
  @override
  bool get isFocused => statesController.value.contains(MaterialState.focused);

  /// Getter for whether this class considers [MaterialState.hovered] to be active.
  @override
  bool get isHovered => statesController.value.contains(MaterialState.hovered);

  /// Getter for whether this class considers [MaterialState.pressed] to be active.
  @override
  bool get isPressed => statesController.value.contains(MaterialState.pressed);

  /// Getter for whether this class considers [MaterialState.scrolledUnder] to be active.
  @override
  bool get isScrolledUnder =>
      statesController.value.contains(MaterialState.scrolledUnder);

  /// Getter for whether this class considers [MaterialState.selected] to be active.
  @override
  bool get isSelected =>
      statesController.value.contains(MaterialState.selected);

  @override
  Set<MaterialState> get materialStates => statesController.value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PageBarItemStyle>()!;
    return InkWell(
      onTap: () {
        widget.onSelected(widget.item);
      },
      onHover: (value) => statesController.update(MaterialState.hovered, value),
      hoverColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: theme.border.resolve(materialStates),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: isSelected ? 4 : 0),
          child: Text(
            widget.item.text,
            textAlign: TextAlign.center,
            style: theme.textStyle.resolve(materialStates),
          ),
        ),
      ),
    );
  }
}

/// Defines data for [PageBar] pages.
/// Style can be customized using [ThemeExtension] : [PageBarItemStyle]
class PageItem {
  final String text;

  PageItem({required this.text});
}
