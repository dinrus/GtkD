module gtkD.glib.Timeout;

public  import gtkD.gtkc.glibtypes;

private import gtkD.gtkc.glib;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Source;




/**
 * Description
 *  The main event loop manages all the available sources of events for
 *  GLib and GTK+ applications. These events can come from any number of
 *  different types of sources such as file descriptors (plain files,
 *  pipes or sockets) and timeouts. New types of event sources can also
 *  be added using g_source_attach().
 *  To allow multiple independent sets of sources to be handled in
 *  different threads, each source is associated with a GMainContext.
 *  A GMainContext can only be running in a single thread, but
 *  sources can be added to it and removed from it from other threads.
 *  Each event source is assigned a priority. The default priority,
 *  G_PRIORITY_DEFAULT, is 0. Values less than 0 denote higher
 *  priorities. Values greater than 0 denote lower priorities. Events
 *  from high priority sources are always processed before events from
 *  lower priority sources.
 *  Idle functions can also be added, and assigned a priority. These will
 *  be run whenever no events with a higher priority are ready to be
 *  processed.
 *  The GMainLoop data type represents a main event loop. A GMainLoop
 *  is created with g_main_loop_new(). After adding the initial event sources,
 *  g_main_loop_run() is called. This continuously checks for new events from
 *  each of the event sources and dispatches them. Finally, the
 *  processing of an event from one of the sources leads to a call to
 *  g_main_loop_quit() to exit the main loop, and g_main_loop_run() returns.
 *  It is possible to create new instances of GMainLoop recursively.
 *  This is often used in GTK+ applications when showing modal dialog
 *  boxes. Note that event sources are associated with a particular
 *  GMainContext, and will be checked and dispatched for all main
 *  loops associated with that GMainContext.
 *  GTK+ contains wrappers of some of these functions, e.g. gtk_main(),
 *  gtk_main_quit() and gtk_events_pending().
 * Creating new sources types
 *  One of the unusual features of the GTK+ main loop functionality
 *  is that new types of event source can be created and used in
 *  addition to the builtin type of event source. A new event source
 *  type is used for handling GDK events. A new source type is
 *  created by deriving from the GSource
 *  structure. The derived type of source is represented by a
 *  structure that has the GSource structure as a first element,
 *  and other elements specific to the new source type. To create
 *  an instance of the new source type, call g_source_new() passing
 *  in the size of the derived structure and a table of functions.
 *  These GSourceFuncs determine the behavior of the new source
 *  types.
 *  New source types basically interact with the main context
 *  in two ways. Their prepare function in GSourceFuncs can set
 *  a timeout to determine the maximum amount of time that the
 *  main loop will sleep before checking the source again. In
 *  addition, or as well, the source can add file descriptors to
 *  the set that the main context checks using g_source_add_poll().
 * <hr>
 * Customizing the main loop iteration
 *  Single iterations of a GMainContext can be run with
 *  g_main_context_iteration(). In some cases, more detailed control
 *  of exactly how the details of the main loop work is desired,
 *  for instance, when integrating the GMainLoop with an external
 *  main loop. In such cases, you can call the component functions
 *  of g_main_context_iteration() directly. These functions
 *  are g_main_context_prepare(), g_main_context_query(),
 *  g_main_context_check() and g_main_context_dispatch().
 *  The operation of these functions can best be seen in terms
 *  of a state diagram, as shown in Figure 1, “States of a Main Context”.
 * Figure 1. States of a Main Context
 */
public class Timeout
{
	
	/** Holds all timeout delegates */
	bool delegate()[] timeoutListeners;
	/** our gtk timeout ID */
	uint timeoutID;
	
	
	/**
	 * Creates a new timeout cycle with the default priority, GPriority.DEFAULT.
	 *
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next timeout is
	 * recalculated based on the current time and the given interval
	 * (it does not try to 'catch up' time lost in delays).
	 * Params:
	 *    	interval = 	the timeout in milieconds
	 *    	delegate() = 	the delegate to be executed
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(uint interval, bool delegate() dlg, bool fireNow=false);
	
	/**
	 * Creates a new timeout cycle.
	 * Params:
	 *    	interval = 	the timeout in milieconds
	 *    	delegate() = 	the delegate to be executed
	 *      priority = Priority for the timeout function
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(uint interval, bool delegate() dlg, GPriority priority, bool fireNow=false);
	
	/**
	 * Creates a new timeout cycle with the default priority, GPriority.DEFAULT.
	 * Params:
	 *    	delegate() = 	the delegate to be executed
	 *      seconds = interval in seconds.
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(bool delegate() dlg, uint seconds, bool fireNow=false);
	
	/**
	 * Creates a new timeout cycle.
	 * Params:
	 *    	delegate() = 	the delegate to be executed
	 *      seconds = interval in seconds.
	 *      priority = Priority for the timeout function
	 *    	fireNow = 	When true the delegate will be executed emmidiatly
	 */
	this(bool delegate() dlg, uint seconds, GPriority priority, bool fireNow=false);
	
	/** */
	public void stop();
	
	/**
	 * Removes the timeout from gtk
	 */
	~this();
	
	/**
	 * Adds a new delegate to this timeout cycle
	 * Params:
	 *    	dlg =
	 *    	fireNow =
	 */
	public void addListener(bool delegate() dlg, bool fireNow=false);
	
	/**
	 * The callback execution from glib
	 * Params:
	 *    	timeout =
	 * Returns:
	 */
	extern(C) static bool timeoutCallback(Timeout timeout);
	
	/**
	 * Executes all delegates on the execution list
	 * Returns:
	 */
	private bool callAllListeners();
	
	/**
	 */
	
