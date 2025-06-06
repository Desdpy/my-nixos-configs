#!/usr/bin/env bash

SHORTCUT="$1"

# qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.shortcutNames

qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Switch Window ${SHORTCUT}"
qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "MoveMouseToFocus"