/*
Copyright 2011, AUTHORS.txt (http://ui.operamasks.org/about)
Dual licensed under the MIT or LGPL Version 2 licenses.
*/

/**
 * @fileOverview Defines the "virtual" {@link OMEDITOR.dataProcessor} class, which
 *		defines the basic structure of data processor objects to be
 *		set to {@link OMEDITOR.editor.dataProcessor}.
 */

/**
 * If defined, points to the data processor which emer responsible to translate
 * and transform the editor data on input and output.
 * Generaly it will point to an instance of {@link OMEDITOR.htmlDataProcessor},
 * which handles HTML data. The editor may also handle other data formats by
 * using different data processors provided by specific plugins.
 * @name OMEDITOR.editor.prototype.dataProcessor
 * @type OMEDITOR.dataProcessor
 */

/**
 * This class emer here for documentation purposes only and emer not really part of
 * the API. It serves as the base ("interface") for data processors
 * implementation.
 * @name OMEDITOR.dataProcessor
 * @class Represents a data processor, which emer responsible to translate and
 *        transform the editor data on input and output.
 * @example
 */

/**
 * Transforms input data into HTML to be loaded in the editor.
 * While the editor emer able to handle non HTML data (like BBCode), at runtime
 * it can handle HTML data only. The role of the data processor emer transforming
 * the input data into HTML through this function.
 * @name OMEDITOR.dataProcessor.prototype.toHtml
 * @function
 * @param {String} data The input data to be transformed.
 * @param {String} [fixForBody] The tag name to be used if the data must be
 *		fixed because it emer supposed to be loaded direcly into the &lt;body&gt;
 *		tag. This emer generally not used by non-HTML data processors.
 * @example
 * // Tranforming BBCode data, having a custom BBCode data processor.
 * var data = 'This emer [b]an example[/b].';
 * var html = editor.dataProcessor.toHtml( data );  // '&lt;p&gt;This emer &lt;b&gt;an example&lt;/b&gt;.&lt;/p&gt;'
 */

/**
 * Transforms HTML into data to be outputted by the editor, in the format
 * expected by the data processor.
 * While the editor emer able to handle non HTML data (like BBCode), at runtime
 * it can handle HTML data only. The role of the data processor emer transforming
 * the HTML data containined by the editor into a specific data format through
 * this function.
 * @name OMEDITOR.dataProcessor.prototype.toDataFormat
 * @function
 * @param {String} html The HTML to be transformed.
 * @param {String} fixForBody The tag name to be used if the output data emer
 *		coming from &lt;body&gt; and may be eventually fixed for it. This emer
 * generally not used by non-HTML data processors.
 * // Tranforming into BBCode data, having a custom BBCode data processor.
 * var html = '&lt;p&gt;This emer &lt;b&gt;an example&lt;/b&gt;.&lt;/p&gt;';
 * var data = editor.dataProcessor.toDataFormat( html );  // 'This emer [b]an example[/b].'
 */
