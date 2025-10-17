// This sample still does not showcase all CKEditor&nbsp;5 features (!)
	// Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
	CKEDITOR.ClassicEditor.create(document.querySelector("#editor"), {
		// https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
		toolbar: {
			items: [
				"exportPDF",
				"|",
				"findAndReplace",
				"selectAll",
				"|",
				"heading",
				"|",
				"bold",
				"italic",
				"strikethrough",
				"underline",
				"code",
				"subscript",
				"superscript",
				"removeFormat",
				"|",
				"bulletedList",
				"numberedList",
				"todoList",
				"|",
				"outdent",
				"indent",
				"|",
				"undo",
				"redo",
				"-",
				"fontSize",
				"fontFamily",
				"fontColor",
				"fontBackgroundColor",
				"highlight",
				"|",
				"alignment",
				"|",
				"link",
				"uploadImage",
				"blockQuote",
				"insertTable",
				"mediaEmbed",
				"codeBlock",
				"|",
				"specialCharacters",
				"horizontalLine",
				"|",
				"sourceEditing",
			],
			shouldNotGroupWhenFull: true,
		},
		// https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
		heading: {
			options: [
				{
					model: "paragraph",
					title: "Paragraph",
					class: "ck-heading_paragraph",
				},
				{
					model: "heading1",
					view: "h1",
					title: "Heading 1",
					class: "ck-heading_heading1",
				},
				{
					model: "heading2",
					view: "h2",
					title: "Heading 2",
					class: "ck-heading_heading2",
				},
			],
		},
		// https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
		placeholder: "내용을 입력하세요",
		// https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
		fontFamily: {
			options: ["default", "Arial, Helvetica, sans-serif"],
			supportAllValues: true,
		},
		// https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
		fontSize: {
			options: [10, 12, 14, "default", 18, 20, 22],
			supportAllValues: true,
		},
		// Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
		// https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
		htmlSupport: {
			allow: [
				{
					name: /.*/,
					attributes: true,
					classes: true,
					styles: true,
				},
			],
		},
		// https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
		link: {
			decorators: {
				addTargetToExternalLinks: true,
				//   defaultProtocol: "https://",
				toggleDownloadable: {
					mode: "manual",
					label: "Downloadable",
					attributes: {
						download: "file",
					},
				},
			},
		},
		// The "superbuild" contains more premium features that require additional configuration, disable them below.
		// Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
		removePlugins: [
			// These two are commercial, but you can try them out without registering to a trial.
			// 'ExportPdf',
			// 'ExportWord',
			"AIAssistant",
			"CKBox",
			"CKFinder",
			"EasyImage",
			// This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
			// https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
			// Storing images as Base64 is usually a very bad idea.
			// Replace it on production website with other solutions:
			// https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
			// 'Base64UploadAdapter',
			"MultiLevelList",
			"RealTimeCollaborativeComments",
			"RealTimeCollaborativeTrackChanges",
			"RealTimeCollaborativeRevisionHistory",
			"PresenceList",
			"Comments",
			"TrackChanges",
			"TrackChangesData",
			"RevisionHistory",
			"Pagination",
			"WProofreader",
			// Careful, with the Mathtype plugin CKEditor will not load when loading this sample
			// from a local file system (file://) - load this site via HTTP server if you enable MathType.
			"MathType",
			// The following features are part of the Productivity Pack and require additional license.
			"SlashCommand",
			"Template",
			"DocumentOutline",
			"FormatPainter",
			"TableOfContents",
			"PasteFromOfficeEnhanced",
			"CaseChange",
		],
	}).then(editor => {
		window.editor = editor;
	})
	.catch(error => {
		console.error(error);
	});
	
	
	CKEDITOR.ClassicEditor.create(document.querySelector("#editor103"), {
			// https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
			toolbar: {
				items: [
					"exportPDF",
					"|",
					"findAndReplace",
					"selectAll",
					"|",
					"heading",
					"|",
					"bold",
					"italic",
					"strikethrough",
					"underline",
					"code",
					"subscript",
					"superscript",
					"removeFormat",
					"|",
					"bulletedList",
					"numberedList",
					"todoList",
					"|",
					"outdent",
					"indent",
					"|",
					"undo",
					"redo",
					"-",
					"fontSize",
					"fontFamily",
					"fontColor",
					"fontBackgroundColor",
					"highlight",
					"|",
					"alignment",
					"|",
					"link",
					"uploadImage",
					"blockQuote",
					"insertTable",
					"mediaEmbed",
					"codeBlock",
					"|",
					"specialCharacters",
					"horizontalLine",
					"|",
					"sourceEditing",
				],
				shouldNotGroupWhenFull: true,
			},
			// https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
			heading: {
				options: [
					{
						model: "paragraph",
						title: "Paragraph",
						class: "ck-heading_paragraph",
					},
					{
						model: "heading1",
						view: "h1",
						title: "Heading 1",
						class: "ck-heading_heading1",
					},
					{
						model: "heading2",
						view: "h2",
						title: "Heading 2",
						class: "ck-heading_heading2",
					},
				],
			},
			// https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
			placeholder: "내용을 입력하세요",
			// https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
			fontFamily: {
				options: ["default", "Arial, Helvetica, sans-serif"],
				supportAllValues: true,
			},
			// https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
			fontSize: {
				options: [10, 12, 14, "default", 18, 20, 22],
				supportAllValues: true,
			},
			// Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
			// https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
			htmlSupport: {
				allow: [
					{
						name: /.*/,
						attributes: true,
						classes: true,
						styles: true,
					},
				],
			},
			// https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
			link: {
				decorators: {
					addTargetToExternalLinks: true,
					//   defaultProtocol: "https://",
					toggleDownloadable: {
						mode: "manual",
						label: "Downloadable",
						attributes: {
							download: "file",
						},
					},
				},
			},
			// The "superbuild" contains more premium features that require additional configuration, disable them below.
			// Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
			removePlugins: [
				// These two are commercial, but you can try them out without registering to a trial.
				// 'ExportPdf',
				// 'ExportWord',
				"AIAssistant",
				"CKBox",
				"CKFinder",
				"EasyImage",
				// This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
				// https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
				// Storing images as Base64 is usually a very bad idea.
				// Replace it on production website with other solutions:
				// https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
				// 'Base64UploadAdapter',
				"MultiLevelList",
				"RealTimeCollaborativeComments",
				"RealTimeCollaborativeTrackChanges",
				"RealTimeCollaborativeRevisionHistory",
				"PresenceList",
				"Comments",
				"TrackChanges",
				"TrackChangesData",
				"RevisionHistory",
				"Pagination",
				"WProofreader",
				// Careful, with the Mathtype plugin CKEditor will not load when loading this sample
				// from a local file system (file://) - load this site via HTTP server if you enable MathType.
				"MathType",
				// The following features are part of the Productivity Pack and require additional license.
				"SlashCommand",
				"Template",
				"DocumentOutline",
				"FormatPainter",
				"TableOfContents",
				"PasteFromOfficeEnhanced",
				"CaseChange",
			],
		}).then(editor103 => {
			window.editor103 = editor103;
		})
		.catch(error => {
			console.error(error);
		});
	
		
	
	