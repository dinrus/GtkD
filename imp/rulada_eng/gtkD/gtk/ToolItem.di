module gtkD.gtk.ToolItem;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;

private import gtkD.gobject.Signals;
public  import gtkD.gtkc.gdktypes;

private import gtkD.glib.Str;
private import gtkD.gtk.Tooltips;
private import gtkD.gtk.Widget;
private import gtkD.gtk.ActivatableT;
private import gtkD.gtk.ActivatableIF;



private import gtkD.gtk.Bin;

/**
 * Description
 * GtkToolItems are widgets that can appear on a toolbar. To
 * create a toolbar item that contain something else than a button, use
 * gtk_tool_item_new(). Use gtk_container_add() to add a child
 * widget to the tool item.
 * For toolbar items that contain buttons, see the GtkToolButton,
 * GtkToggleToolButton and GtkRadioToolButton classes.
 * See the GtkToolbar class for a description of the toolbar widget, and
 * GtkToolShell for a description of the tool shell interface.
 */
public class ToolItem : Bin, ActivatableIF
{
	
	/** the main Gtk struct */
	protected GtkToolItem* gtkToolItem;
	
	
	public GtkToolItem* getToolItemStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();

	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkToolItem* gtkToolItem);
	
	// add the Activatable capabilities
	mixin ActivatableT!(GtkToolItem);
	
	/**
	 * Sets this widget tooltip
	 * Deprecated: Since 2.12 use setTooltipText() or setTooltipMarkup()
	 * Params:
	 *  tipText = the tooltip
	 *  tipPrivate = a private text
	 */
	override void setTooltip(string tipText, string tipPrivate);
	
	/**
	 */
	int[char[]] connectedSignals;
	
	bool delegate(ToolItem)[] onCreateMenuProxyListeners;
	/**
	 * This signal is emitted when the toolbar needs information from tool_item
	 * about whether the item should appear in the toolbar overflow menu. In
	 * response the tool item should either
	 * call gtk_tool_item_set_proxy_menu_item() with a NULL
	 * pointer and return TRUE to indicate that the item should not appear
	 * in the overflow menu
	 *  call gtk_tool_item_set_proxy_menu_item() with a new menu
	 * item and return TRUE, or
	 *  return FALSE to indicate that the signal was not
	 * handled by the item. This means that
	 * the item will not appear in the overflow menu unless a later handler
	 * installs a menu item.
	 * The toolbar may cache the result of this signal. When the tool item changes
	 * how it will respond to this signal it must call gtk_tool_item_rebuild_menu()
	 * to invalidate the cache and ensure that the toolbar rebuilds its overflow
	 * menu.
	 */
	void addOnCreateMenuProxy(bool delegate(ToolItem) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static gboolean callBackCreateMenuProxy(GtkToolItem* toolItemStruct, ToolItem toolItem);
	
	bool delegate(Tooltips, string, string, ToolItem)[] onSetTooltipListeners;
	/**
	 * This signal is emitted when the toolitem's tooltip changes.
	 * Application developers can use gtk_tool_item_set_tooltip() to
	 * set the item's tooltip.
	 */
	void addOnSetTooltip(bool delegate(Tooltips, string, string, ToolItem) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static gboolean callBackSetTooltip(GtkToolItem* toolItemStruct, GtkTooltips* tooltips, gchar* tipText, gchar* tipPrivate, ToolItem toolItem);
	
	void delegate(ToolItem)[] onToolbarReconfiguredListeners;
	/**
	 * This signal is emitted when some property of the toolbar that the
	 * item is a child of changes. For custom subclasses of GtkToolItem,
	 * the default handler of this signal use the functions
	 * gtk_tool_shell_get_orientation()
	 * gtk_tool_shell_get_style()
	 * gtk_tool_shell_get_icon_size()
	 * gtk_tool_shell_get_relief_style()
	 * to find out what the toolbar should look like and change
	 * themselves accordingly.
	 * See Also
	 * GtkToolbar
	 * The toolbar widget
	 * GtkToolButton
	 * A subclass of GtkToolItem that displays buttons on
	 *  the toolbar
	 * GtkSeparatorToolItem
	 * A subclass of GtkToolItem that separates groups of
	 *  items on a toolbar
	 */
	void addOnToolbarReconfigured(void delegate(ToolItem) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackToolbarReconfigured(GtkToolItem* toolItemStruct, ToolItem toolItem);
	
	
	/**
	 * Creates a new GtkToolItem
	 * Since 2.4
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this ();
	
	/**
	 * Sets whether tool_item is to be allocated the same size as other
	 * homogeneous items. The effect is that all homogeneous items will have
	 * the same width as the widest of the items.
	 * Since 2.4
	 * Params:
	 * homogeneous =  whether tool_item is the same size as other homogeneous items
	 */
	public void setHomogeneous(int homogeneous);
	
	/**
	 * Returns whether tool_item is the same size as other homogeneous
	 * items. See gtk_tool_item_set_homogeneous().
	 * Since 2.4
	 * Returns: TRUE if the item is the same size as other homogeneousitems.
	 */
	public int getHomogeneous();
	/**
	 * Sets whether tool_item is allocated extra space when there
	 * is more room on the toolbar then needed for the items. The
	 * effect is that the item gets bigger when the toolbar gets bigger
	 * and smaller when the toolbar gets smaller.
	 * Since 2.4
	 * Params:
	 * expand =  Whether tool_item is allocated extra space
	 */
	public void setExpand(int expand);
	
	/**
	 * Returns whether tool_item is allocated extra space.
	 * See gtk_tool_item_set_expand().
	 * Since 2.4
	 * Returns: TRUE if tool_item is allocated extra space.
	 */
	public int getExpand();
	/**
	 * Warning
	 * gtk_tool_item_set_tooltip has been deprecated since version 2.12 and should not be used in newly-written code. Use gtk_tool_item_set_tooltip_text() instead.
	 * Sets the GtkTooltips object to be used for tool_item, the
	 * text to be displayed as tooltip on the item and the private text
	 * to be used. See gtk_tooltips_set_tip().
	 * Since 2.4
	 * Params:
	 * tooltips =  The GtkTooltips object to be used
	 * tipText =  text to be used as tooltip text for tool_item
	 * tipPrivate =  text to be used as private tooltip text
	 */
	public void setTooltip(Tooltips tooltips, string tipText, string tipPrivate);
	
	/**
	 * Sets the text to be displayed as tooltip on the item.
	 * See gtk_widget_set_tooltip_text().
	 * Since 2.12
	 * Params:
	 * text =  text to be used as tooltip for tool_item
	 */
	public override void setTooltipText(string text);
	
	/**
	 * Sets the markup text to be displayed as tooltip on the item.
	 * See gtk_widget_set_tooltip_markup().
	 * Since 2.12
	 * Params:
	 * markup =  markup text to be used as tooltip for tool_item
	 */
	public override void setTooltipMarkup(string markup);
	
	/**
	 * Sets whether tool_item has a drag window. When TRUE the
	 * toolitem can be used as a drag source through gtk_drag_source_set().
	 * When tool_item has a drag window it will intercept all events,
	 * even those that would otherwise be sent to a child of tool_item.
	 * Since 2.4
	 * Params:
	 * useDragWindow =  Whether tool_item has a drag window.
	 */
	public void setUseDragWindow(int useDragWindow);
	
	/**
	 * Returns whether tool_item has a drag window. See
	 * gtk_tool_item_set_use_drag_window().
	 * Since 2.4
	 * Returns: TRUE if tool_item uses a drag window.
	 */
	public int getUseDragWindow();
	
	/**
	 * Sets whether tool_item is visible when the toolbar is docked horizontally.
	 * Since 2.4
	 * Params:
	 * visibleHorizontal =  Whether tool_item is visible when in horizontal mode
	 */
	public void setVisibleHorizontal(int visibleHorizontal);
	
	/**
	 * Returns whether the tool_item is visible on toolbars that are
	 * docked horizontally.
	 * Since 2.4
	 * Returns: TRUE if tool_item is visible on toolbars that aredocked horizontally.
	 */
	public int getVisibleHorizontal();
	
	/**
	 * Sets whether tool_item is visible when the toolbar is docked
	 * vertically. Some tool items, such as text entries, are too wide to be
	 * useful on a vertically docked toolbar. If visible_vertical is FALSE
	 * tool_item will not appear on toolbars that are docked vertically.
	 * Since 2.4
	 * Params:
	 * visibleVertical =  whether tool_item is visible when the toolbar
	 * is in vertical mode
	 */
	public void setVisibleVertical(int visibleVertical);
	
	/**
	 * Returns whether tool_item is visible when the toolbar is docked vertically.
	 * See gtk_tool_item_set_visible_vertical().
	 * Since 2.4
	 * Returns: Whether tool_item is visible when the toolbar is docked vertically
	 */
	public int getVisibleVertical();
	
	/**
	 * Sets whether tool_item should be considered important. The GtkToolButton
	 * class uses this property to determine whether to show or hide its label
	 * when the toolbar style is GTK_TOOLBAR_BOTH_HORIZ. The result is that
	 * only tool buttons with the "is_important" property set have labels, an
	 * effect known as "priority text"
	 * Since 2.4
	 * Params:
	 * isImportant =  whether the tool item should be considered important
	 */
	public void setIsImportant(int isImportant);
	
	/**
	 * Returns whether tool_item is considered important. See
	 * gtk_tool_item_set_is_important()
	 * Since 2.4
	 * Returns: TRUE if tool_item is considered important.
	 */
	public int getIsImportant();
	
	/**
	 * Returns the icon size used for tool_item. Custom subclasses of
	 * GtkToolItem should call this function to find out what size icons
	 * they should use.
	 * Since 2.4
	 * Returns: a GtkIconSize indicating the icon size used for tool_item
	 */
	public GtkIconSize getIconSize();
	
	/**
	 * Returns the orientation used for tool_item. Custom subclasses of
	 * GtkToolItem should call this function to find out what size icons
	 * they should use.
	 * Since 2.4
	 * Returns: a GtkOrientation indicating the orientationused for tool_item
	 */
	public GtkOrientation getOrientation();
	
	/**
	 * Returns the toolbar style used for tool_item. Custom subclasses of
	 * GtkToolItem should call this function in the handler of the
	 * GtkToolItem::toolbar_reconfigured signal to find out in what style
	 * the toolbar is displayed and change themselves accordingly
	 * Since 2.4
	 * Returns: A GtkToolbarStyle indicating the toolbar style usedfor tool_item.
	 */
	public GtkToolbarStyle getToolbarStyle();
	
	/**
	 * Returns the relief style of tool_item. See gtk_button_set_relief_style().
	 * Custom subclasses of GtkToolItem should call this function in the handler
	 * of the "toolbar_reconfigured" signal to find out the
	 * relief style of buttons.
	 * Since 2.4
	 * Returns: a GtkReliefStyle indicating the relief style usedfor tool_item.
	 */
	public GtkReliefStyle getReliefStyle();
	
	/**
	 * Returns the GtkMenuItem that was last set by
	 * gtk_tool_item_set_proxy_menu_item(), ie. the GtkMenuItem
	 * that is going to appear in the overflow menu.
	 * Since 2.4
	 * Returns: The GtkMenuItem that is going to appear in theoverflow menu for tool_item.
	 */
	public Widget retrieveProxyMenuItem();
	
	/**
	 * If menu_item_id matches the string passed to
	 * gtk_tool_item_set_proxy_menu_item() return the corresponding GtkMenuItem.
	 * Custom subclasses of GtkToolItem should use this function to update
	 * their menu item when the GtkToolItem changes. That the
	 * menu_item_ids must match ensures that a GtkToolItem will not
	 * inadvertently change a menu item that they did not create.
	 * Since 2.4
	 * Params:
	 * menuItemId =  a string used to identify the menu item
	 * Returns: The GtkMenuItem passed togtk_tool_item_set_proxy_menu_item(), if the menu_item_ids match.
	 */
	public Widget getProxyMenuItem(string menuItemId);
	
	/**
	 * Sets the GtkMenuItem used in the toolbar overflow menu. The
	 * menu_item_id is used to identify the caller of this function and
	 * should also be used with gtk_tool_item_get_proxy_menu_item().
	 * Since 2.4
	 * Params:
	 * menuItemId =  a string used to identify menu_item
	 * menuItem =  a GtkMenuItem to be used in the overflow menu
	 */
	public void setProxyMenuItem(string menuItemId, Widget menuItem);
	
	/**
	 * Calling this function signals to the toolbar that the
	 * overflow menu item for tool_item has changed. If the
	 * overflow menu is visible when this function it called,
	 * the menu will be rebuilt.
	 * The function must be called when the tool item
	 * changes what it will do in response to the "create_menu_proxy"
	 * signal.
	 * Since 2.6
	 */
	public void rebuildMenu();
	/**
	 * Emits the signal "toolbar_reconfigured" on tool_item.
	 * GtkToolbar and other GtkToolShell implementations use this function
	 * to notify children, when some aspect of their configuration changes.
	 * Since 2.14
	 */
	public void toolbarReconfigured();
}
