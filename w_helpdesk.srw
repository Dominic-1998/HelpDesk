$PBExportHeader$w_helpdesk.srw
forward
global type w_helpdesk from window
end type
type ribbonbar_1 from ribbonbar within w_helpdesk
end type
type dw_1 from datawindow within w_helpdesk
end type
end forward

global type w_helpdesk from window
integer width = 5536
integer height = 2604
boolean titlebar = true
string title = "Help Desk"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "C:\Infotech\Projects\HelpDesk_Appeon\Images\Icons\helpdesk.ico"
boolean center = true
windowdockstate windowdockstate = windowdockstatetabbedwindow!
ribbonbar_1 ribbonbar_1
dw_1 dw_1
end type
global w_helpdesk w_helpdesk

on w_helpdesk.create
this.ribbonbar_1=create ribbonbar_1
this.dw_1=create dw_1
this.Control[]={this.ribbonbar_1,&
this.dw_1}
end on

on w_helpdesk.destroy
destroy(this.ribbonbar_1)
destroy(this.dw_1)
end on

event open;//Assigns the xml file to the ribbon bar object.
IF FileExists("RibbonBar.xml") THEN
	RibbonBar_1.ImportFromXMLFile ("RibbonBar.xml")
ELSE
	MessageBox("Ribbon Bar Error", "The RibbonBar.xml file is missing from your directory, please grab the latest file from HelpDesk_Appeon under the projects folder", StopSign!)
	Close(w_helpdesk)
END IF

//Opens the datawindow
dw_1.SetTransObject(sqlca)
dw_1.retrieve(1,2,4)
end event

event resize;/* // Scales the datawindow to the window size.
long ll_datawindow_xoffset=0,ll_datawindow_yoffset=0,ll_datawindow_temp

// Sets the default x position and puts the y to a long to workout the offset.
dw_1.x = 0
ll_datawindow_temp = dw_1.y
// Scales the datawindow height.
dw_1.height = newheight - ll_datawindow_yoffset - ll_datawindow_temp

// Sets the default y position and puts the x to a long to workout the offset.
dw_1.y = 540
ll_datawindow_temp = dw_1.x
// Scales the datawindow width.
dw_1.width = newwidth - ll_datawindow_xoffset - ll_datawindow_temp */

dw_1.x = 0
dw_1.y = 540
dw_1.width = (newwidth - dw_1.x)
dw_1.height = (newheight - dw_1.y)

ribbonbar_1.x = 0
ribbonbar_1.y = 0
ribbonbar_1.width = newwidth
end event

type ribbonbar_1 from ribbonbar within w_helpdesk
integer width = 6999
integer height = 492
long backcolor = 15132390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

type dw_1 from datawindow within w_helpdesk
integer y = 540
integer width = 4997
integer height = 1960
integer taborder = 10
string title = "none"
string dataobject = "d_helpdesk_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event clicked;IF (row > 0) THEN
	This.SelectRow(0, false)
	This.SelectRow(row, true)
ELSE
	This.SelectRow(0, false)
END IF
end event

event doubleclicked;/* int li_MessageBox
long ll_ticketno
IF (row > 0) THEN
		IF IsValid(w_support_ticket) THEN
			li_MessageBox = MessageBox("Window Already Open", "Have you saved any changes made?", Question!, YesNo!)
			IF li_MessageBox = 1 THEN
				Close(w_support_ticket)
			ELSE
				Return 0
			END IF
		END IF
	ll_ticketno = dw_1.GetItemNumber(row, "ticketno")
	OpenWithParm(w_support_ticket, ll_ticketno)
ELSE
	Return 0
END IF */
end event

