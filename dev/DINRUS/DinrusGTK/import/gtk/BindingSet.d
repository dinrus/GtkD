module gtkD.gtk.BindingSet;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gtk.BindingSet;
private import gtkD.gtk.ObjectGtk;
private import gtkD.glib.ListSG;
private import gtkD.glib.ScannerG;




/**
 * Description
 * GtkBinding provides a mechanism for configuring GTK+ key bindings through
 * RC files. This eases key binding adjustments for application developers as
 * well as users and provides GTK+ users or administrators with high key
 * binding configurability which requires no application or toolkit side changes.
 * Installing a key binding
 * A resource file binding consists of a 'binding' definition and a match
 * statement to apply the binding to specific widget types. Details on the
 * matching mechanism are described under
 * Pathnames and patterns.
 * Inside the binding definition, key combinations are bound to specific signal
 * emissions on the target widget. Key combinations are strings consisting of
 * an optional GdkModifierType name and
 * key names such as those defined
 * in <gdk/gdkkeysyms.h> or returned from
 * gdk_keyval_name(), they have to be parsable by gtk_accelerator_parse().
 * Specifications of signal emissions consist of a string identifying the signal
 * name, and a list of signal specific arguments in parenthesis.
 * For example for binding Control and the left or right cursor keys of a
 * GtkEntry widget to the "move-cursor" signal, so movement occurs
 * in 3 letter steps, the following binding can be used:
 * binding "MoveCursor3" {
	 *  bind "<Control>Right" {
		 *  "move-cursor" (visual-positions, 3, 0)
	 *  }
	 *  bind "<Control>Left" {
		 *  "move-cursor" (visual-positions, -3, 0)
	 *  }
 * }
 * class "GtkEntry" binding "MoveCursor3"
 * GTK+ already defines a number of useful bindings for the widgets it provides.
 * Because custom bindings set up in RC files take precedence over the default
 * bindings shipped with GTK+, overriding existing bindings as demonstrated in
 * Installing a key binding
 * works as expected. The same mechanism can not be used to "unbind" existing
 * bindings, however.
 * binding "MoveCursor3" {
 *  bind "<Control>Right" { }
 *  bind "<Control>Left" { }
 * }
 * class "GtkEntry" binding "MoveCursor3"
 * The above example will not have the desired effect of causing
 * "<Control>Right" and "<Control>Left" key presses to be ignored
 * by GTK+. Instead, it just causes any existing bindings from the bindings
 * set "MoveCursor3" to be deleted, so when "<Control>Right" or
 * "<Control>Left" are pressed, no binding for these keys is found in
 * binding set "MoveCursor3". GTK+ will thus continue to search for matching
 * key bindings, and will eventually lookup and find the default GTK+ bindings
 * for entries which implement word movement. To keep GTK+ from activating its
 * default bindings, the "unbind" keyword can be used like this:
 * binding "MoveCursor3" {
	 *  unbind "<Control>Right"
	 *  unbind "<Control>Left"
 * }
 * class "GtkEntry" binding "MoveCursor3"
 * Now, GTK+ will find a match when looking up "<Control>Right" and
 * "<Control>Left" key presses before it resorts to its default
 * bindings, and the match instructs it to abort ("unbind") the search, so
 * the key presses are not consumed by this widget. As usual, further processing
 * of the key presses, e.g. by an entry's parent widget, is now possible.
 * The "unbind" functionality has been introduced in GTK+ 2.12.
 */
public class BindingSet
{
	
