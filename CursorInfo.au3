#include "Interface.au3"

;Ctrl+Alt+f
HotKeySet("^!f", "FreezeUnfreeze")
HotKeySet("!a", "GetCursorArea")

Func GetCursorAreaInfo($iArea=1, $iPixelStep=1)
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
	GetCursorAreaInfo(1, 1)
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

Func HexToRGB($sHex)
    ; Remove “#” ou “0x” se existir
    $sHex = StringRegExpReplace($sHex, '^(#|0x)', '')

    ; Deve restar exatamente 6 dígitos
    If StringLen($sHex) <> 6 Then Return SetError(1, 0, 0)

    ; Extrai pares RR, GG, BB
    Local $sR = StringLeft($sHex, 2)
    Local $sG = StringMid($sHex, 3, 2)
    Local $sB = StringRight($sHex, 2)

    ; Converte cada par hexadecimal para decimal
    Local $iR = Dec($sR)
    Local $iG = Dec($sG)
    Local $iB = Dec($sB)
	

    Return $iR&", " & $iG&", " & $iB
EndFunc

Global $g_bFrozen = False
Global $g_bShowRGB = False
Global $g_aCursorPos[2]
Global $g_sColorInfo = ""
Global $g_sWindowTitle = ""

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

Func HandleBtnCopyWindowTitle()
	ClipPut($g_sWindowTitle)
EndFunc

Func HandleBtnRadio()
	$g_bShowRGB = (GUICtrlRead($btnRGB) = $GUI_CHECKED)
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
		Case $btnCopyWindowTitle
			HandleBtnCopyWindowTitle()
		Case $btnRGB, $btnHex
			HandleBtnRadio()
	EndSwitch

	if not $g_bFrozen Then
		$g_aCursorPos = MouseGetPos()
		$g_sWindowTitle = WinGetTitle("[ACTIVE]")
		
		Local $iColorRaw = PixelGetColor($g_aCursorPos[0], $g_aCursorPos[1])
		GUICtrlSetBkColor($grphCursorColor, $iColorRaw)
		If $g_bShowRGB Then
			$g_sColorInfo = HexToRGB(Hex($iColorRaw, 6))
		Else
			$g_sColorInfo = Hex($iColorRaw, 6)
		EndIf
		
		GUICtrlSetData($inptColorInfo, $g_sColorInfo)
		GUICtrlSetData($inptXYInfo, $g_aCursorPos[0]+1 & "," & $g_aCursorPos[1]+1)
		GUICtrlSetData($inptCursorXCurrentPos, $g_aCursorPos[0]+1)
		GUICtrlSetData($inptCursorYCurrentPos, $g_aCursorPos[1]+1)
		GUICtrlSetData($InptWindowTitle, $g_sWindowTitle)
	EndIf
WEnd