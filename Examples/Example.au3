#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include "../API/VK_API_New.au3"

Global $sSt, $sFriends, $iApp_ID = 2672631

$aAuth = _VK_SignIn($iApp_ID,"audio,status,wall")
$hMain = GUICreate("Testing API UDF VKontakte", 621, 444, 192, 124)
$Pic1 = GUICtrlCreatePic("", 8, 8, 201, 417)
$idStatus = GUICtrlCreateEdit("", 224, 32, 393, 65, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_WANTRETURN))
$ChangeStatus = GUICtrlCreateButton("Сменить статус", 488, 104, 121, 25)
$Hello = GUICtrlCreateLabel("Добро пожаловать! ", 224, 8, 107, 17)
GUICtrlCreateGroup("Последние аудиозаписи:", 224, 144, 385, 121)
GUICtrlSetData($idStatus,_VK_statusGet())
GUICtrlCreateGroup("Последние новости:", 224, 280, 385, 145)
$Last_News = GUICtrlCreateLabel("", 240, 304, 356, 105)
$aAudios = _VK_audio_Get(0, Null, Null, Null, 10)
$sAudios = ""
For $i = 0 to 4
		$sAudios &= (($aAudios[2][1])[$i])[3][1] & " - " & (($aAudios[2][1])[$i])[4][1] & @CRLF
Next
$Last_Audio = GUICtrlCreateLabel($sAudios, 240, 168, 356, 81)
GUISetState(@SW_SHOW, $hMain)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ChangeStatus
			_VK_statusSet(GUICtrlRead($idStatus))
			GUICtrlSetData($idStatus,_VK_statusGet())
	EndSwitch
WEnd