module gtkD.gtk.Testing;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gtk.Widget;
private import gtkD.gtk.SpinButton;




/**
 * Description
 */
public class Testing
{
	
	/**
	 * This function is used to initialize a GTK+ test program.
	 * It will in turn call g_test_init() and gtk_init() to
	 * properly initialize the testing framework and graphical toolkit.
	 * It'll also set the program's locale to "C" and prevent loading of
	 * rc files and Gtk+ modules. This is done to make tets program environments as deterministic as possible.
	 * Like gtk_init() and g_test_init(), any known arguments will be processed and stripped from argc and argv.
	 * Params:
	 *  argvp = Address of the argv parameter of main(). Any parameters understood by g_test_init() or gtk_init() are stripped before return.
	 */
	public static void testInit(inout string[] argv);
	
	/**
	 */
	
	/**
	 * Create a simple window with window title window_title and
	 * text contents dialog_text.
	 * The window will quit any running gtk_main()-loop when destroyed, and it
	 * will automatically be destroyed upon test function teardown.
	 * Since 2.14
	 * Params:
	 * windowTitle =  Title of the window to be displayed.
	 * dialogText =  Text inside the window to be displayed.
	 * Returns: a widget pointer to the newly created GtkWindow.
	 */
	public static Widget createSimpleWindow(string windowTitle, string dialogText);
	
	/**
	 * This function will search widget and all its descendants for a GtkLabel
	 * widget with a text string matching label_pattern.
	 * The label_pattern may contain asterisks '*' and question marks '?' as
	 * placeholders, g_pattern_match() is used for the matching.
	 * Note that locales other than "C" tend to alter (translate" label strings,
	 * so this function is genrally only useful in test programs with
	 * predetermined locales, see gtk_test_init() for more details.
	 * Since 2.14
	 * Params:
	 * widget =  Valid label or container widget.
	 * labelPattern =  Shell-glob pattern to match a label string.
	 * Returns: a GtkLabel widget if any is found.
	 */
	public static Widget findLabel(Widget widget, string labelPattern);
	
	/**
	 * This function will search siblings of base_widget and siblings of its
	 * ancestors for all widgets matching widget_type.
	 * Of the matching widgets, the one that is geometrically closest to
	 * base_widget will be returned.
	 * The general purpose of this function is to find the most likely "action"
	 * widget, relative to another labeling widget. Such as finding a
	 * button or text entry widget, given it's corresponding label widget.
	 * Since 2.14
	 * Params:
	 * baseWidget =  Valid widget, part of a widget hierarchy
	 * widgetType =  Type of a aearched for sibling widget
	 * Returns: a widget of type widget_type if any is found.
	 */
	public static Widget findSibling(Widget baseWidget, GType widgetType);
	
	/**
	 * This function will search the descendants of widget for a widget
	 * of type widget_type that has a label matching label_pattern next
	 * to it. This is most useful for automated GUI testing, e.g. to find
	 * the "OK" button in a dialog and synthesize clicks on it.
	 * However see gtk_test_find_label(), gtk_test_find_sibling() and
	 * gtk_test_widget_click() for possible caveats involving the search of
	 * such widgets and synthesizing widget events.
	 * Since 2.14
	 * Params:
	 * widget =  Container widget, usually a GtkWindow.
	 * labelPattern =  Shell-glob pattern to match a label string.
	 * widgetType =  Type of a aearched for label sibling widget.
	 * Returns: a valid widget if any is found or NULL.
	 */
	public static Widget findWidget(Widget widget, string labelPattern, GType widgetType);
	
	/**
	 * Return the type ids that have been registered after
	 * calling gtk_test_register_all_types().
	 * Since 2.14
	 * Params:
	 * nTypes =  location to store number of types
	 * Returns: 0-terminated array of type ids
	 */
	public static GType* listAllTypes(uint* nTypes);
	
	/**
	 * Force registration of all core Gtk+ and Gdk object types.
	 * This allowes to refer to any of those object types via
	 * g_type_from_name() after calling this function.
	 * Since 2.14
	 */
	public static void registerAllTypes();
	
