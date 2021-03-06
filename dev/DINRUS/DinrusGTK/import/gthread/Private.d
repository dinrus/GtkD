module gtkD.gthread.Private;

public  import gtkD.gtkc.gthreadtypes;

private import gtkD.gtkc.gthread;
private import gtkD.glib.ConstructionException;






/**
 * Description
 * Threads act almost like processes, but unlike processes all threads of
 * one process share the same memory. This is good, as it provides easy
 * communication between the involved threads via this shared memory, and
 * it is bad, because strange things (so called "Heisenbugs") might
 * happen if the program is not carefully designed. In particular, due to
 * the concurrent nature of threads, no assumptions on the order of
 * execution of code running in different threads can be made, unless
 * order is explicitly forced by the programmer through synchronization
 * primitives.
 * The aim of the thread related functions in GLib is to provide a
 * portable means for writing multi-threaded software. There are
 * primitives for mutexes to protect the access to portions of memory
 * (GMutex, GStaticMutex, G_LOCK_DEFINE, GStaticRecMutex and
 * GStaticRWLock). There are primitives for condition variables to allow
 * synchronization of threads (GCond). There are primitives
 * for thread-private data - data that every thread has a private instance of
 * (GPrivate, GStaticPrivate). Last but definitely not least there are
 * primitives to portably create and manage threads (GThread).
 * You must call g_thread_init() before executing any other GLib
 * functions (except g_mem_set_vtable()) in a GLib program if
 * g_thread_init() will be called at all. This is a requirement even if
 * no threads are in fact ever created by the process. It is enough that
 * g_thread_init() is called. If other GLib functions have been called
 * before that, the behaviour of the program is undefined. An exception
 * is g_mem_set_vtable() which may be called before g_thread_init().
 * Failing this requirement can lead to hangs or crashes, apparently more
 * easily on Windows than on Linux, for example.
 * Please note that if you call functions in some GLib-using library, in
 * particular those above the GTK+ stack, that library might well call
 * g_thread_init() itself, or call some other library that calls
 * g_thread_init(). Thus, if you use some GLib-based library that is
 * above the GTK+ stack, it is safest to call g_thread_init() in your
 * application's main() before calling any GLib functions or functions in
 * GLib-using libraries.
 * After calling g_thread_init(), GLib is completely
 * thread safe (all global data is automatically locked), but individual
 * data structure instances are not automatically locked for performance
 * reasons. So, for example you must coordinate accesses to the same
 * GHashTable from multiple threads. The two notable exceptions from
 * this rule are GMainLoop and GAsyncQueue,
 * which are threadsafe and needs no further
 * application-level locking to be accessed from multiple threads.
 * To help debugging problems in multithreaded applications, GLib supports
 * error-checking mutexes that will give you helpful error messages on
 * common problems. To use error-checking mutexes, define the symbol
 * G_ERRORCHECK_MUTEXES when compiling the application.
 */
public class Private
{
	
	/** the main Gtk struct */
	protected GPrivate* gPrivate;
	
	
	public GPrivate* getPrivateStruct();
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GPrivate* gPrivate);
	
	/**
	 */
	
	/**
	 * Creates a new GPrivate. If destructor is non-NULL, it is a pointer
	 * to a destructor function. Whenever a thread ends and the corresponding
	 * pointer keyed to this instance of GPrivate is non-NULL, the
	 * destructor is called with this pointer as the argument.
	 * Note
	 * destructor is used quite differently from notify in
	 * g_static_private_set().
	 * Note
	 * A GPrivate can not be freed. Reuse it instead, if you can, to avoid
	 * shortage, or use GStaticPrivate.
	 * Note
	 * This function will abort if g_thread_init() has not been called yet.
	 * Params:
	 * destructor = a function to destroy the data keyed to GPrivate when a
	 * thread ends.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (GDestroyNotify destructor);
	
	/**
	 * Returns the pointer keyed to private_key for the current thread.
	 * If g_private_set() hasn't been called for the
	 * current private_key and thread yet, this pointer will be NULL.
	 * This function can be used even if g_thread_init() has not yet been called, and,
	 * in that case, will return the value of private_key casted to gpointer.
	 * Note however, that private data set before g_thread_init() will
	 * not be retained after the call. Instead, NULL
	 * will be returned in all threads directly after g_thread_init(), regardless of
	 * any g_private_set() calls issued before threading system intialization.
	 * Returns:the corresponding pointer.
	 */
	public void* get();
	
	/**
	 * Sets the pointer keyed to private_key for the current thread.
	 * This function can be used even if g_thread_init() has not yet been
	 * called, and, in that case, will set private_key to data casted to GPrivate*.
	 * See g_private_get() for resulting caveats.
	 * Params:
	 * data = the new pointer.
	 */
	public void set(void* data);
}
