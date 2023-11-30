materi_document_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
]

materi_document_deps = [
  dependency('gtk4'),
]

gnome = import('gnome')

materi_document_sources += gnome.compile_resources('materi_document-resources',
  'materi_document.gresource.xml',
  c_name: 'materi_document'
)

executable('materi-document', materi_document_sources,
  vala_args: '--target-glib=2.50',  dependencies: materi_document_deps,
  install: true,
)
