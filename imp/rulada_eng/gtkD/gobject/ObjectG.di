module gtkD.gobject.ObjectG;

public  import gtkD.gtkc.gobjecttypes;

private import gtkD.gtkc.gobject;
private import gtkD.glib.ConstructionException;

private import gtkD.gobject.Signals;
public  import gtkD.gtkc.gdktypes;

private import gtkD.gobject.ParamSpec;
private import gtkD.gobject.Value;
private import gtkD.gobject.Closure;
private import gtkD.glib.Str;

version(Rulada)
    private import std.gc;

version(Dinrus)
    private import gc;


/**
 * Description
 * GObject is the fundamental type providing the common attributes and
 * methods for all object types in GTK+, Pango and other libraries
 * based on GObject. The GObject class provides methods for object
 * construction and destruction, property access methods, and signal
 * support. Signals are described in detail in Signals(3).
 * GInitiallyUnowned is derived from GObject. The only difference between
 * the two is that the initial reference of a GInitiallyUnowned is flagged
 * as a floating reference.
 * This means that it is not specifically claimed to be "owned" by
 * any code portion. The main motivation for providing floating references is
 * C convenience. In particular, it allows code to be written as:
 * container = create_container();
 * container_add_child (container, create_child());
 * If container_add_child() will g_object_ref_sink() the
 * passed in child, no reference of the newly created child is leaked.
 * Without floating references, container_add_child()
 * can only g_object_ref() the new child, so to implement this code without
 * reference leaks, it would have to be written as:
 * Child *child;
 * container = create_container();
 * child = create_child();
 * container_add_child (container, child);
 * g_object_unref (child);
 * The floating reference can be converted into
 * an ordinary reference by calling g_object_ref_sink().
 * For already sunken objects (objects that don't have a floating reference
 * anymore), g_object_ref_sink() is equivalent to g_object_ref() and returns
 * a new reference.
 * Since floating references are useful almost exclusively for C convenience,
 * language bindings that provide automated reference and memory ownership
 * maintenance (such as smart pointers or garbage collection) therefore don't
 * need to expose floating references in their API.
 * Some object implementations may need to save an objects floating state
 * across certain code portions (an example is GtkMenu), to achive this, the
 * following sequence can be used:
 * // save floating state
 * gboolean was_floating = g_object_is_floating (object);
 * g_object_ref_sink (object);
 * // protected code portion
 * ...;
 * // restore floating state
 * if (was_floating)
 *  g_object_force_floating (object);
 * g_obejct_unref (object); // release previously acquired reference
 */
public class ObjectG
{

	/** the main Gtk struct */
	protected GObject* gObject;


	public GObject* getObjectGStruct();


	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/**
	 * Sets our main struct and passes store it on the gtkD.gobject.
	 * Add a gabage collector root to the gtk+ struct so it doesn't get collect
	 */
	public this (GObject* gObject);

	/**
	 * Sets a pointer on this object's has table
	 * Params:
	 *  key = the data identifier
	 *  data = a pointer
	 */
	public void objectGSetDataFull(string key, gpointer data);

	extern(C)
	{
		static void destroyNotify(gpointer* data);
	}

	/**
	 * Gets a D Object from the objects table of associations.
	 * Params:
	 *  object = GObject containing the associations.
	 * Returns: the D Object if found, or NULL if no such Object exists.
	 */
	public static void* getDObject(GObject* obj);

	/** */
	public void setProperty(string propertyName, int value);

	/** */
	public void setProperty(string propertyName, string value);

	/** */
	public void setProperty(string propertyName, long value);

	/** */
	public void setProperty(string propertyName, ulong value);

	/**
	 */
	int[char[]] connectedSignals;

