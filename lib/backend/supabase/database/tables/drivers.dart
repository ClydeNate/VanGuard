import '../database.dart';

class DriversTable extends SupabaseTable<DriversRow> {
  @override
  String get tableName => 'drivers';

  @override
  DriversRow createRow(Map<String, dynamic> data) => DriversRow(data);
}

class DriversRow extends SupabaseDataRow {
  DriversRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriversTable();

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get contactNumber => getField<String>('contact_number')!;
  set contactNumber(String value) => setField<String>('contact_number', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get licenseNumber => getField<String>('license_number')!;
  set licenseNumber(String value) => setField<String>('license_number', value);

  String get vehiclePlate => getField<String>('vehicle_plate')!;
  set vehiclePlate(String value) => setField<String>('vehicle_plate', value);

  String get route => getField<String>('route')!;
  set route(String value) => setField<String>('route', value);
}
