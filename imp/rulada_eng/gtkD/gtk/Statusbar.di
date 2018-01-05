module gtkD.gtk.Statusbar;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;

private import gtkD.gobject.Signals;
public  import gtkD.gtkc.gdktypes;

private import gtkD.glib.Str;



private import gtkD.gtk.HBox;

/**
 * Description
 * A GtkStatusbar is usually placed along the bottom of an application's main
 * GtkWindow. It may provide a regular commentary of the application's status
 * (as is usually the case in a web browser, for example), or may be used to
 * simply output a message when the status changes, (when an upload is complete
 * in an FTP client, for example).
 * It may also have a resize grip (a triangular area in the lower right corner)
 * which can be clicked on to resize the window containing the statusbar.
 * Status bars in GTK+ maintain a stack of messages. The message at
 * the top of the each bar's stack is the one that will currently be displayed.
 * Any messages added to a statusbar's stack must specify a context
 * id that is used to uniquely identify the source of a message.
 * This context id can be generated by gtk_statusbar_get_context_id(), given a
 * message and the statusbar that it will be added to. Note that messages are
 * stored in a stack, and when choosing which message to display, the stack
 * structure is adhered to, regardless of the context identifier of a message.
 * One could say that a statusbar maintains one stack of messages for display
 * purposes, but allows multiple message producers to maintain sub-stacks of
 * the messages they produced (via context ids).
 * Status bars are created using gtk_statusbar_new().
 * Messages are added to the bar's stack with gtk_statusbar_push().
 * The message at the top of the stack can be removed using gtk_statusbar_pop().
 * A message can be removed from anywhere in the stack if its message_id was
 * recorded at the time it was added. This is done using gtk_statusbar_remove().
 */
public class Statusbar : HBox
{
	
	/** the main Gtk struct */
	protected GtkStatusbar* gtkStatusbar;
	
	
	public GtkStatusbar* getStatusbarStruct();
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkStatusbar* gtkStatusbar);
	
	/**
	 */
	int[char[]] connectedSignals;
	
	void delegate(guint, string, Statusbar)[] onTextPoppedListeners;
	/**
	 * Is emitted whenever a new message is popped off a statusbar's stack.
	 */
	void addOnTextPopped(void delegate(guint, string, Statusbar) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackTextPopped(GtkStatusbar* statusbarStruct, guint contextId, gchar* text, Statusbar statusbar);
	
	void delegate(guint, string, Statusbar)[] onTextPushedListeners;
	/**
	 * Is emitted whenever a new message gets pushed onto a statusbar's stack.
	 */
	void addOnTextPushed(void delegate(guint, string, Statusbar) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackTextPushed(GtkStatusbar* statusbarStruct, guint contextId, gchar* text, Statusbar statusbar);
	
	
	/**
	 * Creates a new GtkStatusbar ready for messages.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this ();
	
	/**
	 * Returns a new context identifier, given a description
	 * of the actual context. Note that the description is
	 * not shown in the UI.
	 * Params:
	 * contextDescription =  textual description of what context
	 *  the new message is being used in
	 * Returns: an integer id
	 */
	public uint getContextId(string contextDescription);
	
	/**
	 * Pushes a new message onto a statusbar's stack.
	 * Params:
	 * contextId =  the message's context id, as returned by
	 *  gtk_statusbar_get_context_id()
	 * text =  the message to add to the statusbar
	 * Returns: a message id that can be used with  gtk_statusbar_remove().
	 */
	public uint push(uint contextId, string text);
	
	/**
	 * Removes the first message in the GtkStatusBar's stack
	 * with the given context id.
	 * Note that this may not change the displayed message, if
	 * the message at the top of the stack has a different
	 * context id.
	 * Params:
	 * contextId =  a context identifier
	 */
	public void pop(uint contextId);
	
	/**
	 * Forces the removal of a message from a statusbar's stack.
	 * The exact context_id and message_id must be specified.
	 * Params:
	 * contextId =  a context identifier
	 * messageId =  a message identifier, as returned by gtk_statusbar_push()
	 */
	public void remove(uint contextId, uint messageId);
	
	/**
	 * Sets whether the statusbar has a resize grip.
	 * TRUE by default.
	 * Params:
	 * setting =  TRUE to have a resize grip
	 */
	public void setHasResizeGrip(int setting);
	
	/**
	 * Returns whether the statusbar has a resize grip.
	 * Returns: TRUE if the statusbar has a resize grip.
	 */
	public int getHasResizeGrip();
}