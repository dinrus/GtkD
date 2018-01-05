module gtkD.gtk.TextIter;

public  import gtkD.gtkc.gtktypes;

private import gtkD.gtkc.gtk;
private import gtkD.glib.ConstructionException;


private import gtkD.glib.Str;
private import gtkD.gtk.TextBuffer;
private import gtkD.gdk.Pixbuf;
private import gtkD.glib.ListSG;
private import gtkD.gtk.TextChildAnchor;
private import gtkD.gtk.TextTag;
private import gtkD.gtk.TextAttributes;
private import gtkD.pango.PgLanguage;




/**
 * Description
 * You may wish to begin by reading the text widget
 * conceptual overview which gives an overview of all the objects and data
 * types related to the text widget and how they work together.
 */
public class TextIter
{
	
	/** the main Gtk struct */
	protected GtkTextIter* gtkTextIter;
	
	
	public GtkTextIter* getTextIterStruct();
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct();
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkTextIter* gtkTextIter);
	
	/** */
	public this();
	
	
	/**
	 */
	
	/**
	 * Returns the GtkTextBuffer this iterator is associated with.
	 * Returns: the buffer
	 */
	public TextBuffer getBuffer();
	
	/**
	 * Creates a dynamically-allocated copy of an iterator. This function
	 * is not useful in applications, because iterators can be copied with a
	 * simple assignment (GtkTextIter i = j;). The
	 * function is used by language bindings.
	 * Returns: a copy of the iter, free with gtk_text_iter_free()
	 */
	public TextIter copy();
	
	/**
	 * Free an iterator allocated on the heap. This function
	 * is intended for use in language bindings, and is not
	 * especially useful for applications, because iterators can
	 * simply be allocated on the stack.
	 */
	public void free();
	
	/**
	 * Returns the character offset of an iterator.
	 * Each character in a GtkTextBuffer has an offset,
	 * starting with 0 for the first character in the buffer.
	 * Use gtk_text_buffer_get_iter_at_offset() to convert an
	 * offset back into an iterator.
	 * Returns: a character offset
	 */
	public int getOffset();
	
	/**
	 * Returns the line number containing the iterator. Lines in
	 * a GtkTextBuffer are numbered beginning with 0 for the first
	 * line in the buffer.
	 * Returns: a line number
	 */
	public int getLine();
	
	/**
	 * Returns the character offset of the iterator,
	 * counting from the start of a newline-terminated line.
	 * The first character on the line has offset 0.
	 * Returns: offset from start of line
	 */
	public int getLineOffset();
	
	/**
	 * Returns the byte index of the iterator, counting
	 * from the start of a newline-terminated line.
	 * Remember that GtkTextBuffer encodes text in
	 * UTF-8, and that characters can require a variable
	 * number of bytes to represent.
	 * Returns: distance from start of line, in bytes
	 */
	public int getLineIndex();
	
	/**
	 * Returns the number of bytes from the start of the
	 * line to the given iter, not counting bytes that
	 * are invisible due to tags with the "invisible" flag
	 * toggled on.
	 * Returns: byte index of iter with respect to the start of the line
	 */
	public int getVisibleLineIndex();
	
	/**
	 * Returns the offset in characters from the start of the
	 * line to the given iter, not counting characters that
	 * are invisible due to tags with the "invisible" flag
	 * toggled on.
	 * Returns: offset in visible characters from the start of the line
	 */
	public int getVisibleLineOffset();
	
	/**
	 * Returns the Unicode character at this iterator. (Equivalent to
	 * operator* on a C++ iterator.) If the element at this iterator is a
	 * non-character element, such as an image embedded in the buffer, the
	 * Unicode "unknown" character 0xFFFC is returned. If invoked on
	 * the end iterator, zero is returned; zero is not a valid Unicode character.
	 * So you can write a loop which ends when gtk_text_iter_get_char()
	 * returns 0.
	 * Returns: a Unicode character, or 0 if iter is not dereferenceable
	 */
	public gunichar getChar();
	
	/**
	 * Returns the text in the given range. A "slice" is an array of
	 * characters encoded in UTF-8 format, including the Unicode "unknown"
	 * character 0xFFFC for iterable non-character elements in the buffer,
	 * such as images. Because images are encoded in the slice, byte and
	 * character offsets in the returned array will correspond to byte
	 * offsets in the text buffer. Note that 0xFFFC can occur in normal
	 * text as well, so it is not a reliable indicator that a pixbuf or
	 * widget is in the buffer.
	 * Params:
	 * end =  iterator at end of a range
	 * Returns: slice of text from the buffer
	 */
	public string getSlice(TextIter end);
	
	/**
	 * Returns text in the given range. If the range
	 * contains non-text elements such as images, the character and byte
	 * offsets in the returned string will not correspond to character and
	 * byte offsets in the buffer. If you want offsets to correspond, see
	 * gtk_text_iter_get_slice().
	 * Params:
	 * end =  iterator at end of a range
	 * Returns: array of characters from the buffer
	 */
	public string getText(TextIter end);
	
	/**
	 * Like gtk_text_iter_get_slice(), but invisible text is not included.
	 * Invisible text is usually invisible because a GtkTextTag with the
	 * "invisible" attribute turned on has been applied to it.
	 * Params:
	 * end =  iterator at end of range
	 * Returns: slice of text from the buffer
	 */
	public string getVisibleSlice(TextIter end);
	
	/**
	 * Like gtk_text_iter_get_text(), but invisible text is not included.
	 * Invisible text is usually invisible because a GtkTextTag with the
	 * "invisible" attribute turned on has been applied to it.
	 * Params:
	 * end =  iterator at end of range
	 * Returns: string containing visible text in the range
	 */
	public string getVisibleText(TextIter end);
	
	/**
	 * If the element at iter is a pixbuf, the pixbuf is returned
	 * (with no new reference count added). Otherwise,
	 * NULL is returned.
	 * Returns: the pixbuf at iter
	 */
	public Pixbuf getPixbuf();
	
	/**
	 * Returns a list of all GtkTextMark at this location. Because marks
	 * are not iterable (they don't take up any "space" in the buffer,
	 * they are just marks in between iterable locations), multiple marks
	 * can exist in the same place. The returned list is not in any
	 * meaningful order.
	 * Returns: list of GtkTextMark
	 */
	public ListSG getMarks();
	
	/**
	 * Returns a list of GtkTextTag that are toggled on or off at this
	 * point. (If toggled_on is TRUE, the list contains tags that are
	 * toggled on.) If a tag is toggled on at iter, then some non-empty
	 * range of characters following iter has that tag applied to it. If
	 * a tag is toggled off, then some non-empty range following iter
	 * does not have the tag applied to it.
	 * Params:
	 * toggledOn =  TRUE to get toggled-on tags
	 * Returns: tags toggled at this point
	 */
	public ListSG getToggledTags(int toggledOn);
	
	/**
	 * If the location at iter contains a child anchor, the
	 * anchor is returned (with no new reference count added). Otherwise,
	 * NULL is returned.
	 * Returns: the anchor at iter
	 */
	public TextChildAnchor getChildAnchor();
	
	/**
	 * Returns TRUE if tag is toggled on at exactly this point. If tag
	 * is NULL, returns TRUE if any tag is toggled on at this point. Note
	 * that the gtk_text_iter_begins_tag() returns TRUE if iter is the
	 * start of the tagged range;
	 * gtk_text_iter_has_tag() tells you whether an iterator is
	 * within a tagged range.
	 * Params:
	 * tag =  a GtkTextTag, or NULL
	 * Returns: whether iter is the start of a range tagged with tag
	 */
	public int beginsTag(TextTag tag);
	
	/**
	 * Returns TRUE if tag is toggled off at exactly this point. If tag
	 * is NULL, returns TRUE if any tag is toggled off at this point. Note
	 * that the gtk_text_iter_ends_tag() returns TRUE if iter is the
	 * end of the tagged range;
	 * gtk_text_iter_has_tag() tells you whether an iterator is
	 * within a tagged range.
	 * Params:
	 * tag =  a GtkTextTag, or NULL
	 * Returns: whether iter is the end of a range tagged with tag
	 */
	public int endsTag(TextTag tag);
	
	/**
	 * This is equivalent to (gtk_text_iter_begins_tag() ||
	 * gtk_text_iter_ends_tag()), i.e. it tells you whether a range with
	 * tag applied to it begins or ends at iter.
	 * Params:
	 * tag =  a GtkTextTag, or NULL
	 * Returns: whether tag is toggled on or off at iter
	 */
	public int togglesTag(TextTag tag);
	
	/**
	 * Returns TRUE if iter is within a range tagged with tag.
	 * Params:
	 * tag =  a GtkTextTag
	 * Returns: whether iter is tagged with tag
	 */
	public int hasTag(TextTag tag);
	
	/**
	 * Returns a list of tags that apply to iter, in ascending order of
	 * priority (highest-priority tags are last). The GtkTextTag in the
	 * list don't have a reference added, but you have to free the list
	 * itself.
	 * Returns: list of GtkTextTag
	 */
	public ListSG getTags();
	
	/**
	 * Returns whether the character at iter is within an editable region
	 * of text. Non-editable text is "locked" and can't be changed by the
	 * user via GtkTextView. This function is simply a convenience
	 * wrapper around gtk_text_iter_get_attributes(). If no tags applied
	 * to this text affect editability, default_setting will be returned.
	 * You don't want to use this function to decide whether text can be
	 * inserted at iter, because for insertion you don't want to know
	 * whether the char at iter is inside an editable range, you want to
	 * know whether a new character inserted at iter would be inside an
	 * editable range. Use gtk_text_iter_can_insert() to handle this
	 * case.
	 * Params:
	 * defaultSetting =  TRUE if text is editable by default
	 * Returns: whether iter is inside an editable range
	 */
	public int editable(int defaultSetting);
	
	/**
	 * Considering the default editability of the buffer, and tags that
	 * affect editability, determines whether text inserted at iter would
	 * be editable. If text inserted at iter would be editable then the
	 * user should be allowed to insert text at iter.
	 * gtk_text_buffer_insert_interactive() uses this function to decide
	 * whether insertions are allowed at a given position.
	 * Params:
	 * defaultEditability =  TRUE if text is editable by default
	 * Returns: whether text inserted at iter would be editable
	 */
	public int canInsert(int defaultEditability);
	
	/**
	 * Determines whether iter begins a natural-language word. Word
	 * breaks are determined by Pango and should be correct for nearly any
	 * language (if not, the correct fix would be to the Pango word break
	 * algorithms).
	 * Returns: TRUE if iter is at the start of a word
	 */
	public int startsWord();
	
	/**
	 * Determines whether iter ends a natural-language word. Word breaks
	 * are determined by Pango and should be correct for nearly any
	 * language (if not, the correct fix would be to the Pango word break
	 * algorithms).
	 * Returns: TRUE if iter is at the end of a word
	 */
	public int endsWord();
	
	/**
	 * Determines whether iter is inside a natural-language word (as
	 * opposed to say inside some whitespace). Word breaks are determined
	 * by Pango and should be correct for nearly any language (if not, the
	 * correct fix would be to the Pango word break algorithms).
	 * Returns: TRUE if iter is inside a word
	 */
	public int insideWord();
	
	/**
	 * Returns TRUE if iter begins a paragraph,
	 * i.e. if gtk_text_iter_get_line_offset() would return 0.
	 * However this function is potentially more efficient than
	 * gtk_text_iter_get_line_offset() because it doesn't have to compute
	 * the offset, it just has to see whether it's 0.
	 * Returns: whether iter begins a line
	 */
	public int startsLine();
	
	/**
	 * Returns TRUE if iter points to the start of the paragraph
	 * delimiter characters for a line (delimiters will be either a
	 * newline, a carriage return, a carriage return followed by a
	 * newline, or a Unicode paragraph separator character). Note that an
	 * iterator pointing to the \n of a \r\n pair will not be counted as
	 * the end of a line, the line ends before the \r. The end iterator is
	 * considered to be at the end of a line, even though there are no
	 * paragraph delimiter chars there.
	 * Returns: whether iter is at the end of a line
	 */
	public int endsLine();
	
	/**
	 * Determines whether iter begins a sentence. Sentence boundaries are
	 * determined by Pango and should be correct for nearly any language
	 * (if not, the correct fix would be to the Pango text boundary
	 * algorithms).
	 * Returns: TRUE if iter is at the start of a sentence.
	 */
	public int startsSentence();
	
	/**
	 * Determines whether iter ends a sentence. Sentence boundaries are
	 * determined by Pango and should be correct for nearly any language
	 * (if not, the correct fix would be to the Pango text boundary
	 * algorithms).
	 * Returns: TRUE if iter is at the end of a sentence.
	 */
	public int endsSentence();
	
	/**
	 * Determines whether iter is inside a sentence (as opposed to in
	 * between two sentences, e.g. after a period and before the first
	 * letter of the next sentence). Sentence boundaries are determined
	 * by Pango and should be correct for nearly any language (if not, the
	 * correct fix would be to the Pango text boundary algorithms).
	 * Returns: TRUE if iter is inside a sentence.
	 */
	public int insideSentence();
	
	/**
	 * See gtk_text_iter_forward_cursor_position() or PangoLogAttr or
	 * pango_break() for details on what a cursor position is.
	 * Returns: TRUE if the cursor can be placed at iter
	 */
	public int isCursorPosition();
	
	/**
	 * Returns the number of characters in the line containing iter,
	 * including the paragraph delimiters.
	 * Returns: number of characters in the line
	 */
	public int getCharsInLine();
	
	/**
	 * Returns the number of bytes in the line containing iter,
	 * including the paragraph delimiters.
	 * Returns: number of bytes in the line
	 */
	public int getBytesInLine();
	
	/**
	 * Computes the effect of any tags applied to this spot in the
	 * text. The values parameter should be initialized to the default
	 * settings you wish to use if no tags are in effect. You'd typically
	 * obtain the defaults from gtk_text_view_get_default_attributes().
	 * gtk_text_iter_get_attributes() will modify values, applying the
	 * effects of any tags present at iter. If any tags affected values,
	 * the function returns TRUE.
	 * Params:
	 * values =  a GtkTextAttributes to be filled in
	 * Returns: TRUE if values was modified
	 */
	public int getAttributes(TextAttributes values);
	
	/**
	 * A convenience wrapper around gtk_text_iter_get_attributes(),
	 * which returns the language in effect at iter. If no tags affecting
	 * language apply to iter, the return value is identical to that of
	 * gtk_get_default_language().
	 * Returns: language in effect at iter
	 */
	public PgLanguage getLanguage();
	
	/**
	 * Returns TRUE if iter is the end iterator, i.e. one past the last
	 * dereferenceable iterator in the buffer. gtk_text_iter_is_end() is
	 * the most efficient way to check whether an iterator is the end
	 * iterator.
	 * Returns: whether iter is the end iterator
	 */
	public int isEnd();
	
	/**
	 * Returns TRUE if iter is the first iterator in the buffer, that is
	 * if iter has a character offset of 0.
	 * Returns: whether iter is the first in the buffer
	 */
	public int isStart();
	
	/**
	 * Moves iter forward by one character offset. Note that images
	 * embedded in the buffer occupy 1 character slot, so
	 * gtk_text_iter_forward_char() may actually move onto an image instead
	 * of a character, if you have images in your buffer. If iter is the
	 * end iterator or one character before it, iter will now point at
	 * the end iterator, and gtk_text_iter_forward_char() returns FALSE for
	 * convenience when writing loops.
	 * Returns: whether iter moved and is dereferenceable
	 */
	public int forwardChar();
	
	/**
	 * Moves backward by one character offset. Returns TRUE if movement
	 * was possible; if iter was the first in the buffer (character
	 * offset 0), gtk_text_iter_backward_char() returns FALSE for convenience when
	 * writing loops.
	 * Returns: whether movement was possible
	 */
	public int backwardChar();
	
	/**
	 * Moves count characters if possible (if count would move past the
	 * start or end of the buffer, moves to the start or end of the
	 * buffer). The return value indicates whether the new position of
	 * iter is different from its original position, and dereferenceable
	 * (the last iterator in the buffer is not dereferenceable). If count
	 * is 0, the function does nothing and returns FALSE.
	 * Params:
	 * count =  number of characters to move, may be negative
	 * Returns: whether iter moved and is dereferenceable
	 */
	public int forwardChars(int count);
	
	/**
	 * Moves count characters backward, if possible (if count would move
	 * past the start or end of the buffer, moves to the start or end of
	 * the buffer). The return value indicates whether the iterator moved
	 * onto a dereferenceable position; if the iterator didn't move, or
	 * moved onto the end iterator, then FALSE is returned. If count is 0,
	 * the function does nothing and returns FALSE.
	 * Params:
	 * count =  number of characters to move
	 * Returns: whether iter moved and is dereferenceable
	 */
	public int backwardChars(int count);
	
	/**
	 * Moves iter to the start of the next line. If the iter is already on the
	 * last line of the buffer, moves the iter to the end of the current line.
	 * If after the operation, the iter is at the end of the buffer and not
	 * dereferencable, returns FALSE. Otherwise, returns TRUE.
	 * Returns: whether iter can be dereferenced
	 */
	public int forwardLine();
	
	/**
	 * Moves iter to the start of the previous line. Returns TRUE if
	 * iter could be moved; i.e. if iter was at character offset 0, this
	 * function returns FALSE. Therefore if iter was already on line 0,
	 * but not at the start of the line, iter is snapped to the start of
	 * the line and the function returns TRUE. (Note that this implies that
	 * in a loop calling this function, the line number may not change on
	 * every iteration, if your first iteration is on line 0.)
	 * Returns: whether iter moved
	 */
	public int backwardLine();
	
	/**
	 * Moves count lines forward, if possible (if count would move
	 * past the start or end of the buffer, moves to the start or end of
	 * the buffer). The return value indicates whether the iterator moved
	 * onto a dereferenceable position; if the iterator didn't move, or
	 * moved onto the end iterator, then FALSE is returned. If count is 0,
	 * the function does nothing and returns FALSE. If count is negative,
	 * moves backward by 0 - count lines.
	 * Params:
	 * count =  number of lines to move forward
	 * Returns: whether iter moved and is dereferenceable
	 */
	public int forwardLines(int count);
	
	/**
	 * Moves count lines backward, if possible (if count would move
	 * past the start or end of the buffer, moves to the start or end of
	 * the buffer). The return value indicates whether the iterator moved
	 * onto a dereferenceable position; if the iterator didn't move, or
	 * moved onto the end iterator, then FALSE is returned. If count is 0,
	 * the function does nothing and returns FALSE. If count is negative,
	 * moves forward by 0 - count lines.
	 * Params:
	 * count =  number of lines to move backward
	 * Returns: whether iter moved and is dereferenceable
	 */
	public int backwardLines(int count);
	
	/**
	 * Calls gtk_text_iter_forward_word_end() up to count times.
	 * Params:
	 * count =  number of times to move
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int forwardWordEnds(int count);
	
	/**
	 * Calls gtk_text_iter_backward_word_start() up to count times.
	 * Params:
	 * count =  number of times to move
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int backwardWordStarts(int count);
	
	/**
	 * Moves forward to the next word end. (If iter is currently on a
	 * word end, moves forward to the next one after that.) Word breaks
	 * are determined by Pango and should be correct for nearly any
	 * language (if not, the correct fix would be to the Pango word break
	 * algorithms).
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int forwardWordEnd();
	
	/**
	 * Moves backward to the previous word start. (If iter is currently on a
	 * word start, moves backward to the next one after that.) Word breaks
	 * are determined by Pango and should be correct for nearly any
	 * language (if not, the correct fix would be to the Pango word break
	 * algorithms).
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int backwardWordStart();
	
	/**
	 * Moves iter forward by a single cursor position. Cursor positions
	 * are (unsurprisingly) positions where the cursor can appear. Perhaps
	 * surprisingly, there may not be a cursor position between all
	 * characters. The most common example for European languages would be
	 * a carriage return/newline sequence. For some Unicode characters,
	 * the equivalent of say the letter "a" with an accent mark will be
	 * represented as two characters, first the letter then a "combining
	 * mark" that causes the accent to be rendered; so the cursor can't go
	 * between those two characters. See also the PangoLogAttr structure and
	 * pango_break() function.
	 * Returns: TRUE if we moved and the new position is dereferenceable
	 */
	public int forwardCursorPosition();
	
	/**
	 * Like gtk_text_iter_forward_cursor_position(), but moves backward.
	 * Returns: TRUE if we moved
	 */
	public int backwardCursorPosition();
	
	/**
	 * Moves up to count cursor positions. See
	 * gtk_text_iter_forward_cursor_position() for details.
	 * Params:
	 * count =  number of positions to move
	 * Returns: TRUE if we moved and the new position is dereferenceable
	 */
	public int forwardCursorPositions(int count);
	
	/**
	 * Moves up to count cursor positions. See
	 * gtk_text_iter_forward_cursor_position() for details.
	 * Params:
	 * count =  number of positions to move
	 * Returns: TRUE if we moved and the new position is dereferenceable
	 */
	public int backwardCursorPositions(int count);
	
	/**
	 * Moves backward to the previous sentence start; if iter is already at
	 * the start of a sentence, moves backward to the next one. Sentence
	 * boundaries are determined by Pango and should be correct for nearly
	 * any language (if not, the correct fix would be to the Pango text
	 * boundary algorithms).
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int backwardSentenceStart();
	
	/**
	 * Calls gtk_text_iter_backward_sentence_start() up to count times,
	 * or until it returns FALSE. If count is negative, moves forward
	 * instead of backward.
	 * Params:
	 * count =  number of sentences to move
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int backwardSentenceStarts(int count);
	
	/**
	 * Moves forward to the next sentence end. (If iter is at the end of
	 * a sentence, moves to the next end of sentence.) Sentence
	 * boundaries are determined by Pango and should be correct for nearly
	 * any language (if not, the correct fix would be to the Pango text
	 * boundary algorithms).
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int forwardSentenceEnd();
	
	/**
	 * Calls gtk_text_iter_forward_sentence_end() count times (or until
	 * gtk_text_iter_forward_sentence_end() returns FALSE). If count is
	 * negative, moves backward instead of forward.
	 * Params:
	 * count =  number of sentences to move
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int forwardSentenceEnds(int count);
	
	/**
	 * Calls gtk_text_iter_forward_visible_word_end() up to count times.
	 * Since 2.4
	 * Params:
	 * count =  number of times to move
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int forwardVisibleWordEnds(int count);
	
	/**
	 * Calls gtk_text_iter_backward_visible_word_start() up to count times.
	 * Since 2.4
	 * Params:
	 * count =  number of times to move
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int backwardVisibleWordStarts(int count);
	
	/**
	 * Moves forward to the next visible word end. (If iter is currently on a
	 * word end, moves forward to the next one after that.) Word breaks
	 * are determined by Pango and should be correct for nearly any
	 * language (if not, the correct fix would be to the Pango word break
	 * algorithms).
	 * Since 2.4
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int forwardVisibleWordEnd();
	
	/**
	 * Moves backward to the previous visible word start. (If iter is currently
	 * on a word start, moves backward to the next one after that.) Word breaks
	 * are determined by Pango and should be correct for nearly any
	 * language (if not, the correct fix would be to the Pango word break
	 * algorithms).
	 * Since 2.4
	 * Returns: TRUE if iter moved and is not the end iterator
	 */
	public int backwardVisibleWordStart();
	
	/**
	 * Moves iter forward to the next visible cursor position. See
	 * gtk_text_iter_forward_cursor_position() for details.
	 * Since 2.4
	 * Returns: TRUE if we moved and the new position is dereferenceable
	 */
	public int forwardVisibleCursorPosition();
	
	/**
	 * Moves iter forward to the previous visible cursor position. See
	 * gtk_text_iter_backward_cursor_position() for details.
	 * Since 2.4
	 * Returns: TRUE if we moved and the new position is dereferenceable
	 */
	public int backwardVisibleCursorPosition();
	
	/**
	 * Moves up to count visible cursor positions. See
	 * gtk_text_iter_forward_cursor_position() for details.
	 * Since 2.4
	 * Params:
	 * count =  number of positions to move
	 * Returns: TRUE if we moved and the new position is dereferenceable
	 */
	public int forwardVisibleCursorPositions(int count);
	
	/**
	 * Moves up to count visible cursor positions. See
	 * gtk_text_iter_backward_cursor_position() for details.
	 * Since 2.4
	 * Params:
	 * count =  number of positions to move
	 * Returns: TRUE if we moved and the new position is dereferenceable
	 */
	public int backwardVisibleCursorPositions(int count);
	/**
	 * Moves iter to the start of the next visible line. Returns TRUE if there
	 * was a next line to move to, and FALSE if iter was simply moved to
	 * the end of the buffer and is now not dereferenceable, or if iter was
	 * already at the end of the buffer.
	 * Since 2.8
	 * Returns: whether iter can be dereferenced
	 */
	public int forwardVisibleLine();

	/**
	 * Moves iter to the start of the previous visible line. Returns TRUE if
	 * iter could be moved; i.e. if iter was at character offset 0, this
	 * function returns FALSE. Therefore if iter was already on line 0,
	 * but not at the start of the line, iter is snapped to the start of
	 * the line and the function returns TRUE. (Note that this implies that
	 * in a loop calling this function, the line number may not change on
	 * every iteration, if your first iteration is on line 0.)
	 * Since 2.8
	 * Returns: whether iter moved
	 */
	public int backwardVisibleLine();
	
	/**
	 * Moves count visible lines forward, if possible (if count would move
	 * past the start or end of the buffer, moves to the start or end of
	 * the buffer). The return value indicates whether the iterator moved
	 * onto a dereferenceable position; if the iterator didn't move, or
	 * moved onto the end iterator, then FALSE is returned. If count is 0,
	 * the function does nothing and returns FALSE. If count is negative,
	 * moves backward by 0 - count lines.
	 * Since 2.8
	 * Params:
	 * count =  number of lines to move forward
	 * Returns: whether iter moved and is dereferenceable
	 */
	public int forwardVisibleLines(int count);
	
	/**
	 * Moves count visible lines backward, if possible (if count would move
	 * past the start or end of the buffer, moves to the start or end of
	 * the buffer). The return value indicates whether the iterator moved
	 * onto a dereferenceable position; if the iterator didn't move, or
	 * moved onto the end iterator, then FALSE is returned. If count is 0,
	 * the function does nothing and returns FALSE. If count is negative,
	 * moves forward by 0 - count lines.
	 * Since 2.8
	 * Params:
	 * count =  number of lines to move backward
	 * Returns: whether iter moved and is dereferenceable
	 */
	public int backwardVisibleLines(int count);
	
	/**
	 * Sets iter to point to char_offset. char_offset counts from the start
	 * of the entire text buffer, starting with 0.
	 * Params:
	 * charOffset =  a character number
	 */
	public void setOffset(int charOffset);
	
	/**
	 * Moves iterator iter to the start of the line line_number. If
	 * line_number is negative or larger than the number of lines in the
	 * buffer, moves iter to the start of the last line in the buffer.
	 * Params:
	 * lineNumber =  line number (counted from 0)
	 */
	public void setLine(int lineNumber);
	
	/**
	 * Moves iter within a line, to a new character
	 * (not byte) offset. The given character offset must be less than or
	 * equal to the number of characters in the line; if equal, iter
	 * moves to the start of the next line. See
	 * gtk_text_iter_set_line_index() if you have a byte index rather than
	 * a character offset.
	 * Params:
	 * charOnLine =  a character offset relative to the start of iter's current line
	 */
	public void setLineOffset(int charOnLine);
	
	/**
	 * Same as gtk_text_iter_set_line_offset(), but works with a
	 * byte index. The given byte index must be at
	 * the start of a character, it can't be in the middle of a UTF-8
	 * encoded character.
	 * Params:
	 * byteOnLine =  a byte index relative to the start of iter's current line
	 */
	public void setLineIndex(int byteOnLine);
	
	/**
	 * Like gtk_text_iter_set_line_index(), but the index is in visible
	 * bytes, i.e. text with a tag making it invisible is not counted
	 * in the index.
	 * Params:
	 * byteOnLine =  a byte index
	 */
	public void setVisibleLineIndex(int byteOnLine);
	
	/**
	 * Like gtk_text_iter_set_line_offset(), but the offset is in visible
	 * characters, i.e. text with a tag making it invisible is not
	 * counted in the offset.
	 * Params:
	 * charOnLine =  a character offset
	 */
	public void setVisibleLineOffset(int charOnLine);
	
	/**
	 * Moves iter forward to the "end iterator," which points one past the last
	 * valid character in the buffer. gtk_text_iter_get_char() called on the
	 * end iterator returns 0, which is convenient for writing loops.
	 */
	public void forwardToEnd();
	
	/**
	 * Moves the iterator to point to the paragraph delimiter characters,
	 * which will be either a newline, a carriage return, a carriage
	 * return/newline in sequence, or the Unicode paragraph separator
	 * character. If the iterator is already at the paragraph delimiter
	 * characters, moves to the paragraph delimiter characters for the
	 * next line. If iter is on the last line in the buffer, which does
	 * not end in paragraph delimiters, moves to the end iterator (end of
	 * the last line), and returns FALSE.
	 * Returns: TRUE if we moved and the new location is not the end iterator
	 */
	public int forwardToLineEnd();
	
	/**
	 * Moves forward to the next toggle (on or off) of the
	 * GtkTextTag tag, or to the next toggle of any tag if
	 * tag is NULL. If no matching tag toggles are found,
	 * returns FALSE, otherwise TRUE. Does not return toggles
	 * located at iter, only toggles after iter. Sets iter to
	 * the location of the toggle, or to the end of the buffer
	 * if no toggle is found.
	 * Params:
	 * tag =  a GtkTextTag, or NULL
	 * Returns: whether we found a tag toggle after iter
	 */
	public int forwardToTagToggle(TextTag tag);
	
	/**
	 * Moves backward to the next toggle (on or off) of the
	 * GtkTextTag tag, or to the next toggle of any tag if
	 * tag is NULL. If no matching tag toggles are found,
	 * returns FALSE, otherwise TRUE. Does not return toggles
	 * located at iter, only toggles before iter. Sets iter
	 * to the location of the toggle, or the start of the buffer
	 * if no toggle is found.
	 * Params:
	 * tag =  a GtkTextTag, or NULL
	 * Returns: whether we found a tag toggle before iter
	 */
	public int backwardToTagToggle(TextTag tag);
	
	/**
	 * Advances iter, calling pred on each character. If
	 * pred returns TRUE, returns TRUE and stops scanning.
	 * If pred never returns TRUE, iter is set to limit if
	 * limit is non-NULL, otherwise to the end iterator.
	 * Params:
	 * pred =  a function to be called on each character
	 * userData =  user data for pred
	 * limit =  search limit, or NULL for none
	 * Returns: whether a match was found
	 */
	public int forwardFindChar(GtkTextCharPredicate pred, void* userData, TextIter limit);
	
	/**
	 * Same as gtk_text_iter_forward_find_char(), but goes backward from iter.
	 * Params:
	 * pred =  function to be called on each character
	 * userData =  user data for pred
	 * limit =  search limit, or NULL for none
	 * Returns: whether a match was found
	 */
	public int backwardFindChar(GtkTextCharPredicate pred, void* userData, TextIter limit);
	
	/**
	 * Searches forward for str. Any match is returned by setting
	 * match_start to the first character of the match and match_end to the
	 * first character after the match. The search will not continue past
	 * limit. Note that a search is a linear or O(n) operation, so you
	 * may wish to use limit to avoid locking up your UI on large
	 * buffers.
	 * If the GTK_TEXT_SEARCH_VISIBLE_ONLY flag is present, the match may
	 * have invisible text interspersed in str. i.e. str will be a
	 * possibly-noncontiguous subsequence of the matched range. similarly,
	 * if you specify GTK_TEXT_SEARCH_TEXT_ONLY, the match may have
	 * pixbufs or child widgets mixed inside the matched range. If these
	 * flags are not given, the match must be exact; the special 0xFFFC
	 * character in str will match embedded pixbufs or child widgets.
	 * Params:
	 * str =  a search string
	 * flags =  flags affecting how the search is done
	 * matchStart =  return location for start of match, or NULL
	 * matchEnd =  return location for end of match, or NULL
	 * limit =  bound for the search, or NULL for the end of the buffer
	 * Returns: whether a match was found
	 */
	public int forwardSearch(string str, GtkTextSearchFlags flags, TextIter matchStart, TextIter matchEnd, TextIter limit);
	
	/**
	 * Same as gtk_text_iter_forward_search(), but moves backward.
	 * Params:
	 * str =  search string
	 * flags =  bitmask of flags affecting the search
	 * matchStart =  return location for start of match, or NULL
	 * matchEnd =  return location for end of match, or NULL
	 * limit =  location of last possible match_start, or NULL for start of buffer
	 * Returns: whether a match was found
	 */
	public int backwardSearch(string str, GtkTextSearchFlags flags, TextIter matchStart, TextIter matchEnd, TextIter limit);
	
	/**
	 * Tests whether two iterators are equal, using the fastest possible
	 * mechanism. This function is very fast; you can expect it to perform
	 * better than e.g. getting the character offset for each iterator and
	 * comparing the offsets yourself. Also, it's a bit faster than
	 * gtk_text_iter_compare().
	 * Params:
	 * rhs =  another GtkTextIter
	 * Returns: TRUE if the iterators point to the same place in the buffer
	 */
	public int equal(TextIter rhs);
	
	/**
	 * A qsort()-style function that returns negative if lhs is less than
	 * rhs, positive if lhs is greater than rhs, and 0 if they're equal.
	 * Ordering is in character offset order, i.e. the first character in the buffer
	 * is less than the second character in the buffer.
	 * Params:
	 * rhs =  another GtkTextIter
	 * Returns: -1 if lhs is less than rhs, 1 if lhs is greater, 0 if they are equal
	 */
	public int compare(TextIter rhs);
	
	/**
	 * Checks whether iter falls in the range [start, end).
	 * start and end must be in ascending order.
	 * Params:
	 * start =  start of range
	 * end =  end of range
	 * Returns: TRUE if iter is in the range
	 */
	public int inRange(TextIter start, TextIter end);
	
	/**
	 * Swaps the value of first and second if second comes before
	 * first in the buffer. That is, ensures that first and second are
	 * in sequence. Most text buffer functions that take a range call this
	 * automatically on your behalf, so there's no real reason to call it yourself
	 * in those cases. There are some exceptions, such as gtk_text_iter_in_range(),
	 * that expect a pre-sorted range.
	 * Params:
	 * second =  another GtkTextIter
	 */
	public void order(TextIter second);
}