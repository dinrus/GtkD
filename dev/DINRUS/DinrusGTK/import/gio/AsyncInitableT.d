
module gtkD.gio.AsyncInitableT;

public  import gtkD.gtkc.giotypes;

public import gtkD.gtkc.gio;
public import gtkD.glib.ConstructionException;


public import gtkD.glib.Str;
public import gtkD.glib.ErrorG;
public import gtkD.glib.GException;
public import gtkD.gobject.ObjectG;
public import gtkD.gio.AsyncResultIF;
public import gtkD.gio.Cancellable;




/**
 * Description
 * This is the asynchronous version of GInitable, it behaves the same
 * in all ways except that initialization is asynchronous. For more details
 * see the descriptions on GInitable.
 * A class may implement both the GInitable and GAsyncInitable interfaces.
 * Users of objects implementing this are not intended to use the interface
 * method directly, instead it will be used automatically in various ways.
 * For C applications you generally just call g_async_initable_new_async()
 * directly, or indirectly via a foo_thing_new_async() wrapper. This will call
 * g_async_initable_init_async() under the cover, calling back with NULL and
 * a set GError on failure.
 */
public template AsyncInitableT(TStruct)
{
	
	/** the main Gtk struct */
	protected GAsyncInitable* gAsyncInitable;
	
	
	public GAsyncInitable* getAsyncInitableTStruct()
	{
		return cast(GAsyncInitable*)getStruct();
	}
	
	
	/**
	 */
	
	/**
	 * Starts asynchronous initialization of the object implementing the
	 * interface. This must be done before any real use of the object after
	 * initial construction. If the object also implements GInitable you can
	 * optionally call g_initable_init() instead.
	 * When the initialization is finished, callback will be called. You can
	 * then call g_async_initable_init_finish() to get the result of the
	 * initialization.
	 * Implementations may also support cancellation. If cancellable is not
	 * NULL, then initialization can be cancelled by triggering the cancellable
	 * object from another thread. If the operation was cancelled, the error
	 * G_IO_ERROR_CANCELLED will be returned. If cancellable is not NULL and
	 * the object doesn't support cancellable initialization the error
	 * G_IO_ERROR_NOT_SUPPORTED will be returned.
	 * If this function is not called, or returns with an error then all
	 * operations on the object should fail, generally returning the
	 * error G_IO_ERROR_NOT_INITIALIZED.
	 * Implementations of this method must be idempotent, i.e. multiple calls
	 * to this function with the same argument should return the same results.
	 * Only the first call initializes the object, further calls return the result
	 * of the first call. This is so that its safe to implement the singleton
	 * pattern in the GObject constructor function.
	 * For classes that also support the GInitable interface the default
	 * implementation of this method will run the g_initable_init() function
	 * in a thread, so if you want to support asynchronous initialization via
	 * threads, just implement the GAsyncInitable interface without overriding
	 * any interface methods.
	 * Since 2.22
	 * Params:
	 * ioPriority =  the I/O priority
	 *  of the operation.
	 * cancellable =  optional GCancellable object, NULL to ignore.
	 * callback =  a GAsyncReadyCallback to call when the request is satisfied
	 * userData =  the data to pass to callback function
	 */
	public void gAsyncInitableInitAsync(int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		// void g_async_initable_init_async (GAsyncInitable *initable,  int io_priority,  GCancellable *cancellable,  GAsyncReadyCallback callback,  gpointer user_data);
		g_async_initable_init_async(getAsyncInitableTStruct(), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}
	
	/**
	 * Finishes asynchronous initialization and returns the result.
	 * See g_async_initable_init_async().
	 * Since 2.22
	 * Params:
	 * res =  a GAsyncResult.
	 * Returns: TRUE if successful. If an error has occurred, this functionwill return FALSE and set error appropriately if present.
	 * Throws: GException on failure.
	 */
	public int gAsyncInitableInitFinish(AsyncResultIF res)
	{
		// gboolean g_async_initable_init_finish (GAsyncInitable *initable,  GAsyncResult *res,  GError **error);
		GError* err = null;
		
		auto p = g_async_initable_init_finish(getAsyncInitableTStruct(), (res is null) ? null : res.getAsyncResultTStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}
	
	/**
	 * Finishes the async construction for the various g_async_initable_new calls,
	 * returning the created object or NULL on error.
	 * Since 2.22
	 * Params:
	 * res =  the GAsyncResult.from the callback
	 * Returns: a newly created GObject, or NULL on error. Free with g_object_unref().
	 * Throws: GException on failure.
	 */
	public ObjectG gAsyncInitableNewFinish(AsyncResultIF res)
	{
		// GObject * g_async_initable_new_finish (GAsyncInitable *initable,  GAsyncResult *res,  GError **error);
		GError* err = null;
		
		auto p = g_async_initable_new_finish(getAsyncInitableTStruct(), (res is null) ? null : res.getAsyncResultTStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		if(p is null)
		{
			return null;
		}
		return new ObjectG(cast(GObject*) p);
	}
	
	/**
	 * Helper function for constructing GAsyncInitiable object. This is
	 * similar to g_object_new_valist() but also initializes the object
	 * asyncronously.
	 * When the initialization is finished, callback will be called. You can
	 * then call g_async_initable_new_finish() to get new object and check for
	 * any errors.
	 * Since 2.22
	 * Params:
	 * objectType =  a GType supporting GAsyncInitable.
	 * firstPropertyName =  the name of the first property, followed by
	 * the value, and other property value pairs, and ended by NULL.
	 * varArgs =  The var args list generated from first_property_name.
	 * ioPriority =  the I/O priority
	 *  of the operation.
	 * cancellable =  optional GCancellable object, NULL to ignore.
	 * callback =  a GAsyncReadyCallback to call when the initialization is
	 *  finished
	 * userData =  the data to pass to callback function
	 */
	public static void gAsyncInitableNewValistAsync(GType objectType, string firstPropertyName, void* varArgs, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		// void g_async_initable_new_valist_async (GType object_type,  const gchar *first_property_name,  va_list var_args,  int io_priority,  GCancellable *cancellable,  GAsyncReadyCallback callback,  gpointer user_data);
		g_async_initable_new_valist_async(objectType, Str.toStringz(firstPropertyName), varArgs, ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}
	
	/**
	 * Helper function for constructing GAsyncInitiable object. This is
	 * similar to g_object_newv() but also initializes the object asyncronously.
	 * When the initialization is finished, callback will be called. You can
	 * then call g_async_initable_new_finish() to get new object and check for
	 * any errors.
	 * Since 2.22
	 * Params:
	 * objectType =  a GType supporting GAsyncInitable.
	 * parameters =  the parameters to use to construct the object
	 * ioPriority =  the I/O priority
	 *  of the operation.
	 * cancellable =  optional GCancellable object, NULL to ignore.
	 * callback =  a GAsyncReadyCallback to call when the initialization is
	 *  finished
	 * userData =  the data to pass to callback function
	 */
	public static void gAsyncInitableNewvAsync(GType objectType, GParameter[] parameters, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		// void g_async_initable_newv_async (GType object_type,  guint n_parameters,  GParameter *parameters,  int io_priority,  GCancellable *cancellable,  GAsyncReadyCallback callback,  gpointer user_data);
		g_async_initable_newv_async(objectType, parameters.length, parameters.ptr, ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}
}
