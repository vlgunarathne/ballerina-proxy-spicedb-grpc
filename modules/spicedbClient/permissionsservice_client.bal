final PermissionsServiceClient permissionServiceClient = check new ("http://localhost:50051", {auth: {token: "foobar"}});

public isolated function CheckPermission(CheckPermissionRequest checkPermissionRequest) returns CheckPermissionResponse|error {
    return check permissionServiceClient->CheckPermission(checkPermissionRequest);
}

public isolated function WriteRelationships(WriteRelationshipsRequest writeRelationshipsRequest) returns WriteRelationshipsResponse|error {
    return check permissionServiceClient->WriteRelationships(writeRelationshipsRequest);
}