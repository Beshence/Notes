// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'boxes/notes_box_v1.dart';
import 'boxes/servers_box_v1.dart';
import 'boxes/suggestions_box_v1.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 6418648264883148521),
      name: 'NoteV1',
      lastPropertyId: const obx_int.IdUid(6, 5938313663445189552),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7663299322526942019),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1640767637990908922),
            name: 'id',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(1, 5596055020906544312)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4811480346116440744),
            name: 'createdAt',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2161686364041747650),
            name: 'modifiedAt',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5556934943868800687),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 5938313663445189552),
            name: 'text',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 4669211194556968395),
      name: 'ServerV1',
      lastPropertyId: const obx_int.IdUid(5, 1151063189204008714),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2640672662774767356),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6898613133216483453),
            name: 'address',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(2, 8913905595206211271)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 918777140285327299),
            name: 'token',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 4579295310147870988),
            name: 'order',
            type: 6,
            flags: 40,
            indexId: const obx_int.IdUid(3, 6970830622761130099)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1151063189204008714),
            name: 'lastEventId',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 7035161971617496177),
      name: 'SuggestionV1',
      lastPropertyId: const obx_int.IdUid(3, 1705943682965986212),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2151033512949093129),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5256995484700967669),
            name: 'name',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(4, 8659008565143219895)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1705943682965986212),
            name: 'data',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(3, 7035161971617496177),
      lastIndexId: const obx_int.IdUid(4, 8659008565143219895),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    NoteV1: obx_int.EntityDefinition<NoteV1>(
        model: _entities[0],
        toOneRelations: (NoteV1 object) => [],
        toManyRelations: (NoteV1 object) => {},
        getId: (NoteV1 object) => object.objectBoxId,
        setId: (NoteV1 object, int id) {
          object.objectBoxId = id;
        },
        objectToFB: (NoteV1 object, fb.Builder fbb) {
          final idOffset = fbb.writeString(object.id);
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final textOffset =
              object.text == null ? null : fbb.writeString(object.text!);
          fbb.startTable(7);
          fbb.addInt64(0, object.objectBoxId);
          fbb.addOffset(1, idOffset);
          fbb.addInt64(2, object.createdAt.millisecondsSinceEpoch);
          fbb.addInt64(3, object.modifiedAt.millisecondsSinceEpoch);
          fbb.addOffset(4, titleOffset);
          fbb.addOffset(5, textOffset);
          fbb.finish(fbb.endTable());
          return object.objectBoxId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final objectBoxIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final idParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final createdAtParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0));
          final modifiedAtParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final textParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final object = NoteV1(
              objectBoxId: objectBoxIdParam,
              id: idParam,
              createdAt: createdAtParam,
              modifiedAt: modifiedAtParam,
              title: titleParam,
              text: textParam);

          return object;
        }),
    ServerV1: obx_int.EntityDefinition<ServerV1>(
        model: _entities[1],
        toOneRelations: (ServerV1 object) => [],
        toManyRelations: (ServerV1 object) => {},
        getId: (ServerV1 object) => object.objectBoxId,
        setId: (ServerV1 object, int id) {
          object.objectBoxId = id;
        },
        objectToFB: (ServerV1 object, fb.Builder fbb) {
          final addressOffset = fbb.writeString(object.address);
          final tokenOffset = fbb.writeString(object.token);
          final lastEventIdOffset = object.lastEventId == null
              ? null
              : fbb.writeString(object.lastEventId!);
          fbb.startTable(6);
          fbb.addInt64(0, object.objectBoxId);
          fbb.addOffset(1, addressOffset);
          fbb.addOffset(2, tokenOffset);
          fbb.addInt64(3, object.order);
          fbb.addOffset(4, lastEventIdOffset);
          fbb.finish(fbb.endTable());
          return object.objectBoxId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final objectBoxIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final addressParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final tokenParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final orderParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final lastEventIdParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12);
          final object = ServerV1(
              objectBoxId: objectBoxIdParam,
              address: addressParam,
              token: tokenParam,
              order: orderParam,
              lastEventId: lastEventIdParam);

          return object;
        }),
    SuggestionV1: obx_int.EntityDefinition<SuggestionV1>(
        model: _entities[2],
        toOneRelations: (SuggestionV1 object) => [],
        toManyRelations: (SuggestionV1 object) => {},
        getId: (SuggestionV1 object) => object.objectBoxId,
        setId: (SuggestionV1 object, int id) {
          object.objectBoxId = id;
        },
        objectToFB: (SuggestionV1 object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final dataOffset =
              object.data == null ? null : fbb.writeString(object.data!);
          fbb.startTable(4);
          fbb.addInt64(0, object.objectBoxId);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, dataOffset);
          fbb.finish(fbb.endTable());
          return object.objectBoxId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final objectBoxIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final dataParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final object = SuggestionV1(
              objectBoxId: objectBoxIdParam, name: nameParam, data: dataParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [NoteV1] entity fields to define ObjectBox queries.
class NoteV1_ {
  /// See [NoteV1.objectBoxId].
  static final objectBoxId =
      obx.QueryIntegerProperty<NoteV1>(_entities[0].properties[0]);

  /// See [NoteV1.id].
  static final id = obx.QueryStringProperty<NoteV1>(_entities[0].properties[1]);

  /// See [NoteV1.createdAt].
  static final createdAt =
      obx.QueryDateProperty<NoteV1>(_entities[0].properties[2]);

  /// See [NoteV1.modifiedAt].
  static final modifiedAt =
      obx.QueryDateProperty<NoteV1>(_entities[0].properties[3]);

  /// See [NoteV1.title].
  static final title =
      obx.QueryStringProperty<NoteV1>(_entities[0].properties[4]);

  /// See [NoteV1.text].
  static final text =
      obx.QueryStringProperty<NoteV1>(_entities[0].properties[5]);
}

/// [ServerV1] entity fields to define ObjectBox queries.
class ServerV1_ {
  /// See [ServerV1.objectBoxId].
  static final objectBoxId =
      obx.QueryIntegerProperty<ServerV1>(_entities[1].properties[0]);

  /// See [ServerV1.address].
  static final address =
      obx.QueryStringProperty<ServerV1>(_entities[1].properties[1]);

  /// See [ServerV1.token].
  static final token =
      obx.QueryStringProperty<ServerV1>(_entities[1].properties[2]);

  /// See [ServerV1.order].
  static final order =
      obx.QueryIntegerProperty<ServerV1>(_entities[1].properties[3]);

  /// See [ServerV1.lastEventId].
  static final lastEventId =
      obx.QueryStringProperty<ServerV1>(_entities[1].properties[4]);
}

/// [SuggestionV1] entity fields to define ObjectBox queries.
class SuggestionV1_ {
  /// See [SuggestionV1.objectBoxId].
  static final objectBoxId =
      obx.QueryIntegerProperty<SuggestionV1>(_entities[2].properties[0]);

  /// See [SuggestionV1.name].
  static final name =
      obx.QueryStringProperty<SuggestionV1>(_entities[2].properties[1]);

  /// See [SuggestionV1.data].
  static final data =
      obx.QueryStringProperty<SuggestionV1>(_entities[2].properties[2]);
}
