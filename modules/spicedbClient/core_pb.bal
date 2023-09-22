import ballerina/protobuf;

public const string CORE_DESC = "0A0A636F72652E70726F746F120E617574687A65642E6170692E76311A1C676F6F676C652F70726F746F6275662F7374727563742E70726F746F1A1776616C69646174652F76616C69646174652E70726F746F22B9020A0C52656C6174696F6E7368697012450A087265736F7572636518012001280B321F2E617574687A65642E6170692E76312E4F626A6563745265666572656E63654208FA42058A0102100152087265736F7572636512430A0872656C6174696F6E1802200128094227FA422472222840321E5E5B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D24520872656C6174696F6E12440A077375626A65637418032001280B32202E617574687A65642E6170692E76312E5375626A6563745265666572656E63654208FA42058A0102100152077375626A65637412570A0F6F7074696F6E616C5F63617665617418042001280B32242E617574687A65642E6170692E76312E436F6E7465787475616C697A65644361766561744208FA42058A01021000520E6F7074696F6E616C43617665617422A6010A14436F6E7465787475616C697A656443617665617412510A0B6361766561745F6E616D651801200128094230FA422D722B28800132265E285B612D7A412D5A302D395F5D5B612D7A412D5A302D392F5F7C2D5D7B302C3132377D2924520A6361766561744E616D65123B0A07636F6E7465787418022001280B32172E676F6F676C652E70726F746F6275662E5374727563744208FA42058A010210005207636F6E7465787422AE010A105375626A6563745265666572656E636512410A066F626A65637418012001280B321F2E617574687A65642E6170692E76312E4F626A6563745265666572656E63654208FA42058A0102100152066F626A65637412570A116F7074696F6E616C5F72656C6174696F6E180220012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F2452106F7074696F6E616C52656C6174696F6E22C4010A0F4F626A6563745265666572656E636512690A0B6F626A6563745F747970651801200128094248FA42457243288001323E5E285B612D7A5D5B612D7A302D395F5D7B312C36317D5B612D7A302D395D2F292A5B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D24520A6F626A6563745479706512460A096F626A6563745F69641802200128094229FA42267224288008321F5E28285B612D7A412D5A302D392F5F7C5C2D3D2B5D7B312C7D297C5C2A292452086F626A656374496422290A085A6564546F6B656E121D0A05746F6B656E1801200128094207FA4204720220015205746F6B656E222B0A06437572736F7212210A05746F6B656E180120012809420BFA4208720620012880A0065205746F6B656E22A1020A1252656C6174696F6E7368697055706461746512560A096F7065726174696F6E18012001280E322C2E617574687A65642E6170692E76312E52656C6174696F6E736869705570646174652E4F7065726174696F6E420AFA42078201041001200052096F7065726174696F6E124A0A0C72656C6174696F6E7368697018022001280B321C2E617574687A65642E6170692E76312E52656C6174696F6E736869704208FA42058A01021001520C72656C6174696F6E7368697022670A094F7065726174696F6E12190A154F5045524154494F4E5F554E535045434946494544100012140A104F5045524154494F4E5F435245415445100112130A0F4F5045524154494F4E5F544F554348100212140A104F5045524154494F4E5F44454C455445100322A8020A1A5065726D697373696F6E52656C6174696F6E736869705472656512490A0C696E7465726D65646961746518012001280B32232E617574687A65642E6170692E76312E416C676562726169635375626A6563745365744800520C696E7465726D65646961746512360A046C65616618022001280B32202E617574687A65642E6170692E76312E4469726563745375626A656374536574480052046C65616612480A0F657870616E6465645F6F626A65637418032001280B321F2E617574687A65642E6170692E76312E4F626A6563745265666572656E6365520E657870616E6465644F626A656374122B0A11657870616E6465645F72656C6174696F6E1804200128095210657870616E64656452656C6174696F6E42100A09747265655F747970651203F8420122B7020A13416C676562726169635375626A65637453657412570A096F7065726174696F6E18012001280E322D2E617574687A65642E6170692E76312E416C676562726169635375626A6563745365742E4F7065726174696F6E420AFA42078201041001200052096F7065726174696F6E12550A086368696C6472656E18022003280B322A2E617574687A65642E6170692E76312E5065726D697373696F6E52656C6174696F6E7368697054726565420DFA420A92010722058A0102100152086368696C6472656E22700A094F7065726174696F6E12190A154F5045524154494F4E5F554E535045434946494544100012130A0F4F5045524154494F4E5F554E494F4E1001121A0A164F5045524154494F4E5F494E54455253454354494F4E100212170A134F5045524154494F4E5F4558434C5553494F4E100322500A104469726563745375626A656374536574123C0A087375626A6563747318012003280B32202E617574687A65642E6170692E76312E5375626A6563745265666572656E636552087375626A6563747322570A115061727469616C436176656174496E666F12420A186D697373696E675F72657175697265645F636F6E746578741801200328094208FA4205920102080152166D697373696E675265717569726564436F6E7465787442480A12636F6D2E617574687A65642E6170692E76315A326769746875622E636F6D2F617574687A65642F617574687A65642D676F2F70726F746F2F617574687A65642F6170692F7631620670726F746F33";

