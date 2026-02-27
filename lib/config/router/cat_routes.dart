enum CatRoutes {
  splash(path: '/', name: 'splash', moduleIndex: 0, title: 'Cargando...'),
  listcat(path: '/listcat', name: 'listcat', moduleIndex: 1, title: 'Lista de Gatos'),
  detailcat(path: '/detailcat', name: 'detailcat', moduleIndex: 1, title: 'Detalle de Gato');

  final String path;
  final String name;
  final int moduleIndex;
  final String title;

  const CatRoutes({required this.path, required this.name, required this.moduleIndex, required this.title});
}
