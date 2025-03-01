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

import 'boxes/events_box_v1.dart';
import 'boxes/notes_box_v1.dart';
import 'boxes/servers_box_v1.dart';
import 'boxes/suggestions_box_v1.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 3553965224781449731),
      name: 'ServerV1',
      lastPropertyId: const obx_int.IdUid(5, 6566235524209993216),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4829534177040021320),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5887694889753897601),
            name: 'address',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(3, 108077167109958859)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1585814830122656348),
            name: 'token',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3599481749148606389),
            name: 'order',
            type: 6,
            flags: 40,
            indexId: const obx_int.IdUid(4, 8559891187531066903)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 6566235524209993216),
            name: 'lastEventId',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 5114660945951561952),
      name: 'SuggestionV1',
      lastPropertyId: const obx_int.IdUid(3, 1217023794932705423),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1031018416092211487),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7748878161054383373),
            name: 'name',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(5, 8378110497491397150)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1217023794932705423),
            name: 'data',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(6, 1147931286378033022),
      name: 'NoteV1',
      lastPropertyId: const obx_int.IdUid(7, 7445643926305920763),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7291602325338494453),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6086140606484338637),
            name: 'id',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(6, 4077285268859814141)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4730067559154582414),
            name: 'createdAt',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 170160688986625962),
            name: 'modifiedAt',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1852270230518595786),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 5777128798332125281),
            name: 'text',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 7445643926305920763),
            name: 'deleted',
            type: 1,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(7, 1471989264901194942),
      name: 'EventV1',
      lastPropertyId: const obx_int.IdUid(10, 320149354625817675),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2017543549357872626),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7926862833358551655),
            name: 'id',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1857989553071491577),
            name: 'type',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 7453204468056742609),
            name: 'v',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 4210281872934715268),
            name: 'timestamp',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 5506095661308959348),
            name: 'applied',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 320149354625817675),
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
      lastEntityId: const obx_int.IdUid(7, 1471989264901194942),
      lastIndexId: const obx_int.IdUid(6, 4077285268859814141),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [
        863594941756572646,
        349507091380689959,
        6006003953497071043
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        8978142677250676671,
        330582822938301416,
        1917882053980317808,
        2079328099916470224,
        5113967944150913497,
        4577503235811178359,
        3032011050505503452,
        5858172974274699921,
        7409050764233876568,
        6703584039622439264,
        8431372522042999510,
        6170379021057657937,
        4656334146689087787,
        5083553495423764237,
        1941982804432135666,
        1058376607268439307,
        5977489160618707973,
        6039826224761361278,
        3748787353163575142,
        4237851363352244624,
        5094004173957601725,
        4793978351494192130,
        2512403238363187810,
        1983953306033387501,
        1038480013093662238
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    ServerV1: obx_int.EntityDefinition<ServerV1>(
        model: _entities[0],
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
        model: _entities[1],
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
        }),
    NoteV1: obx_int.EntityDefinition<NoteV1>(
        model: _entities[2],
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
          fbb.startTable(8);
          fbb.addInt64(0, object.objectBoxId);
          fbb.addOffset(1, idOffset);
          fbb.addInt64(2, object.createdAt.millisecondsSinceEpoch);
          fbb.addInt64(3, object.modifiedAt.millisecondsSinceEpoch);
          fbb.addOffset(4, titleOffset);
          fbb.addOffset(5, textOffset);
          fbb.addBool(6, object.deleted);
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
          final deletedParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 16, false);
          final object = NoteV1(
              objectBoxId: objectBoxIdParam,
              id: idParam,
              createdAt: createdAtParam,
              modifiedAt: modifiedAtParam,
              title: titleParam,
              text: textParam,
              deleted: deletedParam);

          return object;
        }),
    EventV1: obx_int.EntityDefinition<EventV1>(
        model: _entities[3],
        toOneRelations: (EventV1 object) => [],
        toManyRelations: (EventV1 object) => {},
        getId: (EventV1 object) => object.objectBoxId,
        setId: (EventV1 object, int id) {
          object.objectBoxId = id;
        },
        objectToFB: (EventV1 object, fb.Builder fbb) {
          final idOffset =
              object.id == null ? null : fbb.writeString(object.id!);
          final typeOffset = fbb.writeString(object.type);
          final vOffset = fbb.writeString(object.v);
          final dataOffset = fbb.writeString(object.data);
          fbb.startTable(11);
          fbb.addInt64(0, object.objectBoxId);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, typeOffset);
          fbb.addOffset(3, vOffset);
          fbb.addInt64(5, object.timestamp?.millisecondsSinceEpoch);
          fbb.addBool(6, object.applied);
          fbb.addOffset(9, dataOffset);
          fbb.finish(fbb.endTable());
          return object.objectBoxId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final timestampValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final objectBoxIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final idParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final vParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final dataParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 22, '');
          final timestampParam = timestampValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(timestampValue);
          final appliedParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 16, false);
          final object = EventV1(
              objectBoxId: objectBoxIdParam,
              id: idParam,
              type: typeParam,
              v: vParam,
              data: dataParam,
              timestamp: timestampParam,
              applied: appliedParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [ServerV1] entity fields to define ObjectBox queries.
class ServerV1_ {
  /// See [ServerV1.objectBoxId].
  static final objectBoxId =
      obx.QueryIntegerProperty<ServerV1>(_entities[0].properties[0]);

  /// See [ServerV1.address].
  static final address =
      obx.QueryStringProperty<ServerV1>(_entities[0].properties[1]);

  /// See [ServerV1.token].
  static final token =
      obx.QueryStringProperty<ServerV1>(_entities[0].properties[2]);

  /// See [ServerV1.order].
  static final order =
      obx.QueryIntegerProperty<ServerV1>(_entities[0].properties[3]);

  /// See [ServerV1.lastEventId].
  static final lastEventId =
      obx.QueryStringProperty<ServerV1>(_entities[0].properties[4]);
}

/// [SuggestionV1] entity fields to define ObjectBox queries.
class SuggestionV1_ {
  /// See [SuggestionV1.objectBoxId].
  static final objectBoxId =
      obx.QueryIntegerProperty<SuggestionV1>(_entities[1].properties[0]);

  /// See [SuggestionV1.name].
  static final name =
      obx.QueryStringProperty<SuggestionV1>(_entities[1].properties[1]);

  /// See [SuggestionV1.data].
  static final data =
      obx.QueryStringProperty<SuggestionV1>(_entities[1].properties[2]);
}

/// [NoteV1] entity fields to define ObjectBox queries.
class NoteV1_ {
  /// See [NoteV1.objectBoxId].
  static final objectBoxId =
      obx.QueryIntegerProperty<NoteV1>(_entities[2].properties[0]);

  /// See [NoteV1.id].
  static final id = obx.QueryStringProperty<NoteV1>(_entities[2].properties[1]);

  /// See [NoteV1.createdAt].
  static final createdAt =
      obx.QueryDateProperty<NoteV1>(_entities[2].properties[2]);

  /// See [NoteV1.modifiedAt].
  static final modifiedAt =
      obx.QueryDateProperty<NoteV1>(_entities[2].properties[3]);

  /// See [NoteV1.title].
  static final title =
      obx.QueryStringProperty<NoteV1>(_entities[2].properties[4]);

  /// See [NoteV1.text].
  static final text =
      obx.QueryStringProperty<NoteV1>(_entities[2].properties[5]);

  /// See [NoteV1.deleted].
  static final deleted =
      obx.QueryBooleanProperty<NoteV1>(_entities[2].properties[6]);
}

/// [EventV1] entity fields to define ObjectBox queries.
class EventV1_ {
  /// See [EventV1.objectBoxId].
  static final objectBoxId =
      obx.QueryIntegerProperty<EventV1>(_entities[3].properties[0]);

  /// See [EventV1.id].
  static final id =
      obx.QueryStringProperty<EventV1>(_entities[3].properties[1]);

  /// See [EventV1.type].
  static final type =
      obx.QueryStringProperty<EventV1>(_entities[3].properties[2]);

  /// See [EventV1.v].
  static final v = obx.QueryStringProperty<EventV1>(_entities[3].properties[3]);

  /// See [EventV1.timestamp].
  static final timestamp =
      obx.QueryDateProperty<EventV1>(_entities[3].properties[4]);

  /// See [EventV1.applied].
  static final applied =
      obx.QueryBooleanProperty<EventV1>(_entities[3].properties[5]);

  /// See [EventV1.data].
  static final data =
      obx.QueryStringProperty<EventV1>(_entities[3].properties[6]);
}
