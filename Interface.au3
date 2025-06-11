#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\felip\documents\git\cursorinfo\forms\form2.kxf
$Form2 = GUICreate("CursorInfo", 253, 283, 401, 209, -1, BitOR($WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
$grphCursorColor = GUICtrlCreateGraphic(68, 56, 76, 12)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$lblColorInfo = GUICtrlCreateLabel("Cursor color:", 8, 54, 63, 17)
$inptColorInfo = GUICtrlCreateInput("", 8, 74, 137, 21)
$lblFreezeInfo = GUICtrlCreateLabel("1. ctrl+alt+f to freeze/unfreeze data", 8, 220, 170, 17)
$lblCursorXCurrentPos = GUICtrlCreateLabel("X:", 8, 152, 14, 17)
$inptCursorXCurrentPos = GUICtrlCreateInput("0", 8, 172, 72, 21)
$lblCursorYCurrentPos = GUICtrlCreateLabel("Y:", 128, 152, 14, 17)
$inptCursorYCurrentPos = GUICtrlCreateInput("0", 128, 172, 64, 21)
$inptXYInfo = GUICtrlCreateInput("0,0", 8, 122, 73, 21)
$Label1 = GUICtrlCreateLabel("X,Y:", 8, 104, 24, 17)
$btnCopyCursorColor = GUICtrlCreateButton("Copy", 200, 76, 35, 25)
$btnCopyCursorXYPos = GUICtrlCreateButton("Copy", 86, 120, 35, 25)
$btnCopyCursorXPos = GUICtrlCreateButton("Copy", 86, 171, 35, 24)
$btnCopyCursorYPos = GUICtrlCreateButton("Copy", 198, 171, 35, 24)
$stsbContent = _GUICtrlStatusBar_Create($Form2)
_GUICtrlStatusBar_SetSimple($stsbContent)
_GUICtrlStatusBar_SetText($stsbContent, "")
$Label2 = GUICtrlCreateLabel("HotKeys:", 8, 200, 55, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$lblObjectInfo = GUICtrlCreateLabel("2. alt+a to get object information", 8, 240, 155, 17)
$Label3 = GUICtrlCreateLabel("Window title:", 8, 8, 65, 17)
$InptWindowTitle = GUICtrlCreateInput("", 8, 24, 185, 21)
$btnCopyWindowTitle = GUICtrlCreateButton("Copy", 200, 24, 35, 25)
$btnRGB = GUICtrlCreateRadio("RGB", 152, 72, 49, 17)
$btnHex = GUICtrlCreateRadio("Hex", 152, 88, 41, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
