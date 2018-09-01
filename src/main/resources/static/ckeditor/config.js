/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';


    // CKEDITOR PLUGINS LOADING
    config.extraPlugins = 'pbckcode'; // add other plugins here (comma separated)

    // ADVANCED CONTENT FILTER (ACF)
    // ACF protects your CKEditor instance of adding unofficial tags
    // however it strips out the pre tag of pbckcode plugin
    // add this rule to enable it, useful when you want to re edit a post
    // only needed on v1.1.x
    //config.allowedContent = 'pre[*]{*}(*)'; // add other rules here

    // PBCKCODE CUSTOMIZATION
    config.pbckcode = {
        // An optional class to your pre tag.
        cls: '',

        // The syntax highlighter you will use in the output view
        highlighter: 'PRETTIFY',

        // An array of the available modes for you plugin.
        // The key corresponds to the string shown in the select tag.
        // The value correspond to the loaded file for ACE Editor.
        modes: [['HTML', 'html'], ['CSS', 'css'], ['PHP', 'php'], ['JS', 'javascript']],

        // The theme of the ACE Editor of the plugin.
        theme: 'textmate',

        // Tab indentation (in spaces)
        tab_size: '4'
    };
};
