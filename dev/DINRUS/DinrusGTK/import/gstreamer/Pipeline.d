module gtkD.gstreamer.Pipeline;

public  import gtkD.gstreamerc.gstreamertypes;

private import gtkD.gstreamerc.gstreamer;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gstreamer.Element;
private import gtkD.gstreamer.Clock;
private import gtkD.gstreamer.Bus;



private import gtkD.gstreamer.Bin;

/**
 * Description
 * A GstPipeline is a special GstBin used as the toplevel container for
 * the filter graph. The GstPipeline will manage the selection and
 * distribution of a global GstClock as well as provide a GstBus to the
 * application. It will also implement a default behavour for managing
 * seek events (see gst_element_seek()).
 * gst_pipeline_new() is used to create a pipeline. when you are done with
 * the pipeline, use gst_object_unref() to free its resources including all
 * added GstElement objects (if not otherwise referenced).
 * Elements are added and removed from the pipeline using the GstBin
 * methods like gst_bin_add() and gst_bin_remove() (see GstBin).
 * Before changing the state of the GstPipeline (see GstElement) a GstBus
 * can be retrieved with gst_pipeline_get_bus(). This bus can then be
 * used to receive GstMessage from the elements in the pipeline.
 * By default, a GstPipeline will automatically flush the pending GstBus
 * messages when going to the NULL state to ensure that no circular
 * references exist when no messages are read from the GstBus. This
 * behaviour can be changed with gst_pipeline_set_auto_flush_bus().
 * When the GstPipeline performs the PAUSED to PLAYING state change it will
 * select a clock for the elements. The clock selection algorithm will by
 * default select a clock provided by an element that is most upstream
 * (closest to the source). For live pipelines (ones that return
 * GST_STATE_CHANGE_NO_PREROLL from the gst_element_set_state() call) this
 * will select the clock provided by the live source. For normal pipelines
 * this will select a clock provided by the sinks (most likely the audio
 * sink). If no element provides a clock, a default GstSystemClock is used.
 * The clock selection can be controlled with the gst_pipeline_use_clock()
 * method, which will enforce a given clock on the pipeline. With
 * gst_pipeline_auto_clock() the default clock selection algorithm can be
 * restored.
 * A GstPipeline maintains a stream time for the elements. The stream
 * time is defined as the difference between the current clock time and
 * the base time. When the pipeline goes to READY or a flushing seek is
 * performed on it, the stream time is reset to 0. When the pipeline is
 * set from PLAYING to PAUSED, the current clock time is sampled and used to
 * configure the base time for the elements when the pipeline is set
 * to PLAYING again. This default behaviour can be changed with the
 * gst_pipeline_set_new_stream_time() method.
 * When sending a flushing seek event to a GstPipeline (see
 * gst_element_seek()), it will make sure that the pipeline is properly
 * PAUSED and resumed as well as set the new stream time to 0 when the
 * seek succeeded.
 * Last reviewed on 2006-03-12 (0.10.5)
 */
public class Pipeline : Bin
{
	
