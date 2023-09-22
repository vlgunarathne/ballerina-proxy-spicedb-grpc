import ballerina/grpc;
import ballerina/protobuf;

public const string EXPERIMENTAL_SERVICE_DESC = "0A1A6578706572696D656E74616C5F736572766963652E70726F746F120E617574687A65642E6170692E76311A1C676F6F676C652F6170692F616E6E6F746174696F6E732E70726F746F1A1776616C69646174652F76616C69646174652E70726F746F1A1C676F6F676C652F70726F746F6275662F7374727563742E70726F746F1A107270632F7374617475732E70726F746F1A0A636F72652E70726F746F1A187065726D697373696F6E5F736572766963652E70726F746F22B9010A2353747265616D696E6742756C6B436865636B5065726D697373696F6E52657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E637912530A056974656D7318022003280B322E2E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E526571756573744974656D420DFA420A92010722058A0102100152056974656D7322B0010A1A42756C6B436865636B5065726D697373696F6E52657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E637912530A056974656D7318022003280B322E2E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E526571756573744974656D420DFA420A92010722058A0102100152056974656D7322B6020A1E42756C6B436865636B5065726D697373696F6E526571756573744974656D12450A087265736F7572636518012001280B321F2E617574687A65642E6170692E76312E4F626A6563745265666572656E63654208FA42058A0102100152087265736F75726365124A0A0A7065726D697373696F6E180220012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F24520A7065726D697373696F6E12440A077375626A65637418032001280B32202E617574687A65642E6170692E76312E5375626A6563745265666572656E63654208FA42058A0102100152077375626A656374123B0A07636F6E7465787418042001280B32172E676F6F676C652E70726F746F6275662E5374727563744208FA42058A010210005207636F6E7465787422AE010A1B42756C6B436865636B5065726D697373696F6E526573706F6E736512410A0A636865636B65645F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E4208FA42058A010210005209636865636B65644174124C0A05706169727318022003280B32272E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E50616972420DFA420A92010722058A010210015205706169727322B7010A2453747265616D696E6742756C6B436865636B5065726D697373696F6E526573706F6E736512410A0A636865636B65645F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E4208FA42058A010210005209636865636B65644174124C0A05706169727318022003280B32272E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E50616972420DFA420A92010722058A010210015205706169727322E2010A1742756C6B436865636B5065726D697373696F6E5061697212480A077265717565737418012001280B322E2E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E526571756573744974656D52077265717565737412450A046974656D18022001280B322F2E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E526573706F6E73654974656D480052046974656D122A0A056572726F7218032001280B32122E676F6F676C652E7270632E537461747573480052056572726F72420A0A08726573706F6E73652295030A1F42756C6B436865636B5065726D697373696F6E526573706F6E73654974656D12720A0E7065726D697373696F6E7368697018012001280E323E2E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E526573706F6E73654974656D2E5065726D697373696F6E73686970420AFA420782010410012000520E7065726D697373696F6E73686970125B0A137061727469616C5F6361766561745F696E666F18022001280B32212E617574687A65642E6170692E76312E5061727469616C436176656174496E666F4208FA42058A0102100052117061727469616C436176656174496E666F22A0010A0E5065726D697373696F6E73686970121E0A1A5045524D495353494F4E534849505F554E535045434946494544100012200A1C5045524D495353494F4E534849505F4E4F5F5045524D495353494F4E100112210A1D5045524D495353494F4E534849505F4841535F5045524D495353494F4E100212290A255045524D495353494F4E534849505F434F4E444954494F4E414C5F5045524D495353494F4E100322730A1E42756C6B496D706F727452656C6174696F6E73686970735265717565737412510A0D72656C6174696F6E736869707318012003280B321C2E617574687A65642E6170692E76312E52656C6174696F6E73686970420DFA420A92010722058A01021001520D72656C6174696F6E736869707322400A1F42756C6B496D706F727452656C6174696F6E7368697073526573706F6E7365121D0A0A6E756D5F6C6F6164656418012001280452096E756D4C6F6164656422D3010A1E42756C6B4578706F727452656C6174696F6E736869707352657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E637912310A0E6F7074696F6E616C5F6C696D697418022001280D420AFA42072A0518904E2800520D6F7074696F6E616C4C696D6974123F0A0F6F7074696F6E616C5F637572736F7218032001280B32162E617574687A65642E6170692E76312E437572736F72520E6F7074696F6E616C437572736F7222AD010A1F42756C6B4578706F727452656C6174696F6E7368697073526573706F6E736512460A1361667465725F726573756C745F637572736F7218012001280B32162E617574687A65642E6170692E76312E437572736F7252116166746572526573756C74437572736F7212420A0D72656C6174696F6E736869707318022003280B321C2E617574687A65642E6170692E76312E52656C6174696F6E73686970520D72656C6174696F6E73686970733281060A134578706572696D656E74616C5365727669636512B2010A1742756C6B496D706F727452656C6174696F6E7368697073122E2E617574687A65642E6170692E76312E42756C6B496D706F727452656C6174696F6E7368697073526571756573741A2F2E617574687A65642E6170692E76312E42756C6B496D706F727452656C6174696F6E7368697073526573706F6E7365223482D3E493022E22292F76312F6578706572696D656E74616C2F72656C6174696F6E73686970732F62756C6B696D706F72743A012A280112B2010A1742756C6B4578706F727452656C6174696F6E7368697073122E2E617574687A65642E6170692E76312E42756C6B4578706F727452656C6174696F6E7368697073526571756573741A2F2E617574687A65642E6170692E76312E42756C6B4578706F727452656C6174696F6E7368697073526573706F6E7365223482D3E493022E22292F76312F6578706572696D656E74616C2F72656C6174696F6E73686970732F62756C6B6578706F72743A012A300112D1010A1C53747265616D696E6742756C6B436865636B5065726D697373696F6E12332E617574687A65642E6170692E76312E53747265616D696E6742756C6B436865636B5065726D697373696F6E526571756573741A342E617574687A65642E6170692E76312E53747265616D696E6742756C6B436865636B5065726D697373696F6E526573706F6E7365224482D3E493023E22392F76312F6578706572696D656E74616C2F7065726D697373696F6E732F73747265616D696E6762756C6B636865636B7065726D697373696F6E3A012A300112AB010A1342756C6B436865636B5065726D697373696F6E122A2E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E526571756573741A2B2E617574687A65642E6170692E76312E42756C6B436865636B5065726D697373696F6E526573706F6E7365223B82D3E493023522302F76312F6578706572696D656E74616C2F7065726D697373696F6E732F62756C6B636865636B7065726D697373696F6E3A012A42480A12636F6D2E617574687A65642E6170692E76315A326769746875622E636F6D2F617574687A65642F617574687A65642D676F2F70726F746F2F617574687A65642F6170692F7631620670726F746F33";
public const map<string> EXPERIMENTAL_SERVICE_DESCRIPTOR_MAP = {"validate/validate.proto": VALIDATE_VALIDATE_DESC, "rpc/status.proto": RPC_STATUS_DESC, "core.proto": CORE_DESC, "permission_service.proto": PERMISSION_SERVICE_DESC};

