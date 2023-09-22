final ExperimentalServiceClient experimentalServiceClient = check new ("http://localhost:50051", {auth: {token: "foobar"}});

public isolated function BulkCheckPermission(BulkCheckPermissionRequest bulkCheckPermissionRequest) returns BulkCheckPermissionResponse|error {
    BulkCheckPermissionResponse bulkCheckPermissionResponse = check experimentalServiceClient->BulkCheckPermission(bulkCheckPermissionRequest);
    return bulkCheckPermissionResponse;
}

