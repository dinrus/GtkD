module gtkD.gdk.Gdk;

public  import gtkD.gtkc.gdktypes;

private import gtkD.gtkc.gdk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gdk.Window;
private import gtkD.gdk.Cursor;




/**
 * Description
 * This section describes the GDK initialization functions and miscellaneous
 * utility functions.
 */
public class Gdk
{
	
	/**
	 */
	
	/**
	 * Initializes the GDK library and connects to the X server.
	 * If initialization fails, a warning message is output and the application
	 * terminates with a call to exit(1).
	 * Any arguments used by GDK are removed from the array and argc and argv are
	 * updated accordingly.
	 * GTK+ initializes GDK in gtk_init() and so this function is not usually needed
	 * by GTK+ applications.
	 * Params:
	 * argv = the array of command line arguments.
	 */
	public static void init(inout string[] argv);
	
	/**
	 * Initializes the GDK library and connects to the X server, returning TRUE on
	 * success.
	 * Any arguments used by GDK are removed from the array and argc and argv are
	 * updated accordingly.
	 * GTK+ initializes GDK in gtk_init() and so this function is not usually needed
	 * by GTK+ applications.
	 * Params:
	 * argv = the array of command line arguments.
	 * Returns:%TRUE if initialization succeeded.
	 */
	public static int initCheck(inout string[] argv);
	
	/**
	 * Parse command line arguments, and store for future
	 * use by calls to gdk_display_open().
	 * Any arguments used by GDK are removed from the array and argc and argv are
	 * updated accordingly.
	 * You shouldn't call this function explicitely if you are using
	 * gtk_init(), gtk_init_check(), gdk_init(), or gdk_init_check().
	 * Since 2.2
	 * Params:
	 * argv =  the array of command line arguments.
	 */
	public static void parseArgs(inout string[] argv);
	
	/**
	 * Gets the display name specified in the command line arguments passed
	 * to gdk_init() or gdk_parse_args(), if any.
	 * Since 2.2
	 * Returns: the display name, if specified explicitely, otherwise NULL this string is owned by GTK+ and must not be modified or freed.
	 */
	public static string getDisplayArgName();
	
	/**
	 * Initializes the support for internationalization by calling the setlocale()
	 * system call. This function is called by gtk_set_locale() and so GTK+
	 * applications should use that instead.
	 * The locale to use is determined by the LANG environment variable,
	 * Returns:the resulting locale.
	 */
	public static string setLocale();
	
	/**
	 * Sets the SM_CLIENT_ID property on the application's leader window so that
	 * the window manager can save the application's state using the X11R6 ICCCM
	 * session management protocol.
	 * See the X Session Management Library documentation for more information on
	 * session management and the Inter-Client Communication Conventions Manual
	 * (ICCCM) for information on the WM_CLIENT_LEADER property.
	 * (Both documents are part of the X Window System distribution.)
	 * Params:
	 * smClientId =  the client id assigned by the session manager when the
	 *  connection was opened, or NULL to remove the property.
	 */
	public static void setSmClientId(string smClientId);
	
	/**
	 * Warning
	 * gdk_exit is deprecated and should not be used in newly-written code.
	 * Exits the application using the exit() system call.
	 * This routine is provided mainly for backwards compatibility, since it used to
	 * perform tasks necessary to exit the application cleanly. Those tasks are now
	 * performed in a function which is automatically called on exit (via the use
	 * of g_atexit()).
	 * Params:
	 * errorCode = the error code to pass to the exit() call.
	 */
	public static void exit(int errorCode);

	/**
	 * Indicates to the GUI environment that the application has finished
	 * loading. If the applications opens windows, this function is
	 * normally called after opening the application's initial set of
	 * windows.
	 * GTK+ will call this function automatically after opening the first
	 * GtkWindow unless gtk_window_set_auto_startup_notification() is called
	 * to disable that feature.
	 * Since 2.2
	 */
	public static void notifyStartupComplete();
	
	/**
	 * Indicates to the GUI environment that the application has finished
	 * loading, using a given identifier.
	 * GTK+ will call this function automatically for GtkWindow with custom
	 * startup-notification identifier unless
	 * gtk_window_set_auto_startup_notification() is called to disable
	 * that feature.
	 * Since 2.12
	 * Params:
	 * startupId =  a startup-notification identifier, for which notification
	 *  process should be completed
	 */
	public static void notifyStartupCompleteWithId(string startupId);
	
