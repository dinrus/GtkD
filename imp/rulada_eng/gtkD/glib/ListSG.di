module gtkD.glib.ListSG;

public  import gtkD.gtkc.glibtypes;

private import gtkD.gtkc.glib;
private import gtkD.glib.ConstructionException;






/**
 * Description
 * The GSList structure and its associated functions provide a standard
 * singly-linked list data structure.
 * Each element in the list contains a piece of data, together with a pointer
 * which links to the next element in the list.
 * Using this pointer it is possible to move through the list in one
 * direction only (unlike the
 * Doubly-Linked Lists
 * which allow movement in both directions).
 * The data contained in each element can be either integer values, by using one
 * of the
 * Type Conversion Macros,
 * or simply pointers to any type of data.
 * List elements are allocated from the slice
 * allocator, which is more efficient than allocating elements
 * individually.
 * Note that most of the GSList functions expect to be passed a pointer to
 * the first element in the list. The functions which insert elements return
 * the new start of the list, which may have changed.
 * There is no function to create a GSList. NULL is considered to be the empty
 * list so you simply set a GSList* to NULL.
 * To add elements, use g_slist_append(), g_slist_prepend(), g_slist_insert()
 * and g_slist_insert_sorted().
 * To remove elements, use g_slist_remove().
 * To find elements in the list use g_slist_last(), g_slist_next(),
 * g_slist_nth(), g_slist_nth_data(), g_slist_find() and
 * g_slist_find_custom().
 * To find the index of an element use g_slist_position() and g_slist_index().
 * To call a function for each element in the list use g_slist_foreach().
 * To free the entire list, use g_slist_free().
 */
public class ListSG
{
	
