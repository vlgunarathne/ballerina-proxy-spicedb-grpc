final PermissionsServiceClient ep = check new ("http://spicedb:50051", {auth: {token: "foobar"}});

public isolated function CheckPermission(CheckPermissionRequest checkPermissionRequest) returns CheckPermissionResponse|error {
    return check ep->CheckPermission(checkPermissionRequest);
}