	/** the main Gtk struct */
	protected GtkBindingSet* gtkBindingSet;
	
	
	public GtkBindingSet* getBindingSetStruct();
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkBindingSet* gtkBindingSet);
	
	/**
	 */
	
	/**
	 * Override or install a new key binding for keyval with modifiers on
	 * binding_set.
	 * Params:
	 * keyval =  key value
	 * modifiers =  key modifier
	 * signalName =  signal name to be bound
	 * bindingArgs =  list of GtkBindingArg signal arguments
	 */
	public void bindingEntryAddSignall(uint keyval, GdkModifierType modifiers, string signalName, ListSG bindingArgs);
	
	/**
	 * Warning
	 * gtk_binding_entry_clear has been deprecated since version 2.12 and should not be used in newly-written code. Use gtk_binding_entry_remove() instead.
	 * Clears a binding entry.
	 * Params:
	 * keyval =  key value of binding to clear
	 * modifiers =  key modifier of binding to clear
	 */
	public void bindingEntryClear(uint keyval, GdkModifierType modifiers);
	
	/**
	 * Warning
	 * gtk_binding_parse_binding has been deprecated since version 2.12 and should not be used in newly-written code. There should be no need to call this function outside GTK+.
	 * Parse a binding entry from a gtkrc file.
	 * Params:
	 * scanner =  GtkRC scanner
	 * Returns: expected token upon errors, G_TOKEN_NONE on success.
	 */
	public static uint bindingParseBinding(ScannerG scanner);
	
	/**
	 * GTK+ maintains a global list of binding sets. Each binding set has
	 * a unique name which needs to be specified upon creation.
	 * Params:
	 * setName =  unique name of this binding set
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (string setName);
	
	/**
	 * This function returns the binding set named after the type name of
	 * the passed in class structure. New binding sets are created on
	 * demand by this function.
	 * Params:
	 * objectClass =  a valid GtkObject class
	 * Returns: the binding set corresponding to object_class
	 */
	public static BindingSet byClass(void* objectClass);
	
	/**
	 * Find a binding set by its globally unique name. The set_name can
	 * either be a name used for gtk_binding_set_new() or the type name of
	 * a class used in gtk_binding_set_by_class().
	 * Params:
	 * setName =  unique binding set name
	 * Returns: NULL or the specified binding set
	 */
	public static BindingSet find(string setName);
	
	/**
	 * Find a key binding matching keyval and modifiers and activate the
	 * binding on object.
	 * Params:
	 * object =  object to activate when binding found
	 * keyval =  key value of the binding
	 * modifiers =  key modifier of the binding
	 * Returns: TRUE if a binding was found and activated
	 */
	public static int activate(ObjectGtk object, uint keyval, GdkModifierType modifiers);
	/**
	 * Looks up key bindings for object to find one matching
	 * event, and if one was found, activate it.
	 * Params:
	 * object =  a GtkObject (generally must be a widget)
	 * event =  a GdkEventKey
	 * Returns: TRUE if a matching key binding was found
	 */
	public static int activateEvent(ObjectGtk object, GdkEventKey* event);
	
	/**
	 * Find a key binding matching keyval and modifiers within
	 * binding_set and activate the binding on object.
	 * Params:
	 * keyval =  key value of the binding
	 * modifiers =  key modifier of the binding
	 * object =  object to activate when binding found
	 * Returns: TRUE if a binding was found and activated
	 */
	public int activate(uint keyval, GdkModifierType modifiers, ObjectGtk object);
	
	/**
	 * Install a binding on binding_set which causes key lookups
	 * to be aborted, to prevent bindings from lower priority sets
	 * to be activated.
	 * Since 2.12
	 * Params:
	 * keyval =  key value of binding to skip
	 * modifiers =  key modifier of binding to skip
	 */
	public void bindingEntrySkip(uint keyval, GdkModifierType modifiers);
	
	/**
	 * Remove a binding previously installed via
	 * gtk_binding_entry_add_signal() on binding_set.
	 * Params:
	 * keyval =  key value of binding to remove
	 * modifiers =  key modifier of binding to remove
	 */
	public void bindingEntryRemove(uint keyval, GdkModifierType modifiers);
	
	/**
	 * This function is used internally by the GtkRC parsing mechanism to
	 * assign match patterns to GtkBindingSet structures.
	 * Params:
	 * pathType =  path type the pattern applies to
	 * pathPattern =  the actual match pattern
	 * priority =  binding priority
	 */
	public void addPath(GtkPathType pathType, string pathPattern, GtkPathPriorityType priority);
}