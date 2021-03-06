module gtkD.gtk.CellRendererSpin;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;


private import gtkD.gtk.CellRenderer;



private import gtkD.gtk.CellRendererText;

/**
 * Description
 * GtkCellRendererSpin renders text in a cell like GtkCellRendererText from
 * which it is derived. But while GtkCellRendererText offers a simple entry to
 * edit the text, GtkCellRendererSpin offers a GtkSpinButton widget. Of course,
 * that means that the text has to be parseable as a floating point number.
 * The range of the spinbutton is taken from the adjustment property of the
 * cell renderer, which can be set explicitly or mapped to a column in the
 * tree model, like all properties of cell renders. GtkCellRendererSpin
 * also has properties for the climb rate and the number of digits to
 * display. Other GtkSpinButton properties can be set in a handler for the
 * start-editing signal.
 * The GtkCellRendererSpin cell renderer was added in GTK+ 2.10.
 */
public class CellRendererSpin : CellRendererText
{
	
	/** the main Gtk struct */
	protected GtkCellRendererSpin* gtkCellRendererSpin;
	
	
	public GtkCellRendererSpin* getCellRendererSpinStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkCellRendererSpin* gtkCellRendererSpin);
	
	/**
	 */
	
	/**
	 * Creates a new GtkCellRendererSpin.
	 * Since 2.10
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this ();
}
