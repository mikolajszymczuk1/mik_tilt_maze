import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/cqrs/handler.dart';
import 'package:mik_tilt_maze/features/menu/application/queries/load_levels_metadata/load_levels_metadata_query.dart';

@injectable
class LoadLevelsMetadataQueryHandler
    implements QueryHandler<LoadLevelsMetadataQuery, List<String>> {
  @override
  Future<List<String>> handle(LoadLevelsMetadataQuery query) async {
    const levelsAssetPath = 'lib/features/game/levels_data/';

    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final levelIds =
        manifest
            .listAssets()
            .where(
              (path) =>
                  path.startsWith(levelsAssetPath) && path.endsWith('.json'),
            )
            .map((path) => path.split('/').last.replaceAll('.json', ''))
            .toList()
          ..sort(
            (a, b) => int.parse(
              a.replaceFirst('level_', ''),
            ).compareTo(int.parse(b.replaceFirst('level_', ''))),
          );

    return levelIds;
  }
}
