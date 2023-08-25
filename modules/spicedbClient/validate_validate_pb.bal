import ballerina/protobuf;
import ballerina/time;

public const string VALIDATE_VALIDATE_DESC = "0A1776616C69646174652F76616C69646174652E70726F746F120876616C69646174651A20676F6F676C652F70726F746F6275662F64657363726970746F722E70726F746F1A1E676F6F676C652F70726F746F6275662F6475726174696F6E2E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F22C8080A0A4669656C6452756C657312300A076D65737361676518112001280B32162E76616C69646174652E4D65737361676552756C657352076D657373616765122C0A05666C6F617418012001280B32142E76616C69646174652E466C6F617452756C657348005205666C6F6174122F0A06646F75626C6518022001280B32152E76616C69646174652E446F75626C6552756C657348005206646F75626C65122C0A05696E74333218032001280B32142E76616C69646174652E496E74333252756C657348005205696E743332122C0A05696E74363418042001280B32142E76616C69646174652E496E74363452756C657348005205696E743634122F0A0675696E74333218052001280B32152E76616C69646174652E55496E74333252756C65734800520675696E743332122F0A0675696E74363418062001280B32152E76616C69646174652E55496E74363452756C65734800520675696E743634122F0A0673696E74333218072001280B32152E76616C69646174652E53496E74333252756C65734800520673696E743332122F0A0673696E74363418082001280B32152E76616C69646174652E53496E74363452756C65734800520673696E74363412320A076669786564333218092001280B32162E76616C69646174652E4669786564333252756C6573480052076669786564333212320A0766697865643634180A2001280B32162E76616C69646174652E4669786564363452756C6573480052076669786564363412350A087366697865643332180B2001280B32172E76616C69646174652E534669786564333252756C657348005208736669786564333212350A087366697865643634180C2001280B32172E76616C69646174652E534669786564363452756C657348005208736669786564363412290A04626F6F6C180D2001280B32132E76616C69646174652E426F6F6C52756C657348005204626F6F6C122F0A06737472696E67180E2001280B32152E76616C69646174652E537472696E6752756C657348005206737472696E67122C0A056279746573180F2001280B32142E76616C69646174652E427974657352756C657348005205627974657312290A04656E756D18102001280B32132E76616C69646174652E456E756D52756C657348005204656E756D12350A08726570656174656418122001280B32172E76616C69646174652E526570656174656452756C657348005208726570656174656412260A036D617018132001280B32122E76616C69646174652E4D617052756C6573480052036D617012260A03616E7918142001280B32122E76616C69646174652E416E7952756C657348005203616E7912350A086475726174696F6E18152001280B32172E76616C69646174652E4475726174696F6E52756C6573480052086475726174696F6E12380A0974696D657374616D7018162001280B32182E76616C69646174652E54696D657374616D7052756C65734800520974696D657374616D7042060A047479706522B0010A0A466C6F617452756C657312140A05636F6E73741801200128025205636F6E7374120E0A026C7418022001280252026C7412100A036C746518032001280252036C7465120E0A0267741804200128025202677412100A036774651805200128025203677465120E0A02696E1806200328025202696E12150A066E6F745F696E18072003280252056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B1010A0B446F75626C6552756C657312140A05636F6E73741801200128015205636F6E7374120E0A026C7418022001280152026C7412100A036C746518032001280152036C7465120E0A0267741804200128015202677412100A036774651805200128015203677465120E0A02696E1806200328015202696E12150A066E6F745F696E18072003280152056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B0010A0A496E74333252756C657312140A05636F6E73741801200128055205636F6E7374120E0A026C7418022001280552026C7412100A036C746518032001280552036C7465120E0A0267741804200128055202677412100A036774651805200128055203677465120E0A02696E1806200328055202696E12150A066E6F745F696E18072003280552056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B0010A0A496E74363452756C657312140A05636F6E73741801200128035205636F6E7374120E0A026C7418022001280352026C7412100A036C746518032001280352036C7465120E0A0267741804200128035202677412100A036774651805200128035203677465120E0A02696E1806200328035202696E12150A066E6F745F696E18072003280352056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B1010A0B55496E74333252756C657312140A05636F6E737418012001280D5205636F6E7374120E0A026C7418022001280D52026C7412100A036C746518032001280D52036C7465120E0A02677418042001280D5202677412100A0367746518052001280D5203677465120E0A02696E18062003280D5202696E12150A066E6F745F696E18072003280D52056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B1010A0B55496E74363452756C657312140A05636F6E73741801200128045205636F6E7374120E0A026C7418022001280452026C7412100A036C746518032001280452036C7465120E0A0267741804200128045202677412100A036774651805200128045203677465120E0A02696E1806200328045202696E12150A066E6F745F696E18072003280452056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B1010A0B53496E74333252756C657312140A05636F6E73741801200128115205636F6E7374120E0A026C7418022001281152026C7412100A036C746518032001281152036C7465120E0A0267741804200128115202677412100A036774651805200128115203677465120E0A02696E1806200328115202696E12150A066E6F745F696E18072003281152056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B1010A0B53496E74363452756C657312140A05636F6E73741801200128125205636F6E7374120E0A026C7418022001281252026C7412100A036C746518032001281252036C7465120E0A0267741804200128125202677412100A036774651805200128125203677465120E0A02696E1806200328125202696E12150A066E6F745F696E18072003281252056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B2010A0C4669786564333252756C657312140A05636F6E73741801200128075205636F6E7374120E0A026C7418022001280752026C7412100A036C746518032001280752036C7465120E0A0267741804200128075202677412100A036774651805200128075203677465120E0A02696E1806200328075202696E12150A066E6F745F696E18072003280752056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B2010A0C4669786564363452756C657312140A05636F6E73741801200128065205636F6E7374120E0A026C7418022001280652026C7412100A036C746518032001280652036C7465120E0A0267741804200128065202677412100A036774651805200128065203677465120E0A02696E1806200328065202696E12150A066E6F745F696E18072003280652056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B3010A0D534669786564333252756C657312140A05636F6E737418012001280F5205636F6E7374120E0A026C7418022001280F52026C7412100A036C746518032001280F52036C7465120E0A02677418042001280F5202677412100A0367746518052001280F5203677465120E0A02696E18062003280F5202696E12150A066E6F745F696E18072003280F52056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922B3010A0D534669786564363452756C657312140A05636F6E73741801200128105205636F6E7374120E0A026C7418022001281052026C7412100A036C746518032001281052036C7465120E0A0267741804200128105202677412100A036774651805200128105203677465120E0A02696E1806200328105202696E12150A066E6F745F696E18072003281052056E6F74496E12210A0C69676E6F72655F656D707479180820012808520B69676E6F7265456D70747922210A09426F6F6C52756C657312140A05636F6E73741801200128085205636F6E737422D4050A0B537472696E6752756C657312140A05636F6E73741801200128095205636F6E737412100A036C656E18132001280452036C656E12170A076D696E5F6C656E18022001280452066D696E4C656E12170A076D61785F6C656E18032001280452066D61784C656E121B0A096C656E5F627974657318142001280452086C656E4279746573121B0A096D696E5F627974657318042001280452086D696E4279746573121B0A096D61785F627974657318052001280452086D6178427974657312180A077061747465726E18062001280952077061747465726E12160A06707265666978180720012809520670726566697812160A067375666669781808200128095206737566666978121A0A08636F6E7461696E731809200128095208636F6E7461696E7312210A0C6E6F745F636F6E7461696E73181720012809520B6E6F74436F6E7461696E73120E0A02696E180A200328095202696E12150A066E6F745F696E180B2003280952056E6F74496E12160A05656D61696C180C2001280848005205656D61696C121C0A08686F73746E616D65180D2001280848005208686F73746E616D6512100A026970180E2001280848005202697012140A0469707634180F20012808480052046970763412140A0469707636181020012808480052046970763612120A037572691811200128084800520375726912190A077572695F72656618122001280848005206757269526566121A0A0761646472657373181520012808480052076164647265737312140A0475756964181620012808480052047575696412400A1077656C6C5F6B6E6F776E5F726567657818182001280E32142E76616C69646174652E4B6E6F776E52656765784800520E77656C6C4B6E6F776E5265676578121C0A067374726963741819200128083A0474727565520673747269637412210A0C69676E6F72655F656D707479181A20012808520B69676E6F7265456D707479420C0A0A77656C6C5F6B6E6F776E22E2020A0A427974657352756C657312140A05636F6E737418012001280C5205636F6E737412100A036C656E180D2001280452036C656E12170A076D696E5F6C656E18022001280452066D696E4C656E12170A076D61785F6C656E18032001280452066D61784C656E12180A077061747465726E18042001280952077061747465726E12160A0670726566697818052001280C520670726566697812160A0673756666697818062001280C5206737566666978121A0A08636F6E7461696E7318072001280C5208636F6E7461696E73120E0A02696E18082003280C5202696E12150A066E6F745F696E18092003280C52056E6F74496E12100A026970180A2001280848005202697012140A0469707634180B20012808480052046970763412140A0469707636180C20012808480052046970763612210A0C69676E6F72655F656D707479180E20012808520B69676E6F7265456D707479420C0A0A77656C6C5F6B6E6F776E226B0A09456E756D52756C657312140A05636F6E73741801200128055205636F6E737412210A0C646566696E65645F6F6E6C79180220012808520B646566696E65644F6E6C79120E0A02696E1803200328055202696E12150A066E6F745F696E18042003280552056E6F74496E223E0A0C4D65737361676552756C657312120A04736B69701801200128085204736B6970121A0A0872657175697265641802200128085208726571756972656422B0010A0D526570656174656452756C6573121B0A096D696E5F6974656D7318012001280452086D696E4974656D73121B0A096D61785F6974656D7318022001280452086D61784974656D7312160A06756E697175651803200128085206756E69717565122A0A056974656D7318042001280B32142E76616C69646174652E4669656C6452756C657352056974656D7312210A0C69676E6F72655F656D707479180520012808520B69676E6F7265456D70747922DC010A084D617052756C6573121B0A096D696E5F706169727318012001280452086D696E5061697273121B0A096D61785F706169727318022001280452086D61785061697273121B0A096E6F5F73706172736518032001280852086E6F53706172736512280A046B65797318042001280B32142E76616C69646174652E4669656C6452756C657352046B657973122C0A0676616C75657318052001280B32142E76616C69646174652E4669656C6452756C6573520676616C75657312210A0C69676E6F72655F656D707479180620012808520B69676E6F7265456D707479224D0A08416E7952756C6573121A0A08726571756972656418012001280852087265717569726564120E0A02696E1802200328095202696E12150A066E6F745F696E18032003280952056E6F74496E22E9020A0D4475726174696F6E52756C6573121A0A08726571756972656418012001280852087265717569726564122F0A05636F6E737418022001280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E5205636F6E737412290A026C7418032001280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E52026C74122B0A036C746518042001280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E52036C746512290A02677418052001280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E52026774122B0A0367746518062001280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E520367746512290A02696E18072003280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E5202696E12300A066E6F745F696E18082003280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E52056E6F74496E22F3020A0E54696D657374616D7052756C6573121A0A0872657175697265641801200128085208726571756972656412300A05636F6E737418022001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D705205636F6E7374122A0A026C7418032001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D7052026C74122C0A036C746518042001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D7052036C7465122A0A02677418052001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D7052026774122C0A0367746518062001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D70520367746512150A066C745F6E6F7718072001280852056C744E6F7712150A0667745F6E6F77180820012808520567744E6F7712310A0677697468696E18092001280B32192E676F6F676C652E70726F746F6275662E4475726174696F6E520677697468696E2A460A0A4B6E6F776E5265676578120B0A07554E4B4E4F574E100012140A10485454505F4845414445525F4E414D45100112150A11485454505F4845414445525F56414C554510023A3C0A0864697361626C6564121F2E676F6F676C652E70726F746F6275662E4D6573736167654F7074696F6E7318AF0820012808520864697361626C65643A3A0A0769676E6F726564121F2E676F6F676C652E70726F746F6275662E4D6573736167654F7074696F6E7318B00820012808520769676E6F7265643A3A0A087265717569726564121D2E676F6F676C652E70726F746F6275662E4F6E656F664F7074696F6E7318AF0820012808520872657175697265643A4A0A0572756C6573121D2E676F6F676C652E70726F746F6275662E4669656C644F7074696F6E7318AF082001280B32142E76616C69646174652E4669656C6452756C6573520572756C657342500A1A696F2E656E766F7970726F78792E7067762E76616C69646174655A326769746875622E636F6D2F656E766F7970726F78792F70726F746F632D67656E2D76616C69646174652F76616C6964617465";

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type FieldRules record {|
    MessageRules message = {};
    FloatRules 'float?;
    DoubleRules double?;
    Int32Rules int32?;
    Int64Rules int64?;
    UInt32Rules uint32?;
    UInt64Rules uint64?;
    SInt32Rules sint32?;
    SInt64Rules sint64?;
    Fixed32Rules fixed32?;
    Fixed64Rules fixed64?;
    SFixed32Rules sfixed32?;
    SFixed64Rules sfixed64?;
    BoolRules bool?;
    StringRules 'string?;
    BytesRules bytes?;
    EnumRules 'enum?;
    RepeatedRules repeated?;
    MapRules 'map?;
    AnyRules 'any?;
    DurationRules duration?;
    TimestampRules timestamp?;
|};

