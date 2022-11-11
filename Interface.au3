#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Zelp\Documents\git\ZelpTools\scripts\CursorInfo\CursorInfo\Forms\Form2.kxf
$Form2 = GUICreate("CursorInfo", 258, 154, 1014, 388)
$grphCursorColor = GUICtrlCreateGraphic(68, 18, 12, 12)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$lblColorInfo = GUICtrlCreateLabel("Cursor color:", 8, 14, 63, 17)
$inptColorInfo = GUICtrlCreateInput("", 8, 34, 73, 21)
$lblFreezeInfo = GUICtrlCreateLabel("Obs.: ctrl+alt+f to freeze/unfreeze data", 64, 116, 186, 17)
$lblCursorXCurrentPos = GUICtrlCreateLabel("X:", 8, 64, 14, 17)
$inptCursorXCurrentPos = GUICtrlCreateInput("0", 8, 84, 56, 21)
$lblCursorYCurrentPos = GUICtrlCreateLabel("Y:", 112, 64, 14, 17)
$inptCursorYCurrentPos = GUICtrlCreateInput("0", 112, 84, 56, 21)
$inptXYInfo = GUICtrlCreateInput("0,0", 128, 34, 65, 21)
$Label1 = GUICtrlCreateLabel("X,Y:", 128, 16, 24, 17)
$picFrozen = GUICtrlCreatePic("", 214, 64, 40, 40)
$btnCopyCursorColor = GUICtrlCreateButton("Copy", 88, 32, 35, 25)
$btnCopyCursorXYPos = GUICtrlCreateButton("Copy", 198, 32, 35, 25)
$btnCopyCursorXPos = GUICtrlCreateButton("Copy", 70, 83, 35, 24)
$btnCopyCursorYPos = GUICtrlCreateButton("Copy", 174, 83, 35, 24)
$stsbContent = _GUICtrlStatusBar_Create($Form2)
_GUICtrlStatusBar_SetSimple($stsbContent)
_GUICtrlStatusBar_SetText($stsbContent, "")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
