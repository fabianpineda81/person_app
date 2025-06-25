class Person {
  final String id;                    // Identificador único interno
  final String firstName;            // Primer nombre
  final String? middleName;          // Segundo nombre (opcional)
  final String lastName;             // Primer apellido
  final String? secondLastName;      // Segundo apellido (opcional)
  final String idType;               // Tipo de identificación (ej: CC, TI, Passport)
  final String idNumber;             // Número de identificación
  final String email;                // Correo electrónico
  final String address;              // Dirección

  Person({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.secondLastName,
    required this.idType,
    required this.idNumber,
    required this.email,
    required this.address,
  });

  Person copyWith({
    String? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? secondLastName,
    String? idType,
    String? idNumber,
    String? email,
    String? address,
  }) {
    return Person(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      secondLastName: secondLastName ?? this.secondLastName,
      idType: idType ?? this.idType,
      idNumber: idNumber ?? this.idNumber,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'Person(id: $id, firstName: $firstName, middleName: $middleName, '
        'lastName: $lastName, secondLastName: $secondLastName, '
        'idType: $idType, idNumber: $idNumber, email: $email, address: $address)';
  }
}
