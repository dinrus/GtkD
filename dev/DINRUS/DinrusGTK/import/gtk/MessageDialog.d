module gtkD.gtk.MessageDialog;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gtk.Window;
private import gtkD.gtk.Widget;



private import gtkD.gtk.Dialog;

/**
 * Description
 * GtkMessageDialog presents a dialog with an image representing the type of
 * message (Error, Question, etc.) alongside some message text. It's simply a
 * convenience widget; you could construct the equivalent of GtkMessageDialog
 * from GtkDialog without too much effort, but GtkMessageDialog saves typing.
 * The easiest way to do a modal message dialog is to use gtk_dialog_run(), though
 * you can also pass in the GTK_DIALOG_MODAL flag, gtk_dialog_run() automatically
 * makes the dialog modal and waits for the user to respond to it. gtk_dialog_run()
 * returns when any dialog button is clicked.
 * Example 8. A modal dialog.
 *  dialog = gtk_message_dialog_new (main_application_window,
 *  GTK_DIALOG_DESTROY_WITH_PARENT,
 *  GTK_MESSAGE_ERROR,
 *  GTK_BUTTONS_CLOSE,
 *  "Error loading file '%s': %s",
 *  filename, g_strerror (errno));
 *  gtk_dialog_run (GTK_DIALOG (dialog));
 *  gtk_widget_destroy (dialog);
 * You might do a non-modal GtkMessageDialog as follows:
 * Example 9. A non-modal dialog.
 *  dialog = gtk_message_dialog_new (main_application_window,
 *  GTK_DIALOG_DESTROY_WITH_PARENT,
 *  GTK_MESSAGE_ERROR,
 *  GTK_BUTTONS_CLOSE,
 *  "Error loading file '%s': %s",
 *  filename, g_strerror (errno));
 *  /+* Destroy the dialog when the user responds to it (e.g. clicks a button) +/
 *  g_signal_connect_swapped (dialog, "response",
 *  G_CALLBACK (gtk_widget_destroy),
 *  dialog);
 */
public class MessageDialog : Dialog
{
	
	/** the main Gtk struct */
	protected GtkMessageDialog* gtkMessageDialog;
	
	
	public GtkMessageDialog* getMessageDialogStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkMessageDialog* gtkMessageDialog);
	
	/**
	 * Creates a new message dialog, which is a simple dialog with an icon
	 * indicating the dialog type (error, warning, etc.) and some text the
	 * user may want to see. When the user clicks a button a "response"
	 * signal is emitted with response IDs from GtkResponseType. See
	 * GtkDialog for more details.
	 * Params:
	 *    	parent = transient parent, or NULL for none
	 *    	flags = flags
	 *    	type = type of message
	 *    	buttons= set of buttons to use
	 *    	messageFormat = printf()-style format string, or NULL
	 *    	message = the message - should be null, any formatting should be done prior to call this constructor
	 *  arguments for message_format
	 * Returns:
	 *  a new GtkMessageDialog
	 */
	public this (Window parent, GtkDialogFlags flags, GtkMessageType type, GtkButtonsType buttons, string messageFormat, string message=null );
	
	/**
	 * Creates a new message dialog, which is a simple dialog with an icon
	 * indicating the dialog type (error, warning, etc.) and some text which
	 * is marked up with the Pango text markup language.
	 * When the user clicks a button a "response" signal is emitted with
	 * response IDs from GtkResponseType. See GtkDialog for more details.
	 *
	 * If Markup is true special XML characters in the printf() arguments passed to this
	 * function will automatically be escaped as necessary.
	 * (See g_markup_printf_escaped() for how this is implemented.)
	 * Usually this is what you want, but if you have an existing
	 * Pango markup string that you want to use literally as the
	 * label, then you need to use gtk_message_dialog_set_markup()
	 * instead, since you can't pass the markup string either
	 * as the format (it might contain '%' characters) or as a string
	 * argument.
	 * Since 2.4
	 * Examples:
	 * --------------------
	 *  GtkWidget *dialog;
	 *  dialog = gtk_message_dialog_new (main_application_window,
	 *  GTK_DIALOG_DESTROY_WITH_PARENT,
	 *  GTK_MESSAGE_ERROR,
	 *  GTK_BUTTONS_CLOSE,
	 *  NULL);
	 *  gtk_message_dialog_set_markup (GTK_MESSAGE_DIALOG (dialog),
	 *  markup);
	 * --------------------
	 * Params:
	 *  parent = transient parent, or NULL for none
	 *  flags = flags
	 *  type = type of message
	 *  buttons = set of buttons to use
	 *  messageFormat = printf()-style format string, or NULL
	 *  message = the message - should be null, any formatting should be done prior to call this constructor
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (Window parent, GtkDialogFlags flags, GtkMessageType type, GtkButtonsType buttons, bool markup, string messageFormat, string message=null );
	
	
	/**
	 */
	
	/**
	 * Sets the text of the message dialog to be str, which is marked
	 * up with the Pango text markup
	 * language.
	 * Since 2.4
	 * Params:
	 * str =  markup string (see Pango markup format)
	 */
	public void setMarkup(string str);
	
	/**
	 * Sets the dialog's image to image.
	 * Since 2.10
	 * Params:
	 * image =  the image
	 */
	public void setImage(Widget image);
	
	/**
	 * Gets the dialog's image.
	 * Since 2.14
	 * Returns: the dialog's image
	 */
	public Widget getImage();
}
