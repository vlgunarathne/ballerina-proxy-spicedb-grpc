import ballerina/grpc;
import ballerina/protobuf;

public const string SPICEDB_PROXY_SERVICE_DESC = "0A1B737069636564625F70726F78795F736572766963652E70726F746F12177669647572616E67612E70726F78792E7370696365646222AE010A1148656C6C6F50726F787952657175657374121E0A0A7065726D697373696F6E180120012809520A7065726D697373696F6E123D0A087265736F7572636518022001280B32212E7669647572616E67612E70726F78792E737069636564622E5265736F7572636552087265736F75726365123A0A077375626A65637418032001280B32202E7669647572616E67612E70726F78792E737069636564622E5375626A65637452077375626A65637422390A0F48656C6C6F50726F78795265706C7912260A0E7065726D697373696F6E73686970180120012809520E7065726D697373696F6E7368697022260A0A48656C6C6F5265706C7912180A076D65737361676518012001280952076D65737361676522480A085265736F75726365121B0A096F626A6563745F696418012001280952086F626A6563744964121F0A0B6F626A6563745F74797065180220012809520A6F626A6563745479706522420A075375626A65637412370A066F626A65637418012001280B321F2E7669647572616E67612E70726F78792E737069636564622E4F626A65637452066F626A65637422460A064F626A656374121B0A096F626A6563745F696418012001280952086F626A6563744964121F0A0B6F626A6563745F74797065180220012809520A6F626A6563745479706532EA010A1350726F7879536572766963655370696365444212670A0D53617948656C6C6F50726F7879122A2E7669647572616E67612E70726F78792E737069636564622E48656C6C6F50726F7879526571756573741A282E7669647572616E67612E70726F78792E737069636564622E48656C6C6F50726F78795265706C792200126A0A1353617948656C6C6F53747265616D50726F7879122A2E7669647572616E67612E70726F78792E737069636564622E48656C6C6F50726F7879526571756573741A232E7669647572616E67612E70726F78792E737069636564622E48656C6C6F5265706C7922003001620670726F746F33";

public isolated client class ProxyServiceSpiceDBClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, SPICEDB_PROXY_SERVICE_DESC);
    }

    isolated remote function SayHelloProxy(HelloProxyRequest|ContextHelloProxyRequest req) returns HelloProxyReply|grpc:Error {
        map<string|string[]> headers = {};
        HelloProxyRequest message;
        if req is ContextHelloProxyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("viduranga.proxy.spicedb.ProxyServiceSpiceDB/SayHelloProxy", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <HelloProxyReply>result;
    }

    isolated remote function SayHelloProxyContext(HelloProxyRequest|ContextHelloProxyRequest req) returns ContextHelloProxyReply|grpc:Error {
        map<string|string[]> headers = {};
        HelloProxyRequest message;
        if req is ContextHelloProxyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("viduranga.proxy.spicedb.ProxyServiceSpiceDB/SayHelloProxy", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <HelloProxyReply>result, headers: respHeaders};
    }

    isolated remote function SayHelloStreamProxy(HelloProxyRequest|ContextHelloProxyRequest req) returns stream<HelloReply, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        HelloProxyRequest message;
        if req is ContextHelloProxyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("viduranga.proxy.spicedb.ProxyServiceSpiceDB/SayHelloStreamProxy", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        HelloReplyStream outputStream = new HelloReplyStream(result);
        return new stream<HelloReply, grpc:Error?>(outputStream);
    }

    isolated remote function SayHelloStreamProxyContext(HelloProxyRequest|ContextHelloProxyRequest req) returns ContextHelloReplyStream|grpc:Error {
        map<string|string[]> headers = {};
        HelloProxyRequest message;
        if req is ContextHelloProxyRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("viduranga.proxy.spicedb.ProxyServiceSpiceDB/SayHelloStreamProxy", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        HelloReplyStream outputStream = new HelloReplyStream(result);
        return {content: new stream<HelloReply, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class HelloReplyStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|HelloReply value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|HelloReply value;|} nextRecord = {value: <HelloReply>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class ProxyServiceSpiceDBHelloProxyReplyCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendHelloProxyReply(HelloProxyReply response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextHelloProxyReply(ContextHelloProxyReply response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class ProxyServiceSpiceDBHelloReplyCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendHelloReply(HelloReply response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextHelloReply(ContextHelloReply response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextHelloReplyStream record {|
    stream<HelloReply, error?> content;
    map<string|string[]> headers;
|};

public type ContextHelloProxyRequest record {|
    HelloProxyRequest content;
    map<string|string[]> headers;
|};

public type ContextHelloReply record {|
    HelloReply content;
    map<string|string[]> headers;
|};

public type ContextHelloProxyReply record {|
    HelloProxyReply content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
public type HelloProxyRequest record {|
    string permission = "";
    Resource 'resource = {};
    Subject subject = {};
|};

@protobuf:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
public type Resource record {|
    string object_id = "";
    string object_type = "";
|};

@protobuf:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
public type Object record {|
    string object_id = "";
    string object_type = "";
|};

@protobuf:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
public type HelloReply record {|
    string message = "";
|};

@protobuf:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
public type HelloProxyReply record {|
    string permissionship = "";
|};

@protobuf:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
public type Subject record {|
    Object 'object = {};
|};

