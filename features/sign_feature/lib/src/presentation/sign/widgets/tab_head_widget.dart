import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TabHeadWidget extends StatelessWidget {
  const TabHeadWidget({
    required this.selectedIndexTab,
    required this.onTabChanged,
    required this.tabs,
    super.key,
  });

  final int selectedIndexTab;
  final Function(int) onTabChanged;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabs
          .map(
            (tab) => Expanded(
              child: GestureDetector(
                onTap: () => onTabChanged(tabs.indexOf(tab)),
                child: Column(
                  children: [
                    Text(
                      tab,
                      style: TextStyle(
                        color: tabs.indexOf(tab) == selectedIndexTab
                            ? TokioMarineColors.green
                            : TokioMarineColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (tabs.indexOf(tab) == selectedIndexTab)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 2,
                        color: const Color(0xFF4FC3A1),
                      ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
    // return Row(
    //   children: [
    //     Expanded(
    //       child: GestureDetector(
    //         onTap: () => _cubit.changeTab(0),
    //         child: Column(
    //           children: [
    //             Text(
    //               'Entrar',
    //               style: TextStyle(
    //                 color: state.tabIndex == 0
    //                     ? TokioMarineColors.green
    //                     : TokioMarineColors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 16,
    //               ),
    //             ),
    //             if (state.tabIndex == 0)
    //               Container(
    //                 margin: const EdgeInsets.only(top: 4),
    //                 height: 2,
    //                 color: const Color(0xFF4FC3A1),
    //               ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       child: GestureDetector(
    //         onTap: () => _cubit.changeTab(1),
    //         child: Column(
    //           children: [
    //             Text(
    //               'Cadastrar',
    //               style: TextStyle(
    //                 color: state.tabIndex == 1
    //                     ? const Color(0xFF4FC3A1)
    //                     : Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 16,
    //               ),
    //             ),
    //             if (state.tabIndex == 1)
    //               Container(
    //                 margin: const EdgeInsets.only(top: 4),
    //                 height: 2,
    //                 color: const Color(0xFF4FC3A1),
    //               ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
