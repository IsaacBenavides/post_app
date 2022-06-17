import 'package:flutter/material.dart';
import 'package:post/src/utils/responsive.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);
  final ValueChanged<int> onItemSelected;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  final List<IconData> _icons = const [
    Icons.home,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Container(
      height: responsive.hp(7),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: List.generate(
          _icons.length,
          (index) => _currentIndex == index
              ? _BuildSelectedItem(
                  responsive: responsive, icons: _icons, index: index)
              : _BuildUnselectedItem(
                  responsive: responsive,
                  icons: _icons,
                  index: index,
                  onTap: () {
                    widget.onItemSelected(index);
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
        ),
      ),
    );
  }
}

class _BuildUnselectedItem extends StatelessWidget {
  const _BuildUnselectedItem(
      {Key? key,
      required this.responsive,
      required List<IconData> icons,
      required this.index,
      required this.onTap})
      : _icons = icons,
        super(key: key);

  final Responsive responsive;
  final List<IconData> _icons;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            height: responsive.hp(7),
            child: Center(
              child: Icon(
                _icons[index],
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildSelectedItem extends StatelessWidget {
  const _BuildSelectedItem({
    Key? key,
    required this.responsive,
    required List<IconData> icons,
    required this.index,
  })  : _icons = icons,
        super(key: key);

  final Responsive responsive;
  final List<IconData> _icons;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        height: responsive.hp(7),
        child: Center(
          child: Icon(
            _icons[index],
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
