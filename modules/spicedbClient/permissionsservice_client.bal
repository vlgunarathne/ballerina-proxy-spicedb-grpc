PermissionsServiceClient ep = check new ("http://spicedb:50051", {auth: {token: "foobar"}});

public function CheckPermission(CheckPermissionRequest checkPermissionRequest) returns CheckPermissionResponse|error? {

    CheckPermissionResponse checkPermissionResponse = check ep->CheckPermission(checkPermissionRequest);
    return checkPermissionResponse;
}