	/** the main Gtk struct */
	protected GSList* gSList;
	
	
	public GSList* getListSGStruct();
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GSList* gSList);
	
	/** */
	void* data();
	
	/**
	 * get the next element
	 * Returns: the next element, or NULL if there are no more elements.
	 */
	ListSG next();
	
	/**
	 */
	
	/**
	 * Allocates space for one GSList element.
	 * It is called by the g_slist_append(), g_slist_prepend(), g_slist_insert() and
	 * g_slist_insert_sorted() functions and so is rarely used on its own.
	 * Returns:a pointer to the newly-allocated GSList element.
	 */
	public static ListSG alloc();
	
	/**
	 * Adds a new element on to the end of the list.
	 * Note
	 * The return value is the new start of the list, which may
	 * have changed, so make sure you store the new value.
	 * Note
	 * Note that g_slist_append() has to traverse the entire list
	 * to find the end, which is inefficient when adding multiple
	 * elements. A common idiom to avoid the inefficiency is to prepend
	 * the elements and reverse the list when all elements have been added.
	 * /+* Notice that these are initialized to the empty list. +/
	 * GSList *list = NULL, *number_list = NULL;
	 * /+* This is a list of strings. +/
	 * list = g_slist_append (list, "first");
	 * list = g_slist_append (list, "second");
	 * /+* This is a list of integers. +/
	 * number_list = g_slist_append (number_list, GINT_TO_POINTER (27));
	 * number_list = g_slist_append (number_list, GINT_TO_POINTER (14));
	 * Params:
	 * data =  the data for the new element
	 * Returns: the new start of the GSList
	 */
	public ListSG append(void* data);
	
	/**
	 * Adds a new element on to the start of the list.
	 * Note
	 * The return value is the new start of the list, which
	 * may have changed, so make sure you store the new value.
	 * /+* Notice that it is initialized to the empty list. +/
	 * GSList *list = NULL;
	 * list = g_slist_prepend (list, "last");
	 * list = g_slist_prepend (list, "first");
	 * Params:
	 * data =  the data for the new element
	 * Returns: the new start of the GSList
	 */
	public ListSG prepend(void* data);
	
	/**
	 * Inserts a new element into the list at the given position.
	 * Params:
	 * data =  the data for the new element
	 * position =  the position to insert the element.
	 *  If this is negative, or is larger than the number
	 *  of elements in the list, the new element is added on
	 *  to the end of the list.
	 * Returns: the new start of the GSList
	 */
	public ListSG insert(void* data, int position);
	
	/**
	 * Inserts a node before sibling containing data.
	 * Params:
	 * sibling =  node to insert data before
	 * data =  data to put in the newly-inserted node
	 * Returns: the new head of the list.
	 */
	public ListSG insertBefore(ListSG sibling, void* data);
	
	/**
	 * Inserts a new element into the list, using the given
	 * comparison function to determine its position.
	 * Params:
	 * data =  the data for the new element
	 * func =  the function to compare elements in the list.
	 *  It should return a number > 0 if the first parameter
	 *  comes after the second parameter in the sort order.
	 * Returns: the new start of the GSList
	 */
	public ListSG insertSorted(void* data, GCompareFunc func);
	
	/**
	 * Removes an element from a GSList.
	 * If two elements contain the same data, only the first is removed.
	 * If none of the elements contain the data, the GSList is unchanged.
	 * Params:
	 * data =  the data of the element to remove
	 * Returns: the new start of the GSList
	 */
	public ListSG remove(void* data);
	
	/**
	 * Removes an element from a GSList, without
	 * freeing the element. The removed element's next
	 * link is set to NULL, so that it becomes a
	 * self-contained list with one element.
	 * Params:
	 * link =  an element in the GSList
	 * Returns: the new start of the GSList, without the element
	 */
	public ListSG removeLink(ListSG link);
	
	/**
	 * Removes the node link_ from the list and frees it.
	 * Compare this to g_slist_remove_link() which removes the node
	 * without freeing it.
	 * Params:
	 * link =  node to delete
	 * Returns: the new head of list
	 */
	public ListSG deleteLink(ListSG link);
	
	/**
	 * Removes all list nodes with data equal to data.
	 * Returns the new head of the list. Contrast with
	 * g_slist_remove() which removes only the first node
	 * matching the given data.
	 * Params:
	 * data =  data to remove
	 * Returns: new head of list
	 */
	public ListSG removeAll(void* data);
	
	/**
	 * Frees all of the memory used by a GSList.
	 * The freed elements are returned to the slice allocator.
	 */
	public void free();
	
	/**
	 * Frees one GSList element.
	 * It is usually used after g_slist_remove_link().
	 */
	public void free1();
	
	/**
	 * Gets the number of elements in a GSList.
	 * Note
	 * This function iterates over the whole list to
	 * count its elements.
	 * Returns: the number of elements in the GSList
	 */
	public uint length();
	
	/**
	 * Copies a GSList.
	 * Note
	 * Note that this is a "shallow" copy. If the list elements
	 * consist of pointers to data, the pointers are copied but
	 * the actual data isn't.
	 * Returns: a copy of list
	 */
	public ListSG copy();
	
	/**
	 * Reverses a GSList.
	 * Returns: the start of the reversed GSList
	 */
	public ListSG reverse();
	
	/**
	 * Inserts a new element into the list, using the given
	 * comparison function to determine its position.
	 * Since 2.10
	 * Params:
	 * data =  the data for the new element
	 * func =  the function to compare elements in the list.
	 *  It should return a number > 0 if the first parameter
	 *  comes after the second parameter in the sort order.
	 * userData =  data to pass to comparison function
	 * Returns: the new start of the GSList
	 */
	public ListSG insertSortedWithData(void* data, GCompareDataFunc func, void* userData);
	
	/**
	 * Sorts a GSList using the given comparison function.
	 * Params:
	 * compareFunc =  the comparison function used to sort the GSList.
	 *  This function is passed the data from 2 elements of the GSList
	 *  and should return 0 if they are equal, a negative value if the
	 *  first element comes before the second, or a positive value if
	 *  the first element comes after the second.
	 * Returns: the start of the sorted GSList
	 */
	public ListSG sort(GCompareFunc compareFunc);
	
	/**
	 * Like g_slist_sort(), but the sort function accepts a user data argument.
	 * Params:
	 * compareFunc =  comparison function
	 * userData =  data to pass to comparison function
	 * Returns: new head of the list
	 */
	public ListSG sortWithData(GCompareDataFunc compareFunc, void* userData);
	
	/**
	 * Adds the second GSList onto the end of the first GSList.
	 * Note that the elements of the second GSList are not copied.
	 * They are used directly.
	 * Params:
	 * list2 =  the GSList to add to the end of the first GSList
	 * Returns: the start of the new GSList
	 */
	public ListSG concat(ListSG list2);
	
	/**
	 * Calls a function for each element of a GSList.
	 * Params:
	 * func =  the function to call with each element's data
	 * userData =  user data to pass to the function
	 */
	public void foreac(GFunc func, void* userData);
	
	/**
	 * Gets the last element in a GSList.
	 * Note
	 * This function iterates over the whole list.
	 * Returns: the last element in the GSList,  or NULL if the GSList has no elements
	 */
	public ListSG last();
	
	/**
	 * Gets the element at the given position in a GSList.
	 * Params:
	 * n =  the position of the element, counting from 0
	 * Returns: the element, or NULL if the position is off  the end of the GSList
	 */
	public ListSG nth(uint n);
	
	/**
	 * Gets the data of the element at the given position.
	 * Params:
	 * n =  the position of the element
	 * Returns: the element's data, or NULL if the position  is off the end of the GSList
	 */
	public void* nthData(uint n);
	
	/**
	 * Finds the element in a GSList which
	 * contains the given data.
	 * Params:
	 * data =  the element data to find
	 * Returns: the found GSList element,  or NULL if it is not found
	 */
	public ListSG find(void* data);
	
	/**
	 * Finds an element in a GSList, using a supplied function to
	 * find the desired element. It iterates over the list, calling
	 * the given function which should return 0 when the desired
	 * element is found. The function takes two gconstpointer arguments,
	 * the GSList element's data as the first argument and the
	 * given user data.
	 * Params:
	 * data =  user data passed to the function
	 * func =  the function to call for each element.
	 *  It should return 0 when the desired element is found
	 * Returns: the found GSList element, or NULL if it is not found
	 */
	public ListSG findCustom(void* data, GCompareFunc func);
	
	/**
	 * Gets the position of the given element
	 * in the GSList (starting from 0).
	 * Params:
	 * llink =  an element in the GSList
	 * Returns: the position of the element in the GSList,  or -1 if the element is not found
	 */
	public int position(ListSG llink);
	
	/**
	 * Gets the position of the element containing
	 * the given data (starting from 0).
	 * Params:
	 * data =  the data to find
	 * Returns: the index of the element containing the data,  or -1 if the data is not found
	 */
	public int index(void* data);
	
	/**
	 * Warning
	 * g_slist_push_allocator has been deprecated since version 2.10 and should not be used in newly-written code. It does nothing, since GSList has been
	 * converted to the slice allocator
	 * Sets the allocator to use to allocate GSList elements.
	 * Use g_slist_pop_allocator() to restore the previous allocator.
	 * Note that this function is not available if GLib has been compiled
	 * with --disable-mem-pools
	 * Params:
	 * dummy = the GAllocator to use when allocating GSList elements.
	 */
	public static void pushAllocator(void* dummy);
	
	/**
	 * Warning
	 * g_slist_pop_allocator has been deprecated since version 2.10 and should not be used in newly-written code. It does nothing, since GSList has been
	 * converted to the slice allocator
	 * Restores the previous GAllocator, used when allocating GSList elements.
	 * Note that this function is not available if GLib has been compiled
	 * with --disable-mem-pools
	 */
	public static void popAllocator();
}