isolated function isValidFieldrules(FieldRules r) returns boolean {
    int typeCount = 0;
    if !(r?.'float is ()) {
        typeCount += 1;
    }
    if !(r?.double is ()) {
        typeCount += 1;
    }
    if !(r?.int32 is ()) {
        typeCount += 1;
    }
    if !(r?.int64 is ()) {
        typeCount += 1;
    }
    if !(r?.uint32 is ()) {
        typeCount += 1;
    }
    if !(r?.uint64 is ()) {
        typeCount += 1;
    }
    if !(r?.sint32 is ()) {
        typeCount += 1;
    }
    if !(r?.sint64 is ()) {
        typeCount += 1;
    }
    if !(r?.fixed32 is ()) {
        typeCount += 1;
    }
    if !(r?.fixed64 is ()) {
        typeCount += 1;
    }
    if !(r?.sfixed32 is ()) {
        typeCount += 1;
    }
    if !(r?.sfixed64 is ()) {
        typeCount += 1;
    }
    if !(r?.bool is ()) {
        typeCount += 1;
    }
    if !(r?.'string is ()) {
        typeCount += 1;
    }
    if !(r?.bytes is ()) {
        typeCount += 1;
    }
    if !(r?.'enum is ()) {
        typeCount += 1;
    }
    if !(r?.repeated is ()) {
        typeCount += 1;
    }
    if !(r?.'map is ()) {
        typeCount += 1;
    }
    if !(r?.'any is ()) {
        typeCount += 1;
    }
    if !(r?.duration is ()) {
        typeCount += 1;
    }
    if !(r?.timestamp is ()) {
        typeCount += 1;
    }
    if (typeCount > 1) {
        return false;
    }
    return true;
}

