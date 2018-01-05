module gtkD.gtk.Tooltips;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gtk.Widget;
private import gtkD.gtk.Window;



private import gtkD.gtk.ObjectGtk;

/**
 * Description
 * GtkTooltips has been deprecated in GTK+ 2.12, in favor of the new
 * GtkTooltip API.
 * Tooltips are the messages that appear next to a widget when the mouse pointer is held over it for a short amount of time. They are especially helpful for adding more verbose descriptions of things such as buttons in a toolbar.
 * An individual tooltip belongs to a group of tooltips. A group is created with a call to gtk_tooltips_new(). Every tooltip in the group can then be turned off with a call to gtk_tooltips_disable() and enabled with gtk_tooltips_enable().
 * The length of time the user must keep the mouse over a widget before the tip is shown, can be altered with gtk_tooltips_set_delay(). This is set on a 'per group of tooltips' basis.
 * To assign a tip to a particular GtkWidget, gtk_tooltips_set_tip() is used.
 * Note
 * Tooltips can only be set on widgets which have their own X window and
 * receive enter and leave events.
 * To check if a widget has its own window use GTK_WIDGET_NO_WINDOW().
 * To add a tooltip to a widget that doesn't have its own window, place the
 * widget inside a GtkEventBox and add a tooltip to that instead.
 * The default appearance of all tooltips in a program is determined by the current GTK+ theme that the user has selected.
 * Information about the tooltip (if any) associated with an arbitrary widget can be retrieved using gtk_tooltips_data_get().
 * Example 62. Adding tooltips to buttons.
 *  GtkWidget *load_button, *save_button, *hbox;
 *  GtkTooltips *button_bar_tips;
 *  button_bar_tips = gtk_tooltips_new ();
 *  /+* Create the buttons and pack them into a GtkHBox +/
 *  hbox = gtk_hbox_new (TRUE, 2);
 *  load_button = gtk_button_new_with_label ("Load a file");
 *  gtk_box_pack_start (GTK_BOX (hbox), load_button, TRUE, TRUE, 2);
 *  gtk_widget_show (load_button);
 *  save_button = gtk_button_new_with_label ("Save a file");
 *  gtk_box_pack_start (GTK_BOX (hbox), save_button, TRUE, TRUE, 2);
 *  gtk_widget_show (save_button);
 *  gtk_widget_show (hbox);
 *  /+* Add the tips +/
 *  gtk_tooltips_set_tip (GTK_TOOLTIPS (button_bar_tips), load_button,
 * 				 "Load a new document into this window",
 * 				 "Requests the filename of a document.
 * 				 This will then be loaded into the current
 * 				 window, replacing the contents of whatever
 * 				 is already loaded.");
 *  gtk_tooltips_set_tip (GTK_TOOLTIPS (button_bar_tips), save_button,
 * 				 "Saves the current document to a file",
 * 				 "If you have saved the document previously,
 * 				 then the new version will be saved over the
 * 				 old one. Otherwise, you will be prompted for
 * 				 a filename.");
 */
public class Tooltips : ObjectGtk
{
	
	/** the main Gtk struct */
	protected GtkTooltips* gtkTooltips;
	
	
	public GtkTooltips* getTooltipsStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkTooltips* gtkTooltips);
	
	/**
	 */
	
	/**
	 * Warning
	 * gtk_tooltips_new has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Creates an empty group of tooltips. This function initialises a GtkTooltips structure. Without at least one such structure, you can not add tips to your application.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this ();
	
	/**
	 * Warning
	 * gtk_tooltips_enable has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Allows the user to see your tooltips as they navigate your application.
	 */
	public void enable();
	
	/**
	 * Warning
	 * gtk_tooltips_disable has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Causes all tooltips in tooltips to become inactive. Any widgets that have tips associated with that group will no longer display their tips until they are enabled again with gtk_tooltips_enable().
	 */
	public void disable();
	
	/**
	 * Warning
	 * gtk_tooltips_set_delay has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Sets the time between the user moving the mouse over a widget and the widget's tooltip appearing.
	 * Params:
	 * delay = an integer value representing milliseconds.
	 */
	public void setDelay(uint delay);
	
	/**
	 * Warning
	 * gtk_tooltips_set_tip has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Adds a tooltip containing the message tip_text to the specified GtkWidget.
	 * Params:
	 * widget = the GtkWidget you wish to associate the tip with.
	 * tipText = a string containing the tip itself.
	 * tipPrivate = a string of any further information that may be useful if the user gets stuck.
	 */
	public void setTip(Widget widget, string tipText, string tipPrivate);
	
	/**
	 * Warning
	 * gtk_tooltips_data_get has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Retrieves any GtkTooltipsData previously associated with the given widget.
	 * Params:
	 * widget = a GtkWidget.
	 * Returns:a GtkTooltipsData struct, or NULL if the widget has no tooltip.
	 */
	public static GtkTooltipsData* dataGet(Widget widget);
	
	/**
	 * Warning
	 * gtk_tooltips_force_window has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Ensures that the window used for displaying the given tooltips is created.
	 * Applications should never have to call this function, since GTK+ takes
	 * care of this.
	 */
	public void forceWindow();
	
	/**
	 * Warning
	 * gtk_tooltips_get_info_from_tip_window has been deprecated since version 2.12 and should not be used in newly-written code.
	 * Determines the tooltips and the widget they belong to from the window in
	 * which they are displayed.
	 * This function is mostly intended for use by accessibility technologies;
	 * applications should have little use for it.
	 * Since 2.4
	 * Params:
	 * tipWindow =  a GtkWindow
	 * tooltips =  the return location for the tooltips which are displayed
	 *  in tip_window, or NULL
	 * currentWidget =  the return location for the widget whose tooltips
	 *  are displayed, or NULL
	 * Returns: TRUE if tip_window is displaying tooltips, otherwise FALSE.
	 */
	public static int getInfoFromTipWindow(Window tipWindow, out GtkTooltips* tooltips, out Widget currentWidget);
}
