import 'package:flutter/material.dart';
import '../../utils/neo_brutal_theme.dart';

class SettingsSectionHeader extends StatelessWidget {
  final String title;
  final Color activeAccentColor;

  const SettingsSectionHeader({
    super.key,
    required this.title,
    required this.activeAccentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8, top: 16),
      child: Text(
        title,
        style: TextStyle(
          color: activeAccentColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class SettingsPremiumCard extends StatelessWidget {
  final List<Widget> children;
  final bool isLight;

  const SettingsPremiumCard({
    super.key,
    required this.children,
    required this.isLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, right: 4),
      decoration: NeoBrutal.box(isLight: isLight),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(NeoBrutal.radius - 1.5),
        child: Column(
        children: children.asMap().entries.map((entry) {
          final int idx = entry.key;
          final Widget child = entry.value;
          if (idx == children.length - 1) return child;
          return Column(
            children: [
              child,
              Divider(
                height: 1,
                thickness: 2,
                color: NeoBrutal.ink(isLight),
              ),
            ],
          );
        }).toList(),
      ),
      ),
    );
  }
}

class SettingsPremiumListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? titleColor;
  final bool isActive;
  final bool isLight;
  final Color activeAccentColor;

  const SettingsPremiumListTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.titleColor,
    this.isActive = false,
    required this.isLight,
    required this.activeAccentColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ??
        (isActive
            ? activeAccentColor
            : (isLight ? Colors.black54 : Colors.white70));
    final effectiveTitleColor =
        titleColor ?? (isLight ? const Color(0xFF1A1A1A) : Colors.white);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isActive ? NeoBrutal.yellow : NeoBrutal.paper(isLight),
          borderRadius: BorderRadius.circular(NeoBrutal.radiusSmall),
          border: Border.all(color: NeoBrutal.ink(isLight), width: 2),
        ),
        child: Icon(icon, color: effectiveIconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: effectiveTitleColor,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: isActive
                    ? effectiveIconColor.withValues(alpha: 0.8)
                    : (isLight ? Colors.black45 : Colors.white38),
                fontSize: 12,
              ),
            )
          : null,
      trailing: trailing,
    );
  }
}

class SettingsPremiumSwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isLight;
  final Color activeAccentColor;

  const SettingsPremiumSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.isLight,
    required this.activeAccentColor,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsPremiumListTile(
      icon: icon,
      title: title,
      subtitle: subtitle,
      isActive: value,
      isLight: isLight,
      activeAccentColor: activeAccentColor,
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.white,
        activeTrackColor: activeAccentColor,
        inactiveThumbColor: Colors.white54,
        inactiveTrackColor: Colors.white10,
      ),
    );
  }
}
