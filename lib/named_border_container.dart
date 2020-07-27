import 'package:flutter/material.dart';

enum TitlePosition { onTop, onBottom }

class NamedBorderContainer extends StatelessWidget {
  final EdgeInsets margin;
  final String title;
  final String subtitle;
  final Color subtitleDividerColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double titleAlignAxis;
  final double borderRadius;
  final TextStyle titleStyle;
  final TitlePosition titlePosition;
  final Widget child;
  final bool _hasSubtitle;
  const NamedBorderContainer({
    Key key,
    this.margin = const EdgeInsets.all(8.0),
    this.title = 'Title',
    this.subtitle,
    this.borderColor = Colors.black,
    this.subtitleDividerColor,
    this.borderWidth = 1.0,
    this.titleAlignAxis = 0.5,
    this.borderRadius = 0.0,
    this.backgroundColor = Colors.white,
    this.titleStyle = const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
    this.titlePosition = TitlePosition.onTop,
    this.child,
  })  : _hasSubtitle = subtitle != null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: LayoutBuilder(builder: (context, constraints) {
        print('width ${constraints.maxWidth}');
        return Stack(
          overflow: Overflow.visible,
          alignment: titlePosition == TitlePosition.onTop
              ? AlignmentDirectional.lerp(AlignmentDirectional.topStart,
                  AlignmentDirectional.topEnd, titleAlignAxis)
              : AlignmentDirectional.lerp(AlignmentDirectional.bottomStart,
                  AlignmentDirectional.bottomEnd, titleAlignAxis),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: borderColor, width: borderWidth),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    //color: Colors.red[100],
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top:
                              0.0), //TODO - calcular o padding de acordo com o fontsize do titleStyle
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _hasSubtitle ? Text(subtitle) : Container(),
                          _hasSubtitle
                              ? Divider(
                                  color: subtitleDividerColor ??
                                      borderColor.withAlpha(50),
                                  thickness: 2,
                                  height: 6,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  child,
                ],
              ),
            ),
            Positioned(
              //left: constraints.maxWidth / 30 ,
              //right: null,
              top: titlePosition == TitlePosition.onTop
                  ? titleStyle.fontSize != null
                      ? -8 * titleStyle.fontSize / 14
                      : -8
                  : null, //TODO - criar um calculo para ajustar de acordo com o fontsize do title
              bottom: titlePosition == TitlePosition.onBottom ? -8 : null,
              child: Container(
                color: backgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(title, style: titleStyle),
              ),
            ),
            /*  Container(
                color: backgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text('Teste', style: titleStyle),
              ), */
          ],
        );
      }),
    );
  }
}
