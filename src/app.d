import std.stdio;
import dlangui;

mixin APP_ENTRY_POINT;
bool TurnCross = true;

	

extern (C) int UIAppMain(string[] args)
{
	Log.setLogLevel(LogLevel.Fatal);

embeddedResourceList.addResources(embedResourcesFromList!("resources.list")());
	
	Window window = Platform.instance.createWindow("Dorpion", null,
			WindowFlag.Resizable , 150, 180);

TableLayout res = new TableLayout("editor_options");

	HorizontalLayout line1 = new  HorizontalLayout();
	ImageButton imgBtn1 = new ImageButton("imgBtn1", null);
	imgBtn1.minHeight=60;
	imgBtn1.minWidth=60;
	ImageButton imgBtn2 = new ImageButton("imgBtn2", null);
	imgBtn2.minHeight=60;
	imgBtn2.minWidth=60;
	ImageButton imgBtn3 = new ImageButton("imgBtn3", null);
	imgBtn3.minHeight=60;
	imgBtn3.minWidth=60;
	Widget[] tmp = [imgBtn1,imgBtn2,imgBtn3];
	line1.addChildren(tmp);
	res.addChild(line1);
	res.addChild(new VSpacer());

	HorizontalLayout line2 = new  HorizontalLayout();
	ImageButton imgBtn4 = new ImageButton("imgBtn4", null);
	imgBtn4.minHeight=60;
	imgBtn4.minWidth=60;
	ImageButton imgBtn5 = new ImageButton("imgBtn5", null);
	imgBtn5.minHeight=60;
	imgBtn5.minWidth=60;
	ImageButton imgBtn6 = new ImageButton("imgBtn6", null);
	imgBtn6.minHeight=60;
	imgBtn6.minWidth=60;
	tmp = [imgBtn4,imgBtn5,imgBtn6];
	line2.addChildren(tmp);
	res.addChild(line2);
	res.addChild(new VSpacer());


	HorizontalLayout line3 = new  HorizontalLayout();
	ImageButton imgBtn7 = new ImageButton("imgBtn7", null);
	imgBtn7.minHeight=60;
	imgBtn7.minWidth=60;
	ImageButton imgBtn8 = new ImageButton("imgBtn8", null);
	imgBtn8.minHeight=60;
	imgBtn8.minWidth=60;
	ImageButton imgBtn9 = new ImageButton("imgBtn9", null);
	imgBtn9.minHeight=60;
	imgBtn9.minWidth=60;
	tmp = [imgBtn7,imgBtn8,imgBtn9];
	line3.addChildren(tmp);
	res.addChild(line3);
	res.addChild(new VSpacer());


	imgBtn1.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn2.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn3.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn4.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn5.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn6.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn7.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn8.click = (Widget wid) => ButtonClickable(window, wid);
	imgBtn9.click = (Widget wid) => ButtonClickable(window, wid);

	static if (BACKEND_GUI)
		window.windowIcon = drawableCache.getImage("grid");

	window.mainWidget = res;
	window.show();
	HelpWindow().show();
	// run message loop
	return Platform.instance.enterMessageLoop();
	
	
}


private Window HelpWindow()
{
	Window window = Platform.instance.createWindow("Help", null,
			!WindowFlag.Resizable , 250, 180);

	TableLayout res = new TableLayout("editor_options");
	HorizontalLayout line = new HorizontalLayout();
	EditBox Edit1 = new EditBox("Edit",
	"Bonjour ce jeu est le jeu du morpion pour 2 joueurs,\nles joueurs peuvent " ~
	"jouer chacun leur tour en cliquant sur la case qui les interresse,\nbon jeu."d);
	Edit1.minWidth(300);
	Edit1.minHeight(150);
	Edit1.enabled(false);
	line.addChild(Edit1);
	HorizontalLayout line2 = new HorizontalLayout();
	Button btnClose = new Button("btnOk",UIString.fromRaw("OK"));
	line2.addChild(btnClose);

	res.addChild(line);
	res.addChild(line2);

	btnClose.click = delegate(Widget wid){
		window.close();
		return true;
	};

	static if (BACKEND_GUI)
		window.windowIcon = drawableCache.getImage(null);
	window.mainWidget = res;
	return window;
}





private bool ButtonClickable(Window win,Widget wid)
{
	string msg = "";
	if (TurnCross)
	{
		TurnCross = false;
		wid.backgroundImageId("cross64");
		wid.enabled(false);
		msg = "Tour du rond";

	} else {

		msg = "Tour de la croix";
		wid.backgroundImageId("circle64");
		wid.enabled(false);
		TurnCross = true;
	}

	//win.showMessageBox("Button"d,UIString.fromRaw(msg));
	return 0;
	
}


