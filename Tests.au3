Func GetCursorAreaInfo($iArea, $iPixelStep=1)
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

_FuncTest("non-optional param1 = 1")
_FuncTest("non-optional param1 = 2", "#2")
_FuncTest("non-optional param1 = 3", "#3", "Text New")
_FuncTest("non-optional param1 = 4", "#4", Default, 200)
_FuncTest("non-optional param1 = 5", "#5", Default, 500)

Func _FuncTest($sParam1, $sParam2 = "#1", $sParam3 = "Text Default", $iParam4 = 100)

    If $sParam3 = Default Then $sParam3 = "Text Default"

    MsgBox(BitOR(4096, 48), "Values :", _
                            $sParam1 & @CRLF & _
                            $sParam2 & @CRLF & _
                            $sParam3 & @CRLF & _
                            $iParam4 & @CRLF)

    ; change Param4 if value is 500 :
    If $iParam4 = 500 Then
        $iParam4 = 1000
        MsgBox(BitOR(4096, 48), "Param4 changed :", "New value = " & $iParam4 & @CRLF)
    EndIf
EndFunc