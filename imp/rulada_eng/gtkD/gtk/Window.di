module gtkD.gtk.Window;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;

private import gtkD.gobject.Signals;
public  import gtkD.gtkc.gdktypes;

private import gtkD.glib.Str;
private import gtkD.glib.ErrorG;
private import gtkD.glib.GException;
private import gtkD.gtk.AccelGroup;
private import gtkD.gtk.Widget;
private import gtkD.gtk.WindowGroup;
private import gtkD.gdk.Screen;
private import gtkD.glib.ListG;
private import gtkD.gdk.Pixbuf;



private import gtkD.gtk.Bin;

/**
 * Description
 * GtkWindow as GtkBuildable
 * The GtkWindow implementation of the GtkBuildable interface supports a
 * custom <accel-groups> element, which supports any number of <group>
 * elements representing the GtkAccelGroup objects you want to add to your
 * window (synonymous with gtk_window_add_accel_group().
 * Example 10. A UI definition fragment with accel groups
 * <object class="GtkWindow">
 *  <accel-groups>
 *  <group name="accelgroup1"/>
 *  </accel-groups>
 * </object>
 * ...
 * <object class="GtkAccelGroup" id="accelgroup1"/>
 */
public class Window : Bin
{
	
	/** the main Gtk struct */
	protected GtkWindow* gtkWindow;
	
	
	public GtkWindow* getWindowStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkWindow* gtkWindow);
	
	/**
	 * Creates a top level window with a title
	 * Params:
	 * 		title = The Window title
	 */
	public this(string title);
	
	/**
	 * Move the window to an absolute position.
	 * just calls move(int, int).
	 * convinience because GdkEvent structs return the position coords as doubles
	 */
	public void move(double x, double y);
	
	/**
	 */
	int[char[]] connectedSignals;
	
	void delegate(Window)[] onActivateDefaultListeners;
	/**
	 * The ::activate-default signal is a
	 * keybinding signal
	 * which gets emitted when the user activates the default widget
	 * of window.
	 */
	void addOnActivateDefault(void delegate(Window) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackActivateDefault(GtkWindow* windowStruct, Window window);
	
	void delegate(Window)[] onActivateFocusListeners;
	/**
	 * The ::activate-default signal is a
	 * keybinding signal
	 * which gets emitted when the user activates the currently
	 * focused widget of window.
	 */
	void addOnActivateFocus(void delegate(Window) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackActivateFocus(GtkWindow* windowStruct, Window window);
	
	bool delegate(GdkEvent*, Window)[] onFrameListeners;
	/**
	 */
	void addOnFrame(bool delegate(GdkEvent*, Window) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static gboolean callBackFrame(GtkWindow* windowStruct, GdkEvent* event, Window window);
	
	void delegate(Window)[] onKeysChangedListeners;
	/**
	 * The ::keys-changed signal gets emitted when the set of accelerators
	 * or mnemonics that are associated with window changes.
	 */
	void addOnKeysChanged(void delegate(Window) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackKeysChanged(GtkWindow* windowStruct, Window window);
	
	void delegate(Widget, Window)[] onSetFocusListeners;
	/**
	 */
	void addOnSetFocus(void delegate(Widget, Window) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackSetFocus(GtkWindow* windowStruct, GtkWidget* widget, Window window);
	
	
	/**
	 * Creates a new GtkWindow, which is a toplevel window that can
	 * contain other widgets. Nearly always, the type of the window should
	 * be GTK_WINDOW_TOPLEVEL. If you're implementing something like a
	 * popup menu from scratch (which is a bad idea, just use GtkMenu),
	 * you might use GTK_WINDOW_POPUP. GTK_WINDOW_POPUP is not for
	 * dialogs, though in some other toolkits dialogs are called "popups".
	 * In GTK+, GTK_WINDOW_POPUP means a pop-up menu or pop-up tooltip.
	 * On X11, popup windows are not controlled by the window manager.
	 * If you simply want an undecorated window (no window borders), use
	 * gtk_window_set_decorated(), don't use GTK_WINDOW_POPUP.
	 * Params:
	 * type =  type of window
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (GtkWindowType type);
	
	/**
	 * Sets the title of the GtkWindow. The title of a window will be
	 * displayed in its title bar; on the X Window System, the title bar
	 * is rendered by the window
	 * manager, so exactly how the title appears to users may vary
	 * according to a user's exact configuration. The title should help a
	 * user distinguish this window from other windows they may have
	 * open. A good title might include the application name and current
	 * document filename, for example.
	 * Params:
	 * title =  title of the window
	 */
	public void setTitle(string title);
	
	/**
	 * Don't use this function. It sets the X Window System "class" and
	 * "name" hints for a window. According to the ICCCM, you should
	 * always set these to the same value for all windows in an
	 * application, and GTK+ sets them to that value by default, so calling
	 * this function is sort of pointless. However, you may want to call
	 * gtk_window_set_role() on each window in your application, for the
	 * benefit of the session manager. Setting the role allows the window
	 * manager to restore window positions when loading a saved session.
	 * Params:
	 * wmclassName =  window name hint
	 * wmclassClass =  window class hint
	 */
	public void setWmclass(string wmclassName, string wmclassClass);
	
	/**
	 * Warning
	 * gtk_window_set_policy is deprecated and should not be used in newly-written code. Use gtk_window_set_resizable() instead.
	 * Changes how a toplevel window deals with its size request and user resize
	 * Params:
	 * allowShrink = whether the user can shrink the window below its size request
	 * allowGrow = whether the user can grow the window larger than its size request
	 * autoShrink = whether the window automatically snaps back to its size request
	 *  if it's larger
	 */
	public void setPolicy(int allowShrink, int allowGrow, int autoShrink);
	
	/**
	 * Sets whether the user can resize a window. Windows are user resizable
	 * by default.
	 * Params:
	 * resizable =  TRUE if the user can resize this window
	 */
	public void setResizable(int resizable);
	
	/**
	 * Gets the value set by gtk_window_set_resizable().
	 * Returns: TRUE if the user can resize the window
	 */
	public int getResizable();
	
	/**
	 * Associate accel_group with window, such that calling
	 * gtk_accel_groups_activate() on window will activate accelerators
	 * in accel_group.
	 * Params:
	 * accelGroup =  a GtkAccelGroup
	 */
	public void addAccelGroup(AccelGroup accelGroup);
	
	/**
	 * Reverses the effects of gtk_window_add_accel_group().
	 * Params:
	 * accelGroup =  a GtkAccelGroup
	 */
	public void removeAccelGroup(AccelGroup accelGroup);
	
	/**
	 * Activates the current focused widget within the window.
	 * Returns: TRUE if a widget got activated.
	 */
	public int activateFocus();
	
	/**
	 * Activates the default widget for the window, unless the current
	 * focused widget has been configured to receive the default action
	 * (see GTK_RECEIVES_DEFAULT in GtkWidgetFlags), in which case the
	 * focused widget is activated.
	 * Returns: TRUE if a widget got activated.
	 */
	public int activateDefault();
	
	/**
	 * Sets a window modal or non-modal. Modal windows prevent interaction
	 * with other windows in the same application. To keep modal dialogs
	 * on top of main application windows, use
	 * gtk_window_set_transient_for() to make the dialog transient for the
	 * parent; most window managers
	 * will then disallow lowering the dialog below the parent.
	 * Params:
	 * modal =  whether the window is modal
	 */
	public void setModal(int modal);
	
	/**
	 * Sets the default size of a window. If the window's "natural" size
	 * (its size request) is larger than the default, the default will be
	 * ignored. More generally, if the default size does not obey the
	 * geometry hints for the window (gtk_window_set_geometry_hints() can
	 * be used to set these explicitly), the default size will be clamped
	 * to the nearest permitted size.
	 * Unlike gtk_widget_set_size_request(), which sets a size request for
	 * a widget and thus would keep users from shrinking the window, this
	 * function only sets the initial size, just as if the user had
	 * resized the window themselves. Users can still shrink the window
	 * again as they normally would. Setting a default size of -1 means to
	 * use the "natural" default size (the size request of the window).
	 * For more control over a window's initial size and how resizing works,
	 * investigate gtk_window_set_geometry_hints().
	 * For some uses, gtk_window_resize() is a more appropriate function.
	 * gtk_window_resize() changes the current size of the window, rather
	 * than the size to be used on initial display. gtk_window_resize() always
	 * affects the window itself, not the geometry widget.
	 * The default size of a window only affects the first time a window is
	 * shown; if a window is hidden and re-shown, it will remember the size
	 * it had prior to hiding, rather than using the default size.
	 * Windows can't actually be 0x0 in size, they must be at least 1x1, but
	 * passing 0 for width and height is OK, resulting in a 1x1 default size.
	 * Params:
	 * width =  width in pixels, or -1 to unset the default width
	 * height =  height in pixels, or -1 to unset the default height
	 */
	public void setDefaultSize(int width, int height);
	
	/**
	 * This function sets up hints about how a window can be resized by
	 * the user. You can set a minimum and maximum size; allowed resize
	 * increments (e.g. for xterm, you can only resize by the size of a
	 * character); aspect ratios; and more. See the GdkGeometry struct.
	 * Params:
	 * geometryWidget =  widget the geometry hints will be applied to
	 * geometry =  struct containing geometry information
	 * geomMask =  mask indicating which struct fields should be paid attention to
	 */
	public void setGeometryHints(Widget geometryWidget, GdkGeometry* geometry, GdkWindowHints geomMask);
	
	/**
	 * Window gravity defines the meaning of coordinates passed to
	 * gtk_window_move(). See gtk_window_move() and GdkGravity for
	 * more details.
	 * The default window gravity is GDK_GRAVITY_NORTH_WEST which will
	 * typically "do what you mean."
	 * Params:
	 * gravity =  window gravity
	 */
	public void setGravity(GdkGravity gravity);
	
	/**
	 * Gets the value set by gtk_window_set_gravity().
	 * Returns: window gravity
	 */
	public GdkGravity getGravity();
	
	/**
	 * Sets a position constraint for this window. If the old or new
	 * constraint is GTK_WIN_POS_CENTER_ALWAYS, this will also cause
	 * the window to be repositioned to satisfy the new constraint.
	 * Params:
	 * position =  a position constraint.
	 */
	public void setPosition(GtkWindowPosition position);
	
	/**
	 * Dialog windows should be set transient for the main application
	 * window they were spawned from. This allows window managers to e.g. keep the
	 * dialog on top of the main window, or center the dialog over the
	 * main window. gtk_dialog_new_with_buttons() and other convenience
	 * functions in GTK+ will sometimes call
	 * gtk_window_set_transient_for() on your behalf.
	 * On Windows, this function puts the child window on top of the parent,
	 * much as the window manager would have done on X.
	 * Params:
	 * parent =  parent window
	 */
	public void setTransientFor(Window parent);
	
	/**
	 * If setting is TRUE, then destroying the transient parent of window
	 * will also destroy window itself. This is useful for dialogs that
	 * shouldn't persist beyond the lifetime of the main window they're
	 * associated with, for example.
	 * Params:
	 * setting =  whether to destroy window with its transient parent
	 */
	public void setDestroyWithParent(int setting);
	
	/**
	 * Sets the GdkScreen where the window is displayed; if
	 * the window is already mapped, it will be unmapped, and
	 * then remapped on the new screen.
	 * Since 2.2
	 * Params:
	 * screen =  a GdkScreen.
	 */
	public void setScreen(Screen screen);
	
	/**
	 * Returns the GdkScreen associated with window.
	 * Since 2.2
	 * Returns: a GdkScreen.
	 */
	public override Screen getScreen();
	
	/**
	 * Returns whether the window is part of the current active toplevel.
	 * (That is, the toplevel window receiving keystrokes.)
	 * The return value is TRUE if the window is active toplevel
	 * itself, but also if it is, say, a GtkPlug embedded in the active toplevel.
	 * You might use this function if you wanted to draw a widget
	 * differently in an active window from a widget in an inactive window.
	 * See gtk_window_has_toplevel_focus()
	 * Since 2.4
	 * Returns: TRUE if the window part of the current active window.
	 */
	public int isActive();
	
	/**
	 * Returns whether the input focus is within this GtkWindow.
	 * For real toplevel windows, this is identical to gtk_window_is_active(),
	 * but for embedded windows, like GtkPlug, the results will differ.
	 * Since 2.4
	 * Returns: TRUE if the input focus is within this GtkWindow
	 */
	public int hasToplevelFocus();
	
	/**
	 * Returns a list of all existing toplevel windows. The widgets
	 * in the list are not individually referenced. If you want
	 * to iterate through the list and perform actions involving
	 * callbacks that might destroy the widgets, you must call
	 * g_list_foreach (result, (GFunc)g_object_ref, NULL) first, and
	 * then unref all the widgets afterwards.
	 * Returns: list of toplevel widgets
	 */
	public static ListG listToplevels();
	
	/**
	 * Adds a mnemonic to this window.
	 * Params:
	 * keyval =  the mnemonic
	 * target =  the widget that gets activated by the mnemonic
	 */
	public void addMnemonic(uint keyval, Widget target);

	/**
	 * Removes a mnemonic from this window.
	 * Params:
	 * keyval =  the mnemonic
	 * target =  the widget that gets activated by the mnemonic
	 */
	public void removeMnemonic(uint keyval, Widget target);
	
	/**
	 * Activates the targets associated with the mnemonic.
	 * Params:
	 * keyval =  the mnemonic
	 * modifier =  the modifiers
	 * Returns: TRUE if the activation is done.
	 */
	public int mnemonicActivate(uint keyval, GdkModifierType modifier);
	
	/**
	 * Activates mnemonics and accelerators for this GtkWindow. This is normally
	 * called by the default ::key_press_event handler for toplevel windows,
	 * however in some cases it may be useful to call this directly when
	 * overriding the standard key handling for a toplevel window.
	 * Params:
	 * event =  a GdkEventKey
	 * Returns: TRUE if a mnemonic or accelerator was found and activated.
	 */
	public int activateKey(GdkEventKey* event);
	
	/**
	 * Propagate a key press or release event to the focus widget and
	 * up the focus container chain until a widget handles event.
	 * This is normally called by the default ::key_press_event and
	 * ::key_release_event handlers for toplevel windows,
	 * however in some cases it may be useful to call this directly when
	 * overriding the standard key handling for a toplevel window.
	 * Params:
	 * event =  a GdkEventKey
	 * Returns: TRUE if a widget in the focus chain handled the event.
	 */
	public int propagateKeyEvent(GdkEventKey* event);
	
	/**
	 * Retrieves the current focused widget within the window.
	 * Note that this is the widget that would have the focus
	 * if the toplevel window focused; if the toplevel window
	 * is not focused then GTK_WIDGET_HAS_FOCUS (widget) will
	 * not be TRUE for the widget.
	 * Returns: the currently focused widget, or NULL if there is none.
	 */
	public Widget getFocus();
	
	/**
	 * If focus is not the current focus widget, and is focusable, sets
	 * it as the focus widget for the window. If focus is NULL, unsets
	 * the focus widget for this window. To set the focus to a particular
	 * widget in the toplevel, it is usually more convenient to use
	 * gtk_widget_grab_focus() instead of this function.
	 * Params:
	 * focus =  widget to be the new focus widget, or NULL to unset
	 *  any focus widget for the toplevel window.
	 */
	public void setFocus(Widget focus);
	
	/**
	 * Returns the default widget for window. See gtk_window_set_default()
	 * for more details.
	 * Since 2.14
	 * Returns: the default widget, or NULL if there is none.
	 */
	public Widget getDefaultWidget();
	
	/**
	 * The default widget is the widget that's activated when the user
	 * presses Enter in a dialog (for example). This function sets or
	 * unsets the default widget for a GtkWindow about. When setting
	 * (rather than unsetting) the default widget it's generally easier to
	 * call gtk_widget_grab_focus() on the widget. Before making a widget
	 * the default widget, you must set the GTK_CAN_DEFAULT flag on the
	 * widget you'd like to make the default using GTK_WIDGET_SET_FLAGS().
	 * Params:
	 * defaultWidget =  widget to be the default, or NULL to unset the
	 *  default widget for the toplevel.
	 */
	public void setDefault(Widget defaultWidget);
	
	/**
	 * Presents a window to the user. This may mean raising the window
	 * in the stacking order, deiconifying it, moving it to the current
	 * desktop, and/or giving it the keyboard focus, possibly dependent
	 * on the user's platform, window manager, and preferences.
	 * If window is hidden, this function calls gtk_widget_show()
	 * as well.
	 * This function should be used when the user tries to open a window
	 * that's already open. Say for example the preferences dialog is
	 * currently open, and the user chooses Preferences from the menu
	 * a second time; use gtk_window_present() to move the already-open dialog
	 * where the user can see it.
	 * If you are calling this function in response to a user interaction,
	 * it is preferable to use gtk_window_present_with_time().
	 */
	public void present();
	
	/**
	 * Presents a window to the user in response to a user interaction.
	 * If you need to present a window without a timestamp, use
	 * gtk_window_present(). See gtk_window_present() for details.
	 * Since 2.8
	 * Params:
	 * timestamp =  the timestamp of the user interaction (typically a
	 *  button or key press event) which triggered this call
	 */
	public void presentWithTime(uint timestamp);
	
	/**
	 * Asks to iconify (i.e. minimize) the specified window. Note that
	 * you shouldn't assume the window is definitely iconified afterward,
	 * because other entities (e.g. the user or window manager) could deiconify it
	 * again, or there may not be a window manager in which case
	 * iconification isn't possible, etc. But normally the window will end
	 * up iconified. Just don't write code that crashes if not.
	 * It's permitted to call this function before showing a window,
	 * in which case the window will be iconified before it ever appears
	 * onscreen.
	 * You can track iconification via the "window-state-event" signal
	 * on GtkWidget.
	 */
	public void iconify();
	
	/**
	 * Asks to deiconify (i.e. unminimize) the specified window. Note
	 * that you shouldn't assume the window is definitely deiconified
	 * afterward, because other entities (e.g. the user or window manager) could iconify it
	 * again before your code which assumes deiconification gets to run.
	 * You can track iconification via the "window-state-event" signal
	 * on GtkWidget.
	 */
	public void deiconify();
	
	/**
	 * Asks to stick window, which means that it will appear on all user
	 * desktops. Note that you shouldn't assume the window is definitely
	 * stuck afterward, because other entities (e.g. the user or window manager) could unstick it
	 * again, and some window managers do not support sticking
	 * windows. But normally the window will end up stuck. Just don't
	 * write code that crashes if not.
	 * It's permitted to call this function before showing a window.
	 * You can track stickiness via the "window-state-event" signal
	 * on GtkWidget.
	 */
	public void stick();
	
	/**
	 * Asks to unstick window, which means that it will appear on only
	 * one of the user's desktops. Note that you shouldn't assume the
	 * window is definitely unstuck afterward, because other entities
	 * (e.g. the user or window
	 * manager) could stick it again. But normally the window will
	 * end up stuck. Just don't write code that crashes if not.
	 * You can track stickiness via the "window-state-event" signal
	 * on GtkWidget.
	 */
	public void unstick();
	
	/**
	 * Asks to maximize window, so that it becomes full-screen. Note that
	 * you shouldn't assume the window is definitely maximized afterward,
	 * because other entities (e.g. the user or window manager) could unmaximize it
	 * again, and not all window managers support maximization. But
	 * normally the window will end up maximized. Just don't write code
	 * that crashes if not.
	 * It's permitted to call this function before showing a window,
	 * in which case the window will be maximized when it appears onscreen
	 * initially.
	 * You can track maximization via the "window-state-event" signal
	 * on GtkWidget.
	 */
	public void maximize();
	
	/**
	 * Asks to unmaximize window. Note that you shouldn't assume the
	 * window is definitely unmaximized afterward, because other entities
	 * (e.g. the user or window
	 * manager) could maximize it again, and not all window
	 * managers honor requests to unmaximize. But normally the window will
	 * end up unmaximized. Just don't write code that crashes if not.
	 * You can track maximization via the "window-state-event" signal
	 * on GtkWidget.
	 */
	public void unmaximize();
	
	/**
	 * Asks to place window in the fullscreen state. Note that you
	 * shouldn't assume the window is definitely full screen afterward,
	 * because other entities (e.g. the user or window manager) could unfullscreen it
	 * again, and not all window managers honor requests to fullscreen
	 * windows. But normally the window will end up fullscreen. Just
	 * don't write code that crashes if not.
	 * You can track the fullscreen state via the "window-state-event" signal
	 * on GtkWidget.
	 * Since 2.2
	 */
	public void fullscreen();
	
	/**
	 * Asks to toggle off the fullscreen state for window. Note that you
	 * shouldn't assume the window is definitely not full screen
	 * afterward, because other entities (e.g. the user or window manager) could fullscreen it
	 * again, and not all window managers honor requests to unfullscreen
	 * windows. But normally the window will end up restored to its normal
	 * state. Just don't write code that crashes if not.
	 * You can track the fullscreen state via the "window-state-event" signal
	 * on GtkWidget.
	 * Since 2.2
	 */
	public void unfullscreen();
	
	/**
	 * Asks to keep window above, so that it stays on top. Note that
	 * you shouldn't assume the window is definitely above afterward,
	 * because other entities (e.g. the user or window manager) could not keep it above,
	 * and not all window managers support keeping windows above. But
	 * normally the window will end kept above. Just don't write code
	 * that crashes if not.
	 * It's permitted to call this function before showing a window,
	 * in which case the window will be kept above when it appears onscreen
	 * initially.
	 * You can track the above state via the "window-state-event" signal
	 * on GtkWidget.
	 * Note that, according to the Extended Window
	 * Manager Hints specification, the above state is mainly meant
	 * for user preferences and should not be used by applications e.g. for
	 * drawing attention to their dialogs.
	 * Since 2.4
	 * Params:
	 * setting =  whether to keep window above other windows
	 */
	public void setKeepAbove(int setting);
	
	/**
	 * Asks to keep window below, so that it stays in bottom. Note that
	 * you shouldn't assume the window is definitely below afterward,
	 * because other entities (e.g. the user or window manager) could not keep it below,
	 * and not all window managers support putting windows below. But
	 * normally the window will be kept below. Just don't write code
	 * that crashes if not.
	 * It's permitted to call this function before showing a window,
	 * in which case the window will be kept below when it appears onscreen
	 * initially.
	 * You can track the below state via the "window-state-event" signal
	 * on GtkWidget.
	 * Note that, according to the Extended Window
	 * Manager Hints specification, the above state is mainly meant
	 * for user preferences and should not be used by applications e.g. for
	 * drawing attention to their dialogs.
	 * Since 2.4
	 * Params:
	 * setting =  whether to keep window below other windows
	 */
	public void setKeepBelow(int setting);
	
	/**
	 * Starts resizing a window. This function is used if an application
	 * has window resizing controls. When GDK can support it, the resize
	 * will be done using the standard mechanism for the window manager or windowing
	 * system. Otherwise, GDK will try to emulate window resizing,
	 * potentially not all that well, depending on the windowing system.
	 * Params:
	 * edge =  position of the resize control
	 * button =  mouse button that initiated the drag
	 * rootX =  X position where the user clicked to initiate the drag, in root window coordinates
	 * rootY =  Y position where the user clicked to initiate the drag
	 * timestamp =  timestamp from the click event that initiated the drag
	 */
	public void beginResizeDrag(GdkWindowEdge edge, int button, int rootX, int rootY, uint timestamp);
	
	/**
	 * Starts moving a window. This function is used if an application has
	 * window movement grips. When GDK can support it, the window movement
	 * will be done using the standard mechanism for the window manager or windowing
	 * system. Otherwise, GDK will try to emulate window movement,
	 * potentially not all that well, depending on the windowing system.
	 * Params:
	 * button =  mouse button that initiated the drag
	 * rootX =  X position where the user clicked to initiate the drag, in root window coordinates
	 * rootY =  Y position where the user clicked to initiate the drag
	 * timestamp =  timestamp from the click event that initiated the drag
	 */
	public void beginMoveDrag(int button, int rootX, int rootY, uint timestamp);
	
	/**
	 * By default, windows are decorated with a title bar, resize
	 * controls, etc. Some window
	 * managers allow GTK+ to disable these decorations, creating a
	 * borderless window. If you set the decorated property to FALSE
	 * using this function, GTK+ will do its best to convince the window
	 * manager not to decorate the window. Depending on the system, this
	 * function may not have any effect when called on a window that is
	 * already visible, so you should call it before calling gtk_window_show().
	 * On Windows, this function always works, since there's no window manager
	 * policy involved.
	 * Params:
	 * setting =  TRUE to decorate the window
	 */
	public void setDecorated(int setting);
	
	/**
	 * By default, windows have a close button in the window frame. Some
	 * window managers allow GTK+ to
	 * disable this button. If you set the deletable property to FALSE
	 * using this function, GTK+ will do its best to convince the window
	 * manager not to show a close button. Depending on the system, this
	 * function may not have any effect when called on a window that is
	 * already visible, so you should call it before calling gtk_window_show().
	 * On Windows, this function always works, since there's no window manager
	 * policy involved.
	 * Since 2.10
	 * Params:
	 * setting =  TRUE to decorate the window as deletable
	 */
	public void setDeletable(int setting);
	
	/**
	 * (Note: this is a special-purpose function intended for the framebuffer
	 *  port; see gtk_window_set_has_frame(). It will have no effect on the
	 *  window border drawn by the window manager, which is the normal
	 *  case when using the X Window system.)
	 * For windows with frames (see gtk_window_set_has_frame()) this function
	 * can be used to change the size of the frame border.
	 * Params:
	 * left =  The width of the left border
	 * top =  The height of the top border
	 * right =  The width of the right border
	 * bottom =  The height of the bottom border
	 */
	public void setFrameDimensions(int left, int top, int right, int bottom);
	
	/**
	 * (Note: this is a special-purpose function for the framebuffer port,
	 *  that causes GTK+ to draw its own window border. For most applications,
	 *  you want gtk_window_set_decorated() instead, which tells the window
	 *  manager whether to draw the window border.)
	 * If this function is called on a window with setting of TRUE, before
	 * it is realized or showed, it will have a "frame" window around
	 * window->window, accessible in window->frame. Using the signal
	 * frame_event you can receive all events targeted at the frame.
	 * This function is used by the linux-fb port to implement managed
	 * windows, but it could conceivably be used by X-programs that
	 * want to do their own window decorations.
	 * Params:
	 * setting =  a boolean
	 */
	public void setHasFrame(int setting);
	
	/**
	 * Sets the mnemonic modifier for this window.
	 * Params:
	 * modifier =  the modifier mask used to activate
	 *  mnemonics on this window.
	 */
	public void setMnemonicModifier(GdkModifierType modifier);
	
	/**
	 * By setting the type hint for the window, you allow the window
	 * manager to decorate and handle the window in a way which is
	 * suitable to the function of the window in your application.
	 * This function should be called before the window becomes visible.
	 * gtk_dialog_new_with_buttons() and other convenience functions in GTK+
	 * will sometimes call gtk_window_set_type_hint() on your behalf.
	 * Params:
	 * hint =  the window type
	 */
	public void setTypeHint(GdkWindowTypeHint hint);
	
	/**
	 * Windows may set a hint asking the desktop environment not to display
	 * the window in the task bar. This function sets this hint.
	 * Since 2.2
	 * Params:
	 * setting =  TRUE to keep this window from appearing in the task bar
	 */
	public void setSkipTaskbarHint(int setting);
	
	/**
	 * Windows may set a hint asking the desktop environment not to display
	 * the window in the pager. This function sets this hint.
	 * (A "pager" is any desktop navigation tool such as a workspace
	 * switcher that displays a thumbnail representation of the windows
	 * on the screen.)
	 * Since 2.2
	 * Params:
	 * setting =  TRUE to keep this window from appearing in the pager
	 */
	public void setSkipPagerHint(int setting);
	
	/**
	 * Windows may set a hint asking the desktop environment to draw
	 * the users attention to the window. This function sets this hint.
	 * Since 2.8
	 * Params:
	 * setting =  TRUE to mark this window as urgent
	 */
	public void setUrgencyHint(int setting);
	
	/**
	 * Windows may set a hint asking the desktop environment not to receive
	 * the input focus. This function sets this hint.
	 * Since 2.4
	 * Params:
	 * setting =  TRUE to let this window receive input focus
	 */
	public void setAcceptFocus(int setting);

	/**
	 * Windows may set a hint asking the desktop environment not to receive
	 * the input focus when the window is mapped. This function sets this
	 * hint.
	 * Since 2.6
	 * Params:
	 * setting =  TRUE to let this window receive input focus on map
	 */
	public void setFocusOnMap(int setting);
	
	/**
	 * Startup notification identifiers are used by desktop environment to
	 * track application startup, to provide user feedback and other
	 * features. This function changes the corresponding property on the
	 * underlying GdkWindow. Normally, startup identifier is managed
	 * automatically and you should only use this function in special cases
	 * like transferring focus from other processes. You should use this
	 * function before calling gtk_window_present() or any equivalent
	 * function generating a window map event.
	 * This function is only useful on X11, not with other GTK+ targets.
	 * Since 2.12
	 * Params:
	 * startupId =  a string with startup-notification identifier
	 */
	public void setStartupId(string startupId);
	
	/**
	 * This function is only useful on X11, not with other GTK+ targets.
	 * In combination with the window title, the window role allows a
	 * window manager to identify "the
	 * same" window when an application is restarted. So for example you
	 * might set the "toolbox" role on your app's toolbox window, so that
	 * when the user restarts their session, the window manager can put
	 * the toolbox back in the same place.
	 * If a window already has a unique title, you don't need to set the
	 * role, since the WM can use the title to identify the window when
	 * restoring the session.
	 * Params:
	 * role =  unique identifier for the window to be used when restoring a session
	 */
	public void setRole(string role);
	
	/**
	 * Returns whether the window has been set to have decorations
	 * such as a title bar via gtk_window_set_decorated().
	 * Returns: TRUE if the window has been set to have decorations
	 */
	public int getDecorated();
	
	/**
	 * Returns whether the window has been set to have a close button
	 * via gtk_window_set_deletable().
	 * Since 2.10
	 * Returns: TRUE if the window has been set to have a close button
	 */
	public int getDeletable();
	
	/**
	 * Gets the value set by gtk_window_set_default_icon_list().
	 * The list is a copy and should be freed with g_list_free(),
	 * but the pixbufs in the list have not had their reference count
	 * incremented.
	 * Returns: copy of default icon list
	 */
	public static ListG getDefaultIconList();
	
	/**
	 * Returns the fallback icon name for windows that has been set
	 * with gtk_window_set_default_icon_name(). The returned
	 * string is owned by GTK+ and should not be modified. It
	 * is only valid until the next call to
	 * gtk_window_set_default_icon_name().
	 * Since 2.16
	 * Returns: the fallback icon name for windows
	 */
	public static string getDefaultIconName();
	
	/**
	 * Gets the default size of the window. A value of -1 for the width or
	 * height indicates that a default size has not been explicitly set
	 * for that dimension, so the "natural" size of the window will be
	 * used.
	 * Params:
	 * width =  location to store the default width, or NULL
	 * height =  location to store the default height, or NULL
	 */
	public void getDefaultSize(out int width, out int height);
	
	/**
	 * Returns whether the window will be destroyed with its transient parent. See
	 * gtk_window_set_destroy_with_parent().
	 * Returns: TRUE if the window will be destroyed with its transient parent.
	 */
	public int getDestroyWithParent();
	
	/**
	 * (Note: this is a special-purpose function intended for the
	 *  framebuffer port; see gtk_window_set_has_frame(). It will not
	 *  return the size of the window border drawn by the window manager, which is the normal
	 *  case when using a windowing system. See
	 *  gdk_window_get_frame_extents() to get the standard window border
	 *  extents.)
	 * Retrieves the dimensions of the frame window for this toplevel.
	 * See gtk_window_set_has_frame(), gtk_window_set_frame_dimensions().
	 * Params:
	 * left =  location to store the width of the frame at the left, or NULL
	 * top =  location to store the height of the frame at the top, or NULL
	 * right =  location to store the width of the frame at the returns, or NULL
	 * bottom =  location to store the height of the frame at the bottom, or NULL
	 */
	public void getFrameDimensions(out int left, out int top, out int right, out int bottom);
	
	/**
	 * Accessor for whether the window has a frame window exterior to
	 * window->window. Gets the value set by gtk_window_set_has_frame().
	 * Returns: TRUE if a frame has been added to the window via gtk_window_set_has_frame().
	 */
	public int getHasFrame();
	
	/**
	 * Gets the value set by gtk_window_set_icon() (or if you've
	 * called gtk_window_set_icon_list(), gets the first icon in
	 * the icon list).
	 * Returns: icon for window
	 */
	public Pixbuf getIcon();
	
	/**
	 * Retrieves the list of icons set by gtk_window_set_icon_list().
	 * The list is copied, but the reference count on each
	 * member won't be incremented.
	 * Returns: copy of window's icon list
	 */
	public ListG getIconList();
	
	/**
	 * Returns the name of the themed icon for the window,
	 * see gtk_window_set_icon_name().
	 * Since 2.6
	 * Returns: the icon name or NULL if the window has no themed icon
	 */
	public string getIconName();
	
	/**
	 * Returns the mnemonic modifier for this window. See
	 * gtk_window_set_mnemonic_modifier().
	 * Returns: the modifier mask used to activate mnemonics on this window.
	 */
	public GdkModifierType getMnemonicModifier();

	
	/**
	 * Returns whether the window is modal. See gtk_window_set_modal().
	 * Returns: TRUE if the window is set to be modal and establishes a grab when shown
	 */
	public int getModal();
	
	/**
	 * This function returns the position you need to pass to
	 * gtk_window_move() to keep window in its current position. This
	 * means that the meaning of the returned value varies with window
	 * gravity. See gtk_window_move() for more details.
	 * If you haven't changed the window gravity, its gravity will be
	 * GDK_GRAVITY_NORTH_WEST. This means that gtk_window_get_position()
	 * gets the position of the top-left corner of the window manager
	 * frame for the window. gtk_window_move() sets the position of this
	 * same top-left corner.
	 * gtk_window_get_position() is not 100% reliable because the X Window System
	 * does not specify a way to obtain the geometry of the
	 * decorations placed on a window by the window manager.
	 * Thus GTK+ is using a "best guess" that works with most
	 * window managers.
	 * Moreover, nearly all window managers are historically broken with
	 * respect to their handling of window gravity. So moving a window to
	 * its current position as returned by gtk_window_get_position() tends
	 * to result in moving the window slightly. Window managers are
	 * slowly getting better over time.
	 * If a window has gravity GDK_GRAVITY_STATIC the window manager
	 * frame is not relevant, and thus gtk_window_get_position() will
	 * always produce accurate results. However you can't use static
	 * gravity to do things like place a window in a corner of the screen,
	 * because static gravity ignores the window manager decorations.
	 * If you are saving and restoring your application's window
	 * positions, you should know that it's impossible for applications to
	 * do this without getting it somewhat wrong because applications do
	 * not have sufficient knowledge of window manager state. The Correct
	 * Mechanism is to support the session management protocol (see the
	 * "GnomeClient" object in the GNOME libraries for example) and allow
	 * the window manager to save your window sizes and positions.
	 * Params:
	 * rootX =  return location for X coordinate of gravity-determined reference point
	 * rootY =  return location for Y coordinate of gravity-determined reference point
	 */
	public void getPosition(out int rootX, out int rootY);
	
	/**
	 * Returns the role of the window. See gtk_window_set_role() for
	 * further explanation.
	 * Returns: the role of the window if set, or NULL. The returned is owned by the widget and must not be modified or freed.
	 */
	public string getRole();
	
	/**
	 * Obtains the current size of window. If window is not onscreen,
	 * it returns the size GTK+ will suggest to the window manager for the initial window
	 * size (but this is not reliably the same as the size the window
	 * manager will actually select). The size obtained by
	 * gtk_window_get_size() is the last size received in a
	 * GdkEventConfigure, that is, GTK+ uses its locally-stored size,
	 * rather than querying the X server for the size. As a result, if you
	 * call gtk_window_resize() then immediately call
	 * gtk_window_get_size(), the size won't have taken effect yet. After
	 * the window manager processes the resize request, GTK+ receives
	 * notification that the size has changed via a configure event, and
	 * the size of the window gets updated.
	 * Note 1: Nearly any use of this function creates a race condition,
	 * because the size of the window may change between the time that you
	 * get the size and the time that you perform some action assuming
	 * that size is the current size. To avoid race conditions, connect to
	 * "configure-event" on the window and adjust your size-dependent
	 * state to match the size delivered in the GdkEventConfigure.
	 * Note 2: The returned size does not include the
	 * size of the window manager decorations (aka the window frame or
	 * border). Those are not drawn by GTK+ and GTK+ has no reliable
	 * method of determining their size.
	 * Note 3: If you are getting a window size in order to position
	 * the window onscreen, there may be a better way. The preferred
	 * way is to simply set the window's semantic type with
	 * gtk_window_set_type_hint(), which allows the window manager to
	 * e.g. center dialogs. Also, if you set the transient parent of
	 * dialogs with gtk_window_set_transient_for() window managers
	 * will often center the dialog over its parent window. It's
	 * much preferred to let the window manager handle these
	 * things rather than doing it yourself, because all apps will
	 * behave consistently and according to user prefs if the window
	 * manager handles it. Also, the window manager can take the size
	 * of the window decorations/border into account, while your
	 * application cannot.
	 * In any case, if you insist on application-specified window
	 * positioning, there's still a better way than
	 * doing it yourself - gtk_window_set_position() will frequently
	 * handle the details for you.
	 * Params:
	 * width =  return location for width, or NULL
	 * height =  return location for height, or NULL
	 */
	public void getSize(out int width, out int height);
	
	/**
	 * Retrieves the title of the window. See gtk_window_set_title().
	 * Returns: the title of the window, or NULL if none has been set explicitely. The returned string is owned by the widget and must not be modified or freed.
	 */
	public string getTitle();
	
	/**
	 * Fetches the transient parent for this window. See
	 * gtk_window_set_transient_for().
	 * Returns: the transient parent for this window, or NULL if no transient parent has been set.
	 */
	public Window getTransientFor();
	
	/**
	 * Gets the type hint for this window. See gtk_window_set_type_hint().
	 * Returns: the type hint for window.
	 */
	public GdkWindowTypeHint getTypeHint();
	
	/**
	 * Gets the value set by gtk_window_set_skip_taskbar_hint()
	 * Since 2.2
	 * Returns: TRUE if window shouldn't be in taskbar
	 */
	public int getSkipTaskbarHint();
	
	/**
	 * Gets the value set by gtk_window_set_skip_pager_hint().
	 * Since 2.2
	 * Returns: TRUE if window shouldn't be in pager
	 */
	public int getSkipPagerHint();
	
	/**
	 * Gets the value set by gtk_window_set_urgency_hint()
	 * Since 2.8
	 * Returns: TRUE if window is urgent
	 */
	public int getUrgencyHint();
	
	/**
	 * Gets the value set by gtk_window_set_accept_focus().
	 * Since 2.4
	 * Returns: TRUE if window should receive the input focus
	 */
	public int getAcceptFocus();
	
	/**
	 * Gets the value set by gtk_window_set_focus_on_map().
	 * Since 2.6
	 * Returns: TRUE if window should receive the input focus whenmapped.
	 */
	public int getFocusOnMap();
	
	/**
	 * Returns the group for window or the default group, if
	 * window is NULL or if window does not have an explicit
	 * window group.
	 * Since 2.10
	 * Returns: the GtkWindowGroup for a window or the default group
	 */
	public WindowGroup getGroup();
	
	/**
	 * Asks the window manager to move
	 * window to the given position. Window managers are free to ignore
	 * this; most window managers ignore requests for initial window
	 * positions (instead using a user-defined placement algorithm) and
	 * honor requests after the window has already been shown.
	 * Note: the position is the position of the gravity-determined
	 * Params:
	 * x =  X coordinate to move window to
	 * y =  Y coordinate to move window to
	 */
	public void move(int x, int y);
	
	/**
	 * Parses a standard X Window System geometry string - see the
	 * manual page for X (type 'man X') for details on this.
	 * gtk_window_parse_geometry() does work on all GTK+ ports
	 * including Win32 but is primarily intended for an X environment.
	 * If either a size or a position can be extracted from the
	 * geometry string, gtk_window_parse_geometry() returns TRUE
	 * and calls gtk_window_set_default_size() and/or gtk_window_move()
	 * to resize/move the window.
	 * If gtk_window_parse_geometry() returns TRUE, it will also
	 * set the GDK_HINT_USER_POS and/or GDK_HINT_USER_SIZE hints
	 * indicating to the window manager that the size/position of
	 * the window was user-specified. This causes most window
	 * managers to honor the geometry.
	 * Note that for gtk_window_parse_geometry() to work as expected, it has
	 * to be called when the window has its "final" size, i.e. after calling
	 * gtk_widget_show_all() on the contents and gtk_window_set_geometry_hints()
	 * on the window.
	 * #include <gtk/gtkD.gtk.h>
	 * static void
	 * fill_with_content (GtkWidget *vbox)
	 * {
		 *  /+* fill with content... +/
	 * }
	 * int
	 * main (int argc, char *argv[])
	 * {
		 *  GtkWidget *window, *vbox;
		 *  GdkGeometry size_hints = {
			 *  100, 50, 0, 0, 100, 50, 10, 10, 0.0, 0.0, GDK_GRAVITY_NORTH_WEST
		 *  };
		 *  gtk_init (argc, argv);
		 *  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
		 *  vbox = gtk_vbox_new (FALSE, 0);
		 *  gtk_container_add (GTK_CONTAINER (window), vbox);
		 *  fill_with_content (vbox);
		 *  gtk_widget_show_all (vbox);
		 *  gtk_window_set_geometry_hints (GTK_WINDOW (window),
		 * 	 			 window,
		 * 				 size_hints,
		 * 				 GDK_HINT_MIN_SIZE |
		 * 				 GDK_HINT_BASE_SIZE |
		 * 				 GDK_HINT_RESIZE_INC);
		 *  if (argc > 1)
		 *  {
			 *  if (!gtk_window_parse_geometry (GTK_WINDOW (window), argv[1]))
			 *  fprintf (stderr, "Failed to parse '%s'\n", argv[1]);
		 *  }
		 *  gtk_widget_show_all (window);
		 *  gtk_main ();
		 *  return 0;
	 * }
	 * Params:
	 * geometry =  geometry string
	 * Returns: TRUE if string was parsed successfully
	 */
	public int parseGeometry(string geometry);
	
	/**
	 * Hides window, then reshows it, resetting the
	 * default size and position of the window. Used
	 * by GUI builders only.
	 */
	public void reshowWithInitialSize();
	
	/**
	 * Resizes the window as if the user had done so, obeying geometry
	 * constraints. The default geometry constraint is that windows may
	 * not be smaller than their size request; to override this
	 * constraint, call gtk_widget_set_size_request() to set the window's
	 * request to a smaller value.
	 * If gtk_window_resize() is called before showing a window for the
	 * first time, it overrides any default size set with
	 * gtk_window_set_default_size().
	 * Windows may not be resized smaller than 1 by 1 pixels.
	 * Params:
	 * width =  width in pixels to resize the window to
	 * height =  height in pixels to resize the window to
	 */
	public void resize(int width, int height);
	
	/**
	 * Sets an icon list to be used as fallback for windows that haven't
	 * had gtk_window_set_icon_list() called on them to set up a
	 * window-specific icon list. This function allows you to set up the
	 * icon for all windows in your app at once.
	 * See gtk_window_set_icon_list() for more details.
	 * Params:
	 * list =  a list of GdkPixbuf
	 */
	public static void setDefaultIconList(ListG list);
	
	/**
	 * Sets an icon to be used as fallback for windows that haven't
	 * had gtk_window_set_icon() called on them from a pixbuf.
	 * Since 2.4
	 * Params:
	 * icon =  the icon
	 */
	public static void setDefaultIcon(Pixbuf icon);
	
	/**
	 * Sets an icon to be used as fallback for windows that haven't
	 * had gtk_window_set_icon_list() called on them from a file
	 * on disk. Warns on failure if err is NULL.
	 * Since 2.2
	 * Params:
	 * filename =  location of icon file
	 * Returns: TRUE if setting the icon succeeded.
	 * Throws: GException on failure.
	 */
	public static int setDefaultIconFromFile(string filename);
	
	/**
	 * Sets an icon to be used as fallback for windows that haven't
	 * had gtk_window_set_icon_list() called on them from a named
	 * themed icon, see gtk_window_set_icon_name().
	 * Since 2.6
	 * Params:
	 * name =  the name of the themed icon
	 */
	public static void setDefaultIconName(string name);
	
	/**
	 * Sets up the icon representing a GtkWindow. This icon is used when
	 * the window is minimized (also known as iconified). Some window
	 * managers or desktop environments may also place it in the window
	 * frame, or display it in other contexts.
	 * The icon should be provided in whatever size it was naturally
	 * drawn; that is, don't scale the image before passing it to
	 * GTK+. Scaling is postponed until the last minute, when the desired
	 * final size is known, to allow best quality.
	 * If you have your icon hand-drawn in multiple sizes, use
	 * gtk_window_set_icon_list(). Then the best size will be used.
	 * This function is equivalent to calling gtk_window_set_icon_list()
	 * with a 1-element list.
	 * See also gtk_window_set_default_icon_list() to set the icon
	 * for all windows in your application in one go.
	 * Params:
	 * icon =  icon image, or NULL
	 */
	public void setIcon(Pixbuf icon);
	
	/**
	 * Sets up the icon representing a GtkWindow. The icon is used when
	 * the window is minimized (also known as iconified). Some window
	 * managers or desktop environments may also place it in the window
	 * frame, or display it in other contexts.
	 * gtk_window_set_icon_list() allows you to pass in the same icon in
	 * several hand-drawn sizes. The list should contain the natural sizes
	 * your icon is available in; that is, don't scale the image before
	 * passing it to GTK+. Scaling is postponed until the last minute,
	 * when the desired final size is known, to allow best quality.
	 * By passing several sizes, you may improve the final image quality
	 * of the icon, by reducing or eliminating automatic image scaling.
	 * Recommended sizes to provide: 16x16, 32x32, 48x48 at minimum, and
	 * larger images (64x64, 128x128) if you have them.
	 * See also gtk_window_set_default_icon_list() to set the icon
	 * for all windows in your application in one go.
	 * Note that transient windows (those who have been set transient for another
	 * window using gtk_window_set_transient_for()) will inherit their
	 * icon from their transient parent. So there's no need to explicitly
	 * set the icon on transient windows.
	 * Params:
	 * list =  list of GdkPixbuf
	 */
	public void setIconList(ListG list);
	
	/**
	 * Sets the icon for window.
	 * Warns on failure if err is NULL.
	 * This function is equivalent to calling gtk_window_set_icon()
	 * with a pixbuf created by loading the image from filename.
	 * Since 2.2
	 * Params:
	 * filename =  location of icon file
	 * Returns: TRUE if setting the icon succeeded.
	 * Throws: GException on failure.
	 */
	public int setIconFromFile(string filename);
	
	/**
	 * Sets the icon for the window from a named themed icon. See
	 * the docs for GtkIconTheme for more details.
	 * Note that this has nothing to do with the WM_ICON_NAME
	 * property which is mentioned in the ICCCM.
	 * Since 2.6
	 * Params:
	 * name =  the name of the themed icon
	 */
	public void setIconName(string name);
	
	/**
	 * By default, after showing the first GtkWindow, GTK+ calls
	 * gdk_notify_startup_complete(). Call this function to disable
	 * the automatic startup notification. You might do this if your
	 * first window is a splash screen, and you want to delay notification
	 * until after your real main window has been shown, for example.
	 * In that example, you would disable startup notification
	 * temporarily, show your splash screen, then re-enable it so that
	 * showing the main window would automatically result in notification.
	 * Since 2.2
	 * Params:
	 * setting =  TRUE to automatically do startup notification
	 */
	public static void setAutoStartupNotification(int setting);
	
	/**
	 * Fetches the requested opacity for this window. See
	 * gtk_window_set_opacity().
	 * Since 2.12
	 * Returns: the requested opacity for this window.
	 */
	public double getOpacity();
	
	/**
	 * Request the windowing system to make window partially transparent,
	 * with opacity 0 being fully transparent and 1 fully opaque. (Values
	 * of the opacity parameter are clamped to the [0,1] range.) On X11
	 * this has any effect only on X screens with a compositing manager
	 * running. See gtk_widget_is_composited(). On Windows it should work
	 * always.
	 * Note that setting a window's opacity after the window has been
	 * shown causes it to flicker once on Windows.
	 * Since 2.12
	 * Params:
	 * opacity =  desired opacity, between 0 and 1
	 */
	public void setOpacity(double opacity);
}
