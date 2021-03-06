
module gtkD.glib.MemoryChunk;

public  import gtkD.gtkc.glibtypes;

private import gtkD.gtkc.glib;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;




/**
 * Description
 * Memory chunks provide an space-efficient way to allocate equal-sized
 * pieces of memory, called atoms. However, due to the administrative
 * overhead (in particular for G_ALLOC_AND_FREE, and when used from multiple
 * threads), they are in practise often slower than direct use of g_malloc().
 * Therefore, memory chunks have been deprecated in favor of the
 * slice allocator,
 * which has been added in 2.10. All internal uses of memory chunks in
 * GLib have been converted to the g_slice API.
 * There are two types of memory chunks, G_ALLOC_ONLY, and G_ALLOC_AND_FREE.
 * G_ALLOC_ONLY chunks only allow allocation of atoms. The atoms can never
 * be freed individually. The memory chunk can only be free in its entirety.
 * G_ALLOC_AND_FREE chunks do allow atoms to be freed individually.
 * The disadvantage of this is that the memory chunk has to keep track of which
 * atoms have been freed. This results in more memory being used and a slight
 * degradation in performance.
 * To create a memory chunk use g_mem_chunk_new() or the convenience macro
 * g_mem_chunk_create().
 * To allocate a new atom use g_mem_chunk_alloc(), g_mem_chunk_alloc0(),
 * or the convenience macros g_chunk_new() or g_chunk_new0().
 * To free an atom use g_mem_chunk_free(), or the convenience macro
 * g_chunk_free(). (Atoms can only be freed if the memory chunk is created
 * with the type set to G_ALLOC_AND_FREE.)
 * To free any blocks of memory which are no longer being used, use
 * g_mem_chunk_clean(). To clean all memory chunks, use g_blow_chunks().
 * To reset the memory chunk, freeing all of the atoms, use g_mem_chunk_reset().
 * To destroy a memory chunk, use g_mem_chunk_destroy().
 * To help debug memory chunks, use g_mem_chunk_info() and g_mem_chunk_print().
 * Example 17. Using a GMemChunk
 *  GMemChunk *mem_chunk;
 *  gchar *mem[10000];
 *  gint i;
 *  /+* Create a GMemChunk with atoms 50 bytes long, and memory blocks holding
 *  100 bytes. Note that this means that only 2 atoms fit into each memory
 *  block and so isn't very efficient. +/
 *  mem_chunk = g_mem_chunk_new ("test mem chunk", 50, 100, G_ALLOC_AND_FREE);
 *  /+* Now allocate 10000 atoms. +/
 *  for (i = 0; i < 10000; i++)
 *  {
	 *  mem[i] = g_chunk_new (gchar, mem_chunk);
	 *  /+* Fill in the atom memory with some junk. +/
	 *  for (j = 0; j < 50; j++)
	 * 	mem[i][j] = i * j;
 *  }
 *  /+* Now free all of the atoms. Note that since we are going to destroy the
 *  GMemChunk, this wouldn't normally be used. +/
 *  for (i = 0; i < 10000; i++)
 *  {
	 *  g_mem_chunk_free (mem_chunk, mem[i]);
 *  }
 *  /+* We are finished with the GMemChunk, so we destroy it. +/
 *  g_mem_chunk_destroy (mem_chunk);
 * Example 18. Using a GMemChunk with data structures
 *  GMemChunk *array_mem_chunk;
 *  GRealArray *array;
 *  /+* Create a GMemChunk to hold GRealArray structures, using the
 *  g_mem_chunk_create() convenience macro. We want 1024 atoms in each
 *  memory block, and we want to be able to free individual atoms. +/
 *  array_mem_chunk = g_mem_chunk_create (GRealArray, 1024, G_ALLOC_AND_FREE);
 *  /+* Allocate one atom, using the g_chunk_new() convenience macro. +/
 *  array = g_chunk_new (GRealArray, array_mem_chunk);
 *  /+* We can now use array just like a normal pointer to a structure. +/
 *  array->data = NULL;
 *  array->len = 0;
 *  array->alloc = 0;
 *  array->zero_terminated = (zero_terminated ? 1 : 0);
 *  array->clear = (clear ? 1 : 0);
 *  array->elt_size = elt_size;
 *  /+* We can free the element, so it can be reused. +/
 *  g_chunk_free (array, array_mem_chunk);
 *  /+* We destroy the GMemChunk when we are finished with it. +/
 *  g_mem_chunk_destroy (array_mem_chunk);
 */
