/// self : "https://jira.atlassian.com/rest/api/2/user?username=ada5d1b0ded2"
/// name : "ada5d1b0ded2"
/// key : "JIRAUSER4715861"
/// avatarUrls : {"48x48":"https://jira.atlassian.com/secure/useravatar?ownerId=JIRAUSER4715861&avatarId=2413314","24x24":"https://jira.atlassian.com/secure/useravatar?size=small&ownerId=JIRAUSER4715861&avatarId=2413314","16x16":"https://jira.atlassian.com/secure/useravatar?size=xsmall&ownerId=JIRAUSER4715861&avatarId=2413314","32x32":"https://jira.atlassian.com/secure/useravatar?size=medium&ownerId=JIRAUSER4715861&avatarId=2413314"}
/// displayName : "Brandon Burchett"
/// active : true
/// timeZone : "Etc/UTC"

class Creator {
  String _self;
  String _name;
  String _key;
  AvatarUrls _avatarUrls;
  String _displayName;
  bool _active;
  String _timeZone;

  String get self => _self;

  String get name => _name;

  String get key => _key;

  AvatarUrls get avatarUrls => _avatarUrls;

  String get displayName => _displayName;

  bool get active => _active;

  String get timeZone => _timeZone;

  Creator(this._self, this._name, this._key, this._avatarUrls,
      this._displayName, this._active, this._timeZone);

  Creator.map(dynamic obj) {
    this._self = obj["self"];
    this._name = obj["name"];
    this._key = obj["key"];
    this._avatarUrls = AvatarUrls.map(obj["avatarUrls"]);
    this._displayName = obj["displayName"];
    this._active = obj["active"];
    this._timeZone = obj["timeZone"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["self"] = _self;
    map["name"] = _name;
    map["key"] = _key;
    map["avatarUrls"] = _avatarUrls;
    map["displayName"] = _displayName;
    map["active"] = _active;
    map["timeZone"] = _timeZone;
    return map;
  }
}

/// 48x48 : "https://jira.atlassian.com/secure/useravatar?ownerId=JIRAUSER4715861&avatarId=2413314"
/// 24x24 : "https://jira.atlassian.com/secure/useravatar?size=small&ownerId=JIRAUSER4715861&avatarId=2413314"
/// 16x16 : "https://jira.atlassian.com/secure/useravatar?size=xsmall&ownerId=JIRAUSER4715861&avatarId=2413314"
/// 32x32 : "https://jira.atlassian.com/secure/useravatar?size=medium&ownerId=JIRAUSER4715861&avatarId=2413314"

class AvatarUrls {
  String _48x48;
  String _24x24;
  String _16x16;
  String _32x32;

  String get s48x48 => _48x48;

  String get s24x24 => _24x24;

  String get s16x16 => _16x16;

  String get s32x32 => _32x32;

  AvatarUrls(this._48x48, this._24x24, this._16x16, this._32x32);

  AvatarUrls.map(dynamic obj) {
    this._48x48 = obj["48x48"];
    this._24x24 = obj["24x24"];
    this._16x16 = obj["16x16"];
    this._32x32 = obj["32x32"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["48x48"] = _48x48;
    map["24x24"] = _24x24;
    map["16x16"] = _16x16;
    map["32x32"] = _32x32;
    return map;
  }
}