	/**
	 * Retrive the literal adjustment value for GtkRange based
	 * widgets and spin buttons. Note that the value returned by
	 * this function is anything between the lower and upper bounds
	 * of the adjustment belonging to widget, and is not a percentage
	 * as passed in to gtk_test_slider_set_perc().
	 * Since 2.14
	 * Params:
	 * widget =  valid widget pointer.
	 * Returns: adjustment->value for an adjustment belonging to widget.
	 */
	public static double sliderGetValue(Widget widget);
	
	/**
	 * This function will adjust the slider position of all GtkRange
	 * based widgets, such as scrollbars or scales, it'll also adjust
	 * spin buttons. The adjustment value of these widgets is set to
	 * a value between the lower and upper limits, according to the
	 * percentage argument.
	 * Since 2.14
	 * Params:
	 * widget =  valid widget pointer.
	 * percentage =  value between 0 and 100.
	 */
	public static void sliderSetPerc(Widget widget, double percentage);
	
	/**
	 * This function will generate a button click in the upwards or downwards
	 * spin button arrow areas, usually leading to an increase or decrease of
	 * spin button's value.
	 * Since 2.14
	 * Params:
	 * spinner =  valid GtkSpinButton widget.
	 * button =  Number of the pointer button for the event, usually 1, 2 or 3.
	 * upwards =  TRUE for upwards arrow click, FALSE for downwards arrow click.
	 * Returns: wether all actions neccessary for the button click simulation were carried out successfully.
	 */
	public static int spinButtonClick(SpinButton spinner, uint button, int upwards);
	
	/**
	 * Retrive the text string of widget if it is a GtkLabel,
	 * GtkEditable (entry and text widgets) or GtkTextView.
	 * Since 2.14
	 * Params:
	 * widget =  valid widget pointer.
	 * Returns: new 0-terminated C string, needs to be released with g_free().
	 */
	public static string textGet(Widget widget);
	
	/**
	 * Set the text string of widget to string if it is a GtkLabel,
	 * GtkEditable (entry and text widgets) or GtkTextView.
	 * Since 2.14
	 * Params:
	 * widget =  valid widget pointer.
	 * string =  a 0-terminated C string
	 */
	public static void textSet(Widget widget, string string);
	
	/**
	 * This function will generate a button click (button press and button
	 * release event) in the middle of the first GdkWindow found that belongs
	 * to widget.
	 * For GTK_NO_WINDOW widgets like GtkButton, this will often be an
	 * input-only event window. For other widgets, this is usually widget->window.
	 * Certain caveats should be considered when using this function, in
	 * particular because the mouse pointer is warped to the button click
	 * location, see gdk_test_simulate_button() for details.
	 * Since 2.14
	 * Params:
	 * widget =  Widget to generate a button click on.
	 * button =  Number of the pointer button for the event, usually 1, 2 or 3.
	 * modifiers =  Keyboard modifiers the event is setup with.
	 * Returns: wether all actions neccessary for the button click simulation were carried out successfully.
	 */
	public static int widgetClick(Widget widget, uint button, GdkModifierType modifiers);
	
	/**
	 * This function will generate keyboard press and release events in
	 * the middle of the first GdkWindow found that belongs to widget.
	 * For GTK_NO_WINDOW widgets like GtkButton, this will often be an
	 * input-only event window. For other widgets, this is usually widget->window.
	 * Certain caveats should be considered when using this function, in
	 * particular because the mouse pointer is warped to the key press
	 * location, see gdk_test_simulate_key() for details.
	 * Since 2.14
	 * Params:
	 * widget =  Widget to generate a key press and release on.
	 * keyval =  A Gdk keyboard value.
	 * modifiers =  Keyboard modifiers the event is setup with.
	 * Returns: wether all actions neccessary for the key event simulation were carried out successfully.
	 */
	public static int widgetSendKey(Widget widget, uint keyval, GdkModifierType modifiers);
}