@protobuf:Descriptor {value: CORE_DESC}
public type AlgebraicSubjectSet record {|
    AlgebraicSubjectSet_Operation operation = OPERATION_UNSPECIFIED;
    PermissionRelationshipTree[] children = [];
|};

public enum AlgebraicSubjectSet_Operation {
    OPERATION_UNSPECIFIED, OPERATION_UNION, OPERATION_INTERSECTION, OPERATION_EXCLUSION
}

@protobuf:Descriptor {value: CORE_DESC}
public type PermissionRelationshipTree record {|
    ObjectReference expanded_object = {};
    string expanded_relation = "";
    AlgebraicSubjectSet intermediate?;
    DirectSubjectSet leaf?;
|};

isolated function isValidPermissionrelationshiptree(PermissionRelationshipTree r) returns boolean {
    int tree_typeCount = 0;
    if !(r?.intermediate is ()) {
        tree_typeCount += 1;
    }
    if !(r?.leaf is ()) {
        tree_typeCount += 1;
    }
    if (tree_typeCount > 1) {
        return false;
    }
    return true;
}

isolated function setPermissionRelationshipTree_Intermediate(PermissionRelationshipTree r, AlgebraicSubjectSet intermediate) {
    r.intermediate = intermediate;
    _ = r.removeIfHasKey("leaf");
}

isolated function setPermissionRelationshipTree_Leaf(PermissionRelationshipTree r, DirectSubjectSet leaf) {
    r.leaf = leaf;
    _ = r.removeIfHasKey("intermediate");
}

@protobuf:Descriptor {value: CORE_DESC}
public type ObjectReference record {|
    string object_type = "";
    string object_id = "";
|};

@protobuf:Descriptor {value: CORE_DESC}
public type PartialCaveatInfo record {|
    string[] missing_required_context = [];
|};

@protobuf:Descriptor {value: CORE_DESC}
public type Relationship record {|
    ObjectReference 'resource = {};
    string relation = "";
    SubjectReference subject = {};
    // ContextualizedCaveat optional_caveat = {};
|};

@protobuf:Descriptor {value: CORE_DESC}
public type ZedToken record {|
    string token = "";
|};

@protobuf:Descriptor {value: CORE_DESC}
public type RelationshipUpdate record {|
    RelationshipUpdate_Operation operation = OPERATION_UNSPECIFIED;
    Relationship relationship = {};
|};

public enum RelationshipUpdate_Operation {
    OPERATION_UNSPECIFIED, OPERATION_CREATE, OPERATION_TOUCH, OPERATION_DELETE
}

@protobuf:Descriptor {value: CORE_DESC}
public type DirectSubjectSet record {|
    SubjectReference[] subjects = [];
|};

@protobuf:Descriptor {value: CORE_DESC}
public type SubjectReference record {|
    ObjectReference 'object = {};
    string optional_relation = "";
|};

@protobuf:Descriptor {value: CORE_DESC}
public type ContextualizedCaveat record {|
    string caveat_name = "";
    map<anydata> context = {};
|};

@protobuf:Descriptor {value: CORE_DESC}
public type Cursor record {|
    string token = "";
|};

