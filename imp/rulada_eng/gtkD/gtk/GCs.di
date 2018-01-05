module gtkD.gtk.GCs;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;


private import gtkD.gdk.GC;
private import gtkD.gdk.Colormap;




/**
 * Description
 * These functions provide access to a shared pool of GdkGC objects.
 * When a new GdkGC is needed, gtk_gc_get() is called with the required depth,
 * colormap and GdkGCValues. If a GdkGC with the required properties already
 * exists then that is returned. If not, a new GdkGC is created.
 * When the GdkGC is no longer needed, gtk_gc_release() should be called.
 */
public class GCs
{
	
	/**
	 */
	
	/**
	 * Gets a GdkGC with the given depth, colormap and GdkGCValues.
	 * If a GdkGC with the given properties already exists then it is returned,
	 * otherwise a new GdkGC is created.
	 * The returned GdkGC should be released with gtk_gc_release() when it is no
	 * longer needed.
	 * Params:
	 * depth = the depth of the GdkGC to create.
	 * colormap = the GdkColormap (FIXME: I don't know why this is needed).
	 * values = a GdkGCValues struct containing settings for the GdkGC.
	 * valuesMask = a set of flags indicating which of the fields in values has
	 * been set.
	 * Returns:a GdkGC.
	 */
	public static GC get(int depth, Colormap colormap, GdkGCValues* values, GdkGCValuesMask valuesMask);
	
	/**
	 * Releases a GdkGC allocated using gtk_gc_get().
	 * Params:
	 * gc = a GdkGC.
	 */
	public static void release(GC gc);
}