isolated function setFieldRules_Float(FieldRules r, FloatRules 'float) {
    r.'float = 'float;
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Double(FieldRules r, DoubleRules double) {
    r.double = double;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Int32(FieldRules r, Int32Rules int32) {
    r.int32 = int32;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Int64(FieldRules r, Int64Rules int64) {
    r.int64 = int64;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Uint32(FieldRules r, UInt32Rules uint32) {
    r.uint32 = uint32;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Uint64(FieldRules r, UInt64Rules uint64) {
    r.uint64 = uint64;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Sint32(FieldRules r, SInt32Rules sint32) {
    r.sint32 = sint32;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Sint64(FieldRules r, SInt64Rules sint64) {
    r.sint64 = sint64;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Fixed32(FieldRules r, Fixed32Rules fixed32) {
    r.fixed32 = fixed32;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Fixed64(FieldRules r, Fixed64Rules fixed64) {
    r.fixed64 = fixed64;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Sfixed32(FieldRules r, SFixed32Rules sfixed32) {
    r.sfixed32 = sfixed32;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Sfixed64(FieldRules r, SFixed64Rules sfixed64) {
    r.sfixed64 = sfixed64;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Bool(FieldRules r, BoolRules bool) {
    r.bool = bool;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_String(FieldRules r, StringRules 'string) {
    r.'string = 'string;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Bytes(FieldRules r, BytesRules bytes) {
    r.bytes = bytes;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Enum(FieldRules r, EnumRules 'enum) {
    r.'enum = 'enum;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Repeated(FieldRules r, RepeatedRules repeated) {
    r.repeated = repeated;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Map(FieldRules r, MapRules 'map) {
    r.'map = 'map;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Any(FieldRules r, AnyRules 'any) {
    r.'any = 'any;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("duration");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Duration(FieldRules r, DurationRules duration) {
    r.duration = duration;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("timestamp");
}

isolated function setFieldRules_Timestamp(FieldRules r, TimestampRules timestamp) {
    r.timestamp = timestamp;
    _ = r.removeIfHasKey("float");
    _ = r.removeIfHasKey("double");
    _ = r.removeIfHasKey("int32");
    _ = r.removeIfHasKey("int64");
    _ = r.removeIfHasKey("uint32");
    _ = r.removeIfHasKey("uint64");
    _ = r.removeIfHasKey("sint32");
    _ = r.removeIfHasKey("sint64");
    _ = r.removeIfHasKey("fixed32");
    _ = r.removeIfHasKey("fixed64");
    _ = r.removeIfHasKey("sfixed32");
    _ = r.removeIfHasKey("sfixed64");
    _ = r.removeIfHasKey("bool");
    _ = r.removeIfHasKey("string");
    _ = r.removeIfHasKey("bytes");
    _ = r.removeIfHasKey("enum");
    _ = r.removeIfHasKey("repeated");
    _ = r.removeIfHasKey("map");
    _ = r.removeIfHasKey("any");
    _ = r.removeIfHasKey("duration");
}

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type DoubleRules record {|
    float 'const = 0.0;
    float lt = 0.0;
    float lte = 0.0;
    float gt = 0.0;
    float gte = 0.0;
    float[] 'in = [];
    float[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type Int32Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type Int64Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type FloatRules record {|
    float 'const = 0.0;
    float lt = 0.0;
    float lte = 0.0;
    float gt = 0.0;
    float gte = 0.0;
    float[] 'in = [];
    float[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type UInt32Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type AnyRules record {|
    boolean required = false;
    string[] 'in = [];
    string[] not_in = [];
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type UInt64Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type Fixed32Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type DurationRules record {|
    boolean required = false;
    time:Seconds 'const = 0.0d;
    time:Seconds lt = 0.0d;
    time:Seconds lte = 0.0d;
    time:Seconds gt = 0.0d;
    time:Seconds gte = 0.0d;
    time:Seconds[] 'in = [];
    time:Seconds[] not_in = [];
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type StringRules record {|
    string 'const = "";
    int len = 0;
    int min_len = 0;
    int max_len = 0;
    int len_bytes = 0;
    int min_bytes = 0;
    int max_bytes = 0;
    string pattern = "";
    string prefix = "";
    string suffix = "";
    string contains = "";
    string not_contains = "";
    string[] 'in = [];
    string[] not_in = [];
    boolean strict = false;
    boolean ignore_empty = false;
    boolean email?;
    boolean hostname?;
    boolean ip?;
    boolean ipv4?;
    boolean ipv6?;
    boolean uri?;
    boolean uri_ref?;
    boolean address?;
    boolean uuid?;
    KnownRegex well_known_regex?;
|};

isolated function isValidStringrules(StringRules r) returns boolean {
    int well_knownCount = 0;
    if !(r?.email is ()) {
        well_knownCount += 1;
    }
    if !(r?.hostname is ()) {
        well_knownCount += 1;
    }
    if !(r?.ip is ()) {
        well_knownCount += 1;
    }
    if !(r?.ipv4 is ()) {
        well_knownCount += 1;
    }
    if !(r?.ipv6 is ()) {
        well_knownCount += 1;
    }
    if !(r?.uri is ()) {
        well_knownCount += 1;
    }
    if !(r?.uri_ref is ()) {
        well_knownCount += 1;
    }
    if !(r?.address is ()) {
        well_knownCount += 1;
    }
    if !(r?.uuid is ()) {
        well_knownCount += 1;
    }
    if !(r?.well_known_regex is ()) {
        well_knownCount += 1;
    }
    if (well_knownCount > 1) {
        return false;
    }
    return true;
}

isolated function setStringRules_Email(StringRules r, boolean email) {
    r.email = email;
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_Hostname(StringRules r, boolean hostname) {
    r.hostname = hostname;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_Ip(StringRules r, boolean ip) {
    r.ip = ip;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_Ipv4(StringRules r, boolean ipv4) {
    r.ipv4 = ipv4;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_Ipv6(StringRules r, boolean ipv6) {
    r.ipv6 = ipv6;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_Uri(StringRules r, boolean uri) {
    r.uri = uri;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_UriRef(StringRules r, boolean uri_ref) {
    r.uri_ref = uri_ref;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_Address(StringRules r, boolean address) {
    r.address = address;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("uuid");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_Uuid(StringRules r, boolean uuid) {
    r.uuid = uuid;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("well_known_regex");
}

isolated function setStringRules_WellKnownRegex(StringRules r, KnownRegex well_known_regex) {
    r.well_known_regex = well_known_regex;
    _ = r.removeIfHasKey("email");
    _ = r.removeIfHasKey("hostname");
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
    _ = r.removeIfHasKey("uri");
    _ = r.removeIfHasKey("uri_ref");
    _ = r.removeIfHasKey("address");
    _ = r.removeIfHasKey("uuid");
}

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type MapRules record {|
    int min_pairs = 0;
    int max_pairs = 0;
    boolean no_sparse = false;
    FieldRules keys = {};
    FieldRules values = {};
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type Fixed64Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type SInt32Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type BoolRules record {|
    boolean 'const = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type BytesRules record {|
    byte[] 'const = [];
    int len = 0;
    int min_len = 0;
    int max_len = 0;
    string pattern = "";
    byte[] prefix = [];
    byte[] suffix = [];
    byte[] contains = [];
    byte[] 'in = [];
    byte[] not_in = [];
    boolean ignore_empty = false;
    boolean ip?;
    boolean ipv4?;
    boolean ipv6?;
|};

isolated function isValidBytesrules(BytesRules r) returns boolean {
    int well_knownCount = 0;
    if !(r?.ip is ()) {
        well_knownCount += 1;
    }
    if !(r?.ipv4 is ()) {
        well_knownCount += 1;
    }
    if !(r?.ipv6 is ()) {
        well_knownCount += 1;
    }
    if (well_knownCount > 1) {
        return false;
    }
    return true;
}

isolated function setBytesRules_Ip(BytesRules r, boolean ip) {
    r.ip = ip;
    _ = r.removeIfHasKey("ipv4");
    _ = r.removeIfHasKey("ipv6");
}

isolated function setBytesRules_Ipv4(BytesRules r, boolean ipv4) {
    r.ipv4 = ipv4;
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv6");
}

isolated function setBytesRules_Ipv6(BytesRules r, boolean ipv6) {
    r.ipv6 = ipv6;
    _ = r.removeIfHasKey("ip");
    _ = r.removeIfHasKey("ipv4");
}

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type EnumRules record {|
    int 'const = 0;
    boolean defined_only = false;
    int[] 'in = [];
    int[] not_in = [];
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type SInt64Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type TimestampRules record {|
    boolean required = false;
    time:Utc 'const = [0, 0.0d];
    time:Utc lt = [0, 0.0d];
    time:Utc lte = [0, 0.0d];
    time:Utc gt = [0, 0.0d];
    time:Utc gte = [0, 0.0d];
    boolean lt_now = false;
    boolean gt_now = false;
    time:Seconds 'within = 0.0d;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type SFixed64Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type MessageRules record {|
    boolean skip = false;
    boolean required = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type RepeatedRules record {|
    int min_items = 0;
    int max_items = 0;
    boolean unique = false;
    FieldRules items = {};
    boolean ignore_empty = false;
|};

@protobuf:Descriptor {value: VALIDATE_VALIDATE_DESC}
public type SFixed32Rules record {|
    int 'const = 0;
    int lt = 0;
    int lte = 0;
    int gt = 0;
    int gte = 0;
    int[] 'in = [];
    int[] not_in = [];
    boolean ignore_empty = false;
|};

public enum KnownRegex {
    UNKNOWN, HTTP_HEADER_NAME, HTTP_HEADER_VALUE
}

