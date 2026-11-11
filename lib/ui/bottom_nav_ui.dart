// ignore_for_file: invalid_use_of_protected_member
part of '../main.dart';

extension _BottomNavUI on _MainScreenState {
  Widget _buildBottomNavBar() {
    final isLight = isAppLight;
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final ink = NeoBrutal.ink(isLight);
    final inactiveColor = ink.withValues(alpha: 0.55);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 64 + bottomInset,
        padding: EdgeInsets.only(bottom: bottomInset),
        decoration: BoxDecoration(
          color: NeoBrutal.card(isLight),
          border: Border(
            top: BorderSide(color: ink, width: NeoBrutal.borderWidth),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              icon: _currentNavIndex == 0 ? Icons.home : Icons.home_outlined,
              label: AppLocalizations.of(context).home,
              isSelected: _currentNavIndex == 0,
              activeColor: ink,
              inactiveColor: inactiveColor,
              isLight: isLight,
            ),
            _buildNavItem(
              index: 1,
              icon: Icons.search_rounded,
              label: AppLocalizations.of(context).search,
              isSelected: _currentNavIndex == 1,
              activeColor: ink,
              inactiveColor: inactiveColor,
              isLight: isLight,
            ),
            _buildNavItem(
              index: 2,
              icon: _currentNavIndex == 2
                  ? Icons.library_music_rounded
                  : Icons.library_music_outlined,
              label: AppLocalizations.of(context).library,
              isSelected: _currentNavIndex == 2,
              activeColor: ink,
              inactiveColor: inactiveColor,
              isLight: isLight,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
    required Color activeColor,
    required Color inactiveColor,
    required bool isLight,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _switchToNavTab(index);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? NeoBrutal.yellow : Colors.transparent,
              borderRadius: BorderRadius.circular(NeoBrutal.radiusSmall),
              border: Border.all(
                color: isSelected ? activeColor : Colors.transparent,
                width: 2.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: NeoBrutal.shadow(isLight),
                        offset: const Offset(2, 2),
                        blurRadius: 0,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: isSelected ? const Color(0xFF000000) : inactiveColor,
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w900,
                    color: isSelected ? const Color(0xFF000000) : inactiveColor,
                    fontFamily: getFontFamily(activeFontNotifier.value),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
