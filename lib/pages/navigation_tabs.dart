// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

// BEGIN NavigationTabsPage

class _TabInfo {
  const _TabInfo(this.icon, {this.title = ''});

  final String title;
  final IconData icon;
}

class NavigationTabsPage extends StatelessWidget {
  const NavigationTabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabInfo = [
      _TabInfo(
        CupertinoIcons.rectangle_split_3x1_fill,
        // GalleryLocalizations.of(context).cupertinoTabBarHomeTab,
      ),
      _TabInfo(
        CupertinoIcons.search,
        // GalleryLocalizations.of(context).cupertinoTabBarChatTab,
      ),
      _TabInfo(
        CupertinoIcons.plus,
        // GalleryLocalizations.of(context).cupertinoTabBarProfileTab,
      ),
      _TabInfo(
        CupertinoIcons.photo_fill,
        // GalleryLocalizations.of(context).cupertinoTabBarProfileTab,
      ),
      _TabInfo(
        CupertinoIcons.person_alt,
        // GalleryLocalizations.of(context).cupertinoTabBarProfileTab,
      ),
    ];

    return DefaultTextStyle(
      style: CupertinoTheme.of(context).textTheme.textStyle,
      child: CupertinoTabScaffold(
        restorationId: 'cupertino_tab_scaffold',
        tabBar: CupertinoTabBar(
          activeColor: const Color(0xFF4E586E),
          backgroundColor: CupertinoColors.systemBackground,
          border: Border.all(width: 0, color: CupertinoColors.systemBackground),
          items: [
            for (final tabInfo in _tabInfo)
              BottomNavigationBarItem(
                label: tabInfo.title,
                icon: Icon(tabInfo.icon),
              ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            restorationScopeId: 'cupertino_tab_view_$index',
            builder: (context) => _CupertinoDemoTab(
              title: _tabInfo[index].title,
              icon: _tabInfo[index].icon,
            ),
            defaultTitle: _tabInfo[index].title,
          );
        },
      ),
    );
  }
}

class _CupertinoDemoTab extends StatelessWidget {
  const _CupertinoDemoTab({
    Key key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: null,
      backgroundColor: CupertinoColors.systemBackground,
      child: Center(
        child: Icon(
          icon,
          semanticLabel: title,
          size: 100,
        ),
      ),
    );
  }
}

// END