	/**
	 * Creates a new timeout source.
	 * The source will not initially be associated with any GMainContext
	 * and must be added to one with g_source_attach() before it will be
	 * executed.
	 * Params:
	 * interval =  the timeout interval in milliseconds.
	 * Returns: the newly-created timeout source
	 */
	public static Source sourceNew(uint interval);
	
	/**
	 * Creates a new timeout source.
	 * The source will not initially be associated with any GMainContext
	 * and must be added to one with g_source_attach() before it will be
	 * executed.
	 * The scheduling granularity/accuracy of this timeout source will be
	 * in seconds.
	 * Since 2.14
	 * Params:
	 * interval =  the timeout interval in seconds
	 * Returns: the newly-created timeout source
	 */
	public static Source sourceNewSeconds(uint interval);
	
	/**
	 * Sets a function to be called at regular intervals, with the default
	 * priority, G_PRIORITY_DEFAULT. The function is called repeatedly
	 * until it returns FALSE, at which point the timeout is automatically
	 * destroyed and the function will not be called again. The first call
	 * to the function will be at the end of the first interval.
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next
	 * timeout is recalculated based on the current time and the given interval
	 * (it does not try to 'catch up' time lost in delays).
	 * If you want to have a timer in the "seconds" range and do not care
	 * about the exact time of the first call of the timer, use the
	 * g_timeout_add_seconds() function; this function allows for more
	 * optimizations and more efficient system power usage.
	 * This internally creates a main loop source using g_timeout_source_new()
	 * and attaches it to the main loop context using g_source_attach(). You can
	 * do these steps manually if you need greater control.
	 * Params:
	 * interval =  the time between calls to the function, in milliseconds
	 *  (1/1000ths of a second)
	 * data =  data to pass to function
	 * Returns: the ID (greater than 0) of the event source.
	 */
	public static uint add(uint interval, GSourceFunc funct, void* data);
	
	/**
	 * Sets a function to be called at regular intervals, with the given
	 * priority. The function is called repeatedly until it returns
	 * FALSE, at which point the timeout is automatically destroyed and
	 * the function will not be called again. The notify function is
	 * called when the timeout is destroyed. The first call to the
	 * function will be at the end of the first interval.
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next
	 * timeout is recalculated based on the current time and the given interval
	 * (it does not try to 'catch up' time lost in delays).
	 * This internally creates a main loop source using g_timeout_source_new()
	 * and attaches it to the main loop context using g_source_attach(). You can
	 * do these steps manually if you need greater control.
	 * Params:
	 * priority =  the priority of the timeout source. Typically this will be in
	 *  the range between G_PRIORITY_DEFAULT and G_PRIORITY_HIGH.
	 * interval =  the time between calls to the function, in milliseconds
	 *  (1/1000ths of a second)
	 * data =  data to pass to function
	 * notify =  function to call when the timeout is removed, or NULL
	 * Returns: the ID (greater than 0) of the event source.
	 */
	public static uint addFull(int priority, uint interval, GSourceFunc funct, void* data, GDestroyNotify notify);
	
	/**
	 * Sets a function to be called at regular intervals with the default
	 * priority, G_PRIORITY_DEFAULT. The function is called repeatedly until
	 * it returns FALSE, at which point the timeout is automatically destroyed
	 * and the function will not be called again.
	 * This internally creates a main loop source using
	 * g_timeout_source_new_seconds() and attaches it to the main loop context
	 * using g_source_attach(). You can do these steps manually if you need
	 * greater control. Also see g_timout_add_seconds_full().
	 * Since 2.14
	 * Params:
	 * interval =  the time between calls to the function, in seconds
	 * data =  data to pass to function
	 * Returns: the ID (greater than 0) of the event source.
	 */
	public static uint addSeconds(uint interval, GSourceFunc funct, void* data);
	
	/**
	 * Sets a function to be called at regular intervals, with priority.
	 * The function is called repeatedly until it returns FALSE, at which
	 * point the timeout is automatically destroyed and the function will
	 * not be called again.
	 * Unlike g_timeout_add(), this function operates at whole second granularity.
	 * The initial starting point of the timer is determined by the implementation
	 * and the implementation is expected to group multiple timers together so that
	 * they fire all at the same time.
	 * To allow this grouping, the interval to the first timer is rounded
	 * and can deviate up to one second from the specified interval.
	 * Subsequent timer iterations will generally run at the specified interval.
	 * Note that timeout functions may be delayed, due to the processing of other
	 * event sources. Thus they should not be relied on for precise timing.
	 * After each call to the timeout function, the time of the next
	 * timeout is recalculated based on the current time and the given interval
	 * If you want timing more precise than whole seconds, use g_timeout_add()
	 * instead.
	 * The grouping of timers to fire at the same time results in a more power
	 * and CPU efficient behavior so if your timer is in multiples of seconds
	 * and you don't require the first timer exactly one second from now, the
	 * use of g_timeout_add_seconds() is preferred over g_timeout_add().
	 * This internally creates a main loop source using
	 * g_timeout_source_new_seconds() and attaches it to the main loop context
	 * using g_source_attach(). You can do these steps manually if you need
	 * greater control.
	 * Since 2.14
	 * Params:
	 * priority =  the priority of the timeout source. Typically this will be in
	 *  the range between G_PRIORITY_DEFAULT and G_PRIORITY_HIGH.
	 * interval =  the time between calls to the function, in seconds
	 * data =  data to pass to function
	 * notify =  function to call when the timeout is removed, or NULL
	 * Returns: the ID (greater than 0) of the event source.
	 */
	public static uint addSecondsFull(int priority, uint interval, GSourceFunc funct, void* data, GDestroyNotify notify);
}