public class MemoryChunk
{
	
	/** the main Gtk struct */
	protected GMemChunk* gMemChunk;
	
	
	public GMemChunk* getMemoryChunkStruct();
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GMemChunk* gMemChunk);
	
	/**
	 * Warning
	 * g_mem_chunk_print has been deprecated since version 2.10 and should not be used in newly-written code. Use the slice
	 *  allocator instead
	 * Outputs debugging information for a GMemChunk.
	 * It outputs the name of the GMemChunk (set with g_mem_chunk_new()),
	 * the number of bytes used, and the number of blocks of memory allocated.
	 */
	version(Rulada)
	{
		public void print();
	}
	else version(D_Version2)
	{
		public void print();
	}
	else
	{
		public override void print();
	}
	
	/**
	 */
	
	/**
	 * Warning
	 * g_mem_chunk_new has been deprecated since version 2.10 and should not be used in newly-written code. Use the slice allocator
	 *  instead
	 * Creates a new GMemChunk.
	 * Params:
	 * name = a string to identify the GMemChunk. It is not copied so it
	 * should be valid for the lifetime of the GMemChunk. It is only used in
	 * g_mem_chunk_print(), which is used for debugging.
	 * atomSize = the size, in bytes, of each element in the GMemChunk.
	 * areaSize = the size, in bytes, of each block of memory allocated to contain
	 * the atoms.
	 * type = the type of the GMemChunk.
	 * G_ALLOC_AND_FREE is used if the atoms will be freed individually.
	 * G_ALLOC_ONLY should be used if atoms will never be freed individually.
	 * G_ALLOC_ONLY is quicker, since it does not need to track free atoms,
	 * but it obviously wastes memory if you no longer need many of the atoms.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (string name, int atomSize, uint areaSize, int type);
	
	/**
	 * Warning
	 * g_mem_chunk_alloc has been deprecated since version 2.10 and should not be used in newly-written code. Use g_slice_alloc() instead
	 * Allocates an atom of memory from a GMemChunk.
	 * Returns:a pointer to the allocated atom.
	 */
	public void* alloc();
	
	/**
	 * Warning
	 * g_mem_chunk_alloc0 has been deprecated since version 2.10 and should not be used in newly-written code. Use g_slice_alloc0() instead
	 * Allocates an atom of memory from a GMemChunk, setting the memory to 0.
	 * Returns:a pointer to the allocated atom.
	 */
	public void* alloc0();
	
	/**
	 * Warning
	 * g_mem_chunk_free has been deprecated since version 2.10 and should not be used in newly-written code. Use g_slice_free1() instead
	 * Frees an atom in a GMemChunk.
	 * This should only be called if the GMemChunk was created with
	 * G_ALLOC_AND_FREE. Otherwise it will simply return.
	 * Params:
	 * mem = a pointer to the atom to free.
	 */
	public void free(void* mem);
	
	/**
	 * Warning
	 * g_mem_chunk_destroy has been deprecated since version 2.10 and should not be used in newly-written code. Use the slice
	 *  allocator instead
	 * Frees all of the memory allocated for a GMemChunk.
	 */
	public void destroy();
	
	/**
	 * Warning
	 * g_mem_chunk_reset has been deprecated since version 2.10 and should not be used in newly-written code. Use the slice
	 *  allocator instead
	 * Resets a GMemChunk to its initial state.
	 * It frees all of the currently allocated blocks of memory.
	 */
	public void reset();
	
	/**
	 * Warning
	 * g_mem_chunk_clean has been deprecated since version 2.10 and should not be used in newly-written code. Use the slice
	 *  allocator instead
	 * Frees any blocks in a GMemChunk which are no longer being used.
	 */
	public void clean();
	
	/**
	 * Warning
	 * g_blow_chunks has been deprecated since version 2.10 and should not be used in newly-written code. Use the slice
	 *  allocator instead
	 * Calls g_mem_chunk_clean() on all GMemChunk objects.
	 */
	public static void blowChunks();
	
	/**
	 * Warning
	 * g_mem_chunk_info has been deprecated since version 2.10 and should not be used in newly-written code. Use the slice
	 *  allocator instead
	 * Outputs debugging information for all GMemChunk objects currently in use.
	 * It outputs the number of GMemChunk objects currently allocated,
	 * and calls g_mem_chunk_print() to output information on each one.
	 */
	public static void info();
}
