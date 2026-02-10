pragma Singleton

import Quickshell

Singleton {
    enum Origin {
        Top,
        TopLeft,
        TopRight,
        Bottom,
        BottomLeft,
        BottomRight,
        Right,
        Left,
        Center
    }

    function anchorLeft(origin: Origin): bool {
        return origin === Positioning.Origin.Left || origin === Positioning.Origin.TopLeft || origin === Positioning.Origin.BottomLeft;
    }

    function anchorRight(origin: Origin): bool {
        return origin === Positioning.Origin.Right || origin === Positioning.Origin.TopRight || origin === Positioning.Origin.BottomRight;
    }

    function anchorTop(origin: Origin): bool {
        return origin === Positioning.Origin.Top || origin === Positioning.Origin.TopLeft || origin === Positioning.Origin.TopRight;
    }

    function anchorBottom(origin: Origin): bool {
        return origin === Positioning.Origin.Bottom || origin === Positioning.Origin.BottomLeft || origin === Positioning.Origin.BottomRight;
    }

    function anchorHCenter(origin: Origin): bool {
        return origin === Positioning.Origin.Top || origin === Positioning.Origin.Bottom || origin === Positioning.Origin.Center;
    }

    function anchorVCenter(origin: Origin): bool {
        return origin === Positioning.Origin.Left || origin === Positioning.Origin.Right || origin === Positioning.Origin.Center;
    }

    function radius(origin: Origin): int {
        return origin === Positioning.Origin.Center ? 8 : 0;
    }

    function topRightRadius(origin: Origin): int {
        return origin === Positioning.Origin.Left 
        || origin === Positioning.Origin.Center 
        || origin === Positioning.Origin.Bottom 
        || origin === Positioning.Origin.BottomLeft
        ? 8 : 0;
    }

    function topLeftRadius(origin: Origin): int {
        return origin === Positioning.Origin.Right 
        || origin === Positioning.Origin.Center 
        || origin === Positioning.Origin.Bottom 
        || origin === Positioning.Origin.BottomRight
        ? 8 : 0;
    }

    function bottomRightRadius(origin: Origin): int {
        return origin === Positioning.Origin.Left 
        || origin === Positioning.Origin.Center 
        || origin === Positioning.Origin.Top 
        || origin === Positioning.Origin.TopLeft
        ? 8 : 0;
    }

    function bottomLeftRadius(origin: Origin): int {
        return origin === Positioning.Origin.Right 
        || origin === Positioning.Origin.Center 
        || origin === Positioning.Origin.Top 
        || origin === Positioning.Origin.TopRight
        ? 8 : 0;
    }

}
