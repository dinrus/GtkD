module gtkD.cairo.PostScriptSurface;

public  import gtkD.gtkc.cairotypes;

private import gtkD.gtkc.cairo;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;



private import gtkD.cairo.Surface;

/**
 * Description
 * The PostScript surface is used to render cairo graphics to Adobe
 * PostScript files and is a multi-page vector surface backend.
 */
public class PostScriptSurface : Surface
{
	
	/** the main Gtk struct */
	protected cairo_surface_t* cairo_surface;
	
	
	public cairo_surface_t* getPostScriptSurfaceStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (cairo_surface_t* cairo_surface);
	
	/**
	 */
	
	/**
	 * Creates a PostScript surface of the specified size in points to be
	 * written to filename. See cairo_ps_surface_create_for_stream() for
	 * a more flexible mechanism for handling the PostScript output than
	 * simply writing it to a named file.
	 * Note that the size of individual pages of the PostScript output can
	 * vary. See cairo_ps_surface_set_size().
	 * Since 1.2
	 * Params:
	 * filename =  a filename for the PS output (must be writable)
	 * widthInPoints =  width of the surface, in points (1 point == 1/72.0 inch)
	 * heightInPoints =  height of the surface, in points (1 point == 1/72.0 inch)
	 * Returns: a pointer to the newly created surface. The callerowns the surface and should call cairo_surface_destroy() when donewith it.This function always returns a valid pointer, but it will return apointer to a "nil" surface if an error such as out of memoryoccurs. You can use cairo_surface_status() to check for this.
	 */
	public static PostScriptSurface create(string filename, double widthInPoints, double heightInPoints);
	
	/**
	 * Creates a PostScript surface of the specified size in points to be
	 * written incrementally to the stream represented by write_func and
	 * closure. See cairo_ps_surface_create() for a more convenient way
	 * to simply direct the PostScript output to a named file.
	 * Note that the size of individual pages of the PostScript
	 * output can vary. See cairo_ps_surface_set_size().
	 * Since 1.2
	 * Params:
	 * writeFunc =  a cairo_write_func_t to accept the output data
	 * closure =  the closure argument for write_func
	 * widthInPoints =  width of the surface, in points (1 point == 1/72.0 inch)
	 * heightInPoints =  height of the surface, in points (1 point == 1/72.0 inch)
	 * Returns: a pointer to the newly created surface. The callerowns the surface and should call cairo_surface_destroy() when donewith it.This function always returns a valid pointer, but it will return apointer to a "nil" surface if an error such as out of memoryoccurs. You can use cairo_surface_status() to check for this.
	 */
	public static PostScriptSurface createForStream(cairo_write_func_t writeFunc, void* closure, double widthInPoints, double heightInPoints);
	
	/**
	 * Restricts the generated PostSript file to level. See
	 * cairo_ps_get_levels() for a list of available level values that
	 * can be used here.
	 * This function should only be called before any drawing operations
	 * have been performed on the given surface. The simplest way to do
	 * this is to call this function immediately after creating the
	 * surface.
	 * Since 1.6
	 * Params:
	 * level =  PostScript level
	 */
	public void restrictToLevel(cairo_ps_level_t level);
	
	/**
	 * Used to retrieve the list of supported levels. See
	 * cairo_ps_surface_restrict_to_level().
	 * Since 1.6
	 * Params:
	 * levels =  supported level list
	 */
	public static void getLevels(out cairo_ps_level_t[] levels);
	
	/**
	 * Get the string representation of the given level id. This function
	 * will return NULL if level id isn't valid. See cairo_ps_get_levels()
	 * for a way to get the list of valid level ids.
	 * Since 1.6
	 * Params:
	 * level =  a level id
	 * Returns: the string associated to given level.
	 */
	public static string levelToString(cairo_ps_level_t level);
	
	/**
	 * If eps is TRUE, the PostScript surface will output Encapsulated
	 * PostScript.
	 * This function should only be called before any drawing operations
	 * have been performed on the current page. The simplest way to do
	 * this is to call this function immediately after creating the
	 * surface. An Encapsulated PostScript file should never contain more
	 * than one page.
	 * Since 1.6
	 * Params:
	 * eps =  TRUE to output EPS format PostScript
	 */
	public void setEps(cairo_bool_t eps);
	