	/**
	 * Gets the program class. Unless the program class has explicitly
	 * been set with gdk_set_program_class() or with the --class
	 * commandline option, the default value is the program name (determined
	 * with g_get_prgname()) with the first character converted to uppercase.
	 * Returns:the program class.
	 */
	public static string getProgramClass();
	
	/**
	 * Sets the program class. The X11 backend uses the program class to set
	 * the class name part of the WM_CLASS property on
	 * toplevel windows; see the ICCCM.
	 * Params:
	 * programClass = a string.
	 */
	public static void setProgramClass(string programClass);
	
	/**
	 * Gets the name of the display, which usually comes from the DISPLAY
	 * environment variable or the --display command line option.
	 * Returns:the name of the display.
	 */
	public static string getDisplay();
	
	/**
	 * Flushes the X output buffer and waits until all requests have been processed
	 * by the server. This is rarely needed by applications. It's main use is for
	 * trapping X errors with gdk_error_trap_push() and gdk_error_trap_pop().
	 */
	public static void flush();
	
	/**
	 * Returns the width of the default screen in pixels.
	 * Returns: the width of the default screen in pixels.
	 */
	public static int screenWidth();
	
	/**
	 * Returns the height of the default screen in pixels.
	 * Returns: the height of the default screen in pixels.
	 */
	public static int screenHeight();
	
	/**
	 * Returns the width of the default screen in millimeters.
	 * Note that on many X servers this value will not be correct.
	 * Returns: the width of the default screen in millimeters,though it is not always correct.
	 */
	public static int screenWidthMm();
	
	/**
	 * Returns the height of the default screen in millimeters.
	 * Note that on many X servers this value will not be correct.
	 * Returns: the height of the default screen in millimeters,though it is not always correct.
	 */
	public static int screenHeightMm();
	
	/**
	 * Grabs the pointer (usually a mouse) so that all events are passed to this
	 * application until the pointer is ungrabbed with gdk_pointer_ungrab(), or
	 * the grab window becomes unviewable.
	 * This overrides any previous pointer grab by this client.
	 * Pointer grabs are used for operations which need complete control over mouse
	 * events, even if the mouse leaves the application.
	 * For example in GTK+ it is used for Drag and Drop, for dragging the handle in
	 * the GtkHPaned and GtkVPaned widgets, and for resizing columns in GtkCList
	 * widgets.
	 * Note that if the event mask of an X window has selected both button press and
	 * button release events, then a button press event will cause an automatic
	 * pointer grab until the button is released.
	 * X does this automatically since most applications expect to receive button
	 * press and release events in pairs.
	 * It is equivalent to a pointer grab on the window with owner_events set to
	 * TRUE.
	 * If you set up anything at the time you take the grab that needs to be cleaned
	 * up when the grab ends, you should handle the GdkEventGrabBroken events that
	 * are emitted when the grab ends unvoluntarily.
	 * Params:
	 * window = the GdkWindow which will own the grab (the grab window).
	 * ownerEvents = if FALSE then all pointer events are reported with respect to
	 * window and are only reported if selected by event_mask. If TRUE then pointer
	 * events for this application are reported as normal, but pointer events outside
	 * this application are reported with respect to window and only if selected by
	 * event_mask. In either mode, unreported events are discarded.
	 * eventMask = specifies the event mask, which is used in accordance with
	 * owner_events. Note that only pointer events (i.e. button and motion events)
	 *  may be selected.
	 * confineTo = If non-NULL, the pointer will be confined to this
	 * window during the grab. If the pointer is outside confine_to, it will
	 * automatically be moved to the closest edge of confine_to and enter
	 * and leave events will be generated as necessary.
	 * cursor = the cursor to display while the grab is active. If this is NULL then
	 * the normal cursors are used for window and its descendants, and the cursor
	 * for window is used for all other windows.
	 * time = the timestamp of the event which led to this pointer grab. This usually
	 * comes from a GdkEventButton struct, though GDK_CURRENT_TIME can be used if
	 * the time isn't known.
	 * Returns:%GDK_GRAB_SUCCESS if the grab was successful.
	 */
	public static GdkGrabStatus pointerGrab(Window window, int ownerEvents, GdkEventMask eventMask, Window confineTo, Cursor cursor, uint time);
	