public isolated client class ExperimentalServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, EXPERIMENTAL_SERVICE_DESC, EXPERIMENTAL_SERVICE_DESCRIPTOR_MAP);
    }

    isolated remote function BulkCheckPermission(BulkCheckPermissionRequest|ContextBulkCheckPermissionRequest req) returns BulkCheckPermissionResponse|grpc:Error {
        map<string|string[]> headers = {};
        BulkCheckPermissionRequest message;
        if req is ContextBulkCheckPermissionRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.ExperimentalService/BulkCheckPermission", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BulkCheckPermissionResponse>result;
    }

    isolated remote function BulkCheckPermissionContext(BulkCheckPermissionRequest|ContextBulkCheckPermissionRequest req) returns ContextBulkCheckPermissionResponse|grpc:Error {
        map<string|string[]> headers = {};
        BulkCheckPermissionRequest message;
        if req is ContextBulkCheckPermissionRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.ExperimentalService/BulkCheckPermission", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BulkCheckPermissionResponse>result, headers: respHeaders};
    }

    isolated remote function BulkImportRelationships() returns BulkImportRelationshipsStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("authzed.api.v1.ExperimentalService/BulkImportRelationships");
        return new BulkImportRelationshipsStreamingClient(sClient);
    }

    isolated remote function BulkExportRelationships(BulkExportRelationshipsRequest|ContextBulkExportRelationshipsRequest req) returns stream<BulkExportRelationshipsResponse, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        BulkExportRelationshipsRequest message;
        if req is ContextBulkExportRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.ExperimentalService/BulkExportRelationships", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BulkExportRelationshipsResponseStream outputStream = new BulkExportRelationshipsResponseStream(result);
        return new stream<BulkExportRelationshipsResponse, grpc:Error?>(outputStream);
    }

    isolated remote function BulkExportRelationshipsContext(BulkExportRelationshipsRequest|ContextBulkExportRelationshipsRequest req) returns ContextBulkExportRelationshipsResponseStream|grpc:Error {
        map<string|string[]> headers = {};
        BulkExportRelationshipsRequest message;
        if req is ContextBulkExportRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.ExperimentalService/BulkExportRelationships", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BulkExportRelationshipsResponseStream outputStream = new BulkExportRelationshipsResponseStream(result);
        return {content: new stream<BulkExportRelationshipsResponse, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function StreamingBulkCheckPermission(StreamingBulkCheckPermissionRequest|ContextStreamingBulkCheckPermissionRequest req) returns stream<StreamingBulkCheckPermissionResponse, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        StreamingBulkCheckPermissionRequest message;
        if req is ContextStreamingBulkCheckPermissionRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.ExperimentalService/StreamingBulkCheckPermission", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        StreamingBulkCheckPermissionResponseStream outputStream = new StreamingBulkCheckPermissionResponseStream(result);
        return new stream<StreamingBulkCheckPermissionResponse, grpc:Error?>(outputStream);
    }

    isolated remote function StreamingBulkCheckPermissionContext(StreamingBulkCheckPermissionRequest|ContextStreamingBulkCheckPermissionRequest req) returns ContextStreamingBulkCheckPermissionResponseStream|grpc:Error {
        map<string|string[]> headers = {};
        StreamingBulkCheckPermissionRequest message;
        if req is ContextStreamingBulkCheckPermissionRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.ExperimentalService/StreamingBulkCheckPermission", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        StreamingBulkCheckPermissionResponseStream outputStream = new StreamingBulkCheckPermissionResponseStream(result);
        return {content: new stream<StreamingBulkCheckPermissionResponse, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public client class BulkImportRelationshipsStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendBulkImportRelationshipsRequest(BulkImportRelationshipsRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextBulkImportRelationshipsRequest(ContextBulkImportRelationshipsRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveBulkImportRelationshipsResponse() returns BulkImportRelationshipsResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <BulkImportRelationshipsResponse>payload;
        }
    }

    isolated remote function receiveContextBulkImportRelationshipsResponse() returns ContextBulkImportRelationshipsResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <BulkImportRelationshipsResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public class BulkExportRelationshipsResponseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|BulkExportRelationshipsResponse value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|BulkExportRelationshipsResponse value;|} nextRecord = {value: <BulkExportRelationshipsResponse>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public class StreamingBulkCheckPermissionResponseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|StreamingBulkCheckPermissionResponse value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|StreamingBulkCheckPermissionResponse value;|} nextRecord = {value: <StreamingBulkCheckPermissionResponse>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public type ContextBulkImportRelationshipsRequestStream record {|
    stream<BulkImportRelationshipsRequest, error?> content;
    map<string|string[]> headers;
|};

public type ContextStreamingBulkCheckPermissionResponseStream record {|
    stream<StreamingBulkCheckPermissionResponse, error?> content;
    map<string|string[]> headers;
|};

public type ContextBulkExportRelationshipsResponseStream record {|
    stream<BulkExportRelationshipsResponse, error?> content;
    map<string|string[]> headers;
|};

public type ContextBulkImportRelationshipsResponse record {|
    BulkImportRelationshipsResponse content;
    map<string|string[]> headers;
|};

public type ContextStreamingBulkCheckPermissionRequest record {|
    StreamingBulkCheckPermissionRequest content;
    map<string|string[]> headers;
|};

public type ContextBulkCheckPermissionRequest record {|
    BulkCheckPermissionRequest content;
    map<string|string[]> headers;
|};

public type ContextBulkImportRelationshipsRequest record {|
    BulkImportRelationshipsRequest content;
    map<string|string[]> headers;
|};

public type ContextBulkCheckPermissionResponse record {|
    BulkCheckPermissionResponse content;
    map<string|string[]> headers;
|};

public type ContextStreamingBulkCheckPermissionResponse record {|
    StreamingBulkCheckPermissionResponse content;
    map<string|string[]> headers;
|};

public type ContextBulkExportRelationshipsRequest record {|
    BulkExportRelationshipsRequest content;
    map<string|string[]> headers;
|};

public type ContextBulkExportRelationshipsResponse record {|
    BulkExportRelationshipsResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type StreamingBulkCheckPermissionRequest record {|
    Consistency consistency = {};
    BulkCheckPermissionRequestItem[] items = [];
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkCheckPermissionRequest record {|
    // Consistency consistency = {};
    BulkCheckPermissionRequestItem[] items = [];
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkCheckPermissionPair record {|
    BulkCheckPermissionRequestItem request = {};
    BulkCheckPermissionResponseItem item?;
    google_rpc_Status 'error?;
|};

isolated function isValidBulkcheckpermissionpair(BulkCheckPermissionPair r) returns boolean {
    int responseCount = 0;
    if !(r?.item is ()) {
        responseCount += 1;
    }
    if !(r?.'error is ()) {
        responseCount += 1;
    }
    if (responseCount > 1) {
        return false;
    }
    return true;
}

isolated function setBulkCheckPermissionPair_Item(BulkCheckPermissionPair r, BulkCheckPermissionResponseItem item) {
    r.item = item;
    _ = r.removeIfHasKey("error");
}

isolated function setBulkCheckPermissionPair_Error(BulkCheckPermissionPair r, google_rpc_Status 'error) {
    r.'error = 'error;
    _ = r.removeIfHasKey("item");
}

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkImportRelationshipsResponse record {|
    int num_loaded = 0;
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkImportRelationshipsRequest record {|
    Relationship[] relationships = [];
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkCheckPermissionRequestItem record {|
    ObjectReference 'resource = {};
    string permission = "";
    SubjectReference subject = {};
    map<anydata> context = {};
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkCheckPermissionResponse record {|
    ZedToken checked_at = {};
    BulkCheckPermissionPair[] pairs = [];
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type StreamingBulkCheckPermissionResponse record {|
    ZedToken checked_at = {};
    BulkCheckPermissionPair[] pairs = [];
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkCheckPermissionResponseItem record {|
    BulkCheckPermissionResponseItem_Permissionship permissionship = PERMISSIONSHIP_UNSPECIFIED;
    PartialCaveatInfo partial_caveat_info = {};
|};

public enum BulkCheckPermissionResponseItem_Permissionship {
    PERMISSIONSHIP_UNSPECIFIED, PERMISSIONSHIP_NO_PERMISSION, PERMISSIONSHIP_HAS_PERMISSION, PERMISSIONSHIP_CONDITIONAL_PERMISSION
}

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkExportRelationshipsRequest record {|
    Consistency consistency = {};
    int optional_limit = 0;
    Cursor optional_cursor = {};
|};

@protobuf:Descriptor {value: EXPERIMENTAL_SERVICE_DESC}
public type BulkExportRelationshipsResponse record {|
    Cursor after_result_cursor = {};
    Relationship[] relationships = [];
|};