	/**
	 * Check whether the PostScript surface will output Encapsulated PostScript.
	 * Since 1.6
	 * Returns: TRUE if the surface will output Encapsulated PostScript.
	 */
	public cairo_bool_t getEps();
	
	/**
	 * Changes the size of a PostScript surface for the current (and
	 * subsequent) pages.
	 * This function should only be called before any drawing operations
	 * have been performed on the current page. The simplest way to do
	 * this is to call this function immediately after creating the
	 * surface or immediately after completing a page with either
	 * cairo_show_page() or cairo_copy_page().
	 * Since 1.2
	 * Params:
	 * widthInPoints =  new surface width, in points (1 point == 1/72.0 inch)
	 * heightInPoints =  new surface height, in points (1 point == 1/72.0 inch)
	 */
	public void setSize(double widthInPoints, double heightInPoints);
	
	/**
	 * This function indicates that subsequent calls to
	 * cairo_ps_surface_dsc_comment() should direct comments to the Setup
	 * section of the PostScript output.
	 * This function should be called at most once per surface, and must
	 * be called before any call to cairo_ps_surface_dsc_begin_page_setup()
	 * and before any drawing is performed to the surface.
	 * See cairo_ps_surface_dsc_comment() for more details.
	 * Since 1.2
	 */
	public void dscBeginSetup();
	
	/**
	 * This function indicates that subsequent calls to
	 * cairo_ps_surface_dsc_comment() should direct comments to the
	 * PageSetup section of the PostScript output.
	 * This function call is only needed for the first page of a
	 * surface. It should be called after any call to
	 * cairo_ps_surface_dsc_begin_setup() and before any drawing is
	 * performed to the surface.
	 * See cairo_ps_surface_dsc_comment() for more details.
	 * Since 1.2
	 */
	public void dscBeginPageSetup();
	
	/**
	 * Emit a comment into the PostScript output for the given surface.
	 * The comment is expected to conform to the PostScript Language
	 * Document Structuring Conventions (DSC). Please see that manual for
	 * details on the available comments and their meanings. In
	 * particular, the %IncludeFeature comment allows a
	 * device-independent means of controlling printer device features. So
	 * the PostScript Printer Description Files Specification will also be
	 * a useful reference.
	 * The comment string must begin with a percent character (%) and the
	 * total length of the string (including any initial percent
	 * characters) must not exceed 255 characters. Violating either of
	 * these conditions will place surface into an error state. But
	 * beyond these two conditions, this function will not enforce
	 * conformance of the comment with any particular specification.
	 * The comment string should not have a trailing newline.
	 * The DSC specifies different sections in which particular comments
	 * can appear. This function provides for comments to be emitted
	 * within three sections: the header, the Setup section, and the
	 * PageSetup section. Comments appearing in the first two sections
	 * apply to the entire document while comments in the BeginPageSetup
	 * section apply only to a single page.
	 * For comments to appear in the header section, this function should
	 * be called after the surface is created, but before a call to
	 * cairo_ps_surface_begin_setup().
	 * For comments to appear in the Setup section, this function should
	 * be called after a call to cairo_ps_surface_begin_setup() but before
	 * a call to cairo_ps_surface_begin_page_setup().
	 * For comments to appear in the PageSetup section, this function
	 * should be called after a call to cairo_ps_surface_begin_page_setup().
	 * Note that it is only necessary to call cairo_ps_surface_begin_page_setup()
	 * for the first page of any surface. After a call to
	 * cairo_show_page() or cairo_copy_page() comments are unambiguously
	 * directed to the PageSetup section of the current page. But it
	 * doesn't hurt to call this function at the beginning of every page
	 * as that consistency may make the calling code simpler.
	 * As a final note, cairo automatically generates several comments on
	 * its own. As such, applications must not manually generate any of
	 * Since 1.2
	 * Params:
	 * comment =  a comment string to be emitted into the PostScript output
	 */
	public void dscComment(string comment);
}