	void delegate(ParamSpec, ObjectG)[] onNotifyListeners;
	/**
	 * The notify signal is emitted on an object when one of its
	 * properties has been changed. Note that getting this signal
	 * doesn't guarantee that the value of the property has actually
	 * changed, it may also be emitted when the setter for the property
	 * is called to reinstate the previous value.
	 * This signal is typically used to obtain change notification for a
	 * single property, by specifying the property name as a detail in the
	 * g_signal_connect (text_view->buffer, "notify::paste-target-list",
	 *  G_CALLBACK (gtk_text_view_target_list_notify),
	 *  text_view)
	 * It is important to note that you must use
	 * canonical parameter names as
	 * detail strings for the notify signal.
	 * See Also
	 * #GParamSpecObject, g_param_spec_object()
	 */
	void addOnNotify(void delegate(ParamSpec, ObjectG) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
	extern(C) static void callBackNotify(GObject* gobjectStruct, GParamSpec* pspec, ObjectG objectG);


	/**
	 * Installs a new property. This is usually done in the class initializer.
	 * Note that it is possible to redefine a property in a derived class,
	 * by installing a property with the same name. This can be useful at times,
	 * e.g. to change the range of allowed values or the default value.
	 * Params:
	 * oclass =  a GObjectClass
	 * propertyId =  the id for the new property
	 * pspec =  the GParamSpec for the new property
	 */
	public static void classInstallProperty(GObjectClass* oclass, uint propertyId, ParamSpec pspec);

	/**
	 * Looks up the GParamSpec for a property of a class.
	 * Params:
	 * oclass =  a GObjectClass
	 * propertyName =  the name of the property to look up
	 * Returns: the GParamSpec for the property, or NULL if the class doesn't have a property of that name
	 */
	public static ParamSpec classFindProperty(GObjectClass* oclass, string propertyName);

	/**
	 * Get an array of GParamSpec* for all properties of a class.
	 * Params:
	 * oclass =  a GObjectClass
	 * Returns: an array of GParamSpec* which should be freed after use
	 */
	public static ParamSpec[] classListProperties(GObjectClass* oclass);

	/**
	 * Registers property_id as referring to a property with the
	 * name name in a parent class or in an interface implemented
	 * by oclass. This allows this class to override
	 * a property implementation in a parent class or to provide
	 * the implementation of a property from an interface.
	 * Note
	 * Internally, overriding is implemented by creating a property of type
	 * GParamSpecOverride; generally operations that query the properties of
	 * the object class, such as g_object_class_find_property() or
	 * g_object_class_list_properties() will return the overridden
	 * property. However, in one case, the construct_properties argument of
	 * the constructor virtual function, the GParamSpecOverride is passed
	 * instead, so that the param_id field of the GParamSpec will be
	 * correct. For virtually all uses, this makes no difference. If you
	 * need to get the overridden property, you can call
	 * g_param_spec_get_redirect_target().
	 * Since 2.4
	 * Params:
	 * oclass =  a GObjectClass
	 * propertyId =  the new property ID
	 * name =  the name of a property registered in a parent class or
	 *  in an interface of this class.
	 */
	public static void classOverrideProperty(GObjectClass* oclass, uint propertyId, string name);

	/**
	 * Add a property to an interface; this is only useful for interfaces
	 * that are added to GObject-derived types. Adding a property to an
	 * interface forces all objects classes with that interface to have a
	 * compatible property. The compatible property could be a newly
	 * created GParamSpec, but normally
	 * g_object_class_override_property() will be used so that the object
	 * class only needs to provide an implementation and inherits the
	 * property description, default value, bounds, and so forth from the
	 * interface property.
	 * This function is meant to be called from the interface's default
	 * vtable initialization function (the class_init member of
	 * GTypeInfo.) It must not be called after after class_init has
	 * been called for any object types implementing this interface.
	 * Since 2.4
	 * Params:
	 * gIface =  any interface vtable for the interface, or the default
	 *  vtable for the interface.
	 * pspec =  the GParamSpec for the new property
	 */
	public static void interfaceInstallProperty(void* gIface, ParamSpec pspec);

	/**
	 * Find the GParamSpec with the given name for an
	 * interface. Generally, the interface vtable passed in as g_iface
	 * will be the default vtable from g_type_default_interface_ref(), or,
	 * if you know the interface has already been loaded,
	 * g_type_default_interface_peek().
	 * Since 2.4
	 * Params:
	 * gIface =  any interface vtable for the interface, or the default
	 *  vtable for the interface
	 * propertyName =  name of a property to lookup.
	 * Returns: the GParamSpec for the property of the interface with the name property_name, or NULL if no such property exists.
	 */
	public static ParamSpec interfaceFindProperty(void* gIface, string propertyName);

	/**
	 * Lists the properties of an interface.Generally, the interface
	 * vtable passed in as g_iface will be the default vtable from
	 * g_type_default_interface_ref(), or, if you know the interface has
	 * already been loaded, g_type_default_interface_peek().
	 * Since 2.4
	 * Params:
	 * gIface =  any interface vtable for the interface, or the default
	 *  vtable for the interface
	 * Returns: a pointer to an array of pointers to GParamSpec structures. The paramspecs are owned by GLib, but the array should be freed with g_free() when you are done with it.
	 */
	public static ParamSpec[] interfaceListProperties(void* gIface);

	/**
	 * Creates a new instance of a GObject subtype and sets its properties.
	 * Construction parameters (see G_PARAM_CONSTRUCT, G_PARAM_CONSTRUCT_ONLY)
	 * which are not explicitly specified are set to their default values.
	 * Params:
	 * objectType =  the type id of the GObject subtype to instantiate
	 * parameters =  an array of GParameter
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (GType objectType, GParameter[] parameters);

	/**
	 * Increases the reference count of object.
	 * Params:
	 * object =  a GObject
	 * Returns: the same object
	 */
	public static void* doref(void* object);

	/**
	 * Decreases the reference count of object. When its reference count
	 * drops to 0, the object is finalized (i.e. its memory is freed).
	 * Params:
	 * object =  a GObject
	 */
	public static void unref(void* object);

	/**
	 * Increase the reference count of object, and possibly remove the
	 * floating reference, if object
	 * has a floating reference.
	 * In other words, if the object is floating, then this call "assumes
	 * ownership" of the floating reference, converting it to a normal
	 * reference by clearing the floating flag while leaving the reference
	 * count unchanged. If the object is not floating, then this call
	 * adds a new normal reference increasing the reference count by one.
	 * Since 2.10
	 * Params:
	 * object =  a GObject
	 * Returns: object
	 */
	public static void* refSink(void* object);

	/**
	 * Checks wether object has a floating
	 * reference.
	 * Since 2.10
	 * Params:
	 * object =  a GObject
	 * Returns: TRUE if object has a floating reference
	 */
	public static int isFloating(void* object);

	/**
	 * This function is intended for GObject implementations to re-enforce a
	 * floating object reference.
	 * Doing this is seldomly required, all
	 * GInitiallyUnowneds are created with a floating reference which
	 * usually just needs to be sunken by calling g_object_ref_sink().
	 * Since 2.10
	 */
	public void forceFloating();

	/**
	 * Adds a weak reference callback to an object. Weak references are
	 * used for notification when an object is finalized. They are called
	 * "weak references" because they allow you to safely hold a pointer
	 * to an object without calling g_object_ref() (g_object_ref() adds a
	 * strong reference, that is, forces the object to stay alive).
	 * Params:
	 * notify =  callback to invoke before the object is freed
	 * data =  extra data to pass to notify
	 */
	public void weakRef(GWeakNotify notify, void* data);

	/**
	 * Removes a weak reference callback to an object.
	 * Params:
	 * notify =  callback to search for
	 * data =  data to search for
	 */
	public void weakUnref(GWeakNotify notify, void* data);

	/**
	 * Adds a weak reference from weak_pointer to object to indicate that
	 * the pointer located at weak_pointer_location is only valid during
	 * the lifetime of object. When the object is finalized,
	 * weak_pointer will be set to NULL.
	 * Params:
	 * weakPointerLocation =  The memory address of a pointer.
	 */
	public void addWeakPointer(void** weakPointerLocation);

	/**
	 * Removes a weak reference from object that was previously added
	 * using g_object_add_weak_pointer(). The weak_pointer_location has
	 * to match the one used with g_object_add_weak_pointer().
	 * Params:
	 * weakPointerLocation =  The memory address of a pointer.
	 */
	public void removeWeakPointer(void** weakPointerLocation);

	/**
	 * Increases the reference count of the object by one and sets a
	 * callback to be called when all other references to the object are
	 * dropped, or when this is already the last reference to the object
	 * and another reference is established.
	 * This functionality is intended for binding object to a proxy
	 * object managed by another memory manager. This is done with two
	 * paired references: the strong reference added by
	 * g_object_add_toggle_ref() and a reverse reference to the proxy
	 * object which is either a strong reference or weak reference.
	 * The setup is that when there are no other references to object,
	 * only a weak reference is held in the reverse direction from object
	 * to the proxy object, but when there are other references held to
	 * object, a strong reference is held. The notify callback is called
	 * when the reference from object to the proxy object should be
	 * toggled from strong to weak (is_last_ref
	 * true) or weak to strong (is_last_ref false).
	 * Since a (normal) reference must be held to the object before
	 * calling g_object_toggle_ref(), the initial state of the reverse
	 * link is always strong.
	 * Multiple toggle references may be added to the same gobject,
	 * however if there are multiple toggle references to an object, none
	 * of them will ever be notified until all but one are removed. For
	 * this reason, you should only ever use a toggle reference if there
	 * is important state in the proxy object.
	 * Since 2.8
	 * Params:
	 * notify =  a function to call when this reference is the
	 *  last reference to the object, or is no longer
	 *  the last reference.
	 * data =  data to pass to notify
	 */
	public void addToggleRef(GToggleNotify notify, void* data);

	/**
	 * Removes a reference added with g_object_add_toggle_ref(). The
	 * reference count of the object is decreased by one.
	 * Since 2.8
	 * Params:
	 * notify =  a function to call when this reference is the
	 *  last reference to the object, or is no longer
	 *  the last reference.
	 * data =  data to pass to notify
	 */
	public void removeToggleRef(GToggleNotify notify, void* data);

	/**
	 * Emits a "notify" signal for the property property_name on object.
	 * Params:
	 * propertyName =  the name of a property installed on the class of object.
	 */
	public void notify(string propertyName);

	/**
	 * Increases the freeze count on object. If the freeze count is
	 * non-zero, the emission of "notify" signals on object is
	 * stopped. The signals are queued until the freeze count is decreased
	 * to zero.
	 * This is necessary for accessors that modify multiple properties to prevent
	 * premature notification while the object is still being modified.
	 */
	public void freezeNotify();

	/**
	 * Reverts the effect of a previous call to
	 * g_object_freeze_notify(). The freeze count is decreased on object
	 * and when it reaches zero, all queued "notify" signals are emitted.
	 * It is an error to call this function when the freeze count is zero.
	 */
	public void thawNotify();

	/**
	 * Gets a named field from the objects table of associations (see g_object_set_data()).
	 * Params:
	 * key =  name of the key for that association
	 * Returns: the data if found, or NULL if no such data exists.
	 */
	public void* getData(string key);

	/**
	 * Each object carries around a table of associations from
	 * strings to pointers. This function lets you set an association.
	 * If the object already had an association with that name,
	 * the old association will be destroyed.
	 * Params:
	 * key =  name of the key
	 * data =  data to associate with that key
	 */
	public void setData(string key, void* data);

	/**
	 * Remove a specified datum from the object's data associations,
	 * without invoking the association's destroy handler.
	 * Params:
	 * key =  name of the key
	 * Returns: the data if found, or NULL if no such data exists.
	 */
	public void* stealData(string key);

	/**
	 * This function gets back user data pointers stored via
	 * g_object_set_qdata().
	 * Params:
	 * quark =  A GQuark, naming the user data pointer
	 * Returns: The user data pointer set, or NULL
	 */
	public void* getQdata(GQuark quark);

	/**
	 * This sets an opaque, named pointer on an object.
	 * The name is specified through a GQuark (retrived e.g. via
	 * g_quark_from_static_string()), and the pointer
	 * can be gotten back from the object with g_object_get_qdata()
	 * until the object is finalized.
	 * Setting a previously set user data pointer, overrides (frees)
	 * the old pointer set, using NULL as pointer essentially
	 * removes the data stored.
	 * Params:
	 * quark =  A GQuark, naming the user data pointer
	 * data =  An opaque user data pointer
	 */
	public void setQdata(GQuark quark, void* data);

	/**
	 * This function works like g_object_set_qdata(), but in addition,
	 * a void (*destroy) (gpointer) function may be specified which is
	 * called with data as argument when the object is finalized, or
	 * the data is being overwritten by a call to g_object_set_qdata()
	 * with the same quark.
	 * Params:
	 * quark =  A GQuark, naming the user data pointer
	 * data =  An opaque user data pointer
	 * destroy =  Function to invoke with data as argument, when data
	 *  needs to be freed
	 */
	public void setQdataFull(GQuark quark, void* data, GDestroyNotify destroy);

	/**
	 * This function gets back user data pointers stored via
	 * g_object_set_qdata() and removes the data from object
	 * without invoking its destroy() function (if any was
	 * set).
	 * Usually, calling this function is only required to update
	 * Params:
	 * quark =  A GQuark, naming the user data pointer
	 * Returns: The user data pointer set, or NULL
	 */
	public void* stealQdata(GQuark quark);

	/**
	 * Sets a property on an object.
	 * Params:
	 * propertyName =  the name of the property to set
	 * value =  the value
	 */
	public void setProperty(string propertyName, Value value);

	/**
	 * Gets a property of an object.
	 * In general, a copy is made of the property contents and the caller is
	 * responsible for freeing the memory by calling g_value_unset().
	 * Note that g_object_get_property() is really intended for language
	 * bindings, g_object_get() is much more convenient for C programming.
	 * Params:
	 * propertyName =  the name of the property to get
	 * value =  return location for the property value
	 */
	public void getProperty(string propertyName, Value value);

	/**
	 * Creates a new instance of a GObject subtype and sets its properties.
	 * Construction parameters (see G_PARAM_CONSTRUCT, G_PARAM_CONSTRUCT_ONLY)
	 * which are not explicitly specified are set to their default values.
	 * Params:
	 * objectType =  the type id of the GObject subtype to instantiate
	 * firstPropertyName =  the name of the first property
	 * varArgs =  the value of the first property, followed optionally by more
	 *  name/value pairs, followed by NULL
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (GType objectType, string firstPropertyName, void* varArgs);

	/**
	 * Sets properties on an object.
	 * Params:
	 * firstPropertyName =  name of the first property to set
	 * varArgs =  value for the first property, followed optionally by more
	 *  name/value pairs, followed by NULL
	 */
	public void setValist(string firstPropertyName, void* varArgs);

	/**
	 * Gets properties of an object.
	 * In general, a copy is made of the property contents and the caller
	 * is responsible for freeing the memory in the appropriate manner for
	 * the type, for instance by calling g_free() or g_object_unref().
	 * See g_object_get().
	 * Params:
	 * firstPropertyName =  name of the first property to get
	 * varArgs =  return location for the first property, followed optionally by more
	 *  name/return location pairs, followed by NULL
	 */
	public void getValist(string firstPropertyName, void* varArgs);

	/**
	 * This function essentially limits the life time of the closure to
	 * the life time of the object. That is, when the object is finalized,
	 * the closure is invalidated by calling g_closure_invalidate() on
	 * it, in order to prevent invocations of the closure with a finalized
	 * (nonexisting) object. Also, g_object_ref() and g_object_unref() are
	 * added as marshal guards to the closure, to ensure that an extra
	 * reference count is held on object during invocation of the
	 * closure. Usually, this function will be called on closures that
	 * use this object as closure data.
	 * Params:
	 * closure =  GClosure to watch
	 */
	public void watchClosure(Closure closure);

	/**
	 * Releases all references to other objects. This can be used to break
	 * reference cycles.
	 * This functions should only be called from object system implementations.
	 */
	public void runDispose();
}
