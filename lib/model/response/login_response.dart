import 'dart:convert';

class LoginResponse {
    final String? id;
    final String? firstname;
    final String? lastname;
    final dynamic othername;
    final String? countryCode;
    final String? phone;
    final String? email;
    final dynamic timezone;
    final dynamic displayTheme;
    final dynamic userStatus;
    final int? enable2Fa;
    final dynamic language;
    final dynamic photo;
    final String? accountChannel;
    final int? onboardingStatus;
    final LastLogin? lastLogin;
    final String? loginLocation;
    final String? accessToken;
    final String? accessUserid;
    final dynamic refreshAccessToken;
    final dynamic tokenExpiresIn;
    final dynamic remarks;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? token;
    final List<AccountRole>? accountRoles;

    LoginResponse({
        this.id,
        this.firstname,
        this.lastname,
        this.othername,
        this.countryCode,
        this.phone,
        this.email,
        this.timezone,
        this.displayTheme,
        this.userStatus,
        this.enable2Fa,
        this.language,
        this.photo,
        this.accountChannel,
        this.onboardingStatus,
        this.lastLogin,
        this.loginLocation,
        this.accessToken,
        this.accessUserid,
        this.refreshAccessToken,
        this.tokenExpiresIn,
        this.remarks,
        this.createdAt,
        this.updatedAt,
        this.token,
        this.accountRoles,
    });

    LoginResponse copyWith({
        String? id,
        String? firstname,
        String? lastname,
        dynamic othername,
        String? countryCode,
        String? phone,
        String? email,
        dynamic timezone,
        dynamic displayTheme,
        dynamic userStatus,
        int? enable2Fa,
        dynamic language,
        dynamic photo,
        String? accountChannel,
        int? onboardingStatus,
        LastLogin? lastLogin,
        String? loginLocation,
        String? accessToken,
        String? accessUserid,
        dynamic refreshAccessToken,
        dynamic tokenExpiresIn,
        dynamic remarks,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? token,
        List<AccountRole>? accountRoles,
    }) => 
        LoginResponse(
            id: id ?? this.id,
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            othername: othername ?? this.othername,
            countryCode: countryCode ?? this.countryCode,
            phone: phone ?? this.phone,
            email: email ?? this.email,
            timezone: timezone ?? this.timezone,
            displayTheme: displayTheme ?? this.displayTheme,
            userStatus: userStatus ?? this.userStatus,
            enable2Fa: enable2Fa ?? this.enable2Fa,
            language: language ?? this.language,
            photo: photo ?? this.photo,
            accountChannel: accountChannel ?? this.accountChannel,
            onboardingStatus: onboardingStatus ?? this.onboardingStatus,
            lastLogin: lastLogin ?? this.lastLogin,
            loginLocation: loginLocation ?? this.loginLocation,
            accessToken: accessToken ?? this.accessToken,
            accessUserid: accessUserid ?? this.accessUserid,
            refreshAccessToken: refreshAccessToken ?? this.refreshAccessToken,
            tokenExpiresIn: tokenExpiresIn ?? this.tokenExpiresIn,
            remarks: remarks ?? this.remarks,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            token: token ?? this.token,
            accountRoles: accountRoles ?? this.accountRoles,
        );

    factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        othername: json["othername"],
        countryCode: json["country_code"],
        phone: json["phone"],
        email: json["email"],
        timezone: json["timezone"],
        displayTheme: json["display_theme"],
        userStatus: json["user_status"],
        enable2Fa: json["enable2FA"],
        language: json["language"],
        photo: json["photo"],
        accountChannel: json["account_channel"],
        onboardingStatus: json["onboarding_status"],
        lastLogin: json["last_login"] == null ? null : LastLogin.fromMap(json["last_login"]),
        loginLocation: json["login_location"],
        accessToken: json["access_token"],
        accessUserid: json["access_userid"],
        refreshAccessToken: json["refresh_access_token"],
        tokenExpiresIn: json["token_expires_in"],
        remarks: json["remarks"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        token: json["token"],
        accountRoles: json["account_roles"] == null ? [] : List<AccountRole>.from(json["account_roles"]!.map((x) => AccountRole.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "othername": othername,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
        "timezone": timezone,
        "display_theme": displayTheme,
        "user_status": userStatus,
        "enable2FA": enable2Fa,
        "language": language,
        "photo": photo,
        "account_channel": accountChannel,
        "onboarding_status": onboardingStatus,
        "last_login": lastLogin?.toMap(),
        "login_location": loginLocation,
        "access_token": accessToken,
        "access_userid": accessUserid,
        "refresh_access_token": refreshAccessToken,
        "token_expires_in": tokenExpiresIn,
        "remarks": remarks,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "token": token,
        "account_roles": accountRoles == null ? [] : List<dynamic>.from(accountRoles!.map((x) => x.toMap())),
    };
}

class AccountRole {
    final int? id;
    final String? userid;
    final int? accountId;
    final int? roleId;
    final int? ownership;
    final int? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Role? role;

    AccountRole({
        this.id,
        this.userid,
        this.accountId,
        this.roleId,
        this.ownership,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.role,
    });

    AccountRole copyWith({
        int? id,
        String? userid,
        int? accountId,
        int? roleId,
        int? ownership,
        int? status,
        DateTime? createdAt,
        DateTime? updatedAt,
        Role? role,
    }) => 
        AccountRole(
            id: id ?? this.id,
            userid: userid ?? this.userid,
            accountId: accountId ?? this.accountId,
            roleId: roleId ?? this.roleId,
            ownership: ownership ?? this.ownership,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            role: role ?? this.role,
        );

    factory AccountRole.fromJson(String str) => AccountRole.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccountRole.fromMap(Map<String, dynamic> json) => AccountRole(
        id: json["id"],
        userid: json["userid"],
        accountId: json["account_id"],
        roleId: json["role_id"],
        ownership: json["ownership"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        role: json["role"] == null ? null : Role.fromMap(json["role"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userid": userid,
        "account_id": accountId,
        "role_id": roleId,
        "ownership": ownership,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "role": role?.toMap(),
    };
}

class Role {
    final int? id;
    final String? name;
    final String? alias;
    final dynamic description;

    Role({
        this.id,
        this.name,
        this.alias,
        this.description,
    });

    Role copyWith({
        int? id,
        String? name,
        String? alias,
        dynamic description,
    }) => 
        Role(
            id: id ?? this.id,
            name: name ?? this.name,
            alias: alias ?? this.alias,
            description: description ?? this.description,
        );

    factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        alias: json["alias"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "alias": alias,
        "description": description,
    };
}

class LastLogin {
    final DateTime? date;
    final int? timezoneType;
    final String? timezone;

    LastLogin({
        this.date,
        this.timezoneType,
        this.timezone,
    });

    LastLogin copyWith({
        DateTime? date,
        int? timezoneType,
        String? timezone,
    }) => 
        LastLogin(
            date: date ?? this.date,
            timezoneType: timezoneType ?? this.timezoneType,
            timezone: timezone ?? this.timezone,
        );

    factory LastLogin.fromJson(String str) => LastLogin.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LastLogin.fromMap(Map<String, dynamic> json) => LastLogin(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toMap() => {
        "date": date?.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
    };
}
