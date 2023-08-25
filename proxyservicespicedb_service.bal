import ballerina_proxy_spicedb_grpc.spicedbClient;
import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
service "ProxyServiceSpiceDB" on ep {

    remote function SayHelloProxy(HelloProxyRequest value) returns HelloProxyReply|error {
        spicedbClient:CheckPermissionRequest checkPermissionRequest = {
            permission: "allowed",
            'resource: {
                object_type: "permissions",
                object_id: value.'resource.object_id
            },
            subject: {
                'object: {
                    object_type: "projectgroups",
                    object_id: value.subject.'object.object_id
                }
            }
        };

        spicedbClient:CheckPermissionResponse|error? checkPermissionResponse = spicedbClient:CheckPermission(checkPermissionRequest);
        if checkPermissionResponse is error {
            return error(checkPermissionResponse.message());
        } else if checkPermissionResponse is spicedbClient:CheckPermissionResponse {
            return {permissionship: checkPermissionResponse.permissionship};
        }
        return error("Something terrible happened");
    }

    remote function SayHelloStreamProxy(HelloProxyRequest value) returns stream<HelloReply, error?>|error {
        return error("Stream not implemented");
    }
}