	/**
	 * Ungrabs the pointer on the default display, if it is grabbed by this
	 * application.
	 * Params:
	 * time =  a timestamp from a GdkEvent, or GDK_CURRENT_TIME if no
	 *  timestamp is available.
	 */
	public static void pointerUngrab(uint time);
	
	/**
	 * Returns TRUE if the pointer on the default display is currently
	 * grabbed by this application.
	 * Note that this does not take the inmplicit pointer grab on button
	 * presses into account.
	 * Returns: TRUE if the pointer is currently grabbed by this application.*
	 */
	public static int pointerIsGrabbed();
	
	/**
	 * Set the double click time for the default display. See
	 * gdk_display_set_double_click_time().
	 * See also gdk_display_set_double_click_distance().
	 * Applications should not set this, it is a
	 * global user-configured setting.
	 * Params:
	 * msec =  double click time in milliseconds (thousandths of a second)
	 */
	public static void setDoubleClickTime(uint msec);
	
	/**
	 * Grabs the keyboard so that all events are passed to this
	 * application until the keyboard is ungrabbed with gdk_keyboard_ungrab().
	 * This overrides any previous keyboard grab by this client.
	 * If you set up anything at the time you take the grab that needs to be cleaned
	 * up when the grab ends, you should handle the GdkEventGrabBroken events that
	 * are emitted when the grab ends unvoluntarily.
	 * Params:
	 * window = the GdkWindow which will own the grab (the grab window).
	 * ownerEvents = if FALSE then all keyboard events are reported with respect to
	 * window. If TRUE then keyboard events for this application are reported as
	 * normal, but keyboard events outside this application are reported with respect
	 * to window. Both key press and key release events are always reported,
	 * independant of the event mask set by the application.
	 * time = a timestamp from a GdkEvent, or GDK_CURRENT_TIME if no timestamp is
	 * available.
	 * Returns:%GDK_GRAB_SUCCESS if the grab was successful.
	 */
	public static GdkGrabStatus keyboardGrab(Window window, int ownerEvents, uint time);
	
	/**
	 * Ungrabs the keyboard on the default display, if it is grabbed by this
	 * application.
	 * Params:
	 * time =  a timestamp from a GdkEvent, or GDK_CURRENT_TIME if no
	 *  timestamp is available.
	 */
	public static void keyboardUngrab(uint time);
	
	/**
	 * Emits a short beep on the default display.
	 */
	public static void beep();
	
	/**
	 * Warning
	 * gdk_get_use_xshm is deprecated and should not be used in newly-written code.
	 * Returns TRUE if GDK will attempt to use the MIT-SHM shared memory extension.
	 * The shared memory extension is used for GdkImage, and consequently for
	 * GdkRGB.
	 * It enables much faster drawing by communicating with the X server through
	 * SYSV shared memory calls. However, it can only be used if the X client and
	 * server are on the same machine and the server supports it.
	 * Returns:%TRUE if use of the MIT shared memory extension will be attempted.
	 */
	public static int getUseXshm();
	
	/**
	 * Warning
	 * gdk_set_use_xshm is deprecated and should not be used in newly-written code.
	 * Sets whether the use of the MIT shared memory extension should be attempted.
	 * This function is mainly for internal use. It is only safe for an application
	 * to set this to FALSE, since if it is set to TRUE and the server does not
	 * support the extension it may cause warning messages to be output.
	 * Params:
	 * useXshm = %TRUE if use of the MIT shared memory extension should be attempted.
	 */
	public static void setUseXshm(int useXshm);
	
	/**
	 * This function allows X errors to be trapped instead of the normal behavior
	 * of exiting the application. It should only be used if it is not possible to
	 * avoid the X error in any other way.
	 * Example 1. Trapping an X error
	 *  gdk_error_trap_push ();
	 *  /+* ... Call the X function which may cause an error here ... +/
	 *  /+* Flush the X queue to catch errors now. +/
	 *  gdk_flush ();
	 *  if (gdk_error_trap_pop ())
	 *  {
		 *  /+* ... Handle the error here ... +/
	 *  }
	 */
	public static void errorTrapPush();
	
	/**
	 * Removes the X error trap installed with gdk_error_trap_push().
	 * Returns:the X error code, or 0 if no error occurred.
	 */
	public static int errorTrapPop();
}
