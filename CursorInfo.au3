#include "Interface.au3"

;Ctrl+Alt+f
HotKeySet("^!f", "FreezeUnfreeze")
HotKeySet("!a", "GetCursorArea")

Func GetCursorAreaInfo($iArea=9, $iPixelStep=1)
	Local $sAreaInfo = ""	
	Local $arCursorPos = MouseGetPos()
	
	Local $iX = $arCursorPos[0]
	Local $iY = $arCursorPos[1]
	
	For $i = 0 To $iArea-1 Step $iPixelStep		
		$sAreaInfo = $sAreaInfo & $iX+$i & ", " & $iY+$i & ", 0x" & Hex(PixelGetColor($iX+$i, $iY+$i), 6) & ", "
		$sAreaInfo = $sAreaInfo & $iX+$i & ", " & $iY-$i & ", 0x" & Hex(PixelGetColor($iX+$i, $iY-$i), 6) & ", "
		$sAreaInfo = $sAreaInfo & $iX-$i & ", " & $iY+$i & ", 0x" & Hex(PixelGetColor($iX-$i, $iY+$i), 6) & ", "
		$sAreaInfo = $sAreaInfo & $iX-$i & ", " & $iY-$i & ", 0x" & Hex(PixelGetColor($iX-$i, $iY-$i), 6) & ", "	
	Next	
	$sAreaInfo = StringTrimRight($sAreaInfo, 2)
	
	ClipPut($sAreaInfo)
	Return $sAreaInfo
EndFunc

Func GetCursorArea()
	GetCursorAreaInfo(9, 1)
EndFunc

Func FreezeUnfreeze()
	if $g_bFrozen Then
		_GUICtrlStatusBar_SetText($stsbContent, "")
		$g_bFrozen = False
	Else
		_GUICtrlStatusBar_SetText($stsbContent, "FROZEN")
		$g_bFrozen = True
	EndIf
EndFunc

Global $g_bFrozen = False
Global $g_aCursorPos[2]
Global $g_sColorInfo = ""

Func HandleBtnCopyCursorXPos()
	ClipPut($g_aCursorPos[0]+1)
EndFunc

Func HandleBtnCopyCursorYPos()
	ClipPut($g_aCursorPos[1]+1)
EndFunc

Func HandleBtnCopyCursorXYPos()
	ClipPut($g_aCursorPos[0]+1 & "," & $g_aCursorPos[1]+1)
EndFunc

Func HandleBtnCopyCursorColor()
	ClipPut($g_sColorInfo)
EndFunc

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnCopyCursorXPos
			HandleBtnCopyCursorXPos()	
		Case $btnCopyCursorYPos
			HandleBtnCopyCursorYPos()	
		Case $btnCopyCursorXYPos
			HandleBtnCopyCursorXYPos()
		Case $btnCopyCursorColor
			HandleBtnCopyCursorColor()
	EndSwitch
	
	if not $g_bFrozen Then
		$g_aCursorPos = MouseGetPos()
		$g_sColorInfo = PixelGetColor($g_aCursorPos[0], $g_aCursorPos[1])
		
		GUICtrlSetData($inptColorInfo, $g_sColorInfo)
		GUICtrlSetBkColor($grphCursorColor, $g_sColorInfo)
		GUICtrlSetData($inptXYInfo, $g_aCursorPos[0]+1 & "," & $g_aCursorPos[1]+1)
		GUICtrlSetData($inptCursorXCurrentPos, $g_aCursorPos[0]+1)
		GUICtrlSetData($inptCursorYCurrentPos, $g_aCursorPos[1]+1)
	EndIf
WEnd