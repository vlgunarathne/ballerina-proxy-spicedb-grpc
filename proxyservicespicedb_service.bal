import ballerina_proxy_spicedb_grpc.spicedbClient;
import ballerina/log;
import ballerina/grpc;

listener grpc:Listener ep = new (9090, {reflectionEnabled: true});

@grpc:Descriptor {value: SPICEDB_PROXY_SERVICE_DESC}
service "ProxyServiceSpiceDB" on ep {

    isolated remote function SayHelloProxy(HelloProxyRequest value) returns HelloProxyReply|error {
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

        spicedbClient:CheckPermissionResponse|error checkPermissionResponse = spicedbClient:CheckPermission(checkPermissionRequest);
        if checkPermissionResponse is error {
            return error(checkPermissionResponse.message());
        }
        return {permissionship: checkPermissionResponse.permissionship};
    }

    isolated remote function SayHelloProxyBulk(HelloProxyRequest value) returns HelloProxyReply|error {
        spicedbClient:BulkCheckPermissionRequestItem checkPermissionRequest = {
            permission: value.permission,
            'resource: {
                object_type: value.'resource.object_type,
                object_id: value.'resource.object_id
            },
            subject: {
                'object: {
                    object_type: value.subject.'object.object_type,
                    object_id: value.subject.'object.object_id
                }
            }
        };
        spicedbClient:BulkCheckPermissionRequestItem[] bulkcheckPermissionRequestItems = [];
        bulkcheckPermissionRequestItems.push(checkPermissionRequest);
        spicedbClient:BulkCheckPermissionResponse|error checkPermissionResponse = spicedbClient:BulkCheckPermission({items: bulkcheckPermissionRequestItems});
        if checkPermissionResponse is error {
            log:printInfo("ERROR " + checkPermissionResponse.toString());
            return error(checkPermissionResponse.message());
        } else {
            if checkPermissionResponse.pairs[0].hasKey("error") {
                log:printInfo("RESPONSE BUT ERROR " + checkPermissionResponse.pairs[0].'error?.message.toString());
            } else {
                log:printInfo("RESPONSE " + checkPermissionResponse.pairs[0].item.toString());
            }
        }
        return {permissionship: ""};
    }

    isolated remote function SayHelloStreamProxy(HelloProxyRequest value) returns stream<HelloReply, error?>|error {
        return error("Stream not implemented");
    }

    isolated remote function WriteHelloProxy(HelloProxyRequest value) returns HelloProxyReply|error {
        spicedbClient:RelationshipUpdate[] createNewRoleUpdatesList = [];
        spicedbClient:RelationshipUpdate newPermissionOnRole = {
            operation: spicedbClient:OPERATION_CREATE,
            relationship: {
                'resource: {
                    object_type: value.'resource.object_type,
                    object_id: value.'resource.object_id
                },
                relation: "allowed",
                subject: {
                    'object: {
                        object_type: value.subject.'object.object_type,
                        object_id: value.subject.'object.object_id
                    },
                    optional_relation: "has"
                }
            }
        };
        createNewRoleUpdatesList.push(newPermissionOnRole);
        spicedbClient:WriteRelationshipsResponse|error createRoleResponse = spicedbClient:WriteRelationships({updates: createNewRoleUpdatesList});
        if createRoleResponse is error {
            log:printError("Response error", createRoleResponse);
            return error("Response error");
        } else {
            log:printInfo("Response successful : " + createRoleResponse.toString());
            return {permissionship: createRoleResponse.written_at.token};
        }
    }
}

