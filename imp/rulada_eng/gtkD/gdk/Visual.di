module gtkD.gdk.Visual;

public  import gtkD.gtkc.gdktypes;

private import gtkD.gtkc.gdk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.ListG;
private import gtkD.gdk.Screen;




/**
 * Description
 * A GdkVisual describes a particular video hardware display format. It includes
 * information about the number of bits used for each color, the way the bits are
 * translated into an RGB value for display, and the way the bits are stored in
 * memory. For example, a piece of display hardware might support 24-bit color,
 * 16-bit color, or 8-bit color; meaning 24/16/8-bit pixel sizes. For a given
 * pixel size, pixels can be in different formats; for example the "red" element
 * of an RGB pixel may be in the top 8 bits of the pixel, or may be in the lower
 * 4 bits.
 * Usually you can avoid thinking about visuals in GTK+. Visuals are useful to
 * interpret the contents of a GdkImage, but you should avoid GdkImage precisely
 * because its contents depend on the display hardware; use GdkPixbuf instead, for
 * all but the most low-level purposes. Also, anytime you provide a GdkColormap,
 * the visual is implied as part of the colormap (gdk_colormap_get_visual()), so
 * you won't have to provide a visual in addition.
 * There are several standard visuals. The visual returned
 * by gdk_visual_get_system() is the system's default
 * visual. gdk_rgb_get_visual() return the visual most
 * suited to displaying full-color image data. If you
 * use the calls in GdkRGB, you should create your windows
 * using this visual (and the colormap returned by
 * gdk_rgb_get_colormap()).
 * A number of functions are provided for determining
 * the "best" available visual. For the purposes of
 * making this determination, higher bit depths are
 * considered better, and for visuals of the same
 * bit depth, GDK_VISUAL_PSEUDO_COLOR is preferred at
 * 8bpp, otherwise, the visual types are ranked in the
 * order of (highest to lowest) GDK_VISUAL_DIRECT_COLOR,
 * GDK_VISUAL_TRUE_COLOR, GDK_VISUAL_PSEUDO_COLOR,
 * GDK_VISUAL_STATIC_COLOR, GDK_VISUAL_GRAYSCALE,
 * then GDK_VISUAL_STATIC_GRAY.
 */
public class Visual
{
	
	/** the main Gtk struct */
	protected GdkVisual* gdkVisual;
	
	
	public GdkVisual* getVisualStruct();
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GdkVisual* gdkVisual);
	
	/**
	 * This function returns the available bit depths for the default
	 * screen. It's equivalent to listing the visuals
	 * (gdk_list_visuals()) and then looking at the depth field in each
	 * visual, removing duplicates.
	 * The array returned by this function should not be freed.
	 * Params:
	 * depths =  return location for available depths
	 */
	public static void gdkQueryDepths(out int[] depths);
	
	/**
	 */
	
	/**
	 * This function returns the available visual types for the default
	 * screen. It's equivalent to listing the visuals
	 * (gdk_list_visuals()) and then looking at the type field in each
	 * visual, removing duplicates.
	 * The array returned by this function should not be freed.
	 * Params:
	 * visualTypes =  return location for the available visual types
	 */
	public static void gdkQueryVisualTypes(out GdkVisualType[] visualTypes);
	
	/**
	 * Lists the available visuals for the default screen.
	 * (See gdk_screen_list_visuals())
	 * A visual describes a hardware image data format.
	 * For example, a visual might support 24-bit color, or 8-bit color,
	 * and might expect pixels to be in a certain format.
	 * Call g_list_free() on the return value when you're finished with it.
	 * Returns: a list of visuals; the list must be freed, but not its contents
	 */
	public static ListG gdkListVisuals();
	
	/**
	 * Get the best available depth for the default GDK screen. "Best"
	 * means "largest," i.e. 32 preferred over 24 preferred over 8 bits
	 * per pixel.
	 * Returns: best available depth
	 */
	public static int getBestDepth();
	
	/**
	 * Return the best available visual type for the default GDK screen.
	 * Returns: best visual type
	 */
	public static GdkVisualType getBestType();
	
	/**
	 * Get the system'sdefault visual for the default GDK screen.
	 * This is the visual for the root window of the display.
	 * The return value should not be freed.
	 * Returns: system visual
	 */
	public static Visual getSystem();
	
	/**
	 * Get the visual with the most available colors for the default
	 * GDK screen. The return value should not be freed.
	 * Returns: best visual
	 */
	public static Visual getBest();
	
	/**
	 * Get the best visual with depth depth for the default GDK screen.
	 * Color visuals and visuals with mutable colormaps are preferred
	 * over grayscale or fixed-colormap visuals. The return value should not
	 * be freed. NULL may be returned if no visual supports depth.
	 * Params:
	 * depth =  a bit depth
	 * Returns: best visual for the given depth
	 */
	public static Visual getBestWithDepth(int depth);
	
	/**
	 * Get the best visual of the given visual_type for the default GDK screen.
	 * Visuals with higher color depths are considered better. The return value
	 * should not be freed. NULL may be returned if no visual has type
	 * visual_type.
	 * Params:
	 * visualType =  a visual type
	 * Returns: best visual of the given type
	 */
	public static Visual getBestWithType(GdkVisualType visualType);
	
	/**
	 * Combines gdk_visual_get_best_with_depth() and gdk_visual_get_best_with_type().
	 * Params:
	 * depth =  a bit depth
	 * visualType =  a visual type
	 * Returns: best visual with both depth and visual_type, or NULL if none
	 */
	public static Visual getBestWithBoth(int depth, GdkVisualType visualType);
	
	/**
	 * Gets the screen to which this visual belongs
	 * Since 2.2
	 * Returns: the screen to which this visual belongs.
	 */
	public Screen getScreen();
}
