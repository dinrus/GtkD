module gtkD.gdk.Pixmap;

public  import gtkD.gtkc.gdktypes;

private import gtkD.gtkc.gdk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gdk.Drawable;
private import gtkD.gdk.Color;
private import gtkD.gdk.Bitmap;
private import gtkD.gdk.Colormap;



private import gtkD.gdk.Drawable;

/**
 * Description
 * Pixmaps are offscreen drawables. They can be drawn upon with the
 * standard drawing primitives, then copied to another drawable (such as
 * a GdkWindow) with gdk_pixmap_draw(). The depth of a pixmap
 * is the number of bits per pixels. Bitmaps are simply pixmaps
 * with a depth of 1. (That is, they are monochrome bitmaps - each
 * pixel can be either on or off).
 */
public class Pixmap : Drawable
{
	
	/** the main Gtk struct */
	protected GdkPixmap* gdkPixmap;
	
	
	public GdkPixmap* getPixmapStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GdkPixmap* gdkPixmap);
	
	/**
	 */
	
	/**
	 * Create a new pixmap with a given size and depth.
	 * Params:
	 * drawable = A GdkDrawable, used to determine default values
	 * for the new pixmap. Can be NULL if depth is specified,
	 * width = The width of the new pixmap in pixels.
	 * height = The height of the new pixmap in pixels.
	 * depth = The depth (number of bits per pixel) of the new pixmap.
	 *  If -1, and drawable is not NULL, the depth of the new
	 *  pixmap will be equal to that of drawable.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (Drawable drawable, int width, int height, int depth);
	
	/**
	 * Create a two-color pixmap from data in XBM data.
	 * Params:
	 * drawable = a GdkDrawable, used to determine default values
	 * for the new pixmap. Can be NULL, if the depth is given.
	 * data = a pointer to the data.
	 * width = the width of the new pixmap in pixels.
	 * height = the height of the new pixmap in pixels.
	 * depth = the depth (number of bits per pixel) of the new pixmap.
	 * fg = the foreground color.
	 * bg = the background color.
	 * Returns:the GdkPixmap
	 */
	public static Pixmap createFromData(Drawable drawable, string data, int width, int height, int depth, Color fg, Color bg);
	
	/**
	 * Create a pixmap from a XPM file.
	 * Params:
	 * drawable = a GdkDrawable, used to determine default values
	 * for the new pixmap.
	 * mask = a pointer to a place to store a bitmap representing
	 * the transparency mask of the XPM file. Can be NULL,
	 * in which case transparency will be ignored.
	 * transparentColor = the color to be used for the pixels
	 * that are transparent in the input file. Can be NULL,
	 * in which case a default color will be used.
	 * filename = the filename of a file containing XPM data.
	 * Returns:the GdkPixmap
	 */
	public static Pixmap createFromXpm(Drawable drawable, out Bitmap mask, Color transparentColor, string filename);
	
	/**
	 * Create a pixmap from a XPM file using a particular colormap.
	 * Params:
	 * drawable = a GdkDrawable, used to determine default values
	 * for the new pixmap. Can be NULL if colormap is given.
	 * colormap = the GdkColormap that the new pixmap will be use.
	 *  If omitted, the colormap for window will be used.
	 * mask = a pointer to a place to store a bitmap representing
	 * the transparency mask of the XPM file. Can be NULL,
	 * in which case transparency will be ignored.
	 * transparentColor = the color to be used for the pixels
	 * that are transparent in the input file. Can be NULL,
	 * in which case a default color will be used.
	 * filename = the filename of a file containing XPM data.
	 * Returns:the GdkPixmap.
	 */
	public static Pixmap colormapCreateFromXpm(Drawable drawable, Colormap colormap, out Bitmap mask, Color transparentColor, string filename);
	
	/**
	 * Create a pixmap from data in XPM format.
	 * Params:
	 * drawable = a GdkDrawable, used to determine default values
	 * for the new pixmap.
	 * mask = Pointer to a place to store a bitmap representing
	 * the transparency mask of the XPM file. Can be NULL,
	 * in which case transparency will be ignored.
	 * transparentColor = This color will be used for the pixels
	 * that are transparent in the input file. Can be NULL
	 * in which case a default color will be used.
	 * data = Pointer to a string containing the XPM data.
	 * Returns:the GdkPixmap
	 */
	public static Pixmap createFromXpmD(Drawable drawable, out Bitmap mask, Color transparentColor, string[] data);
	
	/**
	 * Create a pixmap from data in XPM format using a particular
	 * colormap.
	 * Params:
	 * drawable = a GdkDrawable, used to determine default values
	 * for the new pixmap. Can be NULL if colormap is given.
	 * colormap = the GdkColormap that the new pixmap will be use.
	 *  If omitted, the colormap for window will be used.
	 * mask = a pointer to a place to store a bitmap representing
	 * the transparency mask of the XPM file. Can be NULL,
	 * in which case transparency will be ignored.
	 * transparentColor = the color to be used for the pixels
	 * that are transparent in the input file. Can be NULL,
	 * in which case a default color will be used.
	 * data = Pointer to a string containing the XPM data.
	 * Returns:the GdkPixmap.
	 */
	public static Pixmap colormapCreateFromXpmD(Drawable drawable, Colormap colormap, out Bitmap mask, Color transparentColor, string[] data);
}
