/*
 * Copyright (c) 2020 Pawan Kumar. All rights reserved.
 *
 *  * Licensed under the Apache License, Version 2.0 (the "License");
 *  * you may not use this file except in compliance with the License.
 *  * You may obtain a copy of the License at
 *  * http://www.apache.org/licenses/LICENSE-2.0
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 */

import 'package:flutter/material.dart';

import 'builder.dart';

class _VxGestureBuilder extends VxWidgetBuilder<Widget> {
  _VxGestureBuilder(this._child, this._onClick) : assert(_onClick != null);
  _VxGestureBuilder.doubleClick(this._child, this._onDoubleClick)
      : assert(_child != null),
        assert(_onDoubleClick != null);
  _VxGestureBuilder.longClick(this._child, this._onLongClick)
      : assert(_child != null),
        assert(_onLongClick != null);

  final Widget _child;
  Function _onClick;
  Function _onDoubleClick;
  Function _onLongClick;

  _VxGestureBuilder doubleClick({@required Function onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  _VxGestureBuilder longClick({@required Function onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key key}) {
    return GestureDetector(
      key: key,
      onTap: _onClick,
      child: _child,
      onDoubleTap: _onDoubleClick,
      onLongPress: _onLongClick,
    );
  }
}

class _VelocityXInkWellBuilder extends VxWidgetBuilder<Widget> {
  _VelocityXInkWellBuilder(this._child, this._onClick);
  _VelocityXInkWellBuilder.mdDoubleClick(this._child, this._onDoubleClick);
  _VelocityXInkWellBuilder.mdLongClick(this._child, this._onLongClick);

  final Widget _child;
  Function _onClick;
  Function _onDoubleClick;
  Function _onLongClick;
  Color _splashColor;

  _VelocityXInkWellBuilder splashColor(Color color) =>
      this.._splashColor = color;

  _VelocityXInkWellBuilder mdDoubleClick({@required Function onDoubleClick}) =>
      this.._onDoubleClick = onDoubleClick;

  _VelocityXInkWellBuilder mdLongClick({@required Function onLongClick}) =>
      this.._onLongClick = onLongClick;

  @override
  Widget make({Key key}) {
    return InkWell(
      key: key,
      onTap: _onClick,
      child: _child,
      splashColor: _splashColor,
      onDoubleTap: _onDoubleClick,
      onLongPress: _onLongClick,
    );
  }
}

extension GestureExtensions on Widget {
  _VxGestureBuilder click(Function onClick) => _VxGestureBuilder(this, onClick);
  _VxGestureBuilder doubleClick(Function onClick) =>
      _VxGestureBuilder.doubleClick(this, onClick);
  _VxGestureBuilder longClick(Function onClick) =>
      _VxGestureBuilder.longClick(this, onClick);

  _VelocityXInkWellBuilder mdClick(Function onClick) =>
      _VelocityXInkWellBuilder(this, onClick);
  _VelocityXInkWellBuilder mdDoubleClick(Function onClick) =>
      _VelocityXInkWellBuilder.mdDoubleClick(this, onClick);
  _VelocityXInkWellBuilder mdLongClick(Function onClick) =>
      _VelocityXInkWellBuilder.mdLongClick(this, onClick);
}
