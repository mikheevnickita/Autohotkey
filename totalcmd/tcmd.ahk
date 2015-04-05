Run "c:\Program Files (x86)\totalcmd\TOTALCMD64.EXE" 
   

    SetTitleMatchMode, 3
    SetTitleMatchMode, Slow

Loop 30 {

    WinWait, Total Commander
    WinActivate

    WinGet, text, ControlListHwnd


    Loop, parse, text, `n
    {  
        ControlGetText, substr, ,ahk_id %A_LoopField%

        if substr = 1
        {
			Send, 1
			exit
        }
        if substr = 2
        {
			Send, 2
			exit
        }
        if substr = 3
        {
			Send, 3
			exit
        }

        nmb++

    }     
    Sleep, 100

}
