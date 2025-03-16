import '../database.dart';

class UserLocationsTable extends SupabaseTable<UserLocationsRow> {
  @override
  String get tableName => 'user_locations';

  @override
  UserLocationsRow createRow(Map<String, dynamic> data) =>
      UserLocationsRow(data);
}

class UserLocationsRow extends SupabaseDataRow {
  UserLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLocationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  String? get eta => getField<String>('eta');
  set eta(String? value) => setField<String>('eta', value);

  String? get etd => getField<String>('etd');
  set etd(String? value) => setField<String>('etd', value);
}