	/** the main Gtk struct */
	protected GstPipeline* gstPipeline;
	
	
	public GstPipeline* getPipelineStruct();
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GstPipeline* gstPipeline);
	
	/** */
	public this (string name);
	
	/**
	 */
	
	/**
	 * Create a new pipeline with the given name.
	 * Params:
	 * name =  name of new pipeline
	 * Returns: newly created GstPipelineMT safe.
	 */
	public static Element newPipeline(string name);
	
	/**
	 * Gets the GstBus of pipeline.
	 * Returns: a GstBus, unref after usage.MT safe.
	 */
	public Bus getBus();
	
	/**
	 * Set the clock for pipeline. The clock will be distributed
	 * to all the elements managed by the pipeline.
	 * Params:
	 * clock =  the clock to set
	 * Returns: TRUE if the clock could be set on the pipeline. FALSE if some element did not accept the clock.MT safe.
	 */
	public int setClock(Clock clock);
	
	/**
	 * Gets the current clock used by pipeline.
	 * Returns: a GstClock, unref after usage.
	 */
	public Clock getClock();
	
	/**
	 * Force pipeline to use the given clock. The pipeline will
	 * always use the given clock even if new clock providers are added
	 * to this pipeline.
	 * If clock is NULL all clocking will be disabled which will make
	 * the pipeline run as fast as possible.
	 * MT safe.
	 * Params:
	 * clock =  the clock to use
	 */
	public void useClock(Clock clock);
	
	/**
	 * Let pipeline select a clock automatically. This is the default
	 * behaviour.
	 * Use this function if you previous forced a fixed clock with
	 * gst_pipeline_use_clock() and want to restore the default
	 * pipeline clock selection algorithm.
	 * MT safe.
	 */
	public void autoClock();
	
	/**
	 * Set the new stream time of pipeline to time. The stream time is used to
	 * set the base time on the elements (see gst_element_set_base_time())
	 * in the PAUSED->PLAYING state transition.
	 * Setting time to GST_CLOCK_TIME_NONE will disable the pipeline's management
	 * of element base time. The application will then be responsible for
	 * performing base time distribution. This is sometimes useful if you want to
	 * synchronize capture from multiple pipelines, and you can also ensure that the
	 * pipelines have the same clock.
	 * MT safe.
	 * Params:
	 * time =  the new stream time to set
	 */
	public void setNewStreamTime(GstClockTime time);
	
	/**
	 * Gets the last stream time of pipeline. If the pipeline is PLAYING,
	 * the returned time is the stream time used to configure the element's
	 * base time in the PAUSED->PLAYING state. If the pipeline is PAUSED, the
	 * returned time is the stream time when the pipeline was paused.
	 * This function returns GST_CLOCK_TIME_NONE if the pipeline was
	 * configured to not handle the management of the element's base time
	 * (see gst_pipeline_set_new_stream_time()).
	 * Returns: a GstClockTime.MT safe.
	 */
	public GstClockTime getLastStreamTime();
	
	/**
	 * Usually, when a pipeline goes from READY to NULL state, it automatically
	 * flushes all pending messages on the bus, which is done for refcounting
	 * purposes, to break circular references.
	 * This means that applications that update state using (async) bus messages
	 * (e.g. do certain things when a pipeline goes from PAUSED to READY) might
	 * not get to see messages when the pipeline is shut down, because they might
	 * be flushed before they can be dispatched in the main thread. This behaviour
	 * can be disabled using this function.
	 * It is important that all messages on the bus are handled when the
	 * automatic flushing is disabled else memory leaks will be introduced.
	 * MT safe.
	 * Params:
	 * autoFlush =  whether or not to automatically flush the bus when
	 * the pipeline goes from READY to NULL state
	 * Since 0.10.4
	 */
	public void setAutoFlushBus(int autoFlush);
	
	/**
	 * Check if pipeline will automatically flush messages when going to
	 * the NULL state.
	 * Returns: whether the pipeline will automatically flush its bus whengoing from READY to NULL state or not.MT safe.Since 0.10.4
	 */
	public int getAutoFlushBus();
	
	/**
	 * Set the expected delay needed for all elements to perform the
	 * PAUSED to PLAYING state change. delay will be added to the
	 * base time of the elements so that they wait an additional delay
	 * amount of time before starting to process buffers and cannot be
	 * GST_CLOCK_TIME_NONE.
	 * This option is used for tuning purposes and should normally not be
	 * used.
	 * MT safe.
	 * Params:
	 * delay =  the delay
	 * Since 0.10.5
	 */
	public void setDelay(GstClockTime delay);
	
	/**
	 * Get the configured delay (see gst_pipeline_set_delay()).
	 * Returns: The configured delay.MT safe.Since 0.10.5
	 */
	public GstClockTime getDelay();
}
